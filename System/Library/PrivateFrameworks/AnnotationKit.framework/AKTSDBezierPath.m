@implementation AKTSDBezierPath

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    MEMORY[0x24BEDD108](AKTSDBezierPath, sel_setVersion_);
}

+ (id)bezierPath
{
  return objc_alloc_init((Class)a1);
}

+ (id)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  objc_msgSend(a1, "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveToPoint:", v7, v6);
  objc_msgSend(v8, "lineToPoint:", x, y);
  return v8;
}

+ (id)bezierPathWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendBezierPathWithRect:", x, y, width, height);
  return v7;
}

+ (id)bezierPathWithOvalInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendBezierPathWithOvalInRect:", x, y, width, height);
  return v7;
}

+ (id)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return 0;
}

+ (id)bezierPathWithCGPath:(CGPath *)a3
{
  void *v4;

  objc_msgSend(a1, "bezierPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathApply(a3, v4, (CGPathApplierFunction)sub_228FF3C40);
  return v4;
}

+ (void)fillRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextFillRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat v11;
  CGFloat v12;
  CGFloat MaxY;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextSetLineCap(CurrentContext, (CGLineCap)qword_255A26FE0);
      CGContextSetLineJoin(CurrentContext, (CGLineJoin)qword_255A26FE8);
      sub_228FF3A20(CurrentContext, *(CGFloat *)&qword_255A25360);
      CGContextSetMiterLimit(CurrentContext, *(CGFloat *)&qword_255A25368);
      CGContextBeginPath(CurrentContext);
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      MinX = CGRectGetMinX(v16);
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      MinY = CGRectGetMinY(v17);
      CGContextMoveToPoint(CurrentContext, MinX, MinY);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      MaxX = CGRectGetMaxX(v18);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v11 = CGRectGetMinY(v19);
      CGContextAddLineToPoint(CurrentContext, MaxX, v11);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v12 = CGRectGetMaxX(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MaxY = CGRectGetMaxY(v21);
      CGContextAddLineToPoint(CurrentContext, v12, MaxY);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v14 = CGRectGetMinX(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v15 = CGRectGetMaxY(v23);
      CGContextAddLineToPoint(CurrentContext, v14, v15);
      CGContextClosePath(CurrentContext);
      CGContextStrokePath(CurrentContext);
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (void)clipRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextClipToRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGContext *CurrentContext;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)qword_255A26FE0);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)qword_255A26FE8);
  sub_228FF3A20(CurrentContext, *(CGFloat *)&qword_255A25360);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7, v6);
  CGContextAddLineToPoint(CurrentContext, x, y);
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

+ (void)setDefaultMiterLimit:(double)a3
{
  qword_255A25368 = *(_QWORD *)&a3;
}

+ (double)defaultMiterLimit
{
  return *(double *)&qword_255A25368;
}

+ (void)setDefaultFlatness:(double)a3
{
  qword_255A25370 = *(_QWORD *)&a3;
}

+ (double)defaultFlatness
{
  return *(double *)&qword_255A25370;
}

+ (void)setDefaultWindingRule:(unint64_t)a3
{
  qword_255A26FF0 = a3;
}

+ (unint64_t)defaultWindingRule
{
  return qword_255A26FF0;
}

+ (void)setDefaultLineCapStyle:(unint64_t)a3
{
  qword_255A26FE0 = a3;
}

+ (unint64_t)defaultLineCapStyle
{
  return qword_255A26FE0;
}

+ (void)setDefaultLineJoinStyle:(unint64_t)a3
{
  qword_255A26FE8 = a3;
}

+ (unint64_t)defaultLineJoinStyle
{
  return qword_255A26FE8;
}

+ (void)setDefaultLineWidth:(double)a3
{
  qword_255A25360 = *(_QWORD *)&a3;
}

+ (double)defaultLineWidth
{
  return *(double *)&qword_255A25360;
}

- (AKTSDBezierPath)init
{
  char *v2;
  AKTSDBezierPath *v3;
  int v4;
  int v5;
  uint64_t v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKTSDBezierPath;
  v2 = -[AKTSDBezierPath init](&v9, sel_init);
  v3 = (AKTSDBezierPath *)v2;
  if (v2)
  {
    v4 = *((_DWORD *)v2 + 42);
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *((_QWORD *)v2 + 19) = 0;
    *((_QWORD *)v2 + 20) = 0;
    *((_QWORD *)v2 + 5) = 0;
    *((_QWORD *)v2 + 6) = -1;
    *((_QWORD *)v2 + 7) = 0;
    v5 = ((8 * qword_255A26FF0) | ((_BYTE)qword_255A26FE0 << 6)) | 5 | v4 & 0xFFFFF800 | (16 * (qword_255A26FE8 & 0xF));
    *((_QWORD *)v2 + 8) = qword_255A25360;
    v6 = qword_255A25370;
    *((_QWORD *)v2 + 13) = qword_255A25368;
    *((_QWORD *)v2 + 14) = v6;
    *((_QWORD *)v2 + 15) = 0;
    *((_QWORD *)v2 + 16) = 0;
    *((_QWORD *)v2 + 17) = 0;
    *((_DWORD *)v2 + 42) = v5;
    v7 = v2;
  }

  return v3;
}

- (void)dealloc
{
  double *sfr_dashedLinePattern;
  void *sfr_path;
  void *sfr_extraSegments;
  objc_super v6;

  free(self->sfr_head);
  free(self->sfr_elementLength);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    free(sfr_dashedLinePattern);
  sfr_path = self->sfr_path;
  if (sfr_path)
    CFRelease(sfr_path);
  sfr_extraSegments = self->sfr_extraSegments;
  if (sfr_extraSegments)
    free(sfr_extraSegments);
  v6.receiver = self;
  v6.super_class = (Class)AKTSDBezierPath;
  -[AKTSDBezierPath dealloc](&v6, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double *sfr_dashedLinePattern;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "appendBezierPath:", self);
  objc_msgSend(v4, "setWindingRule:", -[AKTSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v4, "setLineCapStyle:", -[AKTSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v4, "setLineJoinStyle:", -[AKTSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[AKTSDBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(v4, "setLineWidth:");
  -[AKTSDBezierPath miterLimit](self, "miterLimit");
  objc_msgSend(v4, "setMiterLimit:");
  -[AKTSDBezierPath flatness](self, "flatness");
  objc_msgSend(v4, "setFlatness:");
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    objc_msgSend(v4, "setLineDash:count:phase:", sfr_dashedLinePattern, self->sfr_dashedLineCount, self->sfr_dashedLinePhase);
  return v4;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[AKTSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for line"));
  -[AKTSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  if (-[AKTSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for curve"));
  MEMORY[0x24BEDD108](self, sel__deviceCurveToPoint_controlPoint1_controlPoint2_);
}

- (void)closePath
{
  MEMORY[0x24BEDD108](self, sel__deviceClosePath);
}

- (void)removeAllPoints
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  void *sfr_path;

  sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF);
  self->sfr_bpFlags = sfr_bpFlags;
  self->sfr_elementCount = 0;
  self->sfr_extraSegmentCount = 0;
  self->sfr_lastSubpathIndex = -1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
    sfr_bpFlags = self->sfr_bpFlags;
  }
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
}

- (void)relativeMoveToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[AKTSDBezierPath currentPoint](self, "currentPoint");
  -[AKTSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", x + v6, y + v7);
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[AKTSDBezierPath currentPoint](self, "currentPoint");
  -[AKTSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x + v6, y + v7);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  -[AKTSDBezierPath currentPoint](self, "currentPoint");
  MEMORY[0x24BEDD108](self, sel__deviceCurveToPoint_controlPoint1_controlPoint2_);
}

- (double)lineWidth
{
  return self->sfr_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->sfr_lineWidth = a3;
}

- (unint64_t)lineCapStyle
{
  return *(_DWORD *)&self->sfr_bpFlags >> 6;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFF3F | ((a3 & 3) << 6));
}

- (unint64_t)lineJoinStyle
{
  return ((unint64_t)self->sfr_bpFlags >> 4) & 3;
}

- (void)setLineJoinStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFCF | (16 * (a3 & 0xF)));
}

- (unint64_t)windingRule
{
  return ((unint64_t)self->sfr_bpFlags >> 3) & 1;
}

- (void)setWindingRule:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFF7 | (8 * (a3 & 0x1F)));
}

- (double)miterLimit
{
  return self->sfr_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->sfr_miterLimit = a3;
}

- (double)flatness
{
  return self->sfr_flatness;
}

- (void)setFlatness:(double)a3
{
  self->sfr_flatness = a3;
}

- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5
{
  int64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  size_t v9;
  const double *v11;
  double *v12;
  double *v13;
  double *sfr_dashedLinePattern;
  double **p_sfr_dashedLinePattern;
  uint64_t v16;

  if (!a3)
    goto LABEL_14;
  v6 = a4;
  v7 = a4 < 0;
  if (a4 >= 0)
    v8 = a4;
  else
    v8 = -a4;
  if (a4 >= 0)
    v9 = 8 * v8;
  else
    v9 = -8 * v8;
  if (!(8 * v8))
    v7 = 0;
  if (v8 >> 61 || v7)
  {
LABEL_14:
    p_sfr_dashedLinePattern = &self->sfr_dashedLinePattern;
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      free(sfr_dashedLinePattern);
      *p_sfr_dashedLinePattern = 0;
      p_sfr_dashedLinePattern[1] = 0;
      p_sfr_dashedLinePattern[2] = 0;
    }
  }
  else
  {
    v11 = a3;
    v12 = self->sfr_dashedLinePattern;
    if (v12)
      v13 = (double *)malloc_type_realloc(v12, v9, 0x9EE8C79BuLL);
    else
      v13 = (double *)malloc_type_malloc(v9, 0x87648000uLL);
    self->sfr_dashedLinePattern = v13;
    self->sfr_dashedLineCount = v6;
    self->sfr_dashedLinePhase = a5;
    if (v6 >= 1)
    {
      do
      {
        v16 = *(_QWORD *)v11++;
        *(_QWORD *)v13++ = v16;
        --v6;
      }
      while (v6);
    }
  }
}

- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5
{
  double *sfr_dashedLinePattern;
  unint64_t i;
  uint64_t v7;

  if (a4)
    *a4 = self->sfr_dashedLineCount;
  if (a5)
    *a5 = self->sfr_dashedLinePhase;
  if (a3)
  {
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      for (i = self->sfr_dashedLineCount; i; --i)
      {
        v7 = *(_QWORD *)sfr_dashedLinePattern++;
        *(_QWORD *)a3++ = v7;
      }
    }
  }
}

- (void)_doPath
{
  CGPath *Mutable;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  if (!self->sfr_path && !-[AKTSDBezierPath isEmpty](self, "isEmpty"))
  {
    Mutable = CGPathCreateMutable();
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
      do
      {
        switch(*(_DWORD *)sfr_head & 0xF)
        {
          case 0:
            CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 1:
            CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 2:
            CGPathAddCurveToPoint(Mutable, 0, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            sfr_extraSegments += 4;
            break;
          case 3:
            CGPathCloseSubpath(Mutable);
            break;
          default:
            break;
        }
        sfr_head += 6;
      }
      while (sfr_head < v6);
    }
    self->sfr_path = Mutable;
  }
}

- (void)stroke
{
  CGContext *CurrentContext;
  double *sfr_dashedLinePattern;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)-[AKTSDBezierPath lineCapStyle](self, "lineCapStyle"));
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)-[AKTSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  sub_228FF3A20(CurrentContext, self->sfr_lineWidth);
  CGContextSetMiterLimit(CurrentContext, self->sfr_miterLimit);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    CGContextSetLineDash(CurrentContext, self->sfr_dashedLinePhase, sfr_dashedLinePattern, self->sfr_dashedLineCount);
  sub_228FF4848(self, CurrentContext);
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)fill
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sub_228FF4848(self, CurrentContext);
  if (-[AKTSDBezierPath windingRule](self, "windingRule"))
    CGContextEOFillPath(CurrentContext);
  else
    CGContextFillPath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)addClip
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  CGContextBeginPath(CurrentContext);
  sub_228FF4848(self, CurrentContext);
  if (-[AKTSDBezierPath windingRule](self, "windingRule"))
    CGContextEOClip(CurrentContext);
  else
    CGContextClip(CurrentContext);
  CGContextBeginPath(CurrentContext);
}

