@implementation MKOverlayPathRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_externalSubclassOverridesDrawingMethods
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "_mapkitLeafClass");
  if ((objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_drawMapRect_zoomScale_inContext_, v3) & 1) != 0|| (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_applyStrokePropertiesToContext_atZoomScale_, v3) & 1) != 0|| (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_applyFillPropertiesToContext_atZoomScale_, v3) & 1) != 0|| (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_strokePath_inContext_, v3) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_fillPath_inContext_, v3);
  }
}

- (BOOL)_canProvideVectorGeometry
{
  return 0;
}

- (void)_performInitialConfiguration
{
  self->_externalSubclassOverridesDrawingMethods = objc_msgSend((id)objc_opt_class(), "_externalSubclassOverridesDrawingMethods");
  self->_runningVectorGeometryAnimationsLock._os_unfair_lock_opaque = 0;
}

- (void)setShouldRasterize:(BOOL)shouldRasterize
{
  _BOOL4 v3;
  MKOverlayPathRenderer *v4;
  id WeakRetained;
  id v6;
  MKOverlayPathRenderer *obj;

  v3 = shouldRasterize;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_shouldRasterize != v3)
  {
    obj->_shouldRasterize = v3;
    -[MKOverlayRenderer setNeedsDisplay](obj, "setNeedsDisplay");
    WeakRetained = objc_loadWeakRetained((id *)&obj->_usageCounter);

    v4 = obj;
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)&obj->_usageCounter);
      objc_msgSend(v6, "countUsageOfTypeIfNeeded:", 53);

      v4 = obj;
    }
  }
  objc_sync_exit(v4);

}

- (void)_animateVectorGeometryIfNecessaryForKey:(id)a3 withStepHandler:(id)a4
{
  void (**v6)(_QWORD, float);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD, float))a4;
  if (-[MKOverlayPathRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry"))
    -[MKOverlayRenderer _animateIfNecessaryForKey:withStepHandler:](self, "_animateIfNecessaryForKey:withStepHandler:", v7, v6);
  else
    v6[2](v6, 1.0);

}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *strokeColor;
  UIColor *v7;
  UIColor *fillColor;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MKOverlayPathRenderer;
  -[MKOverlayRenderer _decodePropertiesWithCoder:](&v26, sel__decodePropertiesWithCoder_, v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayPathRendererStrokeColor"));
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  strokeColor = self->_strokeColor;
  self->_strokeColor = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayPathRendererFillColor"));
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  fillColor = self->_fillColor;
  self->_fillColor = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayPathLineWidth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    self->_lineWidth = v11;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayPathRendererLineJoin"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    self->_lineJoin = objc_msgSend(v12, "integerValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayPathRendererLineCap"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    self->_lineCap = objc_msgSend(v14, "integerValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayPathRendererMiterLimit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    self->_miterLimit = v18;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayPathRendererLineDashPhase"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "doubleValue");
    self->_lineDashPhase = v21;
  }
  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("MKOverlayPathRendererLineDashPattern"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_storeStrong((id *)&self->_lineDashPattern, v25);

}

- (void)_encodePropertiesWithCoder:(id)a3
{
  id v4;
  UIColor *strokeColor;
  UIColor *fillColor;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *lineDashPattern;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKOverlayPathRenderer;
  -[MKOverlayRenderer _encodePropertiesWithCoder:](&v13, sel__encodePropertiesWithCoder_, v4);
  strokeColor = self->_strokeColor;
  if (strokeColor)
    objc_msgSend(v4, "encodeObject:forKey:", strokeColor, CFSTR("MKOverlayPathRendererStrokeColor"));
  fillColor = self->_fillColor;
  if (fillColor)
    objc_msgSend(v4, "encodeObject:forKey:", fillColor, CFSTR("MKOverlayPathRendererFillColor"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lineWidth);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKOverlayPathLineWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lineJoin);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MKOverlayPathRendererLineJoin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lineCap);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("MKOverlayPathRendererLineCap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_miterLimit);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("MKOverlayPathRendererMiterLimit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lineDashPhase);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("MKOverlayPathRendererLineDashPhase"));

  lineDashPattern = self->_lineDashPattern;
  if (lineDashPattern)
    objc_msgSend(v4, "encodeObject:forKey:", lineDashPattern, CFSTR("MKOverlayPathRendererLineDashPattern"));

}

