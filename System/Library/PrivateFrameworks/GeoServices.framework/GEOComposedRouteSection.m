@implementation GEOComposedRouteSection

- (GEOComposedRouteSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 bounds:(id *)a9 transportType:(int)a10 finalStepIndex:(unint64_t)a11 startDistance:(double)a12 lengthScaleFactor:(double)a13
{
  id v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  unsigned int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float64x2_t v31;
  float32_t v32;
  float32x2_t *v33;
  float64x2_t v34;
  double v35;
  __int128 v36;
  __int128 v37;
  char *v38;
  unint64_t v40;
  objc_super v42;

  v20 = a3;
  v21 = a4;
  v22 = a6;
  v42.receiver = self;
  v42.super_class = (Class)GEOComposedRouteSection;
  v23 = -[GEOComposedRouteSection init](&v42, sel_init);
  if (v23)
  {
    v40 = a5;
    *((_QWORD *)v23 + 2) = malloc_type_malloc(12 * a8, 0x10000403E1C8BA9uLL);
    if (a8)
    {
      v24 = 0;
      v25 = a7;
      do
      {
        objc_msgSend(v20, "coordinateOnRouteAt:", v25, v40);
        v27 = v26;
        v30 = GEOTilePointForCoordinate(v28, v29, 20.0);
        v31.f64[0] = a9->var0.var0;
        v32 = (v27 - a9->var0.var2) / a9->var1.var2;
        v33 = (float32x2_t *)(*((_QWORD *)v23 + 2) + v24);
        v34.f64[1] = a9->var1.var1;
        v34.f64[0] = v30;
        v31.f64[1] = v35 - a9->var0.var1;
        *v33 = vcvt_f32_f64(vdivq_f64(vsubq_f64(v34, v31), *(float64x2_t *)&a9->var1.var0));
        v33[1].f32[0] = v32;
        v24 += 12;
        ++v25;
      }
      while (12 * a8 != v24);
    }
    *((_DWORD *)v23 + 3) = a8;
    v37 = *(_OWORD *)&a9->var0.var2;
    v36 = *(_OWORD *)&a9->var1.var1;
    *(_OWORD *)(v23 + 56) = *(_OWORD *)&a9->var0.var0;
    *(_OWORD *)(v23 + 88) = v36;
    *(_OWORD *)(v23 + 72) = v37;
    *(_OWORD *)(v23 + 104) = *(_OWORD *)(v23 + 56);
    *(_OWORD *)(v23 + 120) = *((_OWORD *)v23 + 5);
    *((_DWORD *)v23 + 2) = a7;
    *((_DWORD *)v23 + 6) = a10;
    objc_storeWeak((id *)v23 + 4, v21);
    *((_QWORD *)v23 + 6) = v40;
    *((_QWORD *)v23 + 17) = a11;
    *((double *)v23 + 18) = a12;
    *((double *)v23 + 19) = a13;
    objc_msgSend(v23, "_initialStepInSteps:", v22);
    v38 = v23;
  }

  return (GEOComposedRouteSection *)v23;
}

- (GEOComposedRouteSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 transportType:(int)a9 finalStepIndex:(unint64_t)a10 fallbackStartCoordinate:(id)a11 fallbackEndCoordinate:(id)a12 startDistance:(double)a13 lengthScaleFactor:(double)a14
{
  double var1;
  double var0;
  double v18;
  double v19;
  id v26;
  id v27;
  id v28;
  GEOComposedRouteSection *v29;
  GEOComposedRouteSection *v30;
  unsigned int v31;
  double *v32;
  uint64_t v33;
  unint64_t pointCount;
  unint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  GeoCodecsVectorTilePoint3D *v45;
  uint64_t v46;
  double x;
  double y;
  double z;
  double width;
  float *p_var2;
  double *v52;
  double height;
  double depth;
  double v55;
  double v56;
  double v57;
  float v58;
  GEOComposedRouteSection *v59;
  _OWORD v61[3];
  objc_super v62;

  var1 = a12.var1;
  var0 = a12.var0;
  v18 = a11.var1;
  v19 = a11.var0;
  v26 = a3;
  v27 = a4;
  v28 = a6;
  v62.receiver = self;
  v62.super_class = (Class)GEOComposedRouteSection;
  v29 = -[GEOComposedRouteSection init](&v62, sel_init);
  v30 = v29;
  if (v29)
  {
    v29->_transportType = a9;
    if (a8 <= 2)
      v31 = 2;
    else
      v31 = a8;
    v29->_startPointIndex = a7;
    v29->_pointCount = v31;
    v32 = (double *)malloc_type_malloc(24 * v31, 0x1000040504FFAC1uLL);
    v33 = (uint64_t)v32;
    pointCount = v30->_pointCount;
    if (pointCount < 2)
    {
      *v32 = GEOTilePointForCoordinate(v19, v18, 20.0);
      *(_QWORD *)(v33 + 8) = v42;
      *(_QWORD *)(v33 + 16) = 0x7FEFFFFFFFFFFFFFLL;
      *(double *)(v33 + 24) = GEOTilePointForCoordinate(var0, var1, 20.0);
      *(_QWORD *)(v33 + 32) = v43;
      *(_QWORD *)(v33 + 40) = 0x7FEFFFFFFFFFFFFFLL;
    }
    else
    {
      v35 = 0;
      v36 = v32 + 2;
      do
      {
        objc_msgSend(v26, "coordinateOnRouteAt:", (v35 + v30->_startPointIndex));
        v38 = v37;
        *(v36 - 2) = GEOTilePointForCoordinate(v39, v40, 20.0);
        *((_QWORD *)v36 - 1) = v41;
        *(_QWORD *)v36 = v38;
        v36 += 3;
        ++v35;
        pointCount = v30->_pointCount;
      }
      while (v35 < pointCount);
    }
    GEOMapBoxBoundingMapPoints(v33, pointCount, (uint64_t)v61);
    v44 = v61[1];
    *(_OWORD *)&v30->_bounds.origin.x = v61[0];
    *(_OWORD *)&v30->_bounds.origin.z = v44;
    *(_OWORD *)&v30->_bounds.size.height = v61[2];
    GEOComposedRouteSectionPadAndSquareBounds(&v30->_bounds.origin.x);
    v45 = (GeoCodecsVectorTilePoint3D *)malloc_type_malloc(12 * v30->_pointCount, 0x10000403E1C8BA9uLL);
    v30->_points = v45;
    v46 = v30->_pointCount;
    if ((_DWORD)v46)
    {
      x = v30->_bounds.origin.x;
      y = v30->_bounds.origin.y;
      z = v30->_bounds.origin.z;
      width = v30->_bounds.size.width;
      p_var2 = &v45->var2;
      v52 = (double *)(v33 + 16);
      height = v30->_bounds.size.height;
      depth = v30->_bounds.size.depth;
      do
      {
        v55 = *(v52 - 2);
        v56 = *(v52 - 1);
        v57 = *v52;
        v52 += 3;
        *(float *)&v55 = (v55 - x) / width;
        v58 = (v57 - z) / depth;
        *(float *)&v56 = (height - (v56 - y)) / height;
        *(p_var2 - 2) = *(float *)&v55;
        *(p_var2 - 1) = *(float *)&v56;
        *p_var2 = v58;
        p_var2 += 3;
        --v46;
      }
      while (v46);
    }
    free((void *)v33);
    v30->_overlayBounds.origin = *($69B62588CC25CB7767350DB9F5F34ADF *)&v30->_bounds.origin.x;
    v30->_overlayBounds.size = *($D4775485B13497D55C4F339E01923D43 *)&v30->_bounds.size.width;
    objc_storeWeak((id *)&v30->_composedRouteSegment, v27);
    v30->_composedRouteSegmentIndex = a5;
    v30->_finalStepIndex = a10;
    v30->_startDistance = a13;
    v30->_lengthScaleFactor = a14;
    -[GEOComposedRouteSection _initialStepInSteps:](v30, "_initialStepInSteps:", v28);
    v59 = v30;
  }

  return v30;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_points);
  v3.receiver = self;
  v3.super_class = (Class)GEOComposedRouteSection;
  -[GEOComposedRouteSection dealloc](&v3, sel_dealloc);
}

- (void)_initialStepInSteps:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "startPointIndex", (_QWORD)v12) >= self->_startPointIndex
          && objc_msgSend(v8, "endPointIndex") < self->_pointCount + self->_startPointIndex)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
            if (objc_msgSend(v9, "maneuver") == 4)
            {
              objc_msgSend(v9, "routeLineArtwork");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "count") == 0;

              if (!v11)
              {
                objc_storeWeak((id *)&self->_composedRouteStep, v9);

                goto LABEL_16;
              }
            }

          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_16:

}