- (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  __int128 v7;
  float64x2_t v8;
  CGFloat y;
  float64x2_t v11;
  CGFloat v12;
  CGFloat v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  uint64_t v32;
  uint64_t v36;
  unint64_t v37;
  CGPoint v38;
  __int128 v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;

  v8 = (float64x2_t)a4;
  a4.x = a7.x;
  *(CGFloat *)&v7 = a7.y;
  y = a5.y;
  v11 = vsubq_f64((float64x2_t)a5, v8);
  v12 = a6.y;
  v38 = a4;
  v39 = v7;
  v13 = a7.y;
  v14 = vsubq_f64((float64x2_t)a6, (float64x2_t)a5);
  v15 = vsubq_f64(v14, v11);
  v16 = vsubq_f64(vsubq_f64((float64x2_t)a4, (float64x2_t)a6), v14);
  v17 = (float64x2_t)vzip2q_s64((int64x2_t)v15, (int64x2_t)v16);
  v18 = (float64x2_t)vzip1q_s64((int64x2_t)v15, (int64x2_t)v16);
  v19 = vmlaq_f64(vmulq_f64(v17, v17), v18, v18);
  if (v19.f64[0] <= v19.f64[1])
    v19.f64[0] = v19.f64[1];
  v20 = a3 * a3;
  v21 = v19.f64[0] * 9.0 * 0.0625;
  if (v21 > v20)
  {
    v22 = vsubq_f64(v16, v15);
    __asm
    {
      FMOV            V5.2D, #3.0
      FMOV            V6.2D, #6.0
    }
    v29 = vmulq_f64(v22, _Q6);
    v30 = vmlaq_f64(v22, _Q5, vaddq_f64(v11, v15));
    v31 = vmulq_f64(vaddq_f64(v15, v22), _Q6);
    v32 = 1;
    __asm
    {
      FMOV            V2.2D, #0.125
      FMOV            V3.2D, #0.25
      FMOV            V4.2D, #0.5
    }
    do
    {
      v36 = v32;
      v29 = vmulq_f64(v29, _Q2);
      v31 = vsubq_f64(vmulq_f64(v31, _Q3), v29);
      v30 = vsubq_f64(vmulq_f64(v30, _Q4), vmulq_f64(v31, _Q4));
      v32 *= 2;
      v21 = v21 * 0.0625;
    }
    while (v21 > v20 && v32 <= 0x10000);
    if (v32 >= 2)
    {
      v37 = (2 * v36) | 1;
      do
      {
        v42 = v29;
        v43 = vaddq_f64(v8, v30);
        v40 = vaddq_f64(v30, v31);
        v41 = vaddq_f64(v29, v31);
        -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v43, v38, v39);
        v30 = v40;
        v31 = v41;
        v29 = v42;
        v8 = v43;
        --v37;
      }
      while (v37 > 2);
    }
  }
  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v38.x, *(double *)&v39);
}

- (void)flattenIntoPath:(id)a3
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  id v8;

  v8 = a3;
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(v8, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(v8, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(v8, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:", *(double *)&qword_255A25370, *(double *)&sfr_head[-4], *(double *)&sfr_head[-2], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(_QWORD *)&sfr_head[2], *(_QWORD *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(v8, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }

}

- (id)bezierPathByFlatteningPath
{
  id v3;

  if ((*(_BYTE *)&self->sfr_bpFlags & 4) != 0)
  {
    v3 = (id)-[AKTSDBezierPath copy](self, "copy");
  }
  else
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    -[AKTSDBezierPath flattenIntoPath:](self, "flattenIntoPath:", v3);
  }
  return v3;
}

- (id)_copyFlattenedPath
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_class());
  -[AKTSDBezierPath flattenIntoPath:](self, "flattenIntoPath:", v3);
  return v3;
}

- (id)bezierPathByReversingPath
{
  id v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  unint64_t v6;
  double *sfr_extraSegments;
  PATHSEGMENT *v8;
  PATHSEGMENT *v9;
  uint64_t v10;
  BOOL v11;
  PATHSEGMENT *v12;
  char v13;
  double *v14;

  if (self->sfr_elementCount > 1)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 2)
    {
      sfr_head = self->sfr_head;
      v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      v8 = sfr_head + 6;
      do
      {
        v9 = v8;
        v10 = *(_QWORD *)&sfr_head[6] & 0xFLL;
        if (v10)
          v11 = (unint64_t)&sfr_head[12] >= v6;
        else
          v11 = 1;
        if (v11)
        {
          if (v10)
            v12 = v9;
          else
            v12 = sfr_head;
          objc_msgSend(v3, "moveToPoint:", *(double *)&v12[2], *(double *)&v12[4]);
          v13 = 0;
          v14 = (double *)&v12[-2];
          while (1)
          {
            switch((_DWORD)v14[1] & 0xF)
            {
              case 0:
                goto LABEL_25;
              case 1:
                if ((v13 & 1) != 0 && (*(_BYTE *)(v14 - 2) & 0xF) == 0)
                  goto LABEL_20;
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_24;
              case 2:
                objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", *(v14 - 1), *v14, sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4) + 2], sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4) + 3], sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4)], sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4) + 1]);
                if ((v13 & 1) != 0)
                {
                  if ((*(_BYTE *)(v14 - 2) & 0xF) == 0)
LABEL_20:
                    objc_msgSend(v3, "closePath");
LABEL_22:
                  v13 = 1;
                }
                else
                {
                  v13 = 0;
                }
LABEL_24:
                v14 -= 3;
                break;
              case 3:
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_22;
              default:
                goto LABEL_24;
            }
          }
        }
LABEL_25:
        v8 = v9 + 6;
        sfr_head = v9;
      }
      while ((unint64_t)&v9[6] < v6);
    }
  }
  else
  {
    v3 = (id)-[AKTSDBezierPath copy](self, "copy");
  }
  return v3;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  double *v9;
  void *sfr_path;

  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    do
    {
      *(float64x2_t *)&sfr_head[2] = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, *(double *)&sfr_head[4]), *(float64x2_t *)&a3->a, *(double *)&sfr_head[2]));
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  if (sfr_extraSegments)
  {
    sfr_extraSegmentCount = self->sfr_extraSegmentCount;
    if (sfr_extraSegmentCount >= 1)
    {
      v9 = &sfr_extraSegments[4 * sfr_extraSegmentCount];
      do
      {
        *(float64x2_t *)sfr_extraSegments = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[1]), *(float64x2_t *)&a3->a, *sfr_extraSegments));
        *((float64x2_t *)sfr_extraSegments + 1) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[3]), *(float64x2_t *)&a3->a, sfr_extraSegments[2]));
        sfr_extraSegments += 4;
      }
      while (sfr_extraSegments < v9);
    }
  }
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (CGPath)CGPath
{
  -[AKTSDBezierPath _doPath](self, "_doPath");
  return (CGPath *)self->sfr_path;
}

- (BOOL)isEmpty
{
  return self->sfr_elementCount == 0;
}

- (CGPoint)currentPoint
{
  PATHSEGMENT *v3;
  double v4;
  double v5;
  CGPoint result;

  if (-[AKTSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for line"));
  v3 = &self->sfr_head[6 * self->sfr_elementCount];
  v4 = *(double *)&v3[-4];
  v5 = *(double *)&v3[-2];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)controlPointBounds
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  CGPoint v4;
  double y;
  float64x2_t size;
  PATHSEGMENT *sfr_head;
  int64_t sfr_elementCount;
  float64x2_t v9;
  unint64_t v10;
  PATHSEGMENT *v11;
  float64x2_t v13;
  float64x2_t *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  float64x2_t *v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  CGRect result;

  if (-[AKTSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for control point bounds"));
  sfr_bpFlags = self->sfr_bpFlags;
  if ((*(_BYTE *)&sfr_bpFlags & 1) != 0)
  {
    sfr_head = self->sfr_head;
    sfr_elementCount = self->sfr_elementCount;
    v9 = *(float64x2_t *)&sfr_head[2];
    if (sfr_elementCount < 2)
    {
      v4 = *(CGPoint *)&sfr_head[2];
    }
    else
    {
      v10 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      v11 = sfr_head + 6;
      v4 = (CGPoint)v9;
      do
      {
        if ((*(_DWORD *)v11 & 0xF) != 3 && ((*(_DWORD *)v11 & 0xF) != 0 || (unint64_t)&v11[6] < v10))
        {
          v13 = *(float64x2_t *)&v11[2];
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v13, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v13);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v9), (int8x16_t)v13, (int8x16_t)v9);
        }
        v11 += 6;
      }
      while ((unint64_t)v11 < v10);
    }
    sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
    if (sfr_extraSegments)
    {
      sfr_extraSegmentCount = self->sfr_extraSegmentCount;
      if (sfr_extraSegmentCount >= 1)
      {
        v16 = &sfr_extraSegments[2 * sfr_extraSegmentCount];
        do
        {
          v17 = *sfr_extraSegments;
          v18 = sfr_extraSegments[1];
          sfr_extraSegments += 2;
          v19 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v17, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v17);
          v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v17, v9), (int8x16_t)v17, (int8x16_t)v9);
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v18, v19), (int8x16_t)v19, (int8x16_t)v18);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v20), (int8x16_t)v18, (int8x16_t)v20);
        }
        while (sfr_extraSegments < v16);
      }
    }
    self->sfr_controlPointBounds.origin = v4;
    size = vsubq_f64(v9, (float64x2_t)v4);
    self->sfr_controlPointBounds.size = (CGSize)size;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFFFE);
    y = v4.y;
  }
  else
  {
    v4.x = self->sfr_controlPointBounds.origin.x;
    y = self->sfr_controlPointBounds.origin.y;
    size = (float64x2_t)self->sfr_controlPointBounds.size;
  }
  v21 = size.f64[1];
  result.size.width = size.f64[0];
  result.origin.x = v4.x;
  result.size.height = v21;
  result.origin.y = y;
  return result;
}

- (CGRect)bounds
{
  const CGPath *sfr_path;
  CGRect result;

  if ((*(_BYTE *)&self->sfr_bpFlags & 4) != 0)
  {
    -[AKTSDBezierPath controlPointBounds](self, "controlPointBounds");
  }
  else
  {
    -[AKTSDBezierPath _doPath](self, "_doPath");
    sfr_path = (const CGPath *)self->sfr_path;
    if (sfr_path)
      return CGPathGetPathBoundingBox(sfr_path);
    else
      return *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF090];
  }
  return result;
}

- (BOOL)isFlat
{
  int64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[AKTSDBezierPath elementCount](self, "elementCount");
  if (!v3)
    return 1;
  v4 = v3;
  if (-[AKTSDBezierPath elementAtIndex:](self, "elementAtIndex:", 0) == 2)
    return 0;
  v6 = 1;
  do
  {
    v7 = v6;
    if (v4 == v6)
      break;
    v8 = -[AKTSDBezierPath elementAtIndex:](self, "elementAtIndex:", v6);
    v6 = v7 + 1;
  }
  while (v8 != 2);
  return v7 >= v4;
}

- (BOOL)isClockwise
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  BOOL v13;
  double v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[AKTSDBezierPath elementCount](self, "elementCount");
  if (v3 < 1)
  {
    v9 = 0.0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *MEMORY[0x24BDBEFB0];
    v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v9 = 0.0;
    v10 = v8;
    v11 = *MEMORY[0x24BDBEFB0];
    do
    {
      switch(-[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v5, &v15))
      {
        case 0uLL:
          v11 = v15;
          v10 = v16;
          v7 = v15;
          v8 = v16;
          break;
        case 1uLL:
          if (v7 != v15 || v8 != v16)
            v9 = v7 * v16 - v8 * v15 + v9;
          v6 = 1;
          v7 = v15;
          v8 = v16;
          break;
        case 2uLL:
          NSLog(CFSTR("Warning: Path should be flat. Illegal TSDCurveToBezierPathElement."));
          break;
        case 3uLL:
          v13 = v7 == v11 && v8 == v10;
          v6 = 0;
          if (!v13)
            v9 = v7 * v10 - v8 * v11 + v9;
          break;
        default:
          break;
      }
      ++v5;
    }
    while (v4 != v5);
    if ((v6 & 1) != 0)
      v9 = v7 * v10 - v8 * v11 + v9;
  }
  return v9 >= 0.0;
}

- (double)calculateLengthOfElement:(int64_t)a3
{
  double v3;
  unint64_t v4;
  float v5;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = 0.0;
  if (a3)
  {
    v4 = -[AKTSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a3, &v9);
    switch(v4)
    {
      case 3uLL:
        goto LABEL_5;
      case 2uLL:
        v8 = 0.0;
        sub_228FF7830((uint64_t)&v9, &v8);
        return v8;
      case 1uLL:
LABEL_5:
        v5 = (v10 - v12) * (v10 - v12) + (v9 - v11) * (v9 - v11);
        return sqrtf(v5);
    }
  }
  return v3;
}

