@implementation MKMultiPolylineRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMultiPolylineRenderer;
  -[MKOverlayPathRenderer _performInitialConfiguration](&v3, sel__performInitialConfiguration);
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMultiPolylineRenderer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MKMultiPolylineRenderer *v6;
  MKMultiPolylineRenderer *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMultiPolylinePolyline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKMultiPolylineRenderer initWithMultiPolyline:](self, "initWithMultiPolyline:", v5);
  v7 = v6;
  if (v6)
    -[MKMultiPolylineRenderer _decodePropertiesWithCoder:](v6, "_decodePropertiesWithCoder:", v4);

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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMultiPolylineRendererStrokeStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    self->_strokeStart = v7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMultiPolylineRendererStrokeEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKMultiPolylineRenderer;
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
  -[MKMultiPolylineRenderer multiPolyline](self, "multiPolyline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKMultiPolylinePolyline"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeStart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKMultiPolylineRendererStrokeStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeEnd);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKMultiPolylineRendererStrokeEnd"));

  v8.receiver = self;
  v8.super_class = (Class)MKMultiPolylineRenderer;
  -[MKOverlayPathRenderer _encodePropertiesWithCoder:](&v8, sel__encodePropertiesWithCoder_, v4);

}

- (double)_strokeStart
{
  MKMultiPolylineRenderer *v2;
  double strokeStart;

  v2 = self;
  objc_sync_enter(v2);
  strokeStart = v2->_strokeStart;
  objc_sync_exit(v2);

  return strokeStart;
}

- (double)_strokeEnd
{
  MKMultiPolylineRenderer *v2;
  double strokeEnd;

  v2 = self;
  objc_sync_enter(v2);
  strokeEnd = v2->_strokeEnd;
  objc_sync_exit(v2);

  return strokeEnd;
}