- (unsigned)endPointIndex
{
  return self->_startPointIndex + self->_pointCount - 1;
}

- (BOOL)isTransfer
{
  return 0;
}

- (BOOL)_MapsCarPlay_isEqual:(id)a3
{
  GEOComposedRouteSection *v4;
  GEOComposedRouteSection *v5;
  uint64_t pointCount;
  GeoCodecsVectorTilePoint3D *points;
  GeoCodecsVectorTilePoint3D *v8;
  float *p_var2;
  float *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  float64x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  char v18;
  _OWORD v20[3];
  _OWORD v21[3];

  v4 = (GEOComposedRouteSection *)a3;
  v5 = v4;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_28;
  }
  if (!v4)
    goto LABEL_26;
  pointCount = self->_pointCount;
  if ((_DWORD)pointCount != v4->_pointCount)
    goto LABEL_26;
  points = self->_points;
  v8 = v4->_points;
  if ((points != 0) == (v8 == 0))
    goto LABEL_26;
  if ((_DWORD)pointCount && points)
  {
    p_var2 = &v8->var2;
    v10 = &points->var2;
    do
    {
      v11 = *(v10 - 2) == *(p_var2 - 2) && *(v10 - 1) == *(p_var2 - 1);
      if (!v11 || *v10 != *p_var2)
        goto LABEL_26;
      p_var2 += 3;
      v10 += 3;
    }
    while (--pointCount);
  }
  if (self->_startPointIndex != v4->_startPointIndex)
    goto LABEL_26;
  if (self->_transportType != v4->_transportType)
    goto LABEL_26;
  if (self->_composedRouteSegmentIndex != v4->_composedRouteSegmentIndex)
    goto LABEL_26;
  if (self->_finalStepIndex != v4->_finalStepIndex)
    goto LABEL_26;
  if (self->_startDistance != v4->_startDistance)
    goto LABEL_26;
  if (self->_lengthScaleFactor != v4->_lengthScaleFactor)
    goto LABEL_26;
  v13 = *(_OWORD *)&self->_bounds.origin.z;
  v21[0] = *(_OWORD *)&self->_bounds.origin.x;
  v21[1] = v13;
  v21[2] = *(_OWORD *)&self->_bounds.size.height;
  v14 = *(_OWORD *)&v4->_bounds.origin.z;
  v20[0] = *(_OWORD *)&v4->_bounds.origin.x;
  v20[1] = v14;
  v20[2] = *(_OWORD *)&v4->_bounds.size.height;
  if (!GEOMapBoxEqualToBox((double *)v21, (double *)v20)
    || (v15 = (float64x2_t)vdupq_n_s64(0x3E45798EE2308C3AuLL),
        v16 = vmovn_s64(vcgtq_f64(v15, vabdq_f64((float64x2_t)self->_overlayBounds.origin, (float64x2_t)v5->_overlayBounds.origin))), (v16.i32[0] & v16.i32[1] & 1) == 0))
  {
LABEL_26:
    v18 = 0;
    goto LABEL_28;
  }
  v17 = vmovn_s64(vcgtq_f64(v15, vabdq_f64((float64x2_t)self->_overlayBounds.size, (float64x2_t)v5->_overlayBounds.size)));
  v18 = v17.i8[0] & v17.i8[4];