- (void)calculateLengths
{
  int64_t v3;
  int64_t sfr_elementMax;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t i;
  double v10;

  self->sfr_totalLength = 0.0;
  v3 = -[AKTSDBezierPath elementCount](self, "elementCount");
  sfr_elementMax = self->sfr_elementMax;
  v5 = sfr_elementMax < 0;
  if (sfr_elementMax >= 0)
    v6 = self->sfr_elementMax;
  else
    v6 = -sfr_elementMax;
  if (!(8 * v6))
    v5 = 0;
  if (!(v6 >> 61) && !v5)
  {
    v7 = v3;
    if (sfr_elementMax >= 0)
      v8 = 8 * v6;
    else
      v8 = -8 * v6;
    self->sfr_elementLength = (double *)malloc_type_realloc(self->sfr_elementLength, v8, 0x7A580F34uLL);
    if (v7 >= 1)
    {
      for (i = 0; i != v7; ++i)
      {
        -[AKTSDBezierPath calculateLengthOfElement:](self, "calculateLengthOfElement:", i);
        self->sfr_elementLength[i] = v10;
        self->sfr_totalLength = v10 + self->sfr_totalLength;
      }
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[AKTSDBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[AKTSDBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  double *sfr_elementLength;
  double result;
  double v7;

  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[AKTSDBezierPath calculateLengths](self, "calculateLengths");
  if (a3 < 1)
    return 0.0;
  sfr_elementLength = self->sfr_elementLength;
  result = 0.0;
  do
  {
    v7 = *sfr_elementLength++;
    result = result + v7;
    --a3;
  }
  while (a3);
  return result;
}

- (int64_t)elementCount
{
  return self->sfr_elementCount;
}

- (unint64_t)elementAtIndex:(int64_t)a3
{
  return -[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", a3, 0);
}

- (unint64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v11;
  CGPoint *v12;

  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCB78];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@: index (%ld) beyond bounds (%ld)"), v9, a3, self->sfr_elementCount);

  }
  sfr_head = self->sfr_head;
  v11 = &sfr_head[6 * a3];
  if (a4)
  {
    if ((*(_QWORD *)v11 & 0xFLL) == 2)
    {
      v12 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(_QWORD *)v11 >> 4));
      *a4 = *v12;
      a4[1] = v12[1];
      a4 += 2;
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(_QWORD *)v11 & 0xFLL;
}

- (unint64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v11;
  unint64_t v12;
  CGPoint *v13;

  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCB78];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@: index (%ld) beyond bounds (%ld)"), v9, a3, self->sfr_elementCount);

  }
  sfr_head = self->sfr_head;
  v11 = &sfr_head[6 * a3];
  if (a4)
  {
    v12 = *(_QWORD *)v11;
    if ((*(_QWORD *)v11 & 0xFLL) != 0)
    {
      *a4 = *(CGPoint *)&sfr_head[6 * a3 - 4];
      v12 = *(_QWORD *)v11;
    }
    if ((v12 & 0xF) != 0)
    {
      if ((v12 & 0xF) == 2)
      {
        v13 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (v12 >> 4));
        a4[1] = *v13;
        a4[2] = v13[1];
        a4 += 3;
      }
      else
      {
        ++a4;
      }
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(_QWORD *)v11 & 0xFLL;
}

- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  PATHSEGMENT *sfr_head;
  CGPoint *v11;
  CGPoint v12;
  void *sfr_path;

  if (a4 < 0 || self->sfr_elementCount <= a4)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCB78];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@: index (%ld) beyond bounds (%ld)"), v9, a4, self->sfr_elementCount);

  }
  sfr_head = self->sfr_head;
  if ((*(_QWORD *)&sfr_head[6 * a4] & 0xFLL) == 2)
  {
    v11 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(_QWORD *)&sfr_head[6 * a4] >> 4));
    *v11 = *a3;
    v12 = a3[1];
    a3 += 2;
    v11[1] = v12;
  }
  *(CGPoint *)&sfr_head[6 * a4 + 2] = *a3;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (void)_appendToPath:(id)a3
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  id v8;

  v8 = a3;
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(v8, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(v8, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(v8, "curveToPoint:controlPoint1:controlPoint2:", *(double *)&sfr_head[2], *(double *)&sfr_head[4], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(v8, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }

}

- (void)appendBezierPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "_appendToPath:", self);
  }
  else
  {
    v6 = objc_msgSend(v4, "elementCount");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        switch(objc_msgSend(v4, "elementAtIndex:associatedPoints:", i, &v9))
        {
          case 0:
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
            break;
          case 1:
            -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
            break;
          case 2:
            -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
            break;
          case 3:
            -[AKTSDBezierPath closePath](self, "closePath");
            break;
          default:
            continue;
        }
      }
    }
  }

}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxX;
  double v9;
  double MinX;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MaxX = CGRectGetMaxX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v12));
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = CGRectGetMaxX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v14));
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v16));
  -[AKTSDBezierPath closePath](self, "closePath");
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4;
  double *p_y;

  v4 = a4 - 1;
  if (a4 >= 1)
  {
    if (-[AKTSDBezierPath isEmpty](self, "isEmpty") || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100)
      -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    else
      -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    if ((unint64_t)a4 >= 2)
    {
      p_y = &a3[1].y;
      do
      {
        -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
        p_y += 2;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AKTSDBezierPath *v8;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v8 = objc_alloc_init(AKTSDBezierPath);
  -[AKTSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0, -45.0, 315.0);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tx = *(_OWORD *)&v16.tx;
  CGAffineTransformTranslate(&v16, &v15, MidX, MidY);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = CGRectGetWidth(v19) * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetHeight(v20);
  v14 = v16;
  CGAffineTransformScale(&v15, &v14, v11, v12 * 0.5);
  v16 = v15;
  -[AKTSDBezierPath transformUsingAffineTransform:](v8, "transformUsingAffineTransform:", &v15);
  -[AKTSDBezierPath appendBezierPath:](self, "appendBezierPath:", v8);

}

- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6
{
  __sincos_stret((a6 - a5) * 0.5);
  __sincos_stret(a5);
  __sincos_stret(a6);
  MEMORY[0x24BEDD108](self, sel__deviceCurveToPoint_controlPoint1_controlPoint2_);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  double y;
  double x;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  __double2 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  y = a3.y;
  x = a3.x;
  if (__fpclassifyd(a5) < 3 || __fpclassifyd(a6) <= 2)
  {
    v15 = (void *)MEMORY[0x24BDBCE88];
    v16 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("%@: illegal angle argument"), v17);

  }
  v18 = a5 * 3.14159265 / 180.0;
  v19 = a6 * 3.14159265;
  v20 = __sincos_stret(v18);
  v21 = x + a4 * v20.__cosval;
  v22 = y + a4 * v20.__sinval;
  if (-[AKTSDBezierPath isEmpty](self, "isEmpty"))
    -[AKTSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v21, v22);
  else
    -[AKTSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v21, v22);
  v23 = v19 / 180.0;
  if (a7)
  {
    for (; v18 < v23; v18 = v18 + 6.28318531)
      ;
    v24 = v18 - v23;
    if (v18 - v23 > 1.57079633)
    {
      do
      {
        v25 = v18 + -1.57079633;
        -[AKTSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v18, v18 + -1.57079633);
        v24 = v25 - v23;
        v18 = v18 + -1.57079633;
      }
      while (v25 - v23 > 1.57079633);
      goto LABEL_19;
    }
  }
  else
  {
    for (; v23 < v18; v23 = v23 + 6.28318531)
      ;
    v24 = v23 - v18;
    if (v23 - v18 > 1.57079633)
    {
      do
      {
        v25 = v18 + 1.57079633;
        -[AKTSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v18, v18 + 1.57079633);
        v24 = v23 - v25;
        v18 = v18 + 1.57079633;
      }
      while (v23 - v25 > 1.57079633);
      goto LABEL_19;
    }
  }
  v25 = v18;
LABEL_19:
  if (v24 > 0.0)
    -[AKTSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v25, v23);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6
{
  -[AKTSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, a3.x, a3.y, a4, a5, a6);
}

- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGAffineTransform v39;
  CGAffineTransform v40;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v37 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  v38 = *MEMORY[0x24BDBD8B8];
  v35 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  v36 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v33 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v34 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  -[AKTSDBezierPath currentPoint](self, "currentPoint");
  v13 = v11;
  v14 = v12;
  if (v11 == v9 && v12 == v8)
  {
    v17 = v9 - v11;
    v16 = v8 - v12;
    v18 = 0.0;
    v30 = 0.0;
  }
  else
  {
    v30 = a5;
    v16 = v8 - v12;
    v17 = v9 - v11;
    v18 = atan2(v8 - v12, v17);
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tx = v34;
  v39.ty = v33;
  CGAffineTransformRotate(&v40, &v39, -v18);
  v19 = v40.tx + v16 * v40.c + v40.a * v17;
  v20 = v40.ty + v16 * v40.d + v40.b * v17;
  v32 = v14;
  v21 = v40.tx + (y - v14) * v40.c + v40.a * (x - v13);
  v22 = v40.ty + (y - v14) * v40.d + v40.b * (x - v13);
  v23 = v19 == v21 && v20 == v22;
  v24 = 0.0;
  if (!v23)
    v24 = 3.14159265 - fabs(atan2(v22 - v20, v21 - v19));
  v25 = sin(v24 * 0.5);
  v31 = v13;
  if (v25 == 0.0)
  {
    v26 = 0.0;
    v27 = v20;
    v28 = 0.0;
    v29 = 0.0;
  }
  else
  {
    v19 = v19 - v30 * fabs(cos(v24 * 0.5) / v25);
    if (v22 <= v20)
    {
      v27 = -v30;
      v29 = v24 + -1.57079633;
      v26 = 1.57079633;
    }
    else
    {
      v29 = 1.57079633 - v24;
      v26 = -1.57079633;
      v27 = v30;
    }
    v28 = v30;
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tx = v34;
  v39.ty = v33;
  CGAffineTransformRotate(&v40, &v39, v18);
  -[AKTSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v40.tx + v27 * v40.c + v40.a * v19, v32 + v40.ty + v27 * v40.d + v40.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  const CGPath *sfr_path;
  BOOL v7;
  CGPoint v9;

  y = a3.y;
  x = a3.x;
  if ((byte_255A26FF8 & 1) == 0)
    byte_255A26FF8 = 1;
  -[AKTSDBezierPath _doPath](self, "_doPath");
  sfr_path = (const CGPath *)self->sfr_path;
  if (!sfr_path)
    return 0;
  v7 = -[AKTSDBezierPath windingRule](self, "windingRule") == 1;
  v9.x = x;
  v9.y = y;
  return CGPathContainsPoint(sfr_path, 0, v9, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v11;
  float64x2_t *sfr_extraSegments;
  size_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  size_t v17;
  void *v18;
  void *v19;
  int64_t sfr_dashedLineCount;
  double *sfr_dashedLinePattern;
  _DWORD *v22;
  double v23;
  unsigned int v24;
  float sfr_lineWidth;
  double sfr_flatness;
  float sfr_miterLimit;
  float v28;
  int64_t v29;
  PATHSEGMENT *v30;
  PATHSEGMENT *v31;
  double *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float sfr_dashedLinePhase;
  int64_t v40;
  float v41;
  float v42;
  float v43;
  char v44;
  float v45;
  float v46;
  float v47;
  float v48;
  int v49;
  int v50;
  int v51;
  float v52;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v5 = -[AKTSDBezierPath windingRule](self, "windingRule");
    v6 = -[AKTSDBezierPath lineCapStyle](self, "lineCapStyle");
    v7 = -[AKTSDBezierPath lineJoinStyle](self, "lineJoinStyle");
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v11 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
      v13 = 9 * (sfr_elementCount + 2 * self->sfr_extraSegmentCount);
      v14 = (char *)malloc_type_malloc(v13, 0xCA1BBA45uLL);
      v15 = v14;
      do
      {
        v16 = *(_QWORD *)sfr_head;
        if ((*(_QWORD *)sfr_head & 0xFLL) == 2)
        {
          *v15 = 2;
          *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*sfr_extraSegments));
          v15[9] = 2;
          *(int8x8_t *)(v15 + 10) = vrev32_s8((int8x8_t)vcvt_f32_f64(sfr_extraSegments[1]));
          v15 += 18;
          sfr_extraSegments += 2;
          v16 = *(_QWORD *)sfr_head;
        }
        *v15 = v16 & 0xF;
        *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*(float64x2_t *)&sfr_head[2]));
        v15 += 9;
        sfr_head += 6;
      }
      while (sfr_head < v11);
      objc_msgSend(v4, "encodeBytes:length:forKey:", v14, v13, CFSTR("TSDSegments"));
      free(v14);
    }
    if (v5)
    {
      *(float *)&v8 = (float)v5;
      objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("TSDWindingRule"), v8);
    }
    if (v6)
    {
      *(float *)&v8 = (float)v6;
      objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("TSDCapStyle"), v8);
    }
    if (v7)
    {
      *(float *)&v8 = (float)v7;
      objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("TSDJoinStyle"), v8);
    }
    if (self->sfr_lineWidth != 1.0)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TSDLineWidth"));
    if (self->sfr_miterLimit != 10.0)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TSDMiterLimit"));
    if (self->sfr_flatness != 0.6)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TSDFlatness"));
    if (self->sfr_dashedLineCount)
    {
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TSDDashPhase"), self->sfr_dashedLinePhase);
      v17 = 4 * self->sfr_dashedLineCount;
      v18 = malloc_type_malloc(v17, 0xDC1F855BuLL);
      v19 = v18;
      sfr_dashedLineCount = self->sfr_dashedLineCount;
      if (sfr_dashedLineCount >= 1)
      {
        sfr_dashedLinePattern = self->sfr_dashedLinePattern;
        v22 = v18;
        do
        {
          v23 = *sfr_dashedLinePattern++;
          *(float *)&v24 = v23;
          *v22++ = bswap32(v24);
          --sfr_dashedLineCount;
        }
        while (sfr_dashedLineCount);
      }
      objc_msgSend(v4, "encodeBytes:length:forKey:", v18, v17, CFSTR("TSDDashPatterns"));
      free(v19);
    }
  }
  else
  {
    v52 = (float)(self->sfr_elementCount + 2 * self->sfr_extraSegmentCount);
    v51 = -[AKTSDBezierPath windingRule](self, "windingRule");
    v50 = -[AKTSDBezierPath lineCapStyle](self, "lineCapStyle");
    v49 = -[AKTSDBezierPath lineJoinStyle](self, "lineJoinStyle");
    sfr_lineWidth = self->sfr_lineWidth;
    sfr_flatness = self->sfr_flatness;
    sfr_miterLimit = self->sfr_miterLimit;
    v47 = sfr_miterLimit;
    v48 = sfr_lineWidth;
    v28 = sfr_flatness;
    v45 = (float)self->sfr_dashedLineCount;
    v46 = v28;
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "i", &v52);
    v29 = self->sfr_elementCount;
    if (v29 >= 1)
    {
      v30 = self->sfr_head;
      v31 = &v30[6 * v29];
      v32 = (double *)self->sfr_extraSegments;
      do
      {
        v44 = *(_BYTE *)v30 & 0xF;
        if (v44 == 2)
        {
          v33 = *v32;
          v34 = v32[1];
          v42 = v34;
          v43 = v33;
          objc_msgSend(v4, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
          v35 = v32[2];
          v36 = v32[3];
          v42 = v36;
          v43 = v35;
          objc_msgSend(v4, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
          v32 += 4;
        }
        v37 = *(double *)&v30[2];
        v38 = *(double *)&v30[4];
        v42 = v38;
        v43 = v37;
        objc_msgSend(v4, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
        v30 += 6;
      }
      while (v30 < v31);
    }
    objc_msgSend(v4, "encodeValuesOfObjCTypes:", "iiifffi", &v51, &v50, &v49, &v48, &v47, &v46, &v45);
    if (self->sfr_dashedLineCount)
    {
      sfr_dashedLinePhase = self->sfr_dashedLinePhase;
      v43 = sfr_dashedLinePhase;
      objc_msgSend(v4, "encodeValueOfObjCType:at:", "f", &v43);
      if ((uint64_t)self->sfr_dashedLineCount >= 1)
      {
        v40 = 0;
        do
        {
          v41 = self->sfr_dashedLinePattern[v40];
          v43 = v41;
          objc_msgSend(v4, "encodeValueOfObjCType:at:", "f", &v43);
          ++v40;
        }
        while (v40 < (int64_t)self->sfr_dashedLineCount);
      }
    }
  }

}

- (AKTSDBezierPath)initWithCoder:(id)a3
{
  id v4;
  AKTSDBezierPath *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  float64x2_t v10;
  int v11;
  double v12;
  int v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  unsigned int *v24;
  unint64_t v25;
  double v26;
  double *v27;
  unsigned int v28;
  float sfr_lineWidth;
  double sfr_flatness;
  float sfr_miterLimit;
  float v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  AKTSDBezierPath *v36;
  float v38;
  float sfr_dashedLineCount;
  float v40;
  float v41;
  float v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  char v46;
  unint64_t v47;

  v4 = a3;
  v5 = -[AKTSDBezierPath init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "allowsKeyedCoding"))
    {
      v47 = 0;
      v6 = objc_retainAutorelease(v4);
      v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("TSDSegments"), &v47);
      if (v7)
      {
        if (v47)
        {
          v8 = v7 + v47;
          if (v7 < v7 + v47)
          {
            do
            {
              v9 = v7 + 9;
              v10 = vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v7 + 1)));
              switch(*(_BYTE *)v7)
              {
                case 0:
                  -[AKTSDBezierPath moveToPoint:](v5, "moveToPoint:", *(_OWORD *)&v10);
                  break;
                case 1:
                  -[AKTSDBezierPath lineToPoint:](v5, "lineToPoint:", *(_OWORD *)&v10);
                  break;
                case 2:
                  v9 = v7 + 27;
                  -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v7 + 19))), *(_OWORD *)&v10, vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v7 + 10))));
                  break;
                case 3:
                  -[AKTSDBezierPath closePath](v5, "closePath");
                  break;
                default:
                  break;
              }
              v7 = v9;
            }
            while (v9 < v8);
          }
        }
      }
      -[AKTSDBezierPath setWindingRule:](v5, "setWindingRule:", (int)objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("TSDWindingRule")));
      -[AKTSDBezierPath setLineCapStyle:](v5, "setLineCapStyle:", (int)objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("TSDCapStyle")));
      -[AKTSDBezierPath setLineJoinStyle:](v5, "setLineJoinStyle:", (int)objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("TSDJoinStyle")));
      v11 = objc_msgSend(v6, "containsValueForKey:", CFSTR("TSDLineWidth"));
      v12 = 1.0;
      if (v11)
        objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("TSDLineWidth"), 1.0);
      v5->sfr_lineWidth = v12;
      v13 = objc_msgSend(v6, "containsValueForKey:", CFSTR("TSDMiterLimit"));
      v14 = 10.0;
      if (v13)
        objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("TSDMiterLimit"), 10.0);
      v5->sfr_miterLimit = v14;
      if (objc_msgSend(v6, "containsValueForKey:", CFSTR("TSDFlatness")))
        objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("TSDFlatness"));
      else
        v15 = 0x3FE3333333333333;
      *(_QWORD *)&v5->sfr_flatness = v15;
      v22 = objc_retainAutorelease(v6);
      v23 = objc_msgSend(v22, "decodeBytesForKey:returnedLength:", CFSTR("TSDDashPatterns"), &v47);
      if (v23 && v47)
      {
        v24 = (unsigned int *)v23;
        v25 = v23 + v47;
        v5->sfr_dashedLineCount = v47 >> 2;
        objc_msgSend(v22, "decodeDoubleForKey:", CFSTR("TSDDashPhase"));
        v5->sfr_dashedLinePhase = v26;
        v27 = (double *)malloc_type_malloc(8 * v5->sfr_dashedLineCount, 0x100004000313F17uLL);
        v5->sfr_dashedLinePattern = v27;
        while ((unint64_t)v24 < v25)
        {
          v28 = *v24++;
          *v27++ = COERCE_FLOAT(bswap32(v28));
        }
      }
    }
    else
    {
      LODWORD(v47) = 0;
      v46 = 0;
      v45 = 0.0;
      v43 = 0;
      v44 = 0;
      v16 = objc_msgSend(v4, "versionForClassName:", CFSTR("AKTSDBezierPath"));
      objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "i", &v47, 4);
      if ((_DWORD)v47)
      {
        v17 = 0;
        do
        {
          objc_msgSend(v4, "decodeValuesOfObjCTypes:", "cff", &v46, &v45, (char *)&v44 + 4);
          v18 = v45;
          v19 = *((float *)&v44 + 1);
          switch(v46)
          {
            case 0:
              -[AKTSDBezierPath moveToPoint:](v5, "moveToPoint:", v45, *((float *)&v44 + 1));
              break;
            case 1:
              -[AKTSDBezierPath lineToPoint:](v5, "lineToPoint:", v45, *((float *)&v44 + 1));
              break;
            case 2:
              objc_msgSend(v4, "decodeValuesOfObjCTypes:", "cff", &v46, &v45, (char *)&v44 + 4);
              v20 = v45;
              v21 = *((float *)&v44 + 1);
              objc_msgSend(v4, "decodeValuesOfObjCTypes:", "cff", &v46, &v45, (char *)&v44 + 4);
              v17 += 2;
              -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", v45, *((float *)&v44 + 1), v18, v19, v20, v21);
              break;
            case 3:
              -[AKTSDBezierPath closePath](v5, "closePath");
              break;
            default:
              break;
          }
          ++v17;
        }
        while (v17 < v47);
      }
      if (v16 > 523)
      {
        sfr_lineWidth = v5->sfr_lineWidth;
        sfr_flatness = v5->sfr_flatness;
        sfr_miterLimit = v5->sfr_miterLimit;
        v41 = sfr_miterLimit;
        v42 = sfr_lineWidth;
        v32 = sfr_flatness;
        sfr_dashedLineCount = (float)v5->sfr_dashedLineCount;
        v40 = v32;
        objc_msgSend(v4, "decodeValuesOfObjCTypes:", "iiifffi", &v44, &v43, (char *)&v43 + 4, &v42, &v41, &v40, &sfr_dashedLineCount);
        -[AKTSDBezierPath setWindingRule:](v5, "setWindingRule:", v44);
        -[AKTSDBezierPath setLineCapStyle:](v5, "setLineCapStyle:", v43);
        -[AKTSDBezierPath setLineJoinStyle:](v5, "setLineJoinStyle:", HIDWORD(v43));
        v5->sfr_lineWidth = v42;
        v33 = v40;
        v5->sfr_miterLimit = v41;
        v5->sfr_flatness = v33;
        v34 = (unint64_t)sfr_dashedLineCount;
        v5->sfr_dashedLineCount = (unint64_t)sfr_dashedLineCount;
        if (v34)
        {
          v38 = 0.0;
          objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "f", &v38, 4);
          v5->sfr_dashedLinePhase = v38;
          v5->sfr_dashedLinePattern = (double *)malloc_type_malloc(8 * v5->sfr_dashedLineCount, 0x100004000313F17uLL);
          if (v5->sfr_dashedLineCount)
          {
            v35 = 0;
            do
            {
              objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "f", &v38, 4);
              v5->sfr_dashedLinePattern[v35++] = v38;
            }
            while (v35 < v5->sfr_dashedLineCount);
          }
        }
      }
      else
      {
        v42 = 0.0;
        LOBYTE(v41) = 0;
        objc_msgSend(v4, "decodeValuesOfObjCTypes:", "iiifc", &v44, &v43, (char *)&v43 + 4, &v42, &v41);
        v5->sfr_lineWidth = v42;
        -[AKTSDBezierPath setWindingRule:](v5, "setWindingRule:", v44);
        -[AKTSDBezierPath setLineCapStyle:](v5, "setLineCapStyle:", v43);
        -[AKTSDBezierPath setLineJoinStyle:](v5, "setLineJoinStyle:", HIDWORD(v43));
      }
    }
    v36 = v5;
  }

  return v5;
}

