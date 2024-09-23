@implementation CPShape

- (CPShape)init
{
  CPShape *v2;
  CPShape *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPShape;
  v2 = -[CPGraphicObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CPChunk setShrinksWithChildren:](v2, "setShrinksWithChildren:", 0);
    v3->miterLimit = 10.0;
    v3->lineCap = 0;
    v3->lineJoin = 0;
    v3->paintTransform = CGAffineTransformIdentity;
  }
  return v3;
}

- (void)dispose
{
  CGColor *fillColor;
  CGColor *strokeColor;
  CGPath *path;

  if (self->path)
  {
    fillColor = self->fillColor;
    if (fillColor)
      CFRelease(fillColor);
    strokeColor = self->strokeColor;
    if (strokeColor)
      CFRelease(strokeColor);
    path = self->path;
    if (path)
      CFRelease(path);
    self->path = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPShape dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPShape;
  -[CPShape finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPShape dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPShape;
  -[CPGraphicObject dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  CGPath *path;
  CGColor *fillColor;
  CGColor *strokeColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPShape;
  v4 = -[CPChunk copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (v4)
  {
    path = self->path;
    if (path)
      CFRetain(self->path);
    v4[23] = path;
    fillColor = self->fillColor;
    v4[28] = fillColor;
    if (fillColor)
      CFRetain(fillColor);
    strokeColor = self->strokeColor;
    v4[29] = strokeColor;
    if (strokeColor)
      CFRetain(strokeColor);
  }
  return v4;
}

- (CGRect)bounds
{
  double y;
  BOOL v4;
  double x;
  double v6;
  double width;
  double height;
  CGRect result;

  if (!self->boundsComputed)
  {
    y = self->super.super.bounds.origin.y;
    v4 = self->super.super.bounds.origin.x == INFINITY || y == INFINITY;
    if (v4 && self->path)
      -[CPShape recomputeBounds](self, "recomputeBounds", INFINITY, y);
  }
  x = self->super.super.bounds.origin.x;
  v6 = self->super.super.bounds.origin.y;
  width = self->super.super.bounds.size.width;
  height = self->super.super.bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v6;
  result.origin.x = x;
  return result;
}

- (void)recomputeBounds
{
  CGRect PathBoundingBox;

  PathBoundingBox = CGPathGetPathBoundingBox(self->path);
  -[CPChunk setBounds:](self, "setBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
  self->isUprightRectangle = CGPathIsCongruentToARect(self->path);
  self->boundsComputed = 1;
}

- (int64_t)mcid
{
  return self->mcid;
}

- (unsigned)pdfObjectID
{
  return self->pdfObjectID;
}

- (void)setPdfObjectID:(unsigned int)a3
{
  self->pdfObjectID = a3;
}

- (CGPath)path
{
  return self->path;
}

- (void)setPath:(CGPath *)a3
{
  CGPath *path;

  path = self->path;
  if (path != a3)
  {
    if (path)
      CFRelease(path);
    if (a3)
      CFRetain(a3);
    self->path = a3;
    self->super.super.bounds = CGRectNull;
    self->super.renderedBounds = CGRectNull;
    self->boundsComputed = 0;
    self->renderedBoundsComputed = 0;
    self->isUprightRectangle = 0;
  }
}

- (CGRect)renderedBounds
{
  double y;
  BOOL v4;
  BOOL v5;
  double x;
  double v7;
  double width;
  double height;
  CGRect result;

  if (!self->renderedBoundsComputed)
  {
    y = self->super.renderedBounds.origin.y;
    v4 = self->super.renderedBounds.origin.x == INFINITY || y == INFINITY;
    if (v4
      || ((y = self->super.super.bounds.origin.y, self->super.super.bounds.origin.x != INFINITY)
        ? (v5 = y == INFINITY)
        : (v5 = 1),
          v5))
    {
      if (self->path)
        -[CPShape recomputeRenderedBounds](self, "recomputeRenderedBounds", INFINITY, y);
    }
  }
  x = self->super.renderedBounds.origin.x;
  v7 = self->super.renderedBounds.origin.y;
  width = self->super.renderedBounds.size.width;
  height = self->super.renderedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v7;
  result.origin.x = x;
  return result;
}

- (void)recomputeRenderedBounds
{
  CGRect *p_renderedBounds;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double y;
  CGPath *v10;
  const CGPath *v11;
  double width;
  double height;
  double v14;
  double v15;
  CGFloat x;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGPath *Mutable;
  CGPath *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  int v28;
  const CGPath *v29[3];
  CGRect v30;
  CGRect v31;
  CGRect PathBoundingBox;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v29[2] = *(const CGPath **)MEMORY[0x1E0C80C00];
  p_renderedBounds = &self->super.renderedBounds;
  -[CPShape bounds](self, "bounds");
  p_renderedBounds->origin.x = v4;
  p_renderedBounds->origin.y = v5;
  p_renderedBounds->size.width = v6;
  p_renderedBounds->size.height = v7;
  self->renderedBoundsComputed = 1;
  y = p_renderedBounds->origin.y;
  if (p_renderedBounds->origin.x != INFINITY && y != INFINITY)
  {
    if (-[CPShape hasStroke](self, "hasStroke", INFINITY, y))
      *p_renderedBounds = CGRectInset(*p_renderedBounds, self->lineWidth * -0.5, self->lineWidth * -0.5);
    if (self->super.clipIndex)
    {
      v10 = CPPDFGetClipPathIntersection(objc_msgSend(-[CPObject page](self, "page"), "PDFContext"), self->super.clipIndex, &v28);
      if (v10)
      {
        v11 = v10;
        width = p_renderedBounds->size.width;
        height = p_renderedBounds->size.height;
        if (width >= 1.0)
          v14 = 0.0;
        else
          v14 = -1.0;
        if (height >= 1.0)
          v15 = 0.0;
        else
          v15 = -1.0;
        x = p_renderedBounds->origin.x;
        v17 = p_renderedBounds->origin.y;
        v30 = CGRectInset(*(CGRect *)(&width - 2), v14, v15);
        v18 = v30.origin.x;
        v19 = v30.origin.y;
        v20 = v30.size.width;
        v21 = v30.size.height;
        Mutable = CGPathCreateMutable();
        v31.origin.x = v18;
        v31.origin.y = v19;
        v31.size.width = v20;
        v31.size.height = v21;
        CGPathAddRect(Mutable, 0, v31);
        v29[0] = v11;
        v29[1] = Mutable;
        v23 = CGPathCreateMutable();
        CGPathAddIntersection(v23, v29, 2u);
        PathBoundingBox = CGPathGetPathBoundingBox(v23);
        v24 = PathBoundingBox.origin.x;
        v25 = PathBoundingBox.origin.y;
        v26 = PathBoundingBox.size.width;
        v27 = PathBoundingBox.size.height;
        if (v23)
          CFRelease(v23);
        if (Mutable)
          CFRelease(Mutable);
        if (v14 != 0.0 || v15 != 0.0)
        {
          v33.origin.x = v24;
          v33.origin.y = v25;
          v33.size.width = v26;
          v33.size.height = v27;
          v34 = CGRectIntersection(v33, *p_renderedBounds);
          v24 = v34.origin.x;
          v25 = v34.origin.y;
          v26 = v34.size.width;
          v27 = v34.size.height;
        }
        p_renderedBounds->origin.x = v24;
        p_renderedBounds->origin.y = v25;
        p_renderedBounds->size.width = v26;
        p_renderedBounds->size.height = v27;
      }
    }
    objc_msgSend(-[CPObject page](self, "page"), "pageCropBox");
    *p_renderedBounds = CGRectIntersection(v35, *p_renderedBounds);
  }
}

- (CGRect)innerBounds
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  -[CPShape bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[CPShape hasStroke](self, "hasStroke"))
  {
    if (x != INFINITY && y != INFINITY)
    {
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      v17 = CGRectInset(v16, self->lineWidth * 0.5, self->lineWidth * 0.5);
      x = v17.origin.x;
      y = v17.origin.y;
      width = v17.size.width;
      height = v17.size.height;
    }
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isUprightRectangle
{
  -[CPShape bounds](self, "bounds");
  return self->isUprightRectangle;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitShape:", self);
}

- (int)windingRule
{
  return self->windingRule;
}

- (void)setWindingRule:(int)a3
{
  self->windingRule = a3;
}

- (CGColor)fillColor
{
  return self->fillColor;
}

- (void)setFillColor:(CGColor *)a3
{
  CGColor *fillColor;

  fillColor = self->fillColor;
  if (fillColor != a3)
  {
    if (fillColor)
      CFRelease(fillColor);
    self->fillColor = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (CGPDFObject)fillObject
{
  return self->fillObject;
}

- (void)setFillObject:(CGPDFObject *)a3
{
  self->fillObject = a3;
}

- (BOOL)hasFill
{
  return self->fillColor || self->fillObject != 0;
}

- (CGColor)strokeColor
{
  return self->strokeColor;
}

- (void)setStrokeColor:(CGColor *)a3
{
  CGColor *strokeColor;

  strokeColor = self->strokeColor;
  if (strokeColor != a3)
  {
    if (strokeColor)
      CFRelease(strokeColor);
    self->strokeColor = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (CGPDFObject)strokeObject
{
  return self->strokeObject;
}

- (void)setStrokeObject:(CGPDFObject *)a3
{
  self->strokeObject = a3;
}

- (BOOL)hasStroke
{
  return self->strokeColor || self->strokeObject != 0;
}

- (double)lineWidth
{
  return self->lineWidth;
}

- (void)setLineWidth:(double)a3
{
  if (self->lineWidth != a3)
  {
    self->lineWidth = a3;
    self->super.renderedBounds = CGRectNull;
    self->renderedBoundsComputed = 0;
  }
}

- (double)miterLimit
{
  return self->miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->miterLimit = a3;
}

- (int)lineCap
{
  return self->lineCap;
}

- (void)setLineCap:(int)a3
{
  self->lineCap = a3;
}

- (int)lineJoin
{
  return self->lineJoin;
}

- (void)setLineJoin:(int)a3
{
  self->lineJoin = a3;
}

- (CGAffineTransform)paintTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].a;
  return self;
}

- (void)setPaintTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->paintTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->paintTransform.c = v4;
  *(_OWORD *)&self->paintTransform.tx = v3;
}

- (BOOL)hasSamePathAs:(id)a3
{
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;

  if (CGPathEqualToPath(self->path, *((CGPathRef *)a3 + 23)))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[CPShape isUprightRectangle](self, "isUprightRectangle");
    if (v5)
    {
      v5 = objc_msgSend(a3, "isUprightRectangle");
      if (v5)
      {
        -[CPShape bounds](self, "bounds");
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;
        objc_msgSend(a3, "bounds");
        LOBYTE(v5) = 0;
        if (vabdd_f64(v7, v17) <= 0.001 && vabdd_f64(v9, v14) <= 0.001)
        {
          v18 = vabdd_f64(v11, v15) <= 0.001;
          LOBYTE(v5) = vabdd_f64(v13, v16) <= 0.001 && v18;
        }
      }
    }
  }
  return v5;
}

- (BOOL)isStrokeFor:(id)a3
{
  return !-[CPShape hasFill](self, "hasFill")
      && (objc_msgSend(a3, "hasStroke") & 1) == 0
      && -[CPShape hasSamePathAs:](self, "hasSamePathAs:", a3);
}

- (BOOL)isVisible
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t fillColor;
  double Alpha;
  uint64_t strokeColor;
  double v12;
  BOOL result;

  fillColor = (uint64_t)self->fillColor;
  result = fillColor
        && ((fillColor & 0x8000000000000000) == 0
          ? (Alpha = *(double *)(fillColor + 8 * *(_QWORD *)(fillColor + 56) + 56))
          : (Alpha = CGTaggedColorGetAlpha(fillColor, (uint64_t)a2, v2, v3, v4, v5, v6, v7)),
            Alpha > 0.0)
        || (strokeColor = (uint64_t)self->strokeColor) != 0
        && ((strokeColor & 0x8000000000000000) == 0
          ? (v12 = *(double *)(strokeColor + 8 * *(_QWORD *)(strokeColor + 56) + 56))
          : (v12 = CGTaggedColorGetAlpha(strokeColor, (uint64_t)a2, v2, v3, v4, v5, v6, v7)),
            v12 > 0.0)
        || self->fillObject
        || self->strokeObject != 0;
  return result;
}

- (BOOL)canCombineWith:(id)a3
{
  unsigned int clipIndex;
  CGAffineTransform *p_paintTransform;
  double v7;
  int v8;
  CGAffineTransform *v9;
  double v10;
  double ty;
  double v12;
  float64x2_t v14[6];

  clipIndex = self->super.clipIndex;
  if (clipIndex != objc_msgSend(a3, "clipIndex"))
    goto LABEL_20;
  if (-[CPShape isStrokeFor:](self, "isStrokeFor:", a3))
  {
    if (self->strokeObject && objc_msgSend(a3, "fillObject"))
    {
      p_paintTransform = &self->paintTransform;
      if (a3)
      {
        objc_msgSend(a3, "paintTransform");
        v7 = v14[3].f64[0];
      }
      else
      {
        memset(&v14[3], 0, 48);
        v7 = 0.0;
      }
      if (p_paintTransform->a == v7
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&p_paintTransform->b, *(float64x2_t *)((char *)&v14[3] + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)&p_paintTransform->d, *(float64x2_t *)((char *)&v14[4] + 8)))), 0xFuLL))) & 1) != 0)
      {
        ty = p_paintTransform->ty;
        v12 = v14[5].f64[1];
LABEL_23:
        LOBYTE(v8) = ty == v12;
        return v8;
      }
      goto LABEL_20;
    }
  }
  else
  {
    v8 = objc_msgSend(a3, "isStrokeFor:", self);
    if (!v8)
      return v8;
    if (self->fillObject && objc_msgSend(a3, "strokeObject"))
    {
      v9 = &self->paintTransform;
      if (a3)
      {
        objc_msgSend(a3, "paintTransform");
        v10 = v14[0].f64[0];
      }
      else
      {
        memset(v14, 0, 48);
        v10 = 0.0;
      }
      if (v9->a == v10
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v9->b, *(float64x2_t *)((char *)v14 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)&v9->d, *(float64x2_t *)((char *)&v14[1] + 8)))), 0xFuLL))) & 1) != 0)
      {
        ty = v9->ty;
        v12 = v14[2].f64[1];
        goto LABEL_23;
      }
