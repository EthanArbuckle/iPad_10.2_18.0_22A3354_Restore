@implementation MKPolygon

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MKPolygon *v10;
  __CFString *v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v11 = CFSTR("Polygon object must be a dictionary");
LABEL_8:
      _errorWithReason(v11);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _geoJSONGeometryType((uint64_t)v7);

  if (v8 != 5)
  {
    if (a4)
    {
      v11 = CFSTR("Input is not a Polygon GeoJSON object");
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("coordinates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self = (MKPolygon *)-[MKPolygon _initWithGeoJSONCoordinateArrays:error:](self, "_initWithGeoJSONCoordinateArrays:error:", v9, a4);

  v10 = self;
LABEL_10:

  return v10;
}

- (id)_initWithGeoJSONCoordinateArrays:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  MKPolygon *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  id v13;
  char *VerticesFromGeoJSON;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v6, "count") < 2)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count") - 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((unint64_t)objc_msgSend(v6, "count") < 2)
      {
LABEL_16:
        objc_msgSend(v6, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        VerticesFromGeoJSON = _createVerticesFromGeoJSON(v11, a4);
        if (VerticesFromGeoJSON)
        {
          self = (MKPolygon *)-[MKPolygon _initWithPointsNoCopy:count:interiorPolygons:](self, "_initWithPointsNoCopy:count:interiorPolygons:", VerticesFromGeoJSON, objc_msgSend(v11, "count"), v7);
          v9 = self;
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {
        v10 = 1;
        while (1)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = _createVerticesFromGeoJSON(v11, a4);
          if (!v12)
            break;
          v13 = -[MKPolygon _initWithPointsNoCopy:count:interiorPolygons:]([MKPolygon alloc], "_initWithPointsNoCopy:count:interiorPolygons:", v12, objc_msgSend(v11, "count"), 0);
          objc_msgSend(v7, "addObject:", v13);

          if (++v10 >= (unint64_t)objc_msgSend(v6, "count"))
            goto LABEL_16;
        }
      }
      v9 = 0;
      goto LABEL_19;
    }
    if (a4)
    {
      v8 = CFSTR("Polygon geometry coordinates MUST be an array");
      goto LABEL_9;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_20;
  }
  if (!a4)
    goto LABEL_10;
  v8 = CFSTR("Polygon geometry is missing value for 'coordinates'");
LABEL_9:
  _errorWithReason(v8);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v9;
}

+ (MKPolygon)polygonWithPoints:(const MKMapPoint *)points count:(NSUInteger)count
{
  return (MKPolygon *)objc_msgSend((id)objc_opt_class(), "polygonWithPoints:count:interiorPolygons:", points, count, 0);
}

+ (MKPolygon)polygonWithPoints:(const MKMapPoint *)points count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons
{
  NSArray *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v7 = interiorPolygons;
  v8 = objc_alloc_init((Class)objc_opt_class());
  if (v7)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v7);
    v10 = (void *)v8[16];
    v8[16] = v9;

  }
  objc_msgSend(v8, "_setPoints:count:", points, count);

  return (MKPolygon *)v8;
}

+ (MKPolygon)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count
{
  return (MKPolygon *)objc_msgSend((id)objc_opt_class(), "polygonWithCoordinates:count:interiorPolygons:", coords, count, 0);
}

+ (MKPolygon)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons
{
  NSArray *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v7 = interiorPolygons;
  v8 = objc_alloc_init((Class)objc_opt_class());
  if (v7)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v7);
    v10 = (void *)v8[16];
    v8[16] = v9;

  }
  objc_msgSend(v8, "_setCoordinates:count:", coords, count);

  return (MKPolygon *)v8;
}

- (id)_initWithPointsNoCopy:(id *)a3 count:(unint64_t)a4 interiorPolygons:(id)a5
{
  id v8;
  MKPolygon *v9;
  uint64_t v10;
  NSArray *interiorPolygons;
  MKPolygon *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MKPolygon;
  v9 = -[MKPolygon init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    interiorPolygons = v9->_interiorPolygons;
    v9->_interiorPolygons = (NSArray *)v10;

    -[MKMultiPoint _assignPoints:count:](v9, "_assignPoints:count:", a3, a4);
    v12 = v9;
  }

  return v9;
}

