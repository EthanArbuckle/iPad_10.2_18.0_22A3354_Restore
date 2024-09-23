@implementation MKOverlayPathView

- (void)setFillColor:(UIColor *)fillColor
{
  MKOverlayPathView *v5;
  void *v6;
  UIColor *v7;

  v7 = fillColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fillColor != v7)
  {
    -[MKOverlayPathView willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("setFillColor"));
    objc_storeStrong((id *)&v5->_fillColor, fillColor);
    -[MKOverlayView _renderer](v5, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathView didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("setFillColor"));
  }
  objc_sync_exit(v5);

}

- (UIColor)fillColor
{
  MKOverlayPathView *v2;
  UIColor *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fillColor;
  objc_sync_exit(v2);

  return v3;
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  MKOverlayPathView *v5;
  void *v6;
  UIColor *v7;

  v7 = strokeColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_strokeColor != v7)
  {
    -[MKOverlayPathView willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("setStrokeColor"));
    objc_storeStrong((id *)&v5->_strokeColor, strokeColor);
    -[MKOverlayView _renderer](v5, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathView didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("setStrokeColor"));
  }
  objc_sync_exit(v5);

}

- (UIColor)strokeColor
{
  MKOverlayPathView *v2;
  UIColor *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_strokeColor;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  void *v4;
  MKOverlayPathView *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineWidth != lineWidth)
  {
    -[MKOverlayPathView willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineWidth"));
    obj->_lineWidth = lineWidth;
    -[MKOverlayView _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathView didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineWidth"));
  }
  objc_sync_exit(obj);

}

- (CGFloat)lineWidth
{
  MKOverlayPathView *v2;
  double lineWidth;

  v2 = self;
  objc_sync_enter(v2);
  lineWidth = v2->_lineWidth;
  objc_sync_exit(v2);

  return lineWidth;
}

- (void)setLineJoin:(CGLineJoin)lineJoin
{
  void *v4;
  MKOverlayPathView *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineJoin != lineJoin)
  {
    -[MKOverlayPathView willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineJoin"));
    obj->_lineJoin = lineJoin;
    -[MKOverlayView _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathView didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineJoin"));
  }
  objc_sync_exit(obj);

}

- (CGLineJoin)lineJoin
{
  MKOverlayPathView *v2;
  CGLineJoin lineJoin;

  v2 = self;
  objc_sync_enter(v2);
  lineJoin = v2->_lineJoin;
  objc_sync_exit(v2);

  return lineJoin;
}

- (void)setLineCap:(CGLineCap)lineCap
{
  void *v4;
  MKOverlayPathView *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineCap != lineCap)
  {
    -[MKOverlayPathView willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineCap"));
    obj->_lineCap = lineCap;
    -[MKOverlayView _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathView didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineCap"));
  }
  objc_sync_exit(obj);

}

- (CGLineCap)lineCap
{
  MKOverlayPathView *v2;
  CGLineCap lineCap;

  v2 = self;
  objc_sync_enter(v2);
  lineCap = v2->_lineCap;
  objc_sync_exit(v2);

  return lineCap;
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  void *v4;
  MKOverlayPathView *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_miterLimit != miterLimit)
  {
    -[MKOverlayPathView willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setMiterLimit"));
    obj->_miterLimit = miterLimit;
    -[MKOverlayView _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathView didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setMiterLimit"));
  }
  objc_sync_exit(obj);

}

- (CGFloat)miterLimit
{
  MKOverlayPathView *v2;
  double miterLimit;

  v2 = self;
  objc_sync_enter(v2);
  miterLimit = v2->_miterLimit;
  objc_sync_exit(v2);

  return miterLimit;
}

- (void)setLineDashPhase:(CGFloat)lineDashPhase
{
  void *v4;
  MKOverlayPathView *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineDashPhase != lineDashPhase)
  {
    -[MKOverlayPathView willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineDashPhase"));
    obj->_lineDashPhase = lineDashPhase;
    -[MKOverlayView _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathView didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineDashPhase"));
  }
  objc_sync_exit(obj);

}

- (CGFloat)lineDashPhase
{
  MKOverlayPathView *v2;
  double lineDashPhase;

  v2 = self;
  objc_sync_enter(v2);
  lineDashPhase = v2->_lineDashPhase;
  objc_sync_exit(v2);

  return lineDashPhase;
}

- (MKOverlayPathView)initWithOverlay:(id)a3
{
  MKOverlayPathView *v3;
  MKOverlayPathView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKOverlayPathView;
  v3 = -[MKOverlayView initWithOverlay:](&v6, sel_initWithOverlay_, a3);
  v4 = v3;
  if (v3)
  {
    -[MKOverlayPathView setLineJoin:](v3, "setLineJoin:", 1);
    -[MKOverlayPathView setLineCap:](v4, "setLineCap:", 1);
    -[MKOverlayPathView _performInitialConfiguration](v4, "_performInitialConfiguration");
  }
  return v4;
}

- (CGPathRef)path
{
  MKOverlayPathView *v2;
  const CGPath *path;

  v2 = self;
  objc_sync_enter(v2);
  path = v2->_path;
  if (!path)
  {
    -[MKOverlayPathView createPath](v2, "createPath");
    path = v2->_path;
  }
  objc_sync_exit(v2);

  return path;
}

- (void)setPath:(CGPathRef)path
{
  MKOverlayPathView *v4;
  const CGPath *v5;
  CGPathRef v6;
  MKOverlayPathView *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  v5 = obj->_path;
  if (v5 != path)
  {
    CGPathRelease(v5);
    v6 = CGPathRetain(path);
    v4 = obj;
    obj->_path = v6;
  }
  objc_sync_exit(v4);

}

- (void)invalidatePath
{
  -[MKOverlayPathView setPath:](self, "setPath:", 0);
  -[MKOverlayView setNeedsDisplay](self, "setNeedsDisplay");
}

- (NSArray)lineDashPattern
{
  MKOverlayPathView *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lineDashPattern;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern
{
  MKOverlayPathView *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *v7;

  v7 = lineDashPattern;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_lineDashPattern != v7)
  {
    -[MKOverlayPathView willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("lineDashPattern"));
    v5 = -[NSArray copy](v7, "copy");
    v6 = v4->_lineDashPattern;
    v4->_lineDashPattern = (NSArray *)v5;

    -[MKOverlayView setNeedsDisplay](v4, "setNeedsDisplay");
    -[MKOverlayPathView didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("lineDashPattern"));
  }
  objc_sync_exit(v4);

}

- (void)applyStrokePropertiesToContext:(CGContextRef)context atZoomScale:(MKZoomScale)zoomScale
{
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGLineJoin v13;
  CGLineCap v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  size_t v26;
  CGFloat *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[MKOverlayPathView strokeColor](self, "strokeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MKOverlayPathView strokeColor](self, "strokeColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(context, (CGColorRef)objc_msgSend(v8, "CGColor"));

    -[MKOverlayPathView contentScaleFactor](self, "contentScaleFactor");
    v10 = v9;
    -[MKOverlayPathView lineWidth](self, "lineWidth");
    v12 = v11;
    v13 = -[MKOverlayPathView lineJoin](self, "lineJoin");
    v14 = -[MKOverlayPathView lineCap](self, "lineCap");
    -[MKOverlayPathView miterLimit](self, "miterLimit");
    if (v15 <= 0.0)
      v16 = 10.0;
    else
      v16 = v15;
    v17 = _MKLinkedOnOrAfterReleaseSet(2310);
    v18 = 1.0;
    if (!v17)
      v18 = zoomScale;
    v19 = v16 / v18;
    -[MKOverlayPathView lineDashPhase](self, "lineDashPhase");
    v21 = v20;
    -[MKOverlayPathView lineDashPattern](self, "lineDashPattern");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 <= 0.0)
    {
      v23 = vcvtmd_s64_f64(log2(zoomScale) + 0.5);
      if (v23 >= -21)
        v24 = (v23 & (v23 >> 63)) + 21;
      else
        v24 = 0;
      v12 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v24];
    }
    CGContextSetLineWidth(context, v10 * (v12 / zoomScale));
    CGContextSetLineJoin(context, v13);
    CGContextSetLineCap(context, v14);
    CGContextSetMiterLimit(context, v10 * v19);
    if (v22)
    {
      v25 = v21 / zoomScale;
      v26 = objc_msgSend(v22, "count");
      v27 = (CGFloat *)malloc_type_malloc(8 * v26, 0x100004000313F17uLL);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v28 = v22;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v36;
        do
        {
          v33 = 0;
          do
          {
            if (*(_QWORD *)v36 != v32)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v33), "cgFloatValue", (_QWORD)v35);
            v27[v31 + v33++] = v10 * (v34 / zoomScale);
          }
          while (v30 != v33);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          v31 += v33;
        }
        while (v30);
      }

      CGContextSetLineDash(context, v25, v27, v26);
      free(v27);
    }

  }
}