LABEL_20:
      LOBYTE(v8) = 0;
      return v8;
    }
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (void)addShape:(id)a3
{
  id v5;
  uint64_t v6;
  _OWORD v7[3];

  v5 = a3;
  objc_msgSend(a3, "remove");
  -[CPChunk addChildrenOf:](self, "addChildrenOf:", a3);
  v6 = objc_msgSend(a3, "zOrder");
  if (v6 > -[CPShape zOrder](self, "zOrder"))
    -[CPChunk setInsertionOrder:](self, "setInsertionOrder:", objc_msgSend(a3, "zOrder"));
  if (objc_msgSend(a3, "hasFill"))
  {
    -[CPShape setWindingRule:](self, "setWindingRule:", objc_msgSend(a3, "windingRule"));
    -[CPShape setFillColor:](self, "setFillColor:", objc_msgSend(a3, "fillColor"));
    -[CPShape setFillObject:](self, "setFillObject:", objc_msgSend(a3, "fillObject"));
  }
  if (objc_msgSend(a3, "hasStroke"))
  {
    objc_msgSend(a3, "lineWidth");
    -[CPShape setLineWidth:](self, "setLineWidth:");
    objc_msgSend(a3, "miterLimit");
    -[CPShape setMiterLimit:](self, "setMiterLimit:");
    -[CPShape setLineCap:](self, "setLineCap:", objc_msgSend(a3, "lineCap"));
    -[CPShape setLineJoin:](self, "setLineJoin:", objc_msgSend(a3, "lineJoin"));
    -[CPShape setStrokeColor:](self, "setStrokeColor:", objc_msgSend(a3, "strokeColor"));
    -[CPShape setStrokeObject:](self, "setStrokeObject:", objc_msgSend(a3, "strokeObject"));
  }
  if (objc_msgSend(a3, "fillObject") || objc_msgSend(a3, "strokeObject"))
  {
    if (a3)
      objc_msgSend(a3, "paintTransform");
    else
      memset(v7, 0, sizeof(v7));
    -[CPShape setPaintTransform:](self, "setPaintTransform:", v7);
  }

}