+ (id)polygonEnclosingMapPoints:(id *)a3 count:(unint64_t)a4
{
  __CFArray *Mutable;
  unint64_t v8;
  double *ValueAtIndex;
  CFIndex v10;
  double *v11;
  __CFArray *v12;
  double *v13;
  double *v14;
  CFIndex v15;
  double *v16;
  double *v17;
  double v18;
  double v19;
  BOOL v20;
  BOOL v21;
  CFIndex Count;
  void *v23;
  void *v24;
  CFIndex v25;
  _OWORD *v26;
  void *v27;

  Mutable = CFArrayCreateMutable(0, a4, 0);
  if (a4)
  {
    v8 = a4;
    do
    {
      CFArrayAppendValue(Mutable, a3++);
      --v8;
    }
    while (v8);
  }
  ValueAtIndex = (double *)CFArrayGetValueAtIndex(Mutable, 0);
  if (CFArrayGetCount(Mutable) >= 1)
  {
    v10 = 0;
    do
    {
      v11 = (double *)CFArrayGetValueAtIndex(Mutable, v10);
      if (*v11 < *ValueAtIndex)
        ValueAtIndex = v11;
      ++v10;
    }
    while (v10 < CFArrayGetCount(Mutable));
  }
  v12 = CFArrayCreateMutable(0, 2, 0);
  v13 = ValueAtIndex;
  do
  {
    CFArrayAppendValue(v12, v13);
    if (!CFArrayGetCount(Mutable))
      break;
    v14 = (double *)CFArrayGetValueAtIndex(Mutable, 0);
    if (CFArrayGetCount(Mutable) < 1)
    {
      v17 = v14;
    }
    else
    {
      v15 = 0;
      do
      {
        v16 = (double *)CFArrayGetValueAtIndex(Mutable, v15);
        v17 = v16;
        v18 = v13[1];
        v19 = v14[1];
        v20 = *v13 == *v14 && v18 == v19;
        if (!v20 && (*v14 - *v13) * (v16[1] - v18) - (*v16 - *v13) * (v19 - v18) <= 0.0)
          v17 = v14;
        ++v15;
        v14 = v17;
      }
      while (v15 < CFArrayGetCount(Mutable));
    }
    if (CFArrayGetCount(v12) < 0 || CFArrayGetCount(v12) >= a4)
      break;
    v21 = *v17 == *ValueAtIndex && v17[1] == ValueAtIndex[1];
    v13 = v17;
  }
  while (!v21);
  Count = CFArrayGetCount(v12);
  v23 = malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  v24 = v23;
  if (Count >= 1)
  {
    v25 = 0;
    v26 = v23;
    do
      *v26++ = *(_OWORD *)CFArrayGetValueAtIndex(v12, v25++);
    while (Count != v25);
  }
  CFRelease(Mutable);
  CFRelease(v12);
  objc_msgSend(a1, "polygonWithPoints:count:", v24, Count);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "set_isDefinitelyConvex:", 1);
  free(v24);
  return v27;
}

+ (id)_polygonWithMapRect:(id)a3
{
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v4[0] = *(_QWORD *)&a3.var0.var0;
  v4[1] = *(_QWORD *)&a3.var0.var1;
  *(double *)&v4[2] = a3.var0.var0 + a3.var1.var0;
  v4[3] = *(_QWORD *)&a3.var0.var1;
  *(double *)&v4[4] = a3.var0.var0 + a3.var1.var0;
  *(double *)&v4[5] = a3.var0.var1 + a3.var1.var1;
  v4[6] = *(_QWORD *)&a3.var0.var0;
  *(double *)&v4[7] = a3.var0.var1 + a3.var1.var1;
  objc_msgSend((id)objc_opt_class(), "polygonWithPoints:count:", v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  objc_super v4;
  CLLocationCoordinate2D result;

  v4.receiver = self;
  v4.super_class = (Class)MKPolygon;
  -[MKMultiPoint coordinate](&v4, sel_coordinate);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  MKPolygon *v13;
  MKPolygon *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  MKMapPoint v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v37 = *MEMORY[0x1E0C80C00];
  if (!-[MKPolygon _isDefinitelyConvex](self, "_isDefinitelyConvex")
    || -[MKMultiPoint pointCount](self, "pointCount") <= 2)
  {
    v27.receiver = self;
    v27.super_class = (Class)MKPolygon;
    if (!-[MKMultiPoint intersectsMapRect:](&v27, sel_intersectsMapRect_, v6, v5, var0, var1))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = self->_interiorPolygons;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v8);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "intersectsMapRect:", v6, v5, var0, var1) & 1) != 0)
            {

              goto LABEL_25;
            }
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
          if (v9)
            continue;
          break;
        }
      }

      LOBYTE(v12) = 0;
      return v12;
    }
