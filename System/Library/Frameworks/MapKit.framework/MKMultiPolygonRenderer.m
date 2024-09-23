@implementation MKMultiPolygonRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayPathRenderer _performInitialConfiguration](&v3, sel__performInitialConfiguration);
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

- (void)dealloc
{
  const CGPath **paths;
  unint64_t v4;
  objc_super v5;

  paths = self->_paths;
  if (paths)
  {
    if (self->_pathsCount)
    {
      v4 = 0;
      do
        CGPathRelease(self->_paths[v4++]);
      while (v4 < self->_pathsCount);
      paths = self->_paths;
    }
    free(paths);
  }
  v5.receiver = self;
  v5.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayPathRenderer dealloc](&v5, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMultiPolygonRenderer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MKMultiPolygonRenderer *v6;
  MKMultiPolygonRenderer *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMultiPolygonPolygon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKMultiPolygonRenderer initWithMultiPolygon:](self, "initWithMultiPolygon:", v5);
  v7 = v6;
  if (v6)
    -[MKMultiPolygonRenderer _decodePropertiesWithCoder:](v6, "_decodePropertiesWithCoder:", v4);

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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMultiPolygonRendererStrokeStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    self->_strokeStart = v7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMultiPolygonRendererStrokeEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKMultiPolygonRenderer;
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
  -[MKMultiPolygonRenderer multiPolygon](self, "multiPolygon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKMultiPolygonPolygon"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeStart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKMultiPolygonRendererStrokeStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_strokeEnd);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKMultiPolygonRendererStrokeEnd"));

  v8.receiver = self;
  v8.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayPathRenderer _encodePropertiesWithCoder:](&v8, sel__encodePropertiesWithCoder_, v4);

}

- (void)createPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CGPath *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  CGPath *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  const CGPath **v29;
  CGPath *Mutable;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
  v4 = v3;
  v6 = v5;
  -[MKOverlayRenderer overlay](self, "overlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "polygons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (const CGPath **)malloc_type_malloc(8 * objc_msgSend(v8, "count"), 0x6004044C4A2DFuLL);

  Mutable = CGPathCreateMutable();
  -[MKOverlayRenderer overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "polygons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      -[MKOverlayRenderer overlay](self, "overlay", v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "polygons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = CGPathCreateMutable();
      _AddPathForPolygon(v16, v15, v4, v6);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v15, "interiorPolygons");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            v22 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v21);
            if ((unint64_t)objc_msgSend(v22, "pointCount") > 2)
            {
              v23 = CGPathCreateMutable();
              _AddPathForPolygon(v23, v22, v4, v6);

              if (v23)
              {
                CGPathAddPath(v16, 0, v23);
                CGPathRelease(v23);
              }
            }
            else
            {

            }
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v19);
      }

      v29[v12] = v16;
      CGPathAddPath(Mutable, 0, v16);

      ++v12;
      -[MKOverlayRenderer overlay](self, "overlay");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "polygons");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

    }
    while (v12 < v26);
  }
  self->_paths = v29;
  -[MKOverlayRenderer overlay](self, "overlay", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "polygons");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  self->_pathsCount = objc_msgSend(v28, "count");

  -[MKOverlayPathRenderer setPath:](self, "setPath:", Mutable);
  CGPathRelease(Mutable);
}

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  void *v6;
  unint64_t pathsCount;
  unint64_t i;
  const CGPath *v9;
  objc_super v10;

  if (!self->_paths)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKMultiPolygonRenderer;
    -[MKOverlayPathRenderer fillPath:inContext:](&v10, sel_fillPath_inContext_, a3, a4);
  }
  -[MKOverlayPathRenderer fillColor](self, "fillColor", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    pathsCount = self->_pathsCount;
    if (pathsCount)
    {
      for (i = 0; i < pathsCount; ++i)
      {
        v9 = self->_paths[i];
        if (v9)
        {
          CGContextSaveGState(a4);
          CGContextBeginPath(a4);
          CGContextAddPath(a4, v9);
          CGContextDrawPath(a4, kCGPathEOFill);
          CGContextRestoreGState(a4);
          pathsCount = self->_pathsCount;
        }
      }
    }
  }
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGLineCap LineCap;
  CGLineJoin LineJoin;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  CGLineCap v24;
  uint64_t v25;
  void *v26;
  CGPath *StrokeClipPathForPolygon;
  const CGPath *v28;
  const CGPath *CopyByStrokingPath;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  CGPath *v35;
  const CGPath *v36;
  const CGPath *v37;
  CGPath *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v7)
  {
    -[MKMultiPolygonRenderer _strokeStart](self, "_strokeStart");
    v9 = v8;
    -[MKMultiPolygonRenderer _strokeEnd](self, "_strokeEnd");
    v11 = v10;
    if (v9 > 0.0 || v10 < 1.0)
    {
      v38 = a3;
      CGContextGetLineWidth();
      v13 = v12;
      LineCap = CGContextGetLineCap();
      LineJoin = CGContextGetLineJoin();
      CGContextGetMiterLimit();
      v17 = v16;
      -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
      v19 = v18;
      v21 = v20;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      -[MKOverlayRenderer overlay](self, "overlay");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "polygons");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v23;
      v41 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v41)
      {
        v40 = *(_QWORD *)v48;
        if (v9 <= 0.0)
          v24 = LineCap;
        else
          v24 = kCGLineCapButt;
        if (v11 < 1.0)
          LineCap = kCGLineCapButt;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v48 != v40)
              objc_enumerationMutation(obj);
            v42 = v25;
            v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v25);
            StrokeClipPathForPolygon = _MKPolygonRendererCreateStrokeClipPathForPolygon(v26, v19, v21, v9, v11);
            if (StrokeClipPathForPolygon)
            {
              v28 = StrokeClipPathForPolygon;
              CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(StrokeClipPathForPolygon, kCGLineCapButt, kCGLineCapButt, LineJoin, v13, v17);
              CGContextAddPath(a4, CopyByStrokingPath);
              CGPathRelease(v28);
              CGPathRelease(CopyByStrokingPath);
            }
            objc_msgSend(v26, "interiorPolygons");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v44;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v44 != v33)
                    objc_enumerationMutation(v30);
                  v35 = _MKPolygonRendererCreateStrokeClipPathForPolygon(*(void **)(*((_QWORD *)&v43 + 1) + 8 * i), v19, v21, v9, v11);
                  if (v35)
                  {
                    v36 = v35;
                    v37 = _MKCGPathCreateCopyByStrokingPath(v35, v24, LineCap, LineJoin, v13, v17);
                    CGContextAddPath(a4, v37);
                    CGPathRelease(v36);
                    CGPathRelease(v37);
                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
              }
              while (v32);
            }

            v25 = v42 + 1;
          }
          while (v42 + 1 != v41);
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v41);
      }

      CGContextClip(a4);
      a3 = v38;
    }
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextStrokePath(a4);
  }
}

