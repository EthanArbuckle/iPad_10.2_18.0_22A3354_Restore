@implementation MKPolygonRenderer

- (MKPolygonRenderer)initWithPolygon:(MKPolygon *)polygon
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPolygonRenderer;
  return -[MKOverlayPathRenderer initWithOverlay:](&v4, sel_initWithOverlay_, polygon);
}

- (void)createPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  CGPath *PathForPolygon;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGPath *v16;
  const CGPath *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
  v4 = v3;
  v6 = v5;
  -[MKOverlayRenderer overlay](self, "overlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PathForPolygon = CreatePathForPolygon(v7, v4, v6);

  -[MKOverlayRenderer overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interiorPolygons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = CreatePathForPolygon(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v15), v4, v6);
        if (v16)
        {
          v17 = v16;
          CGPathAddPath(PathForPolygon, 0, v16);
          CGPathRelease(v17);
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[MKOverlayPathRenderer setPath:](self, "setPath:", PathForPolygon, (_QWORD)v18);
  CGPathRelease(PathForPolygon);

}

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  void *v6;

  -[MKOverlayPathRenderer fillColor](self, "fillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (v6)
    {
      CGContextBeginPath(a4);
      CGContextAddPath(a4, a3);
      CGContextDrawPath(a4, kCGPathEOFill);
    }
  }
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGLineCap LineCap;
  uint64_t LineJoin;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  CGPath *StrokeClipPathForPolygon;
  const CGPath *CopyByStrokingPath;
  CGContext *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGLineCap v29;
  uint64_t i;
  void *v31;
  double v32;
  double v33;
  CGPath *v34;
  const CGPath *v35;
  uint64_t v36;
  const CGPath *v37;
  const CGPath *v38;
  CGPath *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v6)
  {
    -[MKPolygonRenderer strokeStart](self, "strokeStart");
    v8 = v7;
    -[MKPolygonRenderer strokeEnd](self, "strokeEnd");
    v10 = v9;
    if (v8 > 0.0 || v9 < 1.0)
    {
      CGContextGetLineWidth();
      v12 = v11;
      LineCap = CGContextGetLineCap();
      LineJoin = CGContextGetLineJoin();
      CGContextGetMiterLimit();
      v16 = v15;
      -[MKOverlayRenderer overlay](self, "overlay");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
      StrokeClipPathForPolygon = _MKPolygonRendererCreateStrokeClipPathForPolygon(v17, v18, v19, v8, v10);

      if (StrokeClipPathForPolygon)
      {
        CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(StrokeClipPathForPolygon, kCGLineCapButt, kCGLineCapButt, (CGLineJoin)LineJoin, v12, v16);
        CGContextAddPath(a4, CopyByStrokingPath);
        CGPathRelease(StrokeClipPathForPolygon);
        CGPathRelease(CopyByStrokingPath);
      }
      v22 = a4;
      -[MKOverlayRenderer overlay](self, "overlay", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "interiorPolygons");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v42;
        if (v8 <= 0.0)
          v29 = LineCap;
        else
          v29 = kCGLineCapButt;
        if (v10 < 1.0)
          LineCap = kCGLineCapButt;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v42 != v28)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
            v34 = _MKPolygonRendererCreateStrokeClipPathForPolygon(v31, v32, v33, v8, v10);
            if (v34)
            {
              v35 = v34;
              v36 = LineJoin;
              v37 = _MKCGPathCreateCopyByStrokingPath(v34, v29, LineCap, (CGLineJoin)LineJoin, v12, v16);
              CGContextAddPath(v22, v37);
              CGPathRelease(v35);
              v38 = v37;
              LineJoin = v36;
              CGPathRelease(v38);
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v27);
      }

      a4 = v22;
      CGContextClip(v22);

      a3 = v39;
    }
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextStrokePath(a4);
  }
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer _performInitialConfiguration](&v3, sel__performInitialConfiguration);
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolygonRenderer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MKPolygonRenderer *v6;
  MKPolygonRenderer *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolygonRendererPolygon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKPolygonRenderer initWithPolygon:](self, "initWithPolygon:", v5);
  v7 = v6;
  if (v6)
    -[MKPolygonRenderer _decodePropertiesWithCoder:](v6, "_decodePropertiesWithCoder:", v4);

  return v7;
}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolygonRendererStrokeStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    self->_strokeStart = v7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolygonRendererStrokeEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer _decodePropertiesWithCoder:](&v11, sel__decodePropertiesWithCoder_, v4);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[MKOverlayRenderer overlay](self, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKPolygonRendererPolygon"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeStart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKPolygonRendererStrokeStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeEnd);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKPolygonRendererStrokeEnd"));

  v8.receiver = self;
  v8.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer _encodePropertiesWithCoder:](&v8, sel__encodePropertiesWithCoder_, v4);

}

