@implementation _NUBrushStrokeCIImageProvider

- (_NUBrushStrokeCIImageProvider)initWithStroke:(id)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5 filled:(BOOL)a6 alwaysUseCG:(BOOL)a7
{
  id v13;
  _NUBrushStrokeCIImageProvider *v14;
  _NUBrushStrokeCIImageProvider *v15;
  NUBrushStroke *stroke;
  $86B46DF249C2B4242DBB096758D29184 v18;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v19;
  objc_super v20;

  v13 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_NUBrushStrokeCIImageProvider;
  v14 = -[_NUBrushStrokeCIImageProvider init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_stroke, a3);
    v15->_closed = a4;
    v15->_alwaysUseCG = a7;
    v15->_pressureMode = a5;
    stroke = v15->_stroke;
    if (stroke)
    {
      -[NUBrushStroke extent](stroke, "extent");
    }
    else
    {
      v18 = ($86B46DF249C2B4242DBB096758D29184)0;
      v19 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)0;
    }
    v15->_extent.origin = v18;
    v15->_extent.size = v19;
    v15->_filled = a6;
  }

  return v15;
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  unint64_t v16;
  unint64_t v17;
  CGContext *v18;
  CGPath *Mutable;
  float v20;
  float v21;
  float v22;
  int64_t v23;
  float v24;
  float v25;
  CGPathDrawingMode v26;
  NUMutableBufferAdapter *v27;
  void *v28;
  NUMutableBufferAdapter *v29;

  bzero(a3, a8 * a4);
  v16 = self->_extent.origin.x + a5;
  v17 = self->_extent.size.height + self->_extent.origin.y - (a8 + a6);
  if (*(_WORD *)&self->_filled)
  {
    if (-[NUBrushStroke pointCount](self->_stroke, "pointCount"))
    {
      v18 = CGBitmapContextCreate(a3, a7, a8, 8uLL, a4, 0, 7u);
      Mutable = CGPathCreateMutable();
      -[NUBrushStroke radius](self->_stroke, "radius");
      CGContextSetLineWidth(v18, (float)(v20 + v20));
      CGContextSetLineCap(v18, kCGLineCapRound);
      CGContextSetLineJoin(v18, kCGLineJoinRound);
      -[NUBrushStroke pointAtIndex:](self->_stroke, "pointAtIndex:", 0);
      CGPathMoveToPoint(Mutable, 0, v21, v22);
      if (-[NUBrushStroke pointCount](self->_stroke, "pointCount") >= 2)
      {
        v23 = 1;
        do
        {
          -[NUBrushStroke pointAtIndex:](self->_stroke, "pointAtIndex:", v23);
          CGPathAddLineToPoint(Mutable, 0, v24, v25);
          ++v23;
        }
        while (v23 < -[NUBrushStroke pointCount](self->_stroke, "pointCount"));
      }
      if (self->_filled || self->_alwaysUseCG && self->_closed)
        CGPathCloseSubpath(Mutable);
      CGContextTranslateCTM(v18, (double)-(uint64_t)v16, (double)-(uint64_t)v17);
      CGContextAddPath(v18, Mutable);
      if (self->_filled)
        v26 = kCGPathFillStroke;
      else
        v26 = kCGPathStroke;
      CGContextDrawPath(v18, v26);
      CGContextRelease(v18);
      CGPathRelease(Mutable);
    }
  }
  else
  {
    v27 = [NUMutableBufferAdapter alloc];
    +[NUPixelFormat R8](NUPixelFormat, "R8");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:](v27, "initWithSize:format:rowBytes:mutableBytes:", a7, a8, v28, a4, a3);

    +[NUBrushRasterizer rasterizeBrushStroke:atPoint:toBuffer:close:startIndex:](NUBrushRasterizer, "rasterizeBrushStroke:atPoint:toBuffer:close:startIndex:", self->_stroke, v16, v17, v29, self->_closed, -1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stroke, 0);
}

@end