- (double)_strokeStart
{
  MKMultiPolygonRenderer *v2;
  double strokeStart;

  v2 = self;
  objc_sync_enter(v2);
  strokeStart = v2->_strokeStart;
  objc_sync_exit(v2);

  return strokeStart;
}

- (double)_strokeEnd
{
  MKMultiPolygonRenderer *v2;
  double strokeEnd;

  v2 = self;
  objc_sync_enter(v2);
  strokeEnd = v2->_strokeEnd;
  objc_sync_exit(v2);

  return strokeEnd;
}

- (void)_setStrokeStart:(double)a3
{
  void *v4;
  MKMultiPolygonRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(a3, obj->_strokeStart) >= 0.00000011920929)
  {
    -[MKMultiPolygonRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("strokeStart"));
    obj->_strokeStart = a3;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKMultiPolygonRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("strokeStart"));
  }
  objc_sync_exit(obj);

}

- (void)_setStrokeEnd:(double)a3
{
  void *v4;
  MKMultiPolygonRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(a3, obj->_strokeEnd) >= 0.00000011920929)
  {
    -[MKMultiPolygonRenderer willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("strokeEnd"));
    obj->_strokeEnd = a3;
    -[MKOverlayRenderer _renderer](obj, "_renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayForReason:", 2);

    -[MKMultiPolygonRenderer didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("strokeEnd"));
  }
  objc_sync_exit(obj);

}

- (void)setLineWidth:(double)a3
{
  double v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolygonRenderer;
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
    v6[2] = __39__MKMultiPolygonRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E20DB2B0;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("lineWidth"), v6);
  }
}

uint64_t __39__MKMultiPolygonRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setLineWidth:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)setLineJoin:(int)a3
{
  _BOOL4 v5;
  uint64_t v6;
  objc_super v7;

  v5 = a3 == 0;
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolygonRenderer;
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
  v5.super_class = (Class)MKMultiPolygonRenderer;
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
  MKMultiPolygonRenderer *v14;
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
  v15.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayPathRenderer setFillColor:](&v15, sel_setFillColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__MKMultiPolygonRenderer_setFillColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("fillColor"), v11);

}

