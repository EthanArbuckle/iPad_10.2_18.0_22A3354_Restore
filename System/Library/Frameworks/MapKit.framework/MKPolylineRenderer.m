@implementation MKPolylineRenderer

- (void)createPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double *v8;
  void *v9;
  unint64_t v10;
  CGPath *Mutable;
  double *v12;
  double v13;
  double v14;
  unint64_t v15;

  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
  v4 = v3;
  v6 = v5;
  -[MKOverlayRenderer overlay](self, "overlay");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (double *)objc_msgSend(v7, "points");

  -[MKOverlayRenderer overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pointCount");

  if (v10 >= 2)
  {
    Mutable = CGPathCreateMutable();
    v13 = *v8;
    v14 = v8[1];
    v12 = v8 + 3;
    CGPathMoveToPoint(Mutable, 0, v13 - v4, v14 - v6);
    v15 = v10 - 1;
    do
    {
      CGPathAddLineToPoint(Mutable, 0, *(v12 - 1) - v4, *v12 - v6);
      v12 += 2;
      --v15;
    }
    while (v15);
    -[MKOverlayPathRenderer setPath:](self, "setPath:", Mutable);
    CGPathRelease(Mutable);
  }
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double *v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPath *Mutable;
  void *v21;
  unint64_t v22;
  double v23;
  CGFloat v24;
  CGLineCap LineCap;
  double v26;
  CGFloat v27;
  CGPath *v28;
  id v29;
  double *v30;
  void *v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  CGLineCap v39;
  CGLineCap v40;
  const CGPath *CopyByStrokingPath;
  CGLineJoin LineJoin;

  -[MKPolylineRenderer strokeStart](self, "strokeStart", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  v9 = v8;
  -[MKPolylineRenderer strokeEnd](self, "strokeEnd");
  v11 = v10;
  if (vabdd_f64(v9, v10) >= 0.00000011920929)
  {
    -[MKOverlayRenderer overlay](self, "overlay");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (double *)objc_msgSend(v12, "points");
    -[MKOverlayRenderer overlay](self, "overlay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pointCount");
    -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
    v17 = v16;
    v19 = v18;
    Mutable = CGPathCreateMutable();
    _MKPolylineAddToPath(Mutable, v13, v15, v17, v19, a4, 0.0, 1.0, -1.0);

    if (Mutable && !CGPathIsEmpty(Mutable))
    {
      -[MKOverlayPathRenderer applyStrokePropertiesToContext:atZoomScale:](self, "applyStrokePropertiesToContext:atZoomScale:", a5, a4);
      -[MKOverlayRenderer overlay](self, "overlay");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "pointCount");

      if (v22 >= 2 && (v9 > 0.0 || v11 < 1.0))
      {
        CGContextGetLineWidth();
        v24 = v23;
        LineCap = CGContextGetLineCap();
        LineJoin = CGContextGetLineJoin();
        CGContextGetMiterLimit();
        v27 = v26;
        v28 = CGPathCreateMutable();
        -[MKOverlayRenderer overlay](self, "overlay");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30 = (double *)objc_msgSend(v29, "points");
        -[MKOverlayRenderer overlay](self, "overlay");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "pointCount");
        -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
        v34 = v33;
        v36 = v35;
        -[MKOverlayRenderer overlay](self, "overlay");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_mapPointsLength");
        _MKPolylineAddToPath(v28, v30, v32, v34, v36, a4, v9, v11, v38);

        if (v9 <= 0.0)
          v39 = LineCap;
        else
          v39 = kCGLineCapButt;
        if (v11 >= 1.0)
          v40 = LineCap;
        else
          v40 = kCGLineCapButt;
        CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(v28, v39, v40, LineJoin, v24, v27);
        CGPathRelease(v28);
        CGContextAddPath(a5, CopyByStrokingPath);
        CGContextClip(a5);
        CGPathRelease(CopyByStrokingPath);
      }
      -[MKOverlayPathRenderer strokePath:inContext:](self, "strokePath:inContext:", Mutable, a5);
    }
    CGPathRelease(Mutable);
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
  v3.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer _performInitialConfiguration](&v3, sel__performInitialConfiguration);
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolylineRenderer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MKPolylineRenderer *v6;
  MKPolylineRenderer *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolylineRendererPolyline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKPolylineRenderer initWithPolyline:](self, "initWithPolyline:", v5);
  v7 = v6;
  if (v6)
    -[MKPolylineRenderer _decodePropertiesWithCoder:](v6, "_decodePropertiesWithCoder:", v4);

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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolylineRendererStrokeStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    self->_strokeStart = v7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolylineRendererStrokeEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKPolylineRenderer;
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
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKPolylineRendererPolyline"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeStart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKPolylineRendererStrokeStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeEnd);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKPolylineRendererStrokeEnd"));

  v8.receiver = self;
  v8.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer _encodePropertiesWithCoder:](&v8, sel__encodePropertiesWithCoder_, v4);

}