LABEL_28:

  return v18 & 1;
}

- (id)description
{
  long double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = GEOCoordinateRegionForMapRect(self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("p:[%u:%u] (%f,%f)±(%f,%f)"), self->_startPointIndex, -[GEOComposedRouteSection endPointIndex](self, "endPointIndex"), *(_QWORD *)&v3, v4, v5, v6);
}

- (id)stringForPoints
{
  unint64_t v2;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  GeoCodecsVectorTilePoint3D *v9;
  void *v10;
  void *v11;

  LODWORD(v2) = self->_pointCount;
  v4 = log10((double)v2);
  v5 = log10((double)-[GEOComposedRouteSection endPointIndex](self, "endPointIndex"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_pointCount)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = &self->_points[v7];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %*u (%*u):   tile:(%f, %f) | world:(%.1f, %.1f)"), ((int)v4 + 1), v8, ((int)v5 + 1), v8 + self->_startPointIndex, v9->var0, v9->var1, self->_bounds.origin.x + v9->var0 * self->_bounds.size.width, self->_bounds.origin.y + (float)(1.0 - v9->var1) * self->_bounds.size.height);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);

      ++v8;
      ++v7;
    }
    while (v8 < self->_pointCount);
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)stringForCoordinates
{
  unint64_t v2;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  GeoCodecsVectorTilePoint3D *v9;
  double v10;
  long double v11;
  void *v12;
  void *v13;

  LODWORD(v2) = self->_pointCount;
  v4 = log10((double)v2);
  v5 = log10((double)-[GEOComposedRouteSection endPointIndex](self, "endPointIndex"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_pointCount)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = &self->_points[v7];
      v10 = self->_bounds.origin.x + v9->var0 * self->_bounds.size.width;
      v11 = exp(((self->_bounds.origin.y + (float)(1.0 - v9->var1) * self->_bounds.size.height) * 0.0078125 + -1048576.0)/ 333772.107);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %*u (%*u):   %f, %f"), ((int)v4 + 1), v8, ((int)v5 + 1), v8 + self->_startPointIndex, (atan(v11) * -2.0 + 1.57079633) * 57.2957795, v10 * 0.0078125 * 0.000171661377 + -180.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v12);

      ++v8;
      ++v7;
    }
    while (v8 < self->_pointCount);
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unsigned)startPointIndex
{
  return self->_startPointIndex;
}

- (unsigned)pointCount
{
  return self->_pointCount;
}

- (GeoCodecsVectorTilePoint3D)points
{
  return self->_points;
}

- (int)transportType
{
  return self->_transportType;
}

- (GEOComposedRouteSegment)composedRouteSegment
{
  return (GEOComposedRouteSegment *)objc_loadWeakRetained((id *)&self->_composedRouteSegment);
}

- (GEOComposedRouteStep)composedRouteStep
{
  return (GEOComposedRouteStep *)objc_loadWeakRetained((id *)&self->_composedRouteStep);
}

- (unint64_t)composedRouteSegmentIndex
{
  return self->_composedRouteSegmentIndex;
}

- ($3314123FD9D86BC79D52D2D985513A44)bounds
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var2;
  return self;
}

- (unint64_t)finalStepIndex
{
  return self->_finalStepIndex;
}

- (double)startDistance
{
  return self->_startDistance;
}

- (double)lengthScaleFactor
{
  return self->_lengthScaleFactor;
}

- (void)setLengthScaleFactor:(double)a3
{
  self->_lengthScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_composedRouteStep);
  objc_destroyWeak((id *)&self->_composedRouteSegment);
}

@end