- (void)_setStrokeStart:(double)a3
{
  MKMultiPolylineRenderer *v4;
  double strokeStart;
  void *v6;
  _QWORD v7[7];

  v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(a3, v4->_strokeStart) >= 0.00000011920929)
  {
    -[MKMultiPolylineRenderer willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("strokeStart"));
    strokeStart = v4->_strokeStart;
    v4->_strokeStart = a3;
    -[MKOverlayRenderer _renderer](v4, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKMultiPolylineRenderer didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("strokeStart"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__MKMultiPolylineRenderer__setStrokeStart___block_invoke;
    v7[3] = &unk_1E20DB2B0;
    v7[4] = v4;
    *(double *)&v7[5] = strokeStart;
    *(double *)&v7[6] = a3;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](v4, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeStart"), v7);
  }
  objc_sync_exit(v4);

}

uint64_t __43__MKMultiPolylineRenderer__setStrokeStart___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setStrokeStart:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)_setStrokeEnd:(double)a3
{
  MKMultiPolylineRenderer *v4;
  double strokeEnd;
  void *v6;
  _QWORD v7[7];

  v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(a3, v4->_strokeEnd) >= 0.00000011920929)
  {
    -[MKMultiPolylineRenderer willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("strokeEnd"));
    strokeEnd = v4->_strokeEnd;
    v4->_strokeEnd = a3;
    -[MKOverlayRenderer _renderer](v4, "_renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplayForReason:", 2);

    -[MKMultiPolylineRenderer didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("strokeEnd"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__MKMultiPolylineRenderer__setStrokeEnd___block_invoke;
    v7[3] = &unk_1E20DB2B0;
    v7[4] = v4;
    *(double *)&v7[5] = strokeEnd;
    *(double *)&v7[6] = a3;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](v4, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeEnd"), v7);
  }
  objc_sync_exit(v4);

}

uint64_t __41__MKMultiPolylineRenderer__setStrokeEnd___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setStrokeEnd:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)createPath
{
  CGPath *Mutable;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double *v16;
  unint64_t v17;
  unint64_t v18;
  double *v19;
  double v20;
  double v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  Mutable = CGPathCreateMutable();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MKOverlayRenderer overlay](self, "overlay", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "polylines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
        v12 = v11;
        v14 = v13;
        v15 = objc_retainAutorelease(v10);
        v16 = (double *)objc_msgSend(v15, "points");
        v17 = objc_msgSend(v15, "pointCount");
        if (v17 >= 2)
        {
          v18 = v17;
          v20 = *v16;
          v21 = v16[1];
          v19 = v16 + 3;
          CGPathMoveToPoint(Mutable, 0, v20 - v12, v21 - v14);
          v22 = v18 - 1;
          do
          {
            CGPathAddLineToPoint(Mutable, 0, *(v19 - 1) - v12, *v19 - v14);
            v19 += 2;
            --v22;
          }
          while (v22);
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  -[MKOverlayPathRenderer setPath:](self, "setPath:", Mutable);
  CGPathRelease(Mutable);
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  CGPath *Mutable;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  const CGPath *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  double *v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  CGFloat v31;
  CGLineCap LineCap;
  CGLineJoin LineJoin;
  double v34;
  CGFloat v35;
  CGContext *v36;
  CGPath *v37;
  double v38;
  CGLineCap v39;
  CGLineCap v40;
  const CGPath *CopyByStrokingPath;
  const CGPath *v42;
  CGPath *v43;
  CGPath *v44;
  MKMultiPolylineRenderer *v45;
  _BOOL4 v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  v9 = v8;
  v11 = v10;
  Mutable = CGPathCreateMutable();
  -[MKMultiPolylineRenderer _strokeStart](self, "_strokeStart");
  v14 = v13;
  v45 = self;
  -[MKMultiPolylineRenderer _strokeEnd](self, "_strokeEnd");
  v16 = v15;
  v17 = v14 > 0.0;
  if (v15 < 1.0)
    v17 = 1;
  v46 = v17;
  if (v17)
    v18 = CGPathCreateMutable();
  else
    v18 = 0;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[MKOverlayRenderer overlay](self, "overlay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "polylines");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v20;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v49;
    v43 = v18;
    v44 = Mutable;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(obj);
        v26 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i));
        v27 = (double *)objc_msgSend(v26, "points");
        v28 = objc_msgSend(v26, "pointCount");
        if (v28 >= 2)
        {
          v29 = v28;
          _MKPolylineAddToPath(Mutable, v27, v28, v9, v11, a4, 0.0, 1.0, -1.0);
          if (!CGPathIsEmpty(Mutable))
          {
            if ((v23 & 1) == 0)
              -[MKOverlayPathRenderer applyStrokePropertiesToContext:atZoomScale:](v45, "applyStrokePropertiesToContext:atZoomScale:", a5, a4);
            if (v46)
            {
              CGContextGetLineWidth();
              v31 = v30;
              LineCap = CGContextGetLineCap();
              LineJoin = CGContextGetLineJoin();
              CGContextGetMiterLimit();
              v35 = v34;
              v36 = a5;
              v37 = CGPathCreateMutable();
              objc_msgSend(v26, "_mapPointsLength");
              _MKPolylineAddToPath(v37, v27, v29, v9, v11, a4, v14, v16, v38);
              if (v14 <= 0.0)
                v39 = LineCap;
              else
                v39 = kCGLineCapButt;
              if (v16 >= 1.0)
                v40 = LineCap;
              else
                v40 = kCGLineCapButt;
              v18 = v43;
              CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(v37, v39, v40, LineJoin, v31, v35);
              CGPathAddPath(v43, 0, CopyByStrokingPath);
              v42 = v37;
              a5 = v36;
              Mutable = v44;
              CGPathRelease(v42);
              CGPathRelease(CopyByStrokingPath);
            }
            v23 = 1;
          }
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v22);
  }

  if (Mutable && !CGPathIsEmpty(Mutable))
  {
    if (v18)
    {
      CGContextAddPath(a5, v18);
      CGContextClip(a5);
    }
    -[MKOverlayPathRenderer strokePath:inContext:](v45, "strokePath:inContext:", Mutable, a5);
  }
  CGPathRelease(Mutable);
  CGPathRelease(v18);
}