LABEL_25:
    LOBYTE(v12) = 1;
    return v12;
  }
  v29.x = v6;
  v29.y = v5;
  v30 = v6 + var0;
  v31 = v5;
  v32 = v6 + var0;
  v33 = v5 + var1;
  v34 = v6;
  v35 = v5 + var1;
  v13 = objc_retainAutorelease(self);
  if (!MKSeparatingAxisExistsBetweenPolygonsWithPoints(-[MKMultiPoint points](v13, "points"), -[MKMultiPoint pointCount](v13, "pointCount"), &v29, 4))
  {
    v14 = objc_retainAutorelease(v13);
    if (!MKSeparatingAxisExistsBetweenPolygonsWithPoints(&v29, 4uLL, -[MKMultiPoint points](v14, "points"), -[MKMultiPoint pointCount](v14, "pointCount")))goto LABEL_25;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = v13->_interiorPolygons;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v12)
  {
    v16 = *(_QWORD *)v20;
    while (2)
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v15);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "intersectsMapRect:", v6, v5, var0, var1, (_QWORD)v19) & 1) != 0)
        {
          LOBYTE(v12) = 1;
          goto LABEL_27;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_27:

  return v12;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  v6.receiver = self;
  v6.super_class = (Class)MKPolygon;
  -[MKMultiPoint boundingMapRect](&v6, sel_boundingMapRect);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolygon)initWithCoder:(id)a3
{
  id v4;
  MKPolygon *v5;
  void *v6;
  void *v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *interiorPolygons;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKPolygon;
  v5 = -[MKMultiPoint initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolygonCentroidLatitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPolygonCentroidLongitude"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
    objc_msgSend(v7, "doubleValue");
    v5->_centroid = CLLocationCoordinate2DMake(v9, v10);
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MKPolygonInteriorPolygons"));
    v14 = objc_claimAutoreleasedReturnValue();
    interiorPolygons = v5->_interiorPolygons;
    v5->_interiorPolygons = (NSArray *)v14;

    v5->_isDefinitelyConvex = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MKPolygonIsDefinitelyConvex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKPolygon;
  -[MKMultiPoint encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centroid.latitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKPolygonCentroidLatitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centroid.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKPolygonCentroidLongitude"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_interiorPolygons, CFSTR("MKPolygonInteriorPolygons"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isDefinitelyConvex, CFSTR("MKPolygonIsDefinitelyConvex"));

}

- (void)_calculateBounds
{
  MKPolygon *v2;
  double x;
  double v4;
  double y;
  double v6;
  double width;
  double v8;
  double height;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  MKMapRect v24;
  MKMapRect v25;
  MKMapRect v26;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(self);
  x = MKMapRectBoundingMapPoints((uint64_t)-[MKMultiPoint points](v2, "points"), -[MKMultiPoint pointCount](v2, "pointCount"));
  y = v4;
  width = v6;
  height = v8;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v2->_interiorPolygons;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "boundingMapRect", (_QWORD)v18);
        v26.origin.x = v14;
        v26.origin.y = v15;
        v26.size.width = v16;
        v26.size.height = v17;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = MKMapRectUnion(v24, v26);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[MKMultiPoint _setBounds:](v2, "_setBounds:", x, y, width, height);
}

- (BOOL)_isSimple
{
  GEOOnce();
  return self->_simple;
}

uint64_t __22__MKPolygon__isSimple__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_determineSimple");
}