- (CGFloat)strokeStart
{
  MKPolylineRenderer *v2;
  double strokeStart;

  v2 = self;
  objc_sync_enter(v2);
  strokeStart = v2->_strokeStart;
  objc_sync_exit(v2);

  return strokeStart;
}

- (CGFloat)strokeEnd
{
  MKPolylineRenderer *v2;
  double strokeEnd;

  v2 = self;
  objc_sync_enter(v2);
  strokeEnd = v2->_strokeEnd;
  objc_sync_exit(v2);

  return strokeEnd;
}

- (void)setStrokeStart:(CGFloat)strokeStart
{
  MKPolylineRenderer *v4;
  double v5;
  void *v6;
  _QWORD v7[7];

  v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(strokeStart, v4->_strokeStart) >= 0.00000011920929)
  {
    -[MKPolylineRenderer willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("strokeStart"));
    v5 = v4->_strokeStart;
    v4->_strokeStart = strokeStart;
    -[MKOverlayRenderer _renderer](v4, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKPolylineRenderer didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("strokeStart"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MKPolylineRenderer_setStrokeStart___block_invoke;
    v7[3] = &unk_1E20DB2B0;
    v7[4] = v4;
    *(double *)&v7[5] = v5;
    *(CGFloat *)&v7[6] = strokeStart;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](v4, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeStart"), v7);
  }
  objc_sync_exit(v4);

}

uint64_t __37__MKPolylineRenderer_setStrokeStart___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setStrokeStart:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  MKPolylineRenderer *v4;
  double v5;
  void *v6;
  _QWORD v7[7];

  v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(strokeEnd, v4->_strokeEnd) >= 0.00000011920929)
  {
    -[MKPolylineRenderer willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("strokeEnd"));
    v5 = v4->_strokeEnd;
    v4->_strokeEnd = strokeEnd;
    -[MKOverlayRenderer _renderer](v4, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKPolylineRenderer didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("strokeEnd"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__MKPolylineRenderer_setStrokeEnd___block_invoke;
    v7[3] = &unk_1E20DB2B0;
    v7[4] = v4;
    *(double *)&v7[5] = v5;
    *(CGFloat *)&v7[6] = strokeEnd;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](v4, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeEnd"), v7);
  }
  objc_sync_exit(v4);

}

uint64_t __35__MKPolylineRenderer_setStrokeEnd___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setStrokeEnd:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)setLineWidth:(double)a3
{
  double v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setLineWidth:](&v7, sel_setLineWidth_);
  -[VKVectorOverlayPolylineGroup lineWidth](self->_vectorGeometry, "lineWidth");
  if (fabs(a3) < 0.000001 || fabs(v5) < 0.000001)
  {
    -[VKVectorOverlayPolylineGroup setLineWidth:](self->_vectorGeometry, "setLineWidth:", a3);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__MKPolylineRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E20DB2B0;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("lineWidth"), v6);
  }
}

uint64_t __35__MKPolylineRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setLineWidth:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
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
  MKPolylineRenderer *v14;
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
  v15.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setStrokeColor:](&v15, sel_setStrokeColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__MKPolylineRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeColor"), v11);

}

void __37__MKPolylineRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 208), "setColor:", objc_msgSend(v6, "CGColor"));

}

- (void)setAlpha:(double)a3
{
  uint64_t v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  -[VKVectorOverlayPolylineGroup alpha](self->_vectorGeometry, "alpha");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__MKPolylineRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E20DB2B0;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("alpha"), v6);
}

uint64_t __31__MKPolylineRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAlpha:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)setLineJoin:(int)a3
{
  _BOOL4 v5;
  uint64_t v6;
  objc_super v7;

  v5 = a3 == 0;
  v7.receiver = self;
  v7.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setLineJoin:](&v7, sel_setLineJoin_);
  if (a3 == 2)
    v6 = 1;
  else
    v6 = 2 * v5;
  -[VKVectorOverlayPolylineGroup setLineJoin:](self->_vectorGeometry, "setLineJoin:", v6);
}

