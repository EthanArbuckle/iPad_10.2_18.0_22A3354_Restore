@implementation MKMultiPolygon

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  MKMultiPolygon *v18;
  __CFString *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v19 = CFSTR("MultiPolygon object must be a dictionary");
LABEL_17:
      _errorWithReason(v19);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_18:
    v18 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _geoJSONGeometryType((uint64_t)v7);

  if (v8 != 6)
  {
    if (a4)
    {
      v19 = CFSTR("Input is not a MultiPolygon object");
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("coordinates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = -[MKPolygon _initWithGeoJSONCoordinateArrays:error:]([MKPolygon alloc], "_initWithGeoJSONCoordinateArrays:error:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), a4);
          if (!v16)
          {

            v18 = 0;
            goto LABEL_22;
          }
          v17 = v16;
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
          continue;
        break;
      }
    }

    self = -[MKMultiPolygon initWithPolygons:](self, "initWithPolygons:", v10);
    v18 = self;
LABEL_22:

    v9 = v21;
  }
  else if (a4)
  {
    _errorWithReason(CFSTR("MultiPolygon coordinates must be an array"));
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

LABEL_25:
  return v18;
}

- (MKMultiPolygon)initWithPolygons:(NSArray *)polygons
{
  NSArray *v4;
  MKMultiPolygon *v5;
  uint64_t v6;
  NSArray *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  MKMultiPolygon *v12;
  objc_super v14;

  v4 = polygons;
  v14.receiver = self;
  v14.super_class = (Class)MKMultiPolygon;
  v5 = -[MKMultiPolygon init](&v14, sel_init);
  if (v5)
  {
    v6 = -[NSArray copy](v4, "copy");
    v7 = v5->_polygons;
    v5->_polygons = (NSArray *)v6;

    -[MKMultiPolygon _boundingMapRectForPolygons:](v5, "_boundingMapRectForPolygons:", v4);
    v5->_boundingMapRect.origin.x = v8;
    v5->_boundingMapRect.origin.y = v9;
    v5->_boundingMapRect.size.width = v10;
    v5->_boundingMapRect.size.height = v11;
    v12 = v5;
  }

  return v5;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_boundingMapRectForPolygons:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double height;
  double y;
  double width;
  double x;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  MKMapRect v26;
  MKMapRect v27;
  $FD2884BA735A6398BD92EEF91FE53E55 result;
  MKMapRect v29;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    height = 0.0;
    y = INFINITY;
    width = 0.0;
    x = INFINITY;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "boundingMapRect");
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = MKMapRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  else
  {
    height = 0.0;
    y = INFINITY;
    width = 0.0;
    x = INFINITY;
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.var1.var1 = v19;
  result.var1.var0 = v18;
  result.var0.var1 = v17;
  result.var0.var0 = v16;
  return result;
}

- (MKMultiPolygon)init
{
  return -[MKMultiPolygon initWithPolygons:](self, "initWithPolygons:", MEMORY[0x1E0C9AA60]);
}

- (CLLocationCoordinate2D)coordinate
{
  MKMapPoint v7;
  double y;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v11;
  CLLocationCoordinate2D result;

  __asm { FMOV            V2.2D, #0.5 }
  v7 = (MKMapPoint)vaddq_f64((float64x2_t)self->_boundingMapRect.origin, vmulq_f64((float64x2_t)self->_boundingMapRect.size, _Q2));
  y = v7.y;
  v11 = MKCoordinateForMapPoint(v7);
  longitude = v11.longitude;
  latitude = v11.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMultiPolygon)initWithCoder:(id)a3
{
  id v4;
  MKMultiPolygon *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *polygons;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKMultiPolygon;
  v5 = -[MKShape initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MKMultiPolygonPolygons"));
    v9 = objc_claimAutoreleasedReturnValue();
    polygons = v5->_polygons;
    v5->_polygons = (NSArray *)v9;

    -[MKMultiPolygon _boundingMapRectForPolygons:](v5, "_boundingMapRectForPolygons:", v5->_polygons);
    v5->_boundingMapRect.origin.x = v11;
    v5->_boundingMapRect.origin.y = v12;
    v5->_boundingMapRect.size.width = v13;
    v5->_boundingMapRect.size.height = v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKMultiPolygon;
  v4 = a3;
  -[MKShape encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_polygons, CFSTR("MKMultiPolygonPolygons"), v5.receiver, v5.super_class);

}

- (NSArray)polygons
{
  return self->_polygons;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double x;
  double y;
  double width;
  double height;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  x = self->_boundingMapRect.origin.x;
  y = self->_boundingMapRect.origin.y;
  width = self->_boundingMapRect.size.width;
  height = self->_boundingMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygons, 0);
}

@end