- (void)applyFillPropertiesToContext:(CGContextRef)context atZoomScale:(MKZoomScale)zoomScale
{
  void *v6;
  id v7;

  -[MKOverlayPathView fillColor](self, "fillColor", zoomScale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MKOverlayPathView fillColor](self, "fillColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(context, (CGColorRef)objc_msgSend(v7, "CGColor"));

  }
}

- (void)strokePath:(CGPathRef)path inContext:(CGContextRef)context
{
  if (path)
  {
    if (self->_strokeColor)
    {
      CGContextBeginPath(context);
      CGContextAddPath(context, path);
      CGContextStrokePath(context);
    }
  }
}

- (void)fillPath:(CGPathRef)path inContext:(CGContextRef)context
{
  if (path)
  {
    if (self->_fillColor)
    {
      CGContextBeginPath(context);
      CGContextAddPath(context, path);
      CGContextFillPath(context);
    }
  }
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  MKOverlayPathView *v7;
  const CGPath *v8;
  char v9;

  v7 = self;
  objc_sync_enter(v7);
  if (v7->_path || (-[MKOverlayPathView createPath](v7, "createPath"), v7->_path))
  {
    v8 = (const CGPath *)MEMORY[0x18D777FE4]();
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  objc_sync_exit(v7);

  if ((v9 & 1) == 0)
  {
    if (v8)
    {
      -[MKOverlayPathView applyFillPropertiesToContext:atZoomScale:](v7, "applyFillPropertiesToContext:atZoomScale:", a5, a4);
      -[MKOverlayPathView fillPath:inContext:](v7, "fillPath:inContext:", v8, a5);
      -[MKOverlayPathView applyStrokePropertiesToContext:atZoomScale:](v7, "applyStrokePropertiesToContext:atZoomScale:", a5, a4);
      -[MKOverlayPathView strokePath:inContext:](v7, "strokePath:inContext:", v8, a5);
      CGPathRelease(v8);
    }
  }
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var0;
  double var1;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double rect2;
  MKMapRect v30;

  rect2 = a3.var1.var1;
  var0 = a3.var1.var0;
  var1 = a3.var0.var1;
  v7 = a3.var0.var0;
  -[MKOverlayView overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingMapRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[MKOverlayPathView strokeColor](self, "strokeColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MKOverlayPathView lineWidth](self, "lineWidth");
    if (v19 <= 0.0)
    {
      v20 = vcvtmd_s64_f64(log2(a4) + 0.5);
      if (v20 >= -21)
        v21 = (v20 & (v20 >> 63)) + 21;
      else
        v21 = 0;
      v19 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v21];
    }
    v22 = INFINITY;
    if (v11 != INFINITY || (v23 = INFINITY, v13 != INFINITY))
    {
      v24 = v19 / a4;
      v23 = v11 - v24;
      v22 = v13 - v24;
      v15 = v15 + v24 * 2.0;
      v17 = v17 + v24 * 2.0;
    }
  }
  else
  {
    v22 = v13;
    v23 = v11;
  }
  v25 = v23;
  v26 = v15;
  v27 = v17;
  v30.origin.x = v7;
  v30.origin.y = var1;
  v30.size.width = var0;
  v30.size.height = rect2;
  return MKMapRectIntersectsRect(*(MKMapRect *)(&v22 - 1), v30);
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)MKOverlayPathView;
  -[MKOverlayView dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineDashPattern, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