- (void)setLineWidth:(double)a3
{
  double v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolylineRenderer;
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
    v6[2] = __40__MKMultiPolylineRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E20DB2B0;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("lineWidth"), v6);
  }
}

uint64_t __40__MKMultiPolylineRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
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
  MKMultiPolylineRenderer *v14;
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
  v15.super_class = (Class)MKMultiPolylineRenderer;
  -[MKOverlayPathRenderer setStrokeColor:](&v15, sel_setStrokeColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__MKMultiPolylineRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeColor"), v11);

}

void __42__MKMultiPolylineRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
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
  v7.super_class = (Class)MKMultiPolylineRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  -[VKVectorOverlayPolylineGroup alpha](self->_vectorGeometry, "alpha");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MKMultiPolylineRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E20DB2B0;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("alpha"), v6);
}

uint64_t __36__MKMultiPolylineRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
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
  v7.super_class = (Class)MKMultiPolylineRenderer;
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
  v6.super_class = (Class)MKMultiPolylineRenderer;
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
  v6.super_class = (Class)MKMultiPolylineRenderer;
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
  MKMultiPolylineRenderer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  double v25;
  id *p_isa;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_vectorGeometry && -[MKMultiPolylineRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry"))
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    -[MKOverlayRenderer overlay](v2, "overlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "polylines");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    p_isa = (id *)&v2->super.super.super.isa;
    -[MKOverlayRenderer overlay](v2, "overlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "polylines");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x1E0DC65A8]);
          v15 = objc_retainAutorelease(v13);
          v16 = (void *)objc_msgSend(v14, "initWithMapPoints:elevations:count:needsElevationCorrection:", objc_msgSend(v15, "points"), objc_msgSend(v15, "elevations"), objc_msgSend(v15, "pointCount"), objc_msgSend(v15, "needsElevationCorrection"));
          objc_msgSend(v6, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    v17 = v6;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC65B0]), "initWithPolylines:", v6);
    v2 = (MKMultiPolylineRenderer *)p_isa;
    v19 = p_isa[26];
    p_isa[26] = (id)v18;

    objc_msgSend(p_isa, "lineWidth");
    objc_msgSend(p_isa[26], "setLineWidth:");
    objc_msgSend(p_isa, "strokeColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(p_isa[26], "setColor:", objc_msgSend(v20, "CGColor"));

    objc_msgSend(p_isa, "alpha");
    objc_msgSend(p_isa[26], "setAlpha:");
    v21 = objc_msgSend(p_isa, "lineJoin");
    if (v21 == 2)
      v22 = 1;
    else
      v22 = 2 * (v21 == 0);
    objc_msgSend(p_isa[26], "setLineJoin:", v22);
    v23 = objc_msgSend(p_isa, "lineCap");
    if (v23 == 2)
      v24 = 2;
    else
      v24 = v23 == 0;
    objc_msgSend(p_isa[26], "setLineCap:", v24);
    objc_msgSend(p_isa, "_strokeStart");
    objc_msgSend(p_isa[26], "setStrokeStart:");
    objc_msgSend(p_isa, "_strokeEnd");
    objc_msgSend(p_isa[26], "setStrokeEnd:");
    objc_msgSend(p_isa, "miterLimit");
    if (v25 <= 0.0)
      v25 = 10.0;
    objc_msgSend(p_isa[26], "setMiterLimit:", v25);

  }
  return v2->_vectorGeometry;
}

- (id)vectorDataForOverlay:(id)a3
{
  void *v4;

  if (-[MKMultiPolylineRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry", a3))
  {
    -[MKMultiPolylineRenderer _vectorGeometry](self, "_vectorGeometry");
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
    v5[2] = __46__MKMultiPolylineRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E20D7D98;
    v5[4] = self;
    objc_msgSend(v3, "_withEffectiveTraitCollection:", v5);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKMultiPolylineRenderer;
  -[MKOverlayRenderer _updateRenderColors](&v4, sel__updateRenderColors);
}

void __46__MKMultiPolylineRenderer__updateRenderColors__block_invoke(uint64_t a1)
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