- (CGFloat)strokeStart
{
  MKPolygonRenderer *v2;
  double strokeStart;

  v2 = self;
  objc_sync_enter(v2);
  strokeStart = v2->_strokeStart;
  objc_sync_exit(v2);

  return strokeStart;
}

- (CGFloat)strokeEnd
{
  MKPolygonRenderer *v2;
  double strokeEnd;

  v2 = self;
  objc_sync_enter(v2);
  strokeEnd = v2->_strokeEnd;
  objc_sync_exit(v2);

  return strokeEnd;
}

- (void)setStrokeStart:(CGFloat)strokeStart
{
  void *v4;
  MKPolygonRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeStart, obj->_strokeStart) >= 0.00000011920929)
  {
    -[MKPolygonRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("strokeStart"));
    obj->_strokeStart = strokeStart;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKPolygonRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("strokeStart"));
  }
  objc_sync_exit(obj);

}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  void *v4;
  MKPolygonRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeEnd, obj->_strokeEnd) >= 0.00000011920929)
  {
    -[MKPolygonRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("strokeEnd"));
    obj->_strokeEnd = strokeEnd;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKPolygonRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("strokeEnd"));
  }
  objc_sync_exit(obj);

}

- (void)setLineWidth:(double)a3
{
  double v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setLineWidth:](&v7, sel_setLineWidth_);
  -[VKVectorOverlayPolygonGroup lineWidth](self->_vectorData, "lineWidth");
  if (fabs(a3) < 0.000001 || fabs(v5) < 0.000001)
  {
    -[VKVectorOverlayPolygonGroup setLineWidth:](self->_vectorData, "setLineWidth:", a3);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__MKPolygonRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E20DB2B0;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("lineWidth"), v6);
  }
}

uint64_t __34__MKPolygonRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setLineWidth:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)setLineJoin:(int)a3
{
  _BOOL4 v5;
  uint64_t v6;
  objc_super v7;

  v5 = a3 == 0;
  v7.receiver = self;
  v7.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setLineJoin:](&v7, sel_setLineJoin_);
  if (a3 == 2)
    v6 = 1;
  else
    v6 = 2 * v5;
  -[VKVectorOverlayPolygonGroup setLineJoin:](self->_vectorData, "setLineJoin:", v6);
}

- (void)setMiterLimit:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setMiterLimit:](&v5, sel_setMiterLimit_);
  -[VKVectorOverlayPolygonGroup setMiterLimit:](self->_vectorData, "setMiterLimit:", a3);
}

- (void)setFillColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MKPolygonRenderer *v14;
  objc_super v15;

  v4 = a3;
  -[MKOverlayPathRenderer fillColor](self, "fillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setFillColor:](&v15, sel_setFillColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__MKPolygonRenderer_setFillColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("fillColor"), v11);

}

void __34__MKPolygonRenderer_setFillColor___block_invoke(uint64_t a1, float a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_mapkit_blendedColorWithFraction:ofColor:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v4 = *(void **)(a1 + 40);
  v5 = v4;

  v6 = objc_retainAutorelease(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 208), "setFillColor:", objc_msgSend(v6, "CGColor"));

}

- (void)setStrokeColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MKPolygonRenderer *v14;
  objc_super v15;

  v4 = a3;
  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setStrokeColor:](&v15, sel_setStrokeColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__MKPolygonRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeColor"), v11);

}

void __36__MKPolygonRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_mapkit_blendedColorWithFraction:ofColor:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v4 = *(void **)(a1 + 40);
  v5 = v4;

  v6 = objc_retainAutorelease(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 208), "setStrokeColor:", objc_msgSend(v6, "CGColor"));

}