- (const)cString
{
  void *v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  char *v8;
  size_t v9;
  int v10;
  id v11;
  const char *v12;
  char v14;
  _BYTE v15[271];

  *(_QWORD *)&v15[255] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    while (2)
    {
      if (sfr_head == self->sfr_head)
      {
        v8 = &v14;
        v9 = 256;
      }
      else
      {
        v14 = 32;
        v8 = v15;
        v9 = 255;
      }
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          v10 = snprintf(v8, v9, "M %f %f");
          goto LABEL_12;
        case 1:
          v10 = snprintf(v8, v9, "L %f %f");
          goto LABEL_12;
        case 2:
          v10 = snprintf(v8, v9, "C %f %f %f %f %f %f", *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          sfr_extraSegments += 4;
          goto LABEL_12;
        case 3:
          *v8 = 90;
          v10 = 1;
LABEL_12:
          if (v10 < 1)
            break;
          if (v10 >= (int)v9)
            break;
          objc_msgSend(v3, "appendBytes:length:", &v14, &v8[v10] - &v14);
          sfr_head += 6;
          if (sfr_head >= v6)
            break;
          continue;
        default:
          goto LABEL_15;
      }
      break;
    }
  }
LABEL_15:
  v14 = 0;
  objc_msgSend(v3, "appendBytes:length:", &v14, 1);
  v11 = objc_retainAutorelease(v3);
  v12 = (const char *)objc_msgSend(v11, "bytes");

  return v12;
}