- (id)string
{
  __int16 v3;

  v3 = 32;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v3, 1);
}

- (void)makeLineFromVertex:(CGPoint)a3 toVertex:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGPath *Mutable;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v7, v6);
  CGPathAddLineToPoint(Mutable, 0, x, y);
  -[CPShape setPath:](self, "setPath:", Mutable);
  if (Mutable)
    CFRelease(Mutable);
  self->super.clipIndex = 0;
}

- (unsigned)pathElementCount
{
  CGPath *path;
  int info;

  path = self->path;
  if (path)
  {
    info = 0;
    CGPathApply(path, &info, (CGPathApplierFunction)countElements);
    LODWORD(path) = info;
  }
  return path;
}

- (CPShape)initWithPDFShape:(CPPDFShape *)a3
{
  CPShape *v4;
  CPShape *v5;
  CGPath *var4;
  CPPDFStyle *var2;
  __int128 v8;
  __int128 v9;

  v4 = -[CPShape init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->mcid = a3->var8;
    v4->pdfObjectID = a3->var1;
    var4 = a3->var4;
    if (var4)
      CFRetain(a3->var4);
    v5->path = var4;
    -[CPChunk setBounds:](v5, "setBounds:", a3->var0.var0.origin.x, a3->var0.var0.origin.y, a3->var0.var0.size.width, a3->var0.var0.size.height);
    v5->isUprightRectangle = CGPathIsCongruentToARect(v5->path);
    -[CPChunk setInsertionOrder:](v5, "setInsertionOrder:", a3->var0.var3);
    var2 = a3->var2;
    v8 = *(_OWORD *)&a3->var7.a;
    v9 = *(_OWORD *)&a3->var7.tx;
    *(_OWORD *)&v5->paintTransform.c = *(_OWORD *)&a3->var7.c;
    *(_OWORD *)&v5->paintTransform.tx = v9;
    *(_OWORD *)&v5->paintTransform.a = v8;
    if ((a3->var3 & 2) != 0)
    {
      -[CPShape setStrokeColor:](v5, "setStrokeColor:", var2->var2);
      -[CPShape setStrokeObject:](v5, "setStrokeObject:", var2->var13);
      -[CPShape setLineWidth:](v5, "setLineWidth:", sqrt(fabs(a3->var6.a * a3->var6.d - a3->var6.b * a3->var6.c)) * var2->var5);
      -[CPShape setMiterLimit:](v5, "setMiterLimit:", var2->var4);
      if (var2->var6 <= 2u)
        -[CPShape setLineCap:](v5, "setLineCap:");
      if (var2->var7 <= 2u)
        -[CPShape setLineJoin:](v5, "setLineJoin:");
    }
    if ((a3->var3 & 1) != 0)
    {
      -[CPShape setFillColor:](v5, "setFillColor:", var2->var0);
      -[CPShape setFillObject:](v5, "setFillObject:", var2->var12);
      -[CPShape setWindingRule:](v5, "setWindingRule:", !a3->var5);
    }
  }
  return v5;
}

@end