- (void)setAlpha:(double)a3
{
  uint64_t v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  -[VKVectorOverlayPolygonGroup alpha](self->_vectorData, "alpha");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MKPolygonRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E20DB2B0;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("alpha"), v6);
}

uint64_t __30__MKPolygonRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAlpha:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (BOOL)_canProvideVectorGeometry
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  CGPatternRef Pattern;
  id v9;
  CGPatternRef v10;

  if (-[MKOverlayPathRenderer shouldRasterize](self, "shouldRasterize"))
    return 0;
  if (-[MKOverlayPathRenderer _externalSubclassOverridesDrawingMethods](self, "_externalSubclassOverridesDrawingMethods"))
  {
    return 0;
  }
  -[MKOverlayPathRenderer lineDashPattern](self, "lineDashPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 0;
  -[MKOverlayRenderer overlay](self, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isSimple");

  if (!v6)
    return 0;
  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Pattern = CGColorGetPattern((CGColorRef)objc_msgSend(v7, "CGColor"));

  if (Pattern)
    return 0;
  -[MKOverlayPathRenderer fillColor](self, "fillColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = CGColorGetPattern((CGColorRef)objc_msgSend(v9, "CGColor"));

  return !v10 && self->_strokeStart <= 0.0 && self->_strokeEnd >= 1.0;
}

- (id)_vectorGeometry
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  VKVectorOverlayPolygonGroup *v10;
  VKVectorOverlayPolygonGroup *vectorData;
  CGLineJoin v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!self->_vectorData && -[MKPolygonRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC6598]);
    -[MKOverlayRenderer overlay](self, "overlay");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "points");
    -[MKOverlayRenderer overlay](self, "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithMapPoints:count:", v5, objc_msgSend(v6, "pointCount"));

    v8 = objc_alloc(MEMORY[0x1E0DC65A0]);
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (VKVectorOverlayPolygonGroup *)objc_msgSend(v8, "initWithPolygons:", v9);
    vectorData = self->_vectorData;
    self->_vectorData = v10;

    -[MKOverlayPathRenderer lineWidth](self, "lineWidth");
    -[VKVectorOverlayPolygonGroup setLineWidth:](self->_vectorData, "setLineWidth:");
    v12 = -[MKOverlayPathRenderer lineJoin](self, "lineJoin");
    if (v12 == kCGLineJoinBevel)
      v13 = 1;
    else
      v13 = 2 * (v12 == kCGLineJoinMiter);
    -[VKVectorOverlayPolygonGroup setLineJoin:](self->_vectorData, "setLineJoin:", v13);
    -[MKOverlayPathRenderer fillColor](self, "fillColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[VKVectorOverlayPolygonGroup setFillColor:](self->_vectorData, "setFillColor:", objc_msgSend(v14, "CGColor"));

    -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[VKVectorOverlayPolygonGroup setStrokeColor:](self->_vectorData, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

    -[MKOverlayRenderer alpha](self, "alpha");
    -[VKVectorOverlayPolygonGroup setAlpha:](self->_vectorData, "setAlpha:");
    -[MKOverlayPathRenderer miterLimit](self, "miterLimit");
    -[VKVectorOverlayPolygonGroup setMiterLimit:](self->_vectorData, "setMiterLimit:");

  }
  return self->_vectorData;
}

- (id)vectorDataForOverlay:(id)a3
{
  void *v4;

  if (-[MKPolygonRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry", a3))
  {
    -[MKPolygonRenderer _vectorGeometry](self, "_vectorGeometry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_updateRenderColors
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  if (self->_vectorData)
  {
    -[MKOverlayRenderer _mapView](self, "_mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__MKPolygonRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E20D7D98;
    v5[4] = self;
    objc_msgSend(v3, "_withEffectiveTraitCollection:", v5);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayRenderer _updateRenderColors](&v4, sel__updateRenderColors);
}

void __40__MKPolygonRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fillColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setFillColor:", objc_msgSend(v2, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "strokeColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setStrokeColor:", objc_msgSend(v3, "CGColor"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorData, 0);
}

@end