- (AKTSDBezierPath)initWithCString:(const char *)a3
{
  AKTSDBezierPath *v4;
  AKTSDBezierPath *v5;
  const char *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;

  v4 = -[AKTSDBezierPath init](self, "init");
  v5 = v4;
  if (a3)
  {
    if (v4)
    {
      if (*a3)
      {
        v12 = 0;
        v11 = 0;
        if (sscanf(a3, " %c%n", &v12, &v11) >= 1)
        {
          do
          {
            v6 = &a3[v11];
            v11 = 0;
            v9 = 0;
            v10 = 0;
            v8 = 0;
            if (v12 > 98)
            {
              if (v12 > 108)
              {
                if (v12 == 122)
                  goto LABEL_24;
                if (v12 != 113)
                {
                  if (v12 == 109)
                  {
LABEL_15:
                    if (sscanf(v6, " %g %g%n", (char *)&v10 + 4, &v10, &v11) == 2)
                      -[AKTSDBezierPath moveToPoint:](v5, "moveToPoint:", *((float *)&v10 + 1), *(float *)&v10);
                    goto LABEL_29;
                  }
                  goto LABEL_29;
                }
                goto LABEL_25;
              }
              if (v12 == 99)
              {
LABEL_27:
                if (sscanf(v6, " %g %g %g %g %g %g%n", (char *)&v9 + 4, &v9, (char *)&v8 + 4, &v8, (char *)&v10 + 4, &v10, &v11) == 6)-[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", *((float *)&v10 + 1), *(float *)&v10, *((float *)&v9 + 1), *(float *)&v9, *((float *)&v8 + 1), *(float *)&v8);
                goto LABEL_29;
              }
              if (v12 == 108)
              {
LABEL_22:
                if (sscanf(v6, " %g %g%n", (char *)&v10 + 4, &v10, &v11) != 2)
                  goto LABEL_29;
LABEL_26:
                -[AKTSDBezierPath lineToPoint:](v5, "lineToPoint:", *((float *)&v10 + 1), *(float *)&v10);
              }
            }
            else
            {
              if (v12 > 76)
              {
                if (v12 == 77)
                  goto LABEL_15;
                if (v12 != 81)
                {
                  if (v12 != 90)
                    goto LABEL_29;
LABEL_24:
                  -[AKTSDBezierPath closePath](v5, "closePath");
                  goto LABEL_29;
                }
LABEL_25:
                if (sscanf(v6, " %g %g %g %g%n", (char *)&v10 + 4, &v10, (char *)&v9 + 4, &v9, &v11) == 4)
                  goto LABEL_26;
                goto LABEL_29;
              }
              if (v12 == 67)
                goto LABEL_27;
              if (v12 == 76)
                goto LABEL_22;
            }
LABEL_29:
            a3 = &v6[v11];
          }
          while (sscanf(a3, " %c%n", &v12, &v11) > 0);
        }
      }
    }
  }
  return v5;
}

- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  int64_t sfr_elementCount;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  BOOL v12;
  BOOL v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  size_t v17;
  PATHSEGMENT *v18;
  int64_t sfr_elementMax;
  BOOL v20;
  unint64_t v21;
  size_t v22;
  double *v23;
  PATHSEGMENT *sfr_head;
  int64_t v25;
  PATHSEGMENT *v26;
  void *sfr_path;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  double v29;

  y = a4.y;
  x = a4.x;
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount == self->sfr_elementMax)
  {
    v9 = sfr_elementCount + 0x4000000000000000;
    v10 = 2 * sfr_elementCount;
    v11 = v10 + 10;
    v12 = __OFADD__(v10, 10);
    if ((v9 & 0x8000000000000000) == 0 && !v12)
    {
      v13 = v11 < 0;
      if (v11 >= 0)
        v14 = v11;
      else
        v14 = -v11;
      v15 = !is_mul_ok(v14, 0x18uLL);
      v16 = 24 * v14;
      if (!v16)
        v13 = 0;
      if (v15
        || v13
        || (v11 >= 0 ? (v17 = v16) : (v17 = -v16),
            (v18 = (PATHSEGMENT *)malloc_type_realloc(self->sfr_head, v17, 0xCAE44AAuLL)) == 0))
      {
        NSLog(CFSTR("ERROR: AKTSDBezierPath _addPathSegment. sfr_head could not NSZoneRealloc. No memory"), a2);
      }
      else
      {
        self->sfr_elementMax = v11;
        self->sfr_head = v18;
      }
      if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) != 0)
      {
        sfr_elementMax = self->sfr_elementMax;
        v20 = sfr_elementMax < 0;
        if (sfr_elementMax >= 0)
          v21 = self->sfr_elementMax;
        else
          v21 = -sfr_elementMax;
        if (!(8 * v21))
          v20 = 0;
        if (v21 >> 61
          || v20
          || (sfr_elementMax >= 0 ? (v22 = 8 * v21) : (v22 = -8 * v21),
              (v23 = (double *)malloc_type_realloc(self->sfr_elementLength, v22, 0x395D4DCCuLL)) == 0))
        {
          NSLog(CFSTR("ERROR: AKTSDBezierPath _addPathSegment. sfr_elementLength could not NSZoneRealloc. No memory"));
        }
        else
        {
          self->sfr_elementLength = v23;
        }
      }
    }
  }
  sfr_head = self->sfr_head;
  if (sfr_head)
  {
    *(_QWORD *)&sfr_head[6 * self->sfr_elementCount] = *(_QWORD *)&sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
    *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
    v25 = self->sfr_elementCount;
    v26 = &self->sfr_head[6 * v25];
    *(CGFloat *)&v26[2] = x;
    *(CGFloat *)&v26[4] = y;
    self->sfr_elementCount = v25 + 1;
    sfr_path = self->sfr_path;
    if (sfr_path)
    {
      CFRelease(sfr_path);
      self->sfr_path = 0;
    }
    sfr_bpFlags = self->sfr_bpFlags;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
    if (a3 != 2 && (*(_WORD *)&sfr_bpFlags & 0x400) != 0)
    {
      -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", self->sfr_elementCount - 1);
      self->sfr_elementLength[self->sfr_elementCount - 1] = v29;
      self->sfr_totalLength = v29 + self->sfr_totalLength;
    }
  }
}

- (void)_deviceMoveToPoint:(CGPoint)a3
{
  int v4;
  PATHSEGMENT *sfr_head;
  int64_t v6;

  v4 = (*(_DWORD *)&self->sfr_bpFlags >> 8) & 3;
  if (v4 == 2)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
    if ((*(_BYTE *)&sfr_head[6 * v6] & 0xF) == 0)
      goto LABEL_6;
  }
  else if (v4 == 1)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
LABEL_6:
    *(CGPoint *)&sfr_head[6 * v6 + 2] = a3;
    goto LABEL_7;
  }
  -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
  v6 = self->sfr_elementCount - 1;
LABEL_7:
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
  self->sfr_lastSubpathIndex = v6;
}

- (void)_deviceLineToPoint:(CGPoint)a3
{
  -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 1, a3.x, a3.y);
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
}

- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  int64_t sfr_extraSegmentCount;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  BOOL v14;
  BOOL v15;
  unint64_t v16;
  size_t v17;
  void *v18;
  int64_t v19;
  CGFloat *v20;
  PATHSEGMENT *v21;
  double v22;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    v11 = sfr_extraSegmentCount + 0x4000000000000000;
    v12 = 2 * sfr_extraSegmentCount;
    v13 = v12 + 10;
    v14 = __OFADD__(v12, 10);
    if ((v11 & 0x8000000000000000) == 0 && !v14)
    {
      v15 = v13 < 0;
      if (v13 >= 0)
        v16 = v13;
      else
        v16 = -v13;
      if (!(32 * v16))
        v15 = 0;
      if (v16 >> 59
        || v15
        || (v13 >= 0 ? (v17 = 32 * v16) : (v17 = -32 * v16),
            (v18 = malloc_type_realloc(self->sfr_extraSegments, v17, 0xDDCB3BD5uLL)) == 0))
      {
        NSLog(CFSTR("ERROR: AKTSDBezierPath _deviceCurveToPoint sfr_extraSegments could not NSZoneRealloc. No memory"));
      }
      else
      {
        self->sfr_extraSegments = v18;
        self->sfr_extraSegmentMax = v13;
      }
    }
  }
  v19 = self->sfr_extraSegmentCount;
  v20 = (CGFloat *)((char *)self->sfr_extraSegments + 32 * v19);
  *v20 = v8;
  v20[1] = v7;
  v20[2] = x;
  v20[3] = y;
  self->sfr_extraSegmentCount = v19 + 1;
  v21 = &self->sfr_head[6 * self->sfr_elementCount];
  *(_QWORD *)&v21[-6] = *(_QWORD *)&v21[-6] & 0xFLL | (16 * v19);
  LODWORD(v21) = self->sfr_bpFlags;
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(v21 & 0xFFFFFCFB | 0x200);
  if (((unsigned __int16)v21 & 0x400) != 0)
  {
    -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", self->sfr_elementCount - 1);
    self->sfr_elementLength[self->sfr_elementCount - 1] = v22;
    self->sfr_totalLength = v22 + self->sfr_totalLength;
  }
}

- (void)_deviceClosePath
{
  PATHSEGMENT *v3;
  PATHSEGMENT *v4;

  if ((*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x200)
  {
    v3 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&v3[2], *(double *)&v3[4]);
    v4 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v4[2], *(double *)&v4[4]);
    self->sfr_lastSubpathIndex = self->sfr_elementCount - 1;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

+ (void)setMiterLimit:(double)a3
{
  MEMORY[0x24BEDD108](a1, sel_setDefaultMiterLimit_);
}

+ (double)miterLimit
{
  double result;

  MEMORY[0x24BEDD108](a1, sel_defaultMiterLimit);
  return result;
}

+ (void)setFlatness:(double)a3
{
  MEMORY[0x24BEDD108](a1, sel_setDefaultFlatness_);
}

+ (double)flatness
{
  double result;

  MEMORY[0x24BEDD108](a1, sel_defaultFlatness);
  return result;
}

+ (void)setWindingRule:(unint64_t)a3
{
  MEMORY[0x24BEDD108](a1, sel_setDefaultWindingRule_);
}

+ (unint64_t)windingRule
{
  return MEMORY[0x24BEDD108](a1, sel_defaultWindingRule);
}

+ (void)setLineCapStyle:(unint64_t)a3
{
  MEMORY[0x24BEDD108](a1, sel_setDefaultLineCapStyle_);
}

+ (unint64_t)lineCapStyle
{
  return MEMORY[0x24BEDD108](a1, sel_defaultLineCapStyle);
}

+ (void)setLineJoinStyle:(unint64_t)a3
{
  MEMORY[0x24BEDD108](a1, sel_setDefaultLineJoinStyle_);
}

+ (unint64_t)lineJoinStyle
{
  return MEMORY[0x24BEDD108](a1, sel_defaultLineJoinStyle);
}

+ (void)setLineWidth:(double)a3
{
  MEMORY[0x24BEDD108](a1, sel_setDefaultLineWidth_);
}

+ (double)lineWidth
{
  double result;

  MEMORY[0x24BEDD108](a1, sel_defaultLineWidth);
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGRect v18;
  CGRect v19;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("AKTSDBezierPath <%p>"), self);
  if (!-[AKTSDBezierPath isEmpty](self, "isEmpty"))
  {
    -[AKTSDBezierPath bounds](self, "bounds");
    NSStringFromCGRect(v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTSDBezierPath controlPointBounds](self, "controlPointBounds");
    NSStringFromCGRect(v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Bounds: %@"), v4);
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Control point bounds: %@"), v5);
    v6 = -[AKTSDBezierPath elementCount](self, "elementCount");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        switch(-[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v14))
        {
          case 0uLL:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f moveto"), v14[0], v10, v11, v12, v13);
            break;
          case 1uLL:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f lineto"), v14[0], v10, v11, v12, v13);
            break;
          case 2uLL:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f %f %f %f %f curveto"), v14[0], v14[1], v15, v16);
            break;
          case 3uLL:
            objc_msgSend(v3, "appendString:", CFSTR("\n    closepath"));
            break;
          default:
            continue;
        }
      }
    }

  }
  return v3;
}

- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4
{
  unint64_t v7;
  CGPoint *v8;
  _BYTE v9[32];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, a3);
  v7 = -[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", -[AKTSDBezierPath elementCount](self, "elementCount") - 1, v9);
  v8 = (CGPoint *)v9;
  if (v7 == 2)
    v8 = (CGPoint *)v10;
  if (v7 == 3)
    v8 = a3;
  *a4 = *v8;
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  float64x2_t *v27;
  float64x2_t *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  AKTSDBezierPath *v36;
  _OWORD v37[4];
  float64x2_t v38[4];
  _OWORD v39[4];
  float64x2_t v40[4];
  uint64_t v41;

  v6 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v32 = objc_msgSend(v10, "count");
  v36 = self;
  v11 = -[AKTSDBezierPath elementCount](self, "elementCount");
  v12 = objc_msgSend(v9, "elementCount");
  if (v11 < 2)
    goto LABEL_30;
  v13 = v12;
  if (v12 < 2)
    goto LABEL_30;
  if (v6)
    v14 = v11 - 1;
  else
    v14 = 0;
  if (v6)
    v15 = -1;
  else
    v15 = v11;
  v16 = -1;
  if (!v6)
    v16 = 1;
  v34 = v16;
  v35 = v15;
  while (2)
  {
    v17 = -[AKTSDBezierPath elementAtIndex:allPoints:](v36, "elementAtIndex:allPoints:", v14, v38);
    if (!v17)
      goto LABEL_29;
    v18 = v17;
    v19 = 0;
    do
    {
      v20 = objc_msgSend(v9, "elementAtIndex:allPoints:", v19, v37);
      if (!v20)
        goto LABEL_26;
      if (v18 != 2)
      {
        if (v20 != 2)
        {
          sub_229064E64(v38[0].f64, (double *)v37, v14, v19, v10);
          goto LABEL_26;
        }
        v27 = (float64x2_t *)v37;
        v28 = v38;
        v29 = v19;
        v30 = v14;
        v31 = 1;
LABEL_24:
        sub_229064B48(v27->f64, v28->f64, v29, v30, v31, v10);
        goto LABEL_26;
      }
      if (v20 != 2)
      {
        v27 = v38;
        v28 = (float64x2_t *)v37;
        v29 = v14;
        v30 = v19;
        v31 = 0;
        goto LABEL_24;
      }
      v21 = v10;
      v22 = objc_msgSend(v21, "count");
      v40[0] = v38[0];
      v40[1] = v38[1];
      v40[2] = v38[2];
      v40[3] = v38[3];
      v39[0] = v37[0];
      v39[1] = v37[1];
      v39[2] = v37[2];
      v39[3] = v37[3];
      sub_229068F90(v40, (double *)v39, v14, v19, 0, v21, 1.0, 0.0, 1.0, 0.0);
      v23 = objc_msgSend(v21, "count");
      if (v22 < v23)
      {
        v24 = v23;
        do
        {
          objc_msgSend(v21, "objectAtIndex:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "t");
          objc_msgSend(v25, "setPoint:", sub_2290643DC(v38, v26));

          ++v22;
        }
        while (v24 != v22);
      }

LABEL_26:
      ++v19;
    }
    while (v19 != v13);
    if (a5 || v32 >= objc_msgSend(v10, "count"))
    {
LABEL_29:
      v14 += v34;
      if (v14 == v35)
        break;
      continue;
    }
    break;
  }
LABEL_30:

}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4
{
  -[AKTSDBezierPath addIntersectionsWithPath:to:allIntersections:reversed:](self, "addIntersectionsWithPath:to:allIntersections:reversed:", a3, a4, 1, 0);
}

- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v11 = *MEMORY[0x24BDBEFB0];
  v7 = -[AKTSDBezierPath elementCount](self, "elementCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      switch(-[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v13, v11, v12))
      {
        case 0uLL:
          v11 = v13[0];
          v12 = v13[0];
          continue;
        case 1uLL:
          goto LABEL_7;
        case 2uLL:
          sub_229064B48((double *)&v12, &a3->x, i, -1, 0, v6);
          v10 = v13[2];
          goto LABEL_8;
        case 3uLL:
          v13[0] = v11;
LABEL_7:
          sub_229064E64((double *)&v12, &a3->x, i, -1, v6);
          v10 = v13[0];
LABEL_8:
          v12 = v10;
          break;
        default:
          continue;
      }
    }
  }

}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 toSegment:(int64_t)a5
{
  int64_t v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a4 < a5)
  {
    v6 = a4;
    do
    {
      switch(objc_msgSend(a3, "elementAtIndex:associatedPoints:", v6, &v9))
      {
        case 0:
          -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
          break;
        case 1:
          -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
          break;
        case 2:
          -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
          break;
        case 3:
          -[AKTSDBezierPath closePath](self, "closePath");
          break;
        default:
          break;
      }
      ++v6;
    }
    while (a5 != v6);
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 t:(double)a5 toSegment:(int64_t)a6 t:(double)a7 withoutMove:(BOOL)a8
{
  id v14;
  int64_t v15;
  int64_t v16;
  _BOOL4 v18;
  int64_t v19;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  char v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float64x2_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = objc_msgSend(v14, "elementCount");
  v16 = v15;
  v18 = a4 < 1 || v15 <= a4;
  if (v18)
    v19 = -1;
  else
    v19 = a4;
  if (a6 <= 0)
    a6 = v15 + 1;
  if (v19 != a6)
  {
    if (!v18)
    {
      switch(objc_msgSend(v14, "elementAtIndex:allPoints:", a4, &v34))
      {
        case 0:
          if (!a8)
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", *(_OWORD *)&v34);
          break;
        case 1:
        case 3:
          if (!a8)
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
          -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v35, v36);
          break;
        case 2:
          sub_229064434(&v34, (uint64_t)&v26, a5, 1.0);
          if (!a8)
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
          -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
          break;
        default:
          break;
      }
    }
    if (a6 >= v16)
      v22 = v16;
    else
      v22 = a6;
    v23 = v19 + 1;
    if (v23 < v22)
    {
      v24 = 0;
      do
      {
        switch(objc_msgSend(v14, "elementAtIndex:associatedPoints:", v23, &v34))
        {
          case 0:
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", *(_OWORD *)&v34);
            goto LABEL_47;
          case 1:
            -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v34);
            break;
          case 2:
            -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v37, v38, *(_OWORD *)&v34, v35, v36);
            break;
          case 3:
            if ((v24 & 1) != 0)
            {
              -[AKTSDBezierPath closePath](self, "closePath");
LABEL_47:
              v24 = 1;
            }
            else
            {
              -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v34);
              v24 = 0;
            }
            break;
          default:
            break;
        }
        ++v23;
      }
      while (v22 != v23);
    }
    if (a6 < 1 || a6 >= v16)
      goto LABEL_58;
    v25 = objc_msgSend(v14, "elementAtIndex:allPoints:", a6, &v34);
    if (v25 != 3)
    {
      if (v25 == 2)
      {
        sub_229064434(&v34, (uint64_t)&v26, 0.0, a7);
LABEL_57:
        -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
        goto LABEL_58;
      }
      if (v25 != 1)
        goto LABEL_58;
    }
LABEL_55:
    -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v35 * a7 + v34.f64[0] * (1.0 - a7), v36 * a7 + v34.f64[1] * (1.0 - a7));
    goto LABEL_58;
  }
  if (a7 < a5 || v19 >= v15)
    LOBYTE(v18) = 1;
  if (v18)
    goto LABEL_58;
  v21 = objc_msgSend(v14, "elementAtIndex:allPoints:", v19, &v34);
  switch(v21)
  {
    case 3:
      goto LABEL_22;
    case 2:
      sub_229064434(&v34, (uint64_t)&v26, a5, a7);
      if (!a8)
        -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
      goto LABEL_57;
    case 1:
LABEL_22:
      if (!a8)
        -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
      goto LABEL_55;
  }
LABEL_58:

}

- (id)copyFromSegment:(int)a3 t:(float)a4 toSegment:(int)a5 t:(float)a6
{
  id v11;

  v11 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v11, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", self, a3, a5, 0, a4, a6);
  objc_msgSend(v11, "setWindingRule:", -[AKTSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v11, "setLineCapStyle:", -[AKTSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v11, "setLineJoinStyle:", -[AKTSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[AKTSDBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(v11, "setLineWidth:");
  return v11;
}

- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2]
{
  double v5;
  double v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  float v10;
  unint64_t v11;
  __int128 v12;
  float v13;
  CGFloat y;
  double x;
  CGFloat v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  float64x2_t v26;
  _OWORD v27[3];
  uint64_t v28;
  CGPoint result;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v25 = *MEMORY[0x24BDBEFB0];
  v7 = -[AKTSDBezierPath elementCount](self, "elementCount");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 3.4028e38;
    while (1)
    {
      v11 = -[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, v27);
      if (v11 == 2)
        break;
      if (v11 == 3)
      {
        v12 = v25;
LABEL_9:
        v27[0] = v12;
        v11 = 2;
      }
      x = a3[1].x;
      y = a3[1].y;
      v16 = y - a3->y;
      v17 = x - a3->x;
      v18 = v17 * v17 + v16 * v16;
      v19 = (float)(1.0 / sqrtf(v18));
      *(float *)&y = *((double *)v27 + 1) * -(v17 * v19)
                   + v16 * v19 * *(double *)v27
                   - (y * -(v17 * v19)
                    + v16 * v19 * x);
      v20 = fabsf(*(float *)&y);
      if (v10 > v20)
      {
        v6 = *((double *)v27 + 1);
        v5 = *(double *)v27;
        v10 = v20;
      }
      v26 = (float64x2_t)v27[0];
      if (!v11)
        v25 = v27[0];
      if (v8 == ++v9)
        goto LABEL_15;
    }
    v23 = 0.0;
    v24 = 0.0;
    sub_2290645B0(&v26, &a3->x, (uint64_t)&v23);
    if (v13 < v10)
    {
      v6 = v24;
      v5 = v23;
      v10 = v13;
    }
    v12 = v27[2];
    goto LABEL_9;
  }
LABEL_15:
  v21 = v5;
  v22 = v6;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2]
{
  double v5;
  double v6;
  double x;
  double y;
  double v9;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  float v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  BOOL v57;
  BOOL v58;
  BOOL v59;
  double v60;
  double v61;
  double v62;
  float64x2_t *v63;
  float v64;
  float64x2_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  float v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  double v80;
  double v81;
  double v82[2];
  float64x2_t v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  double v87;
  uint64_t v88;
  double v89;
  uint64_t v90;
  CGPoint result;

  v90 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  x = a3[1].x;
  y = a3[1].y;
  v9 = a3->x;
  v77 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
  v10 = -[AKTSDBezierPath elementCount](self, "elementCount");
  if (v10)
  {
    v11 = v10;
    v12 = sub_22902DEF0(x, y, v9);
    v14 = sub_22902DF3C(v12, v13);
    v16 = v15;
    v17 = 0;
    v18 = -2.0;
    v73 = v15;
    v74 = v14;
    while (1)
    {
      v19 = -[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v17, &v79, *(_QWORD *)&v73, *(_QWORD *)&v74);
      if (v19 == 3)
        break;
      v20 = v19;
      if (v19 == 2)
      {
        v75 = v6;
        v76 = v5;
        v21 = a3->x;
        v22 = sub_22902DEF0(a3[1].x, a3[1].y, a3->x);
        v24 = sub_22902DF3C(v22, v23);
        v26 = v25;
        v27 = sub_22902DEF0(v78.f64[0], v78.f64[1], v21);
        v29 = sub_22902DF3C(v27, v28);
        v31 = sub_22902DF5C(v24, v26, v29, v30);
        v83.f64[0] = 0.0;
        v83.f64[1] = v31;
        v32 = sub_22902DEF0(v79.f64[0], v79.f64[1], v21);
        v34 = sub_22902DF3C(v32, v33);
        v36 = sub_22902DF5C(v24, v26, v34, v35);
        v84 = 0x3FD5555555555555;
        v85 = v36;
        v37 = sub_22902DEF0(v80, v81, v21);
        v39 = sub_22902DF3C(v37, v38);
        v41 = sub_22902DF5C(v24, v26, v39, v40);
        v86 = 0x3FE5555555555555;
        v87 = v41;
        v42 = sub_22902DEF0(v82[0], v82[1], v21);
        v44 = sub_22902DF3C(v42, v43);
        v46 = sub_22902DF5C(v24, v26, v44, v45);
        v88 = 0x3FF0000000000000;
        v89 = v46;
        v47 = v36 * 9.0 + v31 * -3.0 + v41 * -9.0 + v46 * 3.0;
        v48 = v36 * -12.0 + v31 * 6.0 + v41 * 6.0;
        v49 = sqrt((v36 * 3.0 + v31 * -3.0) * (v47 * -4.0) + v48 * v48);
        v50 = (-v48 - v49) / (v47 + v47);
        v51 = sub_2290643DC(&v83, (v49 - v48) / (v47 + v47));
        v53 = v52;
        v54 = sub_2290643DC(&v83, v50);
        v57 = v54 <= 1.0 && v54 >= 0.0 && v53 <= v55;
        if ((v57 || (v51 >= 0.0 ? (v58 = v51 > 1.0) : (v58 = 1), v58))
          && (v54 >= 0.0 ? (v59 = v54 > 1.0) : (v59 = 1), v51 = v54, v53 = v55, v59))
        {
          v60 = -2.0;
          v61 = 0.0;
          v62 = 0.0;
        }
        else
        {
          v61 = sub_2290643DC(&v78, v51);
          v60 = fabs(v53);
        }
        v6 = v75;
        v5 = v76;
        v64 = v60;
        if (v18 < v64)
        {
          v18 = v64;
          v6 = v62;
          v5 = v61;
        }
        v63 = (float64x2_t *)v82;
        v16 = v73;
        v14 = v74;
        goto LABEL_28;
      }
LABEL_29:
      v65 = v79;
      v66 = sub_22902DEF0(v79.f64[0], v79.f64[1], a3->x);
      v68 = sub_22902DF3C(v66, v67);
      v70 = sub_22902DF5C(v14, v16, v68, v69);
      if (v18 < v70)
      {
        v18 = v70;
        v6 = v65.f64[1];
        v5 = v65.f64[0];
      }
      v78 = v79;
      if (!v20)
        v77 = v79;
      if (v11 == ++v17)
        goto LABEL_34;
    }
    v63 = &v77;
LABEL_28:
    v79 = *v63;
    v20 = 2;
    goto LABEL_29;
  }
LABEL_34:
  v71 = v5;
  v72 = v6;
  result.y = v72;
  result.x = v71;
  return result;
}

- (id)pressure
{
  return 0;
}

- (int64_t)elementPercentage:(float *)a3 forOverallPercentage:(float)a4
{
  double v7;
  float v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  float v13;
  uint64_t v14;
  double v15;
  float v16;
  double v17;
  double v18;
  float v19;

  -[AKTSDBezierPath length](self, "length");
  v8 = v7;
  if (a4 < 0.0)
  {
    v9 = 0;
    do
      -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", ++v9);
    while (v10 == 0.0);
    -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
    v12 = (float)(v8 * a4) / v11;
LABEL_12:
    v19 = v12;
    goto LABEL_13;
  }
  v13 = v8 * a4;
  v14 = -[AKTSDBezierPath elementCount](self, "elementCount");
  if (v14 < 2)
  {
LABEL_9:
    v9 = v14;
    do
      -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", --v9);
    while (v17 == 0.0);
    -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
    v12 = v13 / v18 + 1.0;
    goto LABEL_12;
  }
  v9 = 1;
  while (1)
  {
    -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
    v16 = v15;
    v13 = v13 - v16;
    if (v13 < 0.0)
      break;
    if (v14 == ++v9)
      goto LABEL_9;
  }
  v19 = (float)(v13 + v16) / v16;
LABEL_13:
  *a3 = v19;
  return v9;
}

- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4
{
  double v6;
  float64x2_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64_t v16;
  double v22;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  uint64_t v28;
  CGPoint result;

  v28 = *MEMORY[0x24BDAC8D0];
  switch(-[AKTSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v24))
  {
    case 0uLL:
      v7 = v24;
      break;
    case 1uLL:
    case 3uLL:
      v7 = vmlaq_n_f64(vmulq_n_f64(v25, a3), v24, 1.0 - a3);
      break;
    case 2uLL:
      if (a3 >= 0.0)
      {
        v13 = 1.0;
        if (a3 <= 1.0)
        {
          __asm { FMOV            V4.2D, #3.0 }
          v7 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(v25, _Q4), a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v24, 1.0 - a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(vmulq_f64(v26, _Q4), a3), a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v27, a3), a3), a3);
          break;
        }
        *(float *)&v13 = a3;
        -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, v13);
        v10 = sub_22902DEFC(v14, v15, a3 + -1.0);
        v12 = v27.f64[1];
        v11 = v27.f64[0];
      }
      else
      {
        *(float *)&v6 = a3;
        -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, v6);
        v10 = sub_22902DEFC(v8, v9, a3);
        v12 = v24.f64[1];
        v11 = v24.f64[0];
      }
      v7.f64[0] = sub_22902DEE4(v11, v12, v10);
      v7.f64[1] = v16;
      break;
    default:
      v7 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
      break;
  }
  v22 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v22;
  return result;
}

- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4
{
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  *(float *)&a3 = a3;
  -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, a3);
  v6 = v4 * v4 + v5 * v5;
  v7 = (float)(1.0 / sqrtf(v6));
  v8 = v5 * v7;
  v9 = v4 * v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)gradientAt:(float)a3
{
  int64_t v4;
  double v5;
  double v6;
  float v7;
  CGPoint result;

  v7 = 0.0;
  v4 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v7);
  -[AKTSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", v4, v7);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)transformedCoordinate:(CGPoint)a3 withPressure:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v26 = 0.0;
  *(float *)&v8 = x;
  v9 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v26, v8);
  -[AKTSDBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", v9, v26);
  v11 = v10;
  v13 = v12;
  -[AKTSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", v9, v26);
  v15 = v14;
  v17 = v16;
  -[AKTSDBezierPath lineWidth](self, "lineWidth");
  v19 = v18;
  if (v7)
    objc_msgSend(v7, "pressureAt:", x);
  else
    v20 = 1.0;
  v21 = y * (v19 * v20);
  v22 = v11 - v17 * v21;
  v23 = v13 + v15 * v21;

  v24 = v22;
  v25 = v23;
  result.y = v25;
  result.x = v24;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 inElement:(int64_t)a4 withPressure:(id)a5
{
  double y;
  double x;
  id v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  *(float *)&v10 = x;
  -[AKTSDBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a4, v10);
  v12 = v11;
  -[AKTSDBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", a4, v11);
  v14 = v13;
  v16 = v15;
  -[AKTSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", a4, v12);
  v18 = v17;
  v20 = v19;
  -[AKTSDBezierPath lineWidth](self, "lineWidth");
  v22 = v21;
  if (v9)
    objc_msgSend(v9, "pressureAt:", x);
  else
    v23 = 1.0;
  v24 = y * (v22 * v23);
  v25 = v14 - v20 * v24;
  v26 = v16 + v18 * v24;

  v27 = v25;
  v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 withPressure:(id)a6 getElement:(int64_t *)a7 getPercentage:(float *)a8
{
  double y;
  double x;
  id v15;
  float v16;
  double v17;
  int64_t v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v15 = a6;
  v37 = 0.0;
  v16 = x;
  *(float *)&v17 = v16;
  v18 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v37, v17);
  if (v18 >= a4)
  {
    if (v18 <= a5)
    {
      v20 = v37;
      a4 = v18;
    }
    else
    {
      *(float *)&v19 = x;
      -[AKTSDBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a5, v19);
      v37 = v20;
      a4 = a5;
    }
  }
  else
  {
    *(float *)&v19 = x;
    -[AKTSDBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a4, v19);
    v37 = v20;
  }
  -[AKTSDBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", a4, v20);
  v22 = v21;
  v24 = v23;
  -[AKTSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", a4, v37);
  v26 = v25;
  v28 = v27;
  -[AKTSDBezierPath lineWidth](self, "lineWidth");
  v30 = v29;
  if (v15)
    objc_msgSend(v15, "pressureAt:", x);
  else
    v31 = 1.0;
  v32 = y * (v30 * v31);
  v33 = v22 - v28 * v32;
  v34 = v24 + v26 * v32;
  *a7 = a4;
  *a8 = v37;

  v35 = v33;
  v36 = v34;
  result.y = v36;
  result.x = v35;
  return result;
}

- (float)elementPercentageFromElement:(int)a3 forOverallPercentage:(float)a4
{
  double v7;
  double v8;
  uint64_t v9;
  float v10;
  double v11;
  float v12;
  double v13;
  double v14;

  -[AKTSDBezierPath length](self, "length");
  v8 = v7;
  if (a3 < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
      v10 = v11 + v10;
      ++v9;
    }
    while (a3 != v9);
  }
  v12 = v8 * a4;
  v13 = (float)(v12 - v10);
  -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", a3);
  return v13 / v14;
}

- (CGPoint)rawGradientAt:(float)a3 fromElement:(int64_t)a4
{
  float64x2_t v5;
  float v6;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  uint64_t v19;
  CGPoint result;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
  switch(-[AKTSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v15))
  {
    case 0uLL:
      NSLog(CFSTR("GA can't handle move to"));
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      v5 = vsubq_f64(v16, v15);
      break;
    case 2uLL:
      v6 = 0.01;
      if (a3 >= 0.01)
        v6 = a3;
      if (v6 > 0.99)
        v6 = 0.99;
      __asm
      {
        FMOV            V4.2D, #-3.0
        FMOV            V5.2D, #3.0
      }
      v5 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_f64(v16, _Q5), (float)((float)((float)(v6 * -4.0) + 1.0) + (float)((float)(v6 * 3.0) * v6))), vmulq_n_f64(vmulq_f64(v15, _Q4), (float)(v6 + -1.0)), (float)(v6 + -1.0)), vmulq_n_f64(vmulq_f64(v17, _Q5), v6), (float)((float)(v6 * -3.0) + 2.0)), vmulq_n_f64(vmulq_f64(v18, _Q5), v6), v6);
      break;
    default:
LABEL_4:
      v5 = v14;
      break;
  }
  v13 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3
{
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  CGPoint result;

  v15 = 0;
  v4 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v15);
  LODWORD(v5) = v15;
  -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v4, v5);
  v7 = v6;
  v9 = v8;
  -[AKTSDBezierPath length](self, "length");
  v11 = v10;
  -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", v4);
  v13 = sub_22902DEFC(v7, v9, v11 / v12);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3 fromElement:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:");
  v7 = v6;
  v9 = v8;
  -[AKTSDBezierPath length](self, "length");
  v11 = v10;
  -[AKTSDBezierPath lengthOfElement:](self, "lengthOfElement:", a4);
  v13 = sub_22902DEFC(v7, v9, v11 / v12);
  result.y = v14;
  result.x = v13;
  return result;
}

- (float)curvatureAt:(float)a3
{
  int64_t v4;
  double v5;
  double v6;
  float result;
  float v8;

  v8 = 0.0;
  v4 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v8);
  -[AKTSDBezierPath curvatureAt:fromElement:](self, "curvatureAt:fromElement:", v4, v8);
  v6 = v5;
  result = 0.5;
  if (v6 <= 0.5)
  {
    result = -0.5;
    if (v6 >= -0.5)
      return v6;
  }
  return result;
}

- (double)curvatureAt:(double)a3 fromElement:(int)a4
{
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = -[AKTSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v13);
  if (v5 == 2)
  {
    v7 = 0.01;
    if (a3 >= 0.01)
      v7 = a3;
    if (v7 > 0.99)
      v7 = 0.99;
    v8 = (v7 * (v7 * (v19 - v17) + (1.0 - v7) * (v17 - v15)) + (1.0 - v7)
                                                             * (v7 * (v17 - v15) + (1.0 - v7) * (v15 - v13)))
       * 3.0;
    v9 = (v7 * (v7 * (v20 - v18) + (1.0 - v7) * (v18 - v16)) + (1.0 - v7)
                                                             * (v7 * (v18 - v16) + (1.0 - v7) * (v16 - v14)))
       * 3.0;
    v10 = v8 * ((v7 * (v20 - v18 - (v18 - v16)) + (1.0 - v7) * (v18 - v16 - (v16 - v14))) * 6.0)
        - v9 * ((v7 * (v19 - v17 - (v17 - v15)) + (1.0 - v7) * (v17 - v15 - (v15 - v13))) * 6.0);
    return (float)(v10 / pow(v9 * v9 + v8 * v8, 1.5));
  }
  else
  {
    v6 = 0.0;
    if (!v5)
      NSLog(CFSTR("CA can't handle move to"));
  }
  return v6;
}

- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AKTSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v7, 0, objc_msgSend(v7, "elementCount") - 1, v6, 0.0, 1.0);

}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a5;
  v10 = a3;
  -[AKTSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v10, 0, objc_msgSend(v10, "elementCount") - 1, v9, var0, var1);

}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  double var0;
  id v11;
  id v12;
  AKTSDPathCut *v13;
  double v14;
  double v15;
  double v16;
  AKTSDPathCut *v17;
  double v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  double v39;
  float v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  float v49;
  float v50;
  float v51;
  AKTSDPathCut *v52;
  double v53;
  BOOL v54;
  AKTSDPathCut *v55;
  double v56;
  double v57;
  double v58;
  AKTSDPathCut *v59;
  int64_t v60;
  int64_t v61;
  uint64_t v62;
  BOOL v63;
  unint64_t v64;
  BOOL v65;
  unint64_t v66;
  float64x2_t v67;
  float64x2_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  float64_t v73;
  double v74;
  uint64_t v75;
  double v76;
  double v77;
  double var1;
  double v79;
  AKTSDPathCut *v80;
  id v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  double v87;
  uint64_t v88;
  float64x2_t v89;
  uint64_t v90;

  length = a5.length;
  location = a5.location;
  var1 = a4.var1;
  var0 = a4.var0;
  v90 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v81 = a6;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = [AKTSDPathCut alloc];
  objc_msgSend(v11, "lengthToElement:", location);
  v15 = v14;
  objc_msgSend(v11, "length");
  v17 = -[AKTSDPathCut initWithSegment:atT:withSkew:](v13, "initWithSegment:atT:withSkew:", location, v15 / v16, 0.0);
  objc_msgSend(v12, "addObject:", v17);
  objc_msgSend(v11, "miterLimit");
  v19 = location + length;
  v20 = location + 1;
  if (v20 < v19)
  {
    v76 = v18 * 0.995;
    v21 = length - 1;
    do
    {
      v22 = v20 + 1;
      objc_msgSend(v11, "lengthOfElement:", v20 + 1, *(_QWORD *)&v76);
      if (v23 >= 0.1)
      {
        objc_msgSend(v11, "lengthOfElement:", v20);
        if (v24 >= 0.1)
        {
          v25 = var0;
          objc_msgSend(v11, "gradientAt:fromElement:", v20, 1.0);
          v28 = sub_22902DF3C(v26, v27);
          v30 = v29;
          objc_msgSend(v11, "gradientAt:fromElement:", v20 + 1, 0.0);
          v33 = sub_22902DF3C(v31, v32);
          v35 = v34;
          v36 = sub_22902DF5C(v28, v30, v33, v34);
          if (v36 >= 0.99)
          {
            var0 = v25;
          }
          else
          {
            objc_msgSend(v11, "lengthToElement:", v20 + 1, v36);
            v79 = v37;
            objc_msgSend(v11, "length");
            v39 = v38;
            v40 = 0.0;
            if (v22 < v19)
            {
              v77 = v38;
              v41 = sub_22902DEFC(v33, v35, -1.0);
              v42 = sub_22902DEE4(v28, v30, v41);
              v44 = v43;
              v45 = -sub_22902DF5C(v28, v30, v42, v43);
              v46 = sub_22902DFAC(0, v28, v30);
              v40 = v45 / sub_22902DF5C(v42, v44, v46, v47);
              v48 = fmin(fmax((float)-v36, -1.0), 1.0);
              v49 = acosf(v48);
              v50 = sinf(v49 * 0.5);
              v39 = v77;
              if (1.0 / v50 > v76)
                v40 = 0.0;
            }
            v51 = v79 / v39;
            v52 = -[AKTSDPathCut initWithSegment:atT:withSkew:]([AKTSDPathCut alloc], "initWithSegment:atT:withSkew:", v20, v51, v40);

            objc_msgSend(v12, "addObject:", v52);
            v17 = v52;
            var0 = v25;
          }
        }
      }
      v20 = v22;
      --v21;
    }
    while (v21);
  }
  if (v19)
  {
    do
    {
      objc_msgSend(v11, "lengthOfElement:", v19);
      v54 = v53 < 0.1;
      if (v53 >= 0.1)
        break;
      --v19;
    }
    while (v19);
  }
  else
  {
    v54 = 1;
  }
  v55 = [AKTSDPathCut alloc];
  objc_msgSend(v11, "lengthToElement:", v19 + 1);
  v57 = v56;
  objc_msgSend(v11, "length");
  v59 = -[AKTSDPathCut initWithSegment:atT:withSkew:](v55, "initWithSegment:atT:withSkew:", v19, v57 / v58, 0.0);

  objc_msgSend(v12, "addObject:", v59);
  if (!v54)
  {
    v80 = v59;
    v84 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
    v60 = -[AKTSDBezierPath elementCount](self, "elementCount");
    if (v60)
    {
      v61 = v60;
      v62 = 0;
      v63 = 0;
      do
      {
        v64 = -[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v62, &v86);
        v65 = v64 == 0;
        if (v64)
        {
          v66 = v64;
          if (v64 == 2)
          {
            v86.f64[0] = var0 + v86.f64[0] * var1;
            v87 = var0 + v87 * var1;
            v89.f64[0] = var0 + v89.f64[0] * var1;
            v82 = v89;
            sub_229066B34(&v85, v11, 0, v81, v63, v12);
            v85 = v82;
          }
          else
          {
            if (v64 == 3)
            {
              v86 = v84;
              v67 = v84;
            }
            else
            {
              v67.f64[0] = var0 + v86.f64[0] * var1;
              v86.f64[0] = v67.f64[0];
            }
            v68 = v85;
            v69 = sub_22902DEF0(v67.f64[0], v86.f64[1], v85.f64[0]);
            v71 = v70;
            v89 = v86;
            v72 = sub_22902DEFC(v69, v70, 0.33);
            v86.f64[0] = sub_22902DEE4(v68.f64[0], v68.f64[1], v72);
            v86.f64[1] = v73;
            v74 = sub_22902DEFC(v69, v71, 0.66);
            v87 = sub_22902DEE4(v68.f64[0], v68.f64[1], v74);
            v88 = v75;
            v83 = v89;
            sub_229066B34(&v85, v11, 0, v81, v63, v12);
            v85 = v83;
            if (v66 == 3)
              objc_msgSend(v81, "closePath");
          }
        }
        else
        {
          v86.f64[0] = var0 + v86.f64[0] * var1;
          v84 = v86;
          v85 = v86;
        }
        ++v62;
        v63 = v65;
      }
      while (v61 != v62);
    }
    v59 = v80;
  }

}

