@implementation MKCircleRenderer

- (MKCircleRenderer)initWithCircle:(MKCircle *)circle
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKCircleRenderer;
  return -[MKOverlayPathRenderer initWithOverlay:](&v4, sel_initWithOverlay_, circle);
}

- (void)createPath
{
  CGPath *Mutable;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;

  Mutable = CGPathCreateMutable();
  -[MKOverlayRenderer overlay](self, "overlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;

  -[MKOverlayRenderer pointForMapPoint:](self, "pointForMapPoint:", MKTilePointForCoordinate(v6, v8, 21.0));
  v10 = v9;
  v12 = v11;
  GEOMapPointsPerMeterAtLatitude();
  v14 = v13;
  -[MKOverlayRenderer overlay](self, "overlay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "radius");
  v17 = v14 * v16;

  CGPathAddArc(Mutable, 0, v10, v12, v17, 0.0, 6.28318531, 1);
  -[MKOverlayPathRenderer setPath:](self, "setPath:", Mutable);
  CGPathRelease(Mutable);
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  CGPath *Mutable;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  const CGPath *CopyByStrokingPath;
  objc_super v31;
  objc_super v32;

  CGContextGetLineWidth();
  v8 = v7;
  -[MKCircleRenderer strokeStart](self, "strokeStart");
  v10 = v9;
  -[MKCircleRenderer strokeEnd](self, "strokeEnd");
  v12 = v11;
  if (fabs(v8) < 0.00000011920929
    || ((v13 = fabs(v11 + -1.0), fabs(v10) < 0.00000011920929) ? (v14 = v13 < 0.00000011920929) : (v14 = 0), v14))
  {
    v32.receiver = self;
    v32.super_class = (Class)MKCircleRenderer;
    -[MKOverlayPathRenderer strokePath:inContext:](&v32, sel_strokePath_inContext_, a3, a4);
  }
  else
  {
    Mutable = CGPathCreateMutable();
    -[MKOverlayRenderer overlay](self, "overlay");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinate");
    v18 = v17;
    v20 = v19;

    -[MKOverlayRenderer pointForMapPoint:](self, "pointForMapPoint:", MKTilePointForCoordinate(v18, v20, 21.0));
    v22 = v21;
    v24 = v23;
    GEOMapPointsPerMeterAtLatitude();
    v26 = v25;
    -[MKOverlayRenderer overlay](self, "overlay");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "radius");
    v29 = v26 * v28;

    CGPathAddArc(Mutable, 0, v22, v24, v29, (v10 + v10) * 3.14159265 + -1.57079633, (v12 + v12) * 3.14159265 + -1.57079633, 0);
    CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(Mutable, kCGLineCapButt, kCGLineCapButt, kCGLineJoinRound, v8, 0.0);
    CGPathRelease(Mutable);
    CGContextAddPath(a4, CopyByStrokingPath);
    CGContextClip(a4);
    v31.receiver = self;
    v31.super_class = (Class)MKCircleRenderer;
    -[MKOverlayPathRenderer strokePath:inContext:](&v31, sel_strokePath_inContext_, a3, a4);
    CGPathRelease(CopyByStrokingPath);
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
  v3.super_class = (Class)MKCircleRenderer;
  -[MKOverlayPathRenderer _performInitialConfiguration](&v3, sel__performInitialConfiguration);
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

- (CGFloat)strokeStart
{
  MKCircleRenderer *v2;
  double strokeStart;

  v2 = self;
  objc_sync_enter(v2);
  strokeStart = v2->_strokeStart;
  objc_sync_exit(v2);

  return strokeStart;
}

- (CGFloat)strokeEnd
{
  MKCircleRenderer *v2;
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
  MKCircleRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeStart, obj->_strokeStart) >= 0.00000011920929)
  {
    -[MKCircleRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("strokeStart"));
    obj->_strokeStart = strokeStart;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKCircleRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("strokeStart"));
  }
  objc_sync_exit(obj);

}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  void *v4;
  MKCircleRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeEnd, obj->_strokeEnd) >= 0.00000011920929)
  {
    -[MKCircleRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("strokeEnd"));
    obj->_strokeEnd = strokeEnd;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKCircleRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("strokeEnd"));
  }
  objc_sync_exit(obj);

}