void __39__MKMultiPolygonRenderer_setFillColor___block_invoke(uint64_t a1, float a2)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 224), "setFillColor:", objc_msgSend(v6, "CGColor"));

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
  MKMultiPolygonRenderer *v14;
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
  v15.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayPathRenderer setStrokeColor:](&v15, sel_setStrokeColor_, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__MKMultiPolygonRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E20DCB78;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("strokeColor"), v11);

}

void __41__MKMultiPolygonRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 224), "setStrokeColor:", objc_msgSend(v6, "CGColor"));

}

- (void)setAlpha:(double)a3
{
  uint64_t v5;
  _QWORD v6[7];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  -[VKVectorOverlayPolygonGroup alpha](self->_vectorData, "alpha");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MKMultiPolygonRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E20DB2B0;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  -[MKOverlayPathRenderer _animateVectorGeometryIfNecessaryForKey:withStepHandler:](self, "_animateVectorGeometryIfNecessaryForKey:withStepHandler:", CFSTR("alpha"), v6);
}

uint64_t __35__MKMultiPolygonRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setAlpha:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (BOOL)_canProvideVectorGeometry
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  CGPatternRef Pattern;
  id v13;
  CGPatternRef v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MKOverlayRenderer overlay](self, "overlay", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "polygons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "_isSimple"))
        {

          return 0;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Pattern = CGColorGetPattern((CGColorRef)objc_msgSend(v11, "CGColor"));

  if (Pattern)
    return 0;
  -[MKOverlayPathRenderer fillColor](self, "fillColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = CGColorGetPattern((CGColorRef)objc_msgSend(v13, "CGColor"));

  return !v14 && self->_strokeStart <= 0.0 && self->_strokeEnd >= 1.0;
}

- (id)_vectorGeometry
{
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
  VKVectorOverlayPolygonGroup *v17;
  VKVectorOverlayPolygonGroup *vectorData;
  CGLineJoin v19;
  uint64_t v20;
  id v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_vectorData && -[MKMultiPolygonRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry"))
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    -[MKOverlayRenderer overlay](self, "overlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "polygons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[MKOverlayRenderer overlay](self, "overlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "polygons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x1E0DC6598]);
          v15 = objc_retainAutorelease(v13);
          v16 = (void *)objc_msgSend(v14, "initWithMapPoints:count:", objc_msgSend(v15, "points"), objc_msgSend(v15, "pointCount"));
          objc_msgSend(v6, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v17 = (VKVectorOverlayPolygonGroup *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC65A0]), "initWithPolygons:", v6);
    vectorData = self->_vectorData;
    self->_vectorData = v17;

    -[MKOverlayPathRenderer lineWidth](self, "lineWidth");
    -[VKVectorOverlayPolygonGroup setLineWidth:](self->_vectorData, "setLineWidth:");
    v19 = -[MKOverlayPathRenderer lineJoin](self, "lineJoin");
    if (v19 == kCGLineJoinBevel)
      v20 = 1;
    else
      v20 = 2 * (v19 == kCGLineJoinMiter);
    -[VKVectorOverlayPolygonGroup setLineJoin:](self->_vectorData, "setLineJoin:", v20);
    -[MKOverlayPathRenderer fillColor](self, "fillColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[VKVectorOverlayPolygonGroup setFillColor:](self->_vectorData, "setFillColor:", objc_msgSend(v21, "CGColor"));

    -[MKOverlayPathRenderer strokeColor](self, "strokeColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[VKVectorOverlayPolygonGroup setStrokeColor:](self->_vectorData, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

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

  if (-[MKMultiPolygonRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry", a3))
  {
    -[MKMultiPolygonRenderer _vectorGeometry](self, "_vectorGeometry");
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
    v5[2] = __45__MKMultiPolygonRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E20D7D98;
    v5[4] = self;
    objc_msgSend(v3, "_withEffectiveTraitCollection:", v5);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayRenderer _updateRenderColors](&v4, sel__updateRenderColors);
}

void __45__MKMultiPolygonRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fillColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setFillColor:", objc_msgSend(v2, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "strokeColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setStrokeColor:", objc_msgSend(v3, "CGColor"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorData, 0);
}

@end