- (id)chisel
{
  void *v3;
  double v4;
  float v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  float v10;
  float v11;
  BOOL v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  double v30;
  float v31;
  float v32;
  float v33;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  float v56;
  double v57;
  float v58;
  float v59;
  unint64_t v60;
  double v61;
  BOOL v62;
  unint64_t v63;
  double v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  double v78;
  float v79;
  float v80;
  float v81;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v99;
  double v100;
  double v101;
  double v102;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  float64x2_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  +[AKTSDBezierPath bezierPath](AKTSDBezierPath, "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDBezierPath lineWidth](self, "lineWidth");
  v5 = v4 * 0.5;
  v6 = -[AKTSDBezierPath elementCount](self, "elementCount");
  if (!v6)
  {
    v9 = 1;
    v55 = -1;
    goto LABEL_60;
  }
  v7 = v6;
  v8 = 0;
  v9 = 1;
  v10 = 9.0;
  v11 = -3.0;
  do
  {
    v12 = v9;
    v13 = -[AKTSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v8, &v112);
    v9 = v13 == 0;
    if (!v13)
      goto LABEL_56;
    v15 = v13;
    LODWORD(v14) = 0;
    -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v14);
    if (v16 <= 0.0)
      v17 = -v5;
    else
      v17 = v5;
    if (v15 == 2)
    {
      v18 = v112.f64[0];
      v19 = v113;
      v20 = v115;
      v21 = v117;
      v22 = (float)((float)((float)(v19 * v10) + (float)(v18 * v11)) + (float)(v20 * -9.0)) + (float)(v21 * 3.0);
      v23 = (float)((float)(v19 * -12.0) + (float)(v18 * 6.0)) + (float)(v20 * 6.0);
      v24 = (float)(v19 * 3.0) + (float)(v18 * v11);
      v25 = (float)(v24 * (float)(v22 * -4.0)) + (float)(v23 * v23);
      if (v25 <= 0.0)
      {
        v36 = v17;
        v37 = v112.f64[1] + v17;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v112.f64[0], v37);
        else
          objc_msgSend(v3, "lineToPoint:", v112.f64[0], v37);
        v41 = v117;
        v42 = v118 + v36;
        v43 = v113;
        v44 = v114 + v36;
        v45 = v115;
        v46 = v116;
        goto LABEL_55;
      }
      v26 = sqrtf(v25);
      v27 = (float)((float)-v23 - v26) / (float)(v22 + v22);
      v28 = (float)(v26 - v23) / (float)(v22 + v22);
      if (v28 >= v27)
        v29 = v28;
      else
        v29 = v27;
      if (v28 < v27)
        v27 = v28;
      v30 = fabsf(v22);
      v31 = (float)-v24 / v23;
      if (v30 <= 0.001)
        v32 = 10.0;
      else
        v32 = v29;
      if (v30 <= 0.001)
        v33 = v31;
      else
        v33 = v27;
      if (v33 > 0.0 && v33 < 1.0)
      {
        v38 = v33;
        sub_229064434(&v112, (uint64_t)&v104, 0.0, v33);
        v39 = v17;
        v40 = v105 + v39;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v104, v40);
        else
          objc_msgSend(v3, "lineToPoint:", v104, v40);
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v110, v111 + v39, v106, v107 + v39, v108, v109 + v39);
        v47 = v38 + 0.01;
        *(float *)&v47 = v38 + 0.01;
        -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v47);
        v12 = 0;
        if (v48 <= 0.0)
          v17 = -v5;
        else
          v17 = v5;
      }
      else
      {
        v33 = 0.0;
      }
      v49 = v33;
      if (v32 > 0.0 && v32 < 1.0)
      {
        v51 = v32;
        sub_229064434(&v112, (uint64_t)&v104, v49, v32);
        v52 = v105 + v17;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v104, v52);
        else
          objc_msgSend(v3, "lineToPoint:", v104, v52);
        v10 = 9.0;
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v110, v111 + v17, v106, v107 + v17, v108, v109 + v17);
        v53 = v51 + 0.01;
        *(float *)&v53 = v51 + 0.01;
        -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v53);
        if (v54 <= 0.0)
          v17 = -v5;
        else
          v17 = v5;
        sub_229064434(&v112, (uint64_t)&v104, v51, 1.0);
      }
      else
      {
        sub_229064434(&v112, (uint64_t)&v104, v49, 1.0);
        if (v12)
        {
          v36 = v17;
          objc_msgSend(v3, "moveToPoint:", v104, v105 + v17);
          v10 = 9.0;
          v11 = -3.0;
LABEL_54:
          v41 = v110;
          v42 = v111 + v36;
          v43 = v106;
          v44 = v107 + v36;
          v45 = v108;
          v46 = v109;
LABEL_55:
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v41, v42, v43, v44, v45, v46 + v36);
          goto LABEL_56;
        }
        v10 = 9.0;
      }
      v11 = -3.0;
      v36 = v17;
      objc_msgSend(v3, "lineToPoint:", v104, v105 + v17);
      goto LABEL_54;
    }
    v35 = v112.f64[1] + v17;
    if (v12)
      objc_msgSend(v3, "moveToPoint:", v112.f64[0], v35);
    else
      objc_msgSend(v3, "lineToPoint:", v112.f64[0], v35);
    objc_msgSend(v3, "lineToPoint:", v113, v114 + v17);
LABEL_56:
    ++v8;
  }
  while (v7 != v8);
  v55 = v7 - 1;
  if (v55)
  {
LABEL_60:
    if (*MEMORY[0x24BDBEFB0] >= 0.0)
      v56 = -v5;
    else
      v56 = v5;
    v57 = v56;
    v58 = 9.0;
    v59 = -3.0;
    do
    {
      v60 = -[AKTSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v55, &v112);
      v62 = v60 == 0;
      if (v60)
      {
        v63 = v60;
        LODWORD(v61) = 1.0;
        -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v55, v61);
        if (v64 >= 0.0)
          v65 = -v5;
        else
          v65 = v5;
        if (v63 == 2)
        {
          v66 = v112.f64[0];
          v67 = v113;
          v68 = v115;
          v69 = v117;
          v70 = (float)((float)((float)(v67 * v58) + (float)(v66 * v59)) + (float)(v68 * -9.0)) + (float)(v69 * 3.0);
          v71 = (float)((float)(v67 * -12.0) + (float)(v66 * 6.0)) + (float)(v68 * 6.0);
          v72 = (float)(v67 * 3.0) + (float)(v66 * v59);
          v73 = (float)(v72 * (float)(v70 * -4.0)) + (float)(v71 * v71);
          if (v73 <= 0.0)
          {
            v86 = v65;
            if (v9)
              objc_msgSend(v3, "moveToPoint:");
            else
              objc_msgSend(v3, "lineToPoint:");
            v90 = v112.f64[0];
            v91 = v112.f64[1] + v86;
            v92 = v115;
            v93 = v116 + v86;
            v94 = v113;
            v95 = v114;
          }
          else
          {
            v74 = sqrtf(v73);
            v75 = (float)((float)-v71 - v74) / (float)(v70 + v70);
            v76 = (float)(v74 - v71) / (float)(v70 + v70);
            if (v76 <= v75)
              v77 = v76;
            else
              v77 = v75;
            if (v76 > v75)
              v75 = v76;
            v78 = fabsf(v70);
            v79 = (float)-v72 / v71;
            if (v78 <= 0.001)
              v80 = 10.0;
            else
              v80 = v77;
            if (v78 <= 0.001)
              v81 = v79;
            else
              v81 = v75;
            if (v81 > 0.0 && v81 < 1.0)
            {
              v87 = v81;
              sub_229064434(&v112, (uint64_t)&v104, v81, 1.0);
              v88 = v65;
              v89 = v111 + v88;
              if (v9)
                objc_msgSend(v3, "moveToPoint:", v110, v89);
              else
                objc_msgSend(v3, "lineToPoint:", v110, v89);
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v104, v105 + v88, v108, v109 + v88, v106, v107 + v88);
              v96 = v87 + -0.01;
              *(float *)&v96 = v87 + -0.01;
              -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v55, v96);
              v9 = 0;
              if (v97 >= 0.0)
                v65 = -v5;
              else
                v65 = v5;
            }
            else
            {
              v81 = 1.0;
            }
            if (v80 > 0.0 && v80 < 1.0)
            {
              v99 = v80;
              sub_229064434(&v112, (uint64_t)&v104, v80, v81);
              v100 = v111 + v65;
              if (v9)
                objc_msgSend(v3, "moveToPoint:", v110, v100);
              else
                objc_msgSend(v3, "lineToPoint:", v110, v100);
              v58 = 9.0;
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v104, v105 + v65, v108, v109 + v65, v106, v107 + v65);
              v101 = v99 + -0.01;
              *(float *)&v101 = v99 + -0.01;
              -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v55, v101);
              if (v102 >= 0.0)
                v65 = -v5;
              else
                v65 = v5;
              sub_229064434(&v112, (uint64_t)&v104, 0.0, v99);
            }
            else
            {
              sub_229064434(&v112, (uint64_t)&v104, 0.0, v81);
              if (v9)
              {
                v86 = v65;
                objc_msgSend(v3, "moveToPoint:", v110, v111 + v65);
                v58 = 9.0;
                v59 = -3.0;
                goto LABEL_117;
              }
              v58 = 9.0;
            }
            v59 = -3.0;
            v86 = v65;
            objc_msgSend(v3, "lineToPoint:", v110, v111 + v65);
LABEL_117:
            v90 = v104;
            v91 = v105 + v86;
            v92 = v108;
            v93 = v109 + v86;
            v94 = v106;
            v95 = v107;
          }
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v90, v91, v92, v93, v94, v95 + v86);
          goto LABEL_119;
        }
        v85 = v114 + v65;
        if (v9)
          objc_msgSend(v3, "moveToPoint:", v113, v85);
        else
          objc_msgSend(v3, "lineToPoint:", v113, v85);
        v83 = v112.f64[0];
        v84 = v112.f64[1] + v65;
      }
      else
      {
        v83 = v112.f64[0];
        v84 = v112.f64[1] - v57;
      }
      objc_msgSend(v3, "lineToPoint:", v83, v84);
LABEL_119:
      v9 = v62;
      --v55;
    }
    while (v55);
  }
  return v3;
}

@end