- (void)setFillColor:(UIColor *)fillColor
{
  MKOverlayPathRenderer *v5;
  void *v6;
  UIColor *v7;

  v7 = fillColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fillColor != v7)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("setFillColor"));
    objc_storeStrong((id *)&v5->_fillColor, fillColor);
    -[MKOverlayRenderer _renderer](v5, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathRenderer didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("setFillColor"));
  }
  objc_sync_exit(v5);

}

- (UIColor)fillColor
{
  MKOverlayPathRenderer *v2;
  UIColor *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fillColor;
  objc_sync_exit(v2);

  return v3;
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  MKOverlayPathRenderer *v5;
  void *v6;
  UIColor *v7;

  v7 = strokeColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_strokeColor != v7)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("setStrokeColor"));
    objc_storeStrong((id *)&v5->_strokeColor, strokeColor);
    -[MKOverlayRenderer _renderer](v5, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathRenderer didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("setStrokeColor"));
  }
  objc_sync_exit(v5);

}

- (UIColor)strokeColor
{
  MKOverlayPathRenderer *v2;
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
  MKOverlayPathRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineWidth != lineWidth)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineWidth"));
    obj->_lineWidth = lineWidth;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineWidth"));
  }
  objc_sync_exit(obj);

}

- (CGFloat)lineWidth
{
  MKOverlayPathRenderer *v2;
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
  MKOverlayPathRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineJoin != lineJoin)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineJoin"));
    obj->_lineJoin = lineJoin;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineJoin"));
  }
  objc_sync_exit(obj);

}

- (CGLineJoin)lineJoin
{
  MKOverlayPathRenderer *v2;
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
  MKOverlayPathRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineCap != lineCap)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineCap"));
    obj->_lineCap = lineCap;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineCap"));
  }
  objc_sync_exit(obj);

}

- (CGLineCap)lineCap
{
  MKOverlayPathRenderer *v2;
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
  MKOverlayPathRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_miterLimit != miterLimit)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setMiterLimit"));
    obj->_miterLimit = miterLimit;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setMiterLimit"));
  }
  objc_sync_exit(obj);

}

- (CGFloat)miterLimit
{
  MKOverlayPathRenderer *v2;
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
  MKOverlayPathRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineDashPhase != lineDashPhase)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("setLineDashPhase"));
    obj->_lineDashPhase = lineDashPhase;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKOverlayPathRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("setLineDashPhase"));
  }
  objc_sync_exit(obj);

}

- (CGFloat)lineDashPhase
{
  MKOverlayPathRenderer *v2;
  double lineDashPhase;

  v2 = self;
  objc_sync_enter(v2);
  lineDashPhase = v2->_lineDashPhase;
  objc_sync_exit(v2);

  return lineDashPhase;
}

- (MKOverlayPathRenderer)initWithOverlay:(id)a3
{
  MKOverlayPathRenderer *v3;
  MKOverlayPathRenderer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKOverlayPathRenderer;
  v3 = -[MKOverlayRenderer initWithOverlay:](&v6, sel_initWithOverlay_, a3);
  v4 = v3;
  if (v3)
  {
    -[MKOverlayPathRenderer setLineJoin:](v3, "setLineJoin:", 1);
    -[MKOverlayPathRenderer setLineCap:](v4, "setLineCap:", 1);
    -[MKOverlayPathRenderer _performInitialConfiguration](v4, "_performInitialConfiguration");
  }
  return v4;
}

- (CGPathRef)path
{
  MKOverlayPathRenderer *v2;
  const CGPath *path;

  v2 = self;
  objc_sync_enter(v2);
  path = v2->_path;
  if (!path)
  {
    -[MKOverlayPathRenderer createPath](v2, "createPath");
    path = v2->_path;
  }
  objc_sync_exit(v2);

  return path;
}