- (void)setLineCap:(int)a3
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setLineCap:](&v6, sel_setLineCap_);
  if (a3 == 2)
    v5 = 2;
  else
    v5 = a3 == 0;
  -[VKVectorOverlayPolylineGroup setLineCap:](self->_vectorGeometry, "setLineCap:", v5);
}

- (void)setMiterLimit:(double)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setMiterLimit:](&v6, sel_setMiterLimit_);
  v5 = 10.0;
  if (a3 > 0.0)
    v5 = a3;
  -[VKVectorOverlayPolylineGroup setMiterLimit:](self->_vectorGeometry, "setMiterLimit:", v5);
}

- (BOOL)_canProvideVectorGeometry
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id v7;

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
  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = CGColorGetPattern((CGColorRef)objc_msgSend(v7, "CGColor")) == 0;

  return v5;
}

- (id)_vectorGeometry
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  VKVectorOverlayPolylineGroup *v14;
  VKVectorOverlayPolylineGroup *vectorGeometry;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!self->_vectorGeometry && -[MKPolylineRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC65A8]);
    -[MKPolylineRenderer polyline](self, "polyline");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "points");
    -[MKPolylineRenderer polyline](self, "polyline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "elevations");
    -[MKPolylineRenderer polyline](self, "polyline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "pointCount");
    -[MKPolylineRenderer polyline](self, "polyline");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v3, "initWithMapPoints:elevations:count:needsElevationCorrection:", v5, v7, v9, objc_msgSend(v10, "needsElevationCorrection"));

    v12 = objc_alloc(MEMORY[0x1E0DC65B0]);
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (VKVectorOverlayPolylineGroup *)objc_msgSend(v12, "initWithPolylines:", v13);
    vectorGeometry = self->_vectorGeometry;
    self->_vectorGeometry = v14;

    -[MKPolylineRenderer _updateVectorGeometry:](self, "_updateVectorGeometry:", self->_vectorGeometry);
  }
  return self->_vectorGeometry;
}

- (void)_updateVectorGeometry:(id)a3
{
  id v4;
  CGLineJoin v5;
  uint64_t v6;
  CGLineCap v7;
  uint64_t v8;
  double v9;
  id v10;

  v10 = a3;
  -[MKOverlayPathRenderer lineWidth](self, "lineWidth");
  objc_msgSend(v10, "setLineWidth:");
  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setColor:", objc_msgSend(v4, "CGColor"));

  -[MKOverlayRenderer alpha](self, "alpha");
  objc_msgSend(v10, "setAlpha:");
  v5 = -[MKOverlayPathRenderer lineJoin](self, "lineJoin");
  if (v5 == kCGLineJoinBevel)
    v6 = 1;
  else
    v6 = 2 * (v5 == kCGLineJoinMiter);
  objc_msgSend(v10, "setLineJoin:", v6);
  v7 = -[MKOverlayPathRenderer lineCap](self, "lineCap");
  if (v7 == kCGLineCapSquare)
    v8 = 2;
  else
    v8 = v7 == kCGLineCapButt;
  objc_msgSend(v10, "setLineCap:", v8);
  -[MKOverlayPathRenderer miterLimit](self, "miterLimit");
  if (v9 <= 0.0)
    v9 = 10.0;
  objc_msgSend(v10, "setMiterLimit:", v9);
  -[MKPolylineRenderer strokeStart](self, "strokeStart");
  objc_msgSend(v10, "setStrokeStart:");
  -[MKPolylineRenderer strokeEnd](self, "strokeEnd");
  objc_msgSend(v10, "setStrokeEnd:");

}

- (void)_setNeedsVectorGeometryUpdate
{
  if (self->_vectorGeometry)
    -[MKPolylineRenderer _updateVectorGeometry:](self, "_updateVectorGeometry:");
}

- (id)vectorDataForOverlay:(id)a3
{
  void *v4;

  if (-[MKPolylineRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry", a3))
  {
    -[MKPolylineRenderer _vectorGeometry](self, "_vectorGeometry");
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

  if (self->_vectorGeometry)
  {
    -[MKOverlayRenderer _mapView](self, "_mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__MKPolylineRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E20D7D98;
    v5[4] = self;
    objc_msgSend(v3, "_withEffectiveTraitCollection:", v5);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayRenderer _updateRenderColors](&v4, sel__updateRenderColors);
}

void __41__MKPolylineRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "strokeColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setColor:", objc_msgSend(v2, "CGColor"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorGeometry, 0);
}

@end