- (void)setLineWidth:(double)a3
{
  double v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKCircleRenderer;
  -[MKOverlayPathRenderer setLineWidth:](&v7, sel_setLineWidth_);
  -[VKVectorOverlayCircle lineWidth](self->_vectorData, "lineWidth");
  if (fabs(a3) < 0.000001 || fabs(v5) < 0.000001)
  {
    -[VKVectorOverlayCircle setLineWidth:](self->_vectorData, "setLineWidth:", a3);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__MKCircleRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E20DB2B0;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("lineWidth"), v6);
  }
}

uint64_t __33__MKCircleRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setLineWidth:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
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
  MKCircleRenderer *v14;
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
  v15.super_class = (Class)MKCircleRenderer;
  -[MKOverlayPathRenderer setFillColor:](&v15, sel_setFillColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__MKCircleRenderer_setFillColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("fillColor"), v11);

}

void __33__MKCircleRenderer_setFillColor___block_invoke(uint64_t a1, float a2)
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
  MKCircleRenderer *v14;
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
  v15.super_class = (Class)MKCircleRenderer;
  -[MKOverlayPathRenderer setStrokeColor:](&v15, sel_setStrokeColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__MKCircleRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeColor"), v11);

}

void __35__MKCircleRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
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
  v7.super_class = (Class)MKCircleRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  -[VKVectorOverlayCircle alpha](self->_vectorData, "alpha");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__MKCircleRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E20DB2B0;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("alpha"), v6);
}

uint64_t __29__MKCircleRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAlpha:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (BOOL)_canProvideVectorGeometry
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  CGPatternRef Pattern;
  void *v8;
  double v9;
  double v10;

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
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (CGColorGetPattern((CGColorRef)objc_msgSend(v5, "CGColor")))
  {

    return 0;
  }
  -[MKOverlayPathRenderer fillColor](self, "fillColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Pattern = CGColorGetPattern((CGColorRef)objc_msgSend(v6, "CGColor"));

  if (Pattern)
    return 0;
  -[MKOverlayRenderer overlay](self, "overlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingMapRect");
  v10 = v9;

  return v10 <= 268435456.0 && self->_strokeStart <= 0.0 && self->_strokeEnd >= 1.0;
}

- (id)_vectorData
{
  id v3;
  void *v4;
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
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  double v19;
  VKVectorOverlayCircle *v20;
  VKVectorOverlayCircle *vectorData;

  if (!self->_vectorData && -[MKCircleRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC6588]);
    -[MKOverlayRenderer overlay](self, "overlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingMapRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[MKOverlayPathRenderer lineWidth](self, "lineWidth");
    v14 = v13;
    -[MKOverlayPathRenderer fillColor](self, "fillColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "CGColor");
    -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[MKOverlayRenderer alpha](self, "alpha");
    v20 = (VKVectorOverlayCircle *)objc_msgSend(v3, "initWithMapRect:lineWidth:fillColor:strokeColor:alpha:", v16, v18, v6, v8, v10, v12, v14, v19);
    vectorData = self->_vectorData;
    self->_vectorData = v20;

  }
  return self->_vectorData;
}

- (id)vectorDataForOverlay:(id)a3
{
  void *v4;

  if (-[MKCircleRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry", a3))
  {
    -[MKCircleRenderer _vectorData](self, "_vectorData");
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
    v5[2] = __39__MKCircleRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E20D7D98;
    v5[4] = self;
    objc_msgSend(v3, "_withEffectiveTraitCollection:", v5);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKCircleRenderer;
  -[MKOverlayRenderer _updateRenderColors](&v4, sel__updateRenderColors);
}

void __39__MKCircleRenderer__updateRenderColors__block_invoke(uint64_t a1)
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKCircleRenderer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MKCircleRenderer *v6;
  MKCircleRenderer *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKCircleRendererCircle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKCircleRenderer initWithCircle:](self, "initWithCircle:", v5);
  v7 = v6;
  if (v6)
    -[MKCircleRenderer _decodePropertiesWithCoder:](v6, "_decodePropertiesWithCoder:", v4);

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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKCircleRendererStrokeStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    self->_strokeStart = v7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKCircleRendererStrokeEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKCircleRenderer;
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
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKCircleRendererCircle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeStart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKCircleRendererStrokeStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeEnd);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKCircleRendererStrokeEnd"));

  v8.receiver = self;
  v8.super_class = (Class)MKCircleRenderer;
  -[MKOverlayPathRenderer _encodePropertiesWithCoder:](&v8, sel__encodePropertiesWithCoder_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorData, 0);
}

@end