- (void)_determineSimple
{
  MKPolygon *v2;
  void *v3;
  uint64_t v4;
  double *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v2 = self;
  -[MKPolygon interiorPolygons](self, "interiorPolygons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    goto LABEL_6;
  v2 = objc_retainAutorelease(v2);
  v5 = -[MKMultiPoint points](v2, "points");
  v6 = -[MKMultiPoint pointCount](v2, "pointCount");
  v7 = v6 - 2;
  if (v6 <= 2)
    goto LABEL_6;
  v9 = v5[2];
  v8 = v5[3];
  v10 = v8 - v5[1];
  v11 = v9 - *v5;
  v12 = 1.0 / sqrt(v11 * v11 + 0.0 + v10 * v10);
  v13 = v10 * v12;
  v14 = v11 * v12;
  v15 = v5 + 5;
  while (1)
  {
    v16 = v14;
    v17 = v13;
    v18 = v9;
    v19 = v8;
    v9 = *(v15 - 1);
    v8 = *v15;
    v20 = v9 - v18;
    v21 = *v15 - v19;
    v22 = 1.0 / sqrt(v20 * v20 + 0.0 + v21 * v21);
    v14 = v20 * v22;
    v13 = v21 * v22;
    if (fabs(v14 * v16 + 0.0 + v21 * v22 * v17 + -1.0) >= 2.22044605e-16)
      break;
    v15 += 2;
    if (!--v7)
      goto LABEL_6;
  }
  if (-[MKMultiPoint _isSelfIntersecting](v2, "_isSelfIntersecting"))
LABEL_6:
    v2->_simple = 0;
  else
    v2->_simple = 1;
}

- (BOOL)_determineSelfIntersecting
{
  MKPolygon *v2;
  uint64_t v3;
  unint64_t v4;
  char isSelf;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  void *v18;
  void *v19;
  char *v20;
  void *__p;
  char *v22;
  char *v23;

  v2 = objc_retainAutorelease(self);
  v3 = -[MKMultiPoint points](v2, "points");
  v4 = -[MKMultiPoint pointCount](v2, "pointCount");
  if (v4 < 3)
    return 0;
  v6 = v4;
  __p = 0;
  v22 = 0;
  v23 = 0;
  std::vector<gm::Matrix<double,2,1>>::reserve(&__p, v4);
  v7 = 0;
  v8 = v22;
  do
  {
    if (v8 >= v23)
    {
      v9 = (char *)__p;
      v10 = (v8 - (_BYTE *)__p) >> 4;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60)
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      v12 = v23 - (_BYTE *)__p;
      if ((v23 - (_BYTE *)__p) >> 3 > v11)
        v11 = v12 >> 3;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
        v13 = 0xFFFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
      {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>((uint64_t)&v23, v13);
        v9 = (char *)__p;
        v8 = v22;
      }
      else
      {
        v14 = 0;
      }
      v15 = &v14[16 * v10];
      *(_OWORD *)v15 = *(_OWORD *)(v3 + 16 * v7);
      v16 = v15 + 16;
      if (v8 != v9)
      {
        do
        {
          *((_OWORD *)v15 - 1) = *((_OWORD *)v8 - 1);
          v15 -= 16;
          v8 -= 16;
        }
        while (v8 != v9);
        v9 = (char *)__p;
      }
      __p = v15;
      v22 = v16;
      v23 = &v14[16 * v13];
      if (v9)
        operator delete(v9);
      v8 = v16;
    }
    else
    {
      *(_OWORD *)v8 = *(_OWORD *)(v3 + 16 * v7);
      v8 += 16;
    }
    v22 = v8;
    ++v7;
  }
  while (v7 != v6);
  v18 = __p;
  v19 = v8;
  v20 = v23;
  __p = 0;
  v22 = 0;
  v23 = 0;
  isSelf = geo::Intersect::isSelfIntersecting<double>(&v18, 1);
  if (v18)
  {
    v19 = v18;
    operator delete(v18);
  }
  if (__p)
  {
    v22 = (char *)__p;
    operator delete(__p);
  }
  return isSelf;
}

- (NSArray)interiorPolygons
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)_isDefinitelyConvex
{
  return self->_isDefinitelyConvex;
}

- (void)set_isDefinitelyConvex:(BOOL)a3
{
  self->_isDefinitelyConvex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interiorPolygons, 0);
}

@end