- (void)setPath:(CGPathRef)path
{
  MKOverlayPathRenderer *v4;
  const CGPath *v5;
  CGPathRef v6;
  MKOverlayPathRenderer *obj;

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
  -[MKOverlayPathRenderer setPath:](self, "setPath:", 0);
  -[MKOverlayRenderer setNeedsDisplay](self, "setNeedsDisplay");
}

- (NSArray)lineDashPattern
{
  MKOverlayPathRenderer *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lineDashPattern;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern
{
  MKOverlayPathRenderer *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *v7;

  v7 = lineDashPattern;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_lineDashPattern != v7)
  {
    -[MKOverlayPathRenderer willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("lineDashPattern"));
    v5 = -[NSArray copy](v7, "copy");
    v6 = v4->_lineDashPattern;
    v4->_lineDashPattern = (NSArray *)v5;

    -[MKOverlayRenderer setNeedsDisplay](v4, "setNeedsDisplay");
    -[MKOverlayPathRenderer didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("lineDashPattern"));
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
  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(context, (CGColorRef)objc_msgSend(v8, "CGColor"));

    -[MKOverlayRenderer contentScaleFactor](self, "contentScaleFactor");
    v10 = v9;
    -[MKOverlayPathRenderer lineWidth](self, "lineWidth");
    v12 = v11;
    v13 = -[MKOverlayPathRenderer lineJoin](self, "lineJoin");
    v14 = -[MKOverlayPathRenderer lineCap](self, "lineCap");
    -[MKOverlayPathRenderer miterLimit](self, "miterLimit");
    if (v15 <= 0.0)
      v16 = 10.0;
    else
      v16 = v15;
    v17 = _MKLinkedOnOrAfterReleaseSet(2310);
    v18 = 1.0;
    if (!v17)
      v18 = zoomScale;
    v19 = v16 / v18;
    -[MKOverlayPathRenderer lineDashPhase](self, "lineDashPhase");
    v21 = v20;
    -[MKOverlayPathRenderer lineDashPattern](self, "lineDashPattern");
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

  -[MKOverlayPathRenderer fillColor](self, "fillColor", zoomScale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MKOverlayPathRenderer fillColor](self, "fillColor");
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
  MKOverlayPathRenderer *v7;
  const CGPath *v8;
  char v9;

  v7 = self;
  objc_sync_enter(v7);
  if (v7->_path || (-[MKOverlayPathRenderer createPath](v7, "createPath"), v7->_path))
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
      -[MKOverlayPathRenderer applyFillPropertiesToContext:atZoomScale:](v7, "applyFillPropertiesToContext:atZoomScale:", a5, a4);
      -[MKOverlayPathRenderer fillPath:inContext:](v7, "fillPath:inContext:", v8, a5);
      -[MKOverlayPathRenderer applyStrokePropertiesToContext:atZoomScale:](v7, "applyStrokePropertiesToContext:atZoomScale:", a5, a4);
      -[MKOverlayPathRenderer strokePath:inContext:](v7, "strokePath:inContext:", v8, a5);
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
  -[MKOverlayRenderer overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingMapRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MKOverlayPathRenderer lineWidth](self, "lineWidth");
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
  v3.super_class = (Class)MKOverlayPathRenderer;
  -[MKOverlayRenderer dealloc](&v3, sel_dealloc);
}

- (BOOL)_externalSubclassOverridesDrawingMethods
{
  return self->_externalSubclassOverridesDrawingMethods;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (MKUsageCounter)_usageCounter
{
  return (MKUsageCounter *)objc_loadWeakRetained((id *)&self->_usageCounter);
}

- (void)_setUsageCounter:(id)a3
{
  objc_storeWeak((id *)&self->_usageCounter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_usageCounter);
  objc_storeStrong((id *)&self->_runningVectorGeometryAnimations, 0);
  objc_storeStrong((id *)&self->_lineDashPattern, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
