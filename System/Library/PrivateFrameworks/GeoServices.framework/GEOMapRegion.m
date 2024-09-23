@implementation GEOMapRegion

- (void)addVertex:(id)a3
{
  id v4;
  NSMutableArray *vertexs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  vertexs = self->_vertexs;
  v8 = v4;
  if (!vertexs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_vertexs;
    self->_vertexs = v6;

    v4 = v8;
    vertexs = self->_vertexs;
  }
  -[NSMutableArray addObject:](vertexs, "addObject:", v4);

}

- (NSMutableArray)vertexs
{
  return self->_vertexs;
}

- (double)westLng
{
  return self->_westLng;
}

- (double)southLat
{
  return self->_southLat;
}

- (double)northLat
{
  return self->_northLat;
}

- (double)eastLng
{
  return self->_eastLng;
}

- (BOOL)isValid
{
  return -[GEOMapRegion hasRectangleVertices](self, "hasRectangleVertices")
      || -[GEOMapRegion vertexsCount](self, "vertexsCount") != 0;
}

- (BOOL)hasWestLng
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)hasRectangleVertices
{
  return -[GEOMapRegion hasNorthLat](self, "hasNorthLat")
      && -[GEOMapRegion hasSouthLat](self, "hasSouthLat")
      && -[GEOMapRegion hasEastLng](self, "hasEastLng")
      && -[GEOMapRegion hasWestLng](self, "hasWestLng");
}

- (BOOL)hasSouthLat
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)hasNorthLat
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hasEastLng
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unsigned int v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("southLat"));

    v5 = *(_BYTE *)(a1 + 60);
  }
  if ((v5 & 8) == 0)
  {
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("northLat"));

    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("westLng"));

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 2) != 0)
    goto LABEL_24;
LABEL_6:
  if ((v5 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("eastLng"));

  }
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("vertex"));
  }
  if ((*(_BYTE *)(a1 + 60) & 0x10) != 0)
  {
    v16 = *(_DWORD *)(a1 + 56) - 1;
    if (v16 >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 56));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C13BC0[v16];
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("mapRegionSourceType"));

  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __42__GEOMapRegion__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOMapRegion)initWithMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  GEOMapRegion *v7;
  GEOMapRegion *v8;
  objc_super v10;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapRegion;
  v7 = -[GEOMapRegion init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[GEOMapRegion setMapRect:](v7, "setMapRect:", v6, v5, var0, var1);
  return v8;
}

- (void)setEastLng:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_eastLng = a3;
}

- (void)setMapRect:(id)a3
{
  double var1;
  double v4;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  var1 = a3.var1.var1;
  v4 = a3.var0.var1;
  v6 = a3.var0.var0 + a3.var1.var0;
  if (a3.var0.var0 >= 0.0 && v6 <= 268435456.0)
  {
    v29 = GEOCoordinate2DForMapPoint(a3.var0.var0, a3.var0.var1);
    v31 = v30;
    v32 = GEOCoordinate2DForMapPoint(v6, v4 + var1);
    v34 = v33;
    -[GEOMapRegion setNorthLat:](self, "setNorthLat:", v29);
    -[GEOMapRegion setWestLng:](self, "setWestLng:", v31);
    -[GEOMapRegion setSouthLat:](self, "setSouthLat:", v32);
    -[GEOMapRegion setEastLng:](self, "setEastLng:", v34);
  }
  else
  {
    v8 = 0.0;
    v9 = INFINITY;
    if (v6 > 268435456.0)
      v10 = 0.0;
    else
      v10 = INFINITY;
    if (v6 > 268435456.0)
    {
      v9 = v4;
      v8 = v6 + -268435456.0;
    }
    v11 = fabs(a3.var0.var0);
    if (a3.var0.var0 < 0.0)
      v12 = a3.var0.var0 + 268435456.0;
    else
      v12 = v10;
    if (a3.var0.var0 < 0.0)
      v13 = v4;
    else
      v13 = v9;
    if (a3.var0.var0 < 0.0)
      v14 = v11;
    else
      v14 = v8;
    v15 = GEOMapRectIntersection(a3.var0.var0, v4, a3.var1.var0, var1, 0.0, 0.0, 268435456.0, 268435456.0);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[GEOMapRegion setNorthLat:](self, "setNorthLat:", (double)GEOCoordinate2DForMapPoint(v15, v16));
    -[GEOMapRegion setSouthLat:](self, "setSouthLat:", (double)GEOCoordinate2DForMapPoint(v15, v17 + v21));
    if (v15 < v12)
      v22 = v12;
    else
      v22 = v15;
    if (v15 < v12)
      v23 = v13;
    else
      v23 = v17;
    if (v15 < v12)
      v24 = v15;
    else
      v24 = v12;
    if (v15 < v12)
      v25 = v17;
    else
      v25 = v13;
    if (v15 < v12)
      v26 = v19;
    else
      v26 = v14;
    GEOCoordinate2DForMapPoint(v24 + v26, v25);
    -[GEOMapRegion setEastLng:](self, "setEastLng:", v27);
    GEOCoordinate2DForMapPoint(v22, v23);
    -[GEOMapRegion setWestLng:](self, "setWestLng:", v28);
  }
}

- (void)setWestLng:(double)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_westLng = a3;
}

- (void)setSouthLat:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_southLat = a3;
}

- (void)setNorthLat:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_northLat = a3;
}

- (BOOL)containsCoordinate:(id)a3
{
  double var1;
  double var0;
  Point *v5;
  char v6;
  Point *v8;
  const Point *v9;

  var1 = a3.var1;
  var0 = a3.var0;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v8, self);
  v5 = v8;
  v6 = geomapregion::Polygon::contains(v8, v9, var1, var0);
  if (v5)
  {
    v9 = v5;
    operator delete(v5);
  }
  return v6;
}

- (GEOMapRegion)initWithLatitude:(double)a3 longitude:(double)a4
{
  GEOMapRegion *v6;
  GEOMapRegion *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOMapRegion;
  v6 = -[GEOMapRegion init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOMapRegion setSouthLat:](v6, "setSouthLat:", a3);
    -[GEOMapRegion setWestLng:](v7, "setWestLng:", a4);
    -[GEOMapRegion setNorthLat:](v7, "setNorthLat:", a3);
    -[GEOMapRegion setEastLng:](v7, "setEastLng:", a4);
  }
  return v7;
}

- (GEOMapRegion)initWithCoordinateRegion:(id)a3
{
  GEOMapRectForCoordinateRegion(a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  return -[GEOMapRegion initWithMapRect:](self, "initWithMapRect:");
}

- (GEOMapRegion)initWithRadialPlace:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "radialDistance");
  v10 = v9;

  return -[GEOMapRegion initWithMapRect:](self, "initWithMapRect:", (double)GEOMapRectMakeWithRadialDistance(v6, v8, v10));
}

- (double)centerLat
{
  double v3;
  double v4;
  double v5;

  -[GEOMapRegion southLat](self, "southLat");
  v4 = v3;
  -[GEOMapRegion northLat](self, "northLat");
  return (v4 + v5) * 0.5;
}

- (double)centerLng
{
  double v3;
  double v4;
  double v5;

  -[GEOMapRegion westLng](self, "westLng");
  v4 = v3;
  -[GEOMapRegion eastLng](self, "eastLng");
  return (v4 + v5) * 0.5;
}

- (double)spanLat
{
  double v3;
  double v4;
  double v5;

  -[GEOMapRegion northLat](self, "northLat");
  v4 = v3;
  -[GEOMapRegion southLat](self, "southLat");
  return vabdd_f64(v4, v5);
}

- (double)spanLng
{
  double v3;
  double v4;
  double v5;

  -[GEOMapRegion eastLng](self, "eastLng");
  v4 = v3;
  -[GEOMapRegion westLng](self, "westLng");
  return vabdd_f64(v4, v5);
}

- (id)coordinates
{
  void *v3;
  GEOLatLng *v4;
  double v5;
  double v6;
  double v7;
  GEOLatLng *v8;
  GEOLatLng *v9;
  double v10;
  double v11;
  double v12;
  GEOLatLng *v13;
  GEOLatLng *v14;
  double v15;
  double v16;
  double v17;
  GEOLatLng *v18;
  GEOLatLng *v19;
  double v20;
  double v21;
  double v22;
  GEOLatLng *v23;

  if (-[GEOMapRegion vertexsCount](self, "vertexsCount"))
  {
    -[GEOMapRegion vertexs](self, "vertexs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[GEOMapRegion hasRectangleVertices](self, "hasRectangleVertices"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [GEOLatLng alloc];
    -[GEOMapRegion northLat](self, "northLat");
    v6 = v5;
    -[GEOMapRegion eastLng](self, "eastLng");
    v8 = -[GEOLatLng initWithLatitude:longitude:](v4, "initWithLatitude:longitude:", v6, v7);
    objc_msgSend(v3, "addObject:", v8);

    v9 = [GEOLatLng alloc];
    -[GEOMapRegion northLat](self, "northLat");
    v11 = v10;
    -[GEOMapRegion westLng](self, "westLng");
    v13 = -[GEOLatLng initWithLatitude:longitude:](v9, "initWithLatitude:longitude:", v11, v12);
    objc_msgSend(v3, "addObject:", v13);

    v14 = [GEOLatLng alloc];
    -[GEOMapRegion southLat](self, "southLat");
    v16 = v15;
    -[GEOMapRegion westLng](self, "westLng");
    v18 = -[GEOLatLng initWithLatitude:longitude:](v14, "initWithLatitude:longitude:", v16, v17);
    objc_msgSend(v3, "addObject:", v18);

    v19 = [GEOLatLng alloc];
    -[GEOMapRegion southLat](self, "southLat");
    v21 = v20;
    -[GEOMapRegion eastLng](self, "eastLng");
    v23 = -[GEOLatLng initWithLatitude:longitude:](v19, "initWithLatitude:longitude:", v21, v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)_geo_mapRegionForGEOCoordinateRegion:(id)a3
{
  double var0;
  GEOMapRegion *v4;
  double var1;
  double v6;
  double v7;
  GEOMapRegion *v8;

  var0 = a3.var0.var0;
  v4 = 0;
  if (a3.var0.var1 >= -180.0)
  {
    var1 = a3.var0.var1;
    if (a3.var0.var1 <= 180.0 && a3.var0.var0 >= -90.0 && a3.var0.var0 <= 90.0)
    {
      v6 = a3.var1.var0;
      v4 = 0;
      if (a3.var1.var0 >= 0.0 && a3.var1.var0 <= 180.0)
      {
        v7 = a3.var1.var1;
        if (a3.var1.var1 >= 0.0 && a3.var1.var1 <= 360.0)
        {
          v8 = [GEOMapRegion alloc];
          GEOMapRectForCoordinateRegion(var0, var1, v6, v7);
          v4 = -[GEOMapRegion initWithMapRect:](v8, "initWithMapRect:");
        }
      }
    }
  }
  return v4;
}

- (BOOL)containsRegion:(id)a3
{
  GEOMapRegion *v4;
  Point *v5;
  double *v6;
  char v7;
  double *v9;
  double *v10;
  Point *v11;
  Point *v12;

  v4 = (GEOMapRegion *)a3;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v11, self);
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v9, v4);
  v5 = v11;
  v6 = v9;
  v7 = geomapregion::Polygon::contains((geomapregion::Polygon *)v11, v12, v9, v10);
  if (v6)
  {
    v10 = v6;
    operator delete(v6);
    v5 = v11;
  }
  if (v5)
  {
    v12 = v5;
    operator delete(v5);
  }

  return v7;
}

- (BOOL)intersectsRegion:(id)a3
{
  GEOMapRegion *v4;
  Point *v5;
  double *v6;
  char v7;
  double *v9;
  double *v10;
  Point *v11;
  Point *v12;

  v4 = (GEOMapRegion *)a3;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v11, self);
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v9, v4);
  v5 = v11;
  v6 = v9;
  v7 = geomapregion::Polygon::intersects((geomapregion::Polygon *)v11, v12, v9, v10);
  if (v6)
  {
    v10 = v6;
    operator delete(v6);
    v5 = v11;
  }
  if (v5)
  {
    v12 = v5;
    operator delete(v5);
  }

  return v7;
}

- (BOOL)containsCoordinate:(id)a3 radius:(double)a4
{
  double var1;
  double var0;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double *v18;
  double *v19;
  double *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  double *v26;
  double *v27;
  double *v28;
  double *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  BOOL v38;
  __int128 v40;
  double v41;
  __int128 v42;
  void *v43;
  char *v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *__p;
  double *v51;
  double *v52;
  _BYTE v53[128];
  uint64_t v54;

  var1 = a3.var1;
  var0 = a3.var0;
  v54 = *MEMORY[0x1E0C80C00];
  -[GEOMapRegion coordinates](self, "coordinates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __p = 0;
  v51 = 0;
  v52 = 0;
  std::vector<gm::Matrix<double,2,1>>::reserve(&__p, objc_msgSend(v7, "count"));
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "coordinate");
        v14 = GEOTilePointForCoordinate(v12, v13, 20.0);
        v16 = v14;
        v17 = v15;
        v18 = v51;
        if (v51 >= v52)
        {
          v20 = (double *)__p;
          v21 = ((char *)v51 - (_BYTE *)__p) >> 4;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 60)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          v23 = (char *)v52 - (_BYTE *)__p;
          if (((char *)v52 - (_BYTE *)__p) >> 3 > v22)
            v22 = v23 >> 3;
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
            v24 = 0xFFFFFFFFFFFFFFFLL;
          else
            v24 = v22;
          if (v24)
          {
            v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v52, v24);
            v20 = (double *)__p;
            v18 = v51;
          }
          else
          {
            v25 = 0;
          }
          v26 = (double *)&v25[16 * v21];
          *v26 = v16;
          *((_QWORD *)v26 + 1) = v17;
          v27 = v26;
          if (v18 != v20)
          {
            do
            {
              *((_OWORD *)v27 - 1) = *((_OWORD *)v18 - 1);
              v27 -= 2;
              v18 -= 2;
            }
            while (v18 != v20);
            v20 = (double *)__p;
          }
          v19 = v26 + 2;
          __p = v27;
          v51 = v26 + 2;
          v52 = (double *)&v25[16 * v24];
          if (v20)
            operator delete(v20);
        }
        else
        {
          *v51 = v14;
          *((_QWORD *)v18 + 1) = v15;
          v19 = v18 + 2;
        }
        v51 = v19;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v9);
  }

  v43 = 0;
  v44 = 0;
  v45 = 0;
  v28 = (double *)__p;
  v29 = v51;
  v30 = (char *)v51 - (_BYTE *)__p;
  if (v51 != __p)
  {
    if (v30 < 0)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v45, v30 >> 4);
    v32 = 0;
    v43 = v31;
    v45 = &v31[16 * v33];
    v34 = v31;
    do
    {
      v35 = *(_OWORD *)v28;
      v28 += 2;
      *v34++ = v35;
      v32 += 16;
    }
    while (v28 != v29);
    v44 = &v31[v32];
  }
  *(_QWORD *)&v42 = GEOTilePointForCoordinate(var0, var1, 20.0);
  *((_QWORD *)&v42 + 1) = v36;
  if (a4 <= 0.0)
  {
    v37 = geo::containsPoint<double>((uint64_t *)&v43, (double *)&v42);
  }
  else
  {
    v40 = v42;
    v41 = a4 / (1.0 / GEOMapPointsPerMeterAtLatitude(var0));
    v37 = geo::Polygon2<double>::intersects((uint64_t *)&v43, (double *)&v40);
  }
  v38 = v37;
  if (v43)
  {
    v44 = (char *)v43;
    operator delete(v43);
  }
  if (__p)
  {
    v51 = (double *)__p;
    operator delete(__p);
  }

  return v38;
}

- (BOOL)containsMapRect:(id)a3
{
  double v3;
  double v4;
  char v6;
  double v8;
  double v10;
  double var1;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  double *v20;
  Point *v21;
  double *v22;
  void *v23;
  double *v25;
  double *v26;
  void *__p;
  double *v28;
  void *v29;
  Point *v30;
  double v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  $140BDABED96B4E653C9F0DB440664A5C v39;

  v39 = a3;
  v3 = fabs(a3.var0.var0);
  v4 = fabs(a3.var0.var1);
  if (v3 == INFINITY || v4 == INFINITY)
    return 0;
  v8 = a3.var0.var0 + a3.var1.var0;
  if (a3.var0.var0 < 0.0 || v8 > 268435456.0)
  {
    v10 = 0.0;
    var1 = INFINITY;
    v12 = v8 <= 268435456.0;
    v13 = v8 + -268435456.0;
    if (v12)
      v14 = INFINITY;
    else
      v14 = 0.0;
    if (v12)
      v13 = 0.0;
    else
      var1 = a3.var0.var1;
    if (!v12)
      v10 = a3.var1.var1;
    if (a3.var0.var0 >= 0.0)
    {
      v3 = v13;
    }
    else
    {
      v14 = a3.var0.var0 + 268435456.0;
      var1 = a3.var0.var1;
    }
    v35 = v14;
    v36 = var1;
    if (a3.var0.var0 < 0.0)
      v15 = a3.var1.var1;
    else
      v15 = v10;
    v37 = v3;
    v38 = v15;
    v31 = GEOMapRectIntersection(a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, 0.0, 0.0, 268435456.0, 268435456.0);
    v32 = v16;
    v33 = v17;
    v34 = v18;
    geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v29, self);
    geomapregion::Polygon::Polygon(&__p, &v35);
    v19 = (double *)__p;
    if (geomapregion::Polygon::contains((geomapregion::Polygon *)v29, v30, (double *)__p, v28))
    {
      geomapregion::Polygon::Polygon((void **)&v25, &v31);
      v20 = v25;
      v6 = geomapregion::Polygon::contains((geomapregion::Polygon *)v29, v30, v25, v26);
      if (v20)
      {
        v26 = v20;
        operator delete(v20);
      }
      v19 = (double *)__p;
      if (!__p)
      {
LABEL_36:
        v23 = v29;
        if (v29)
        {
          v30 = (Point *)v29;
          goto LABEL_38;
        }
        return v6;
      }
    }
    else
    {
      v6 = 0;
      if (!v19)
        goto LABEL_36;
    }
    v28 = v19;
    operator delete(v19);
    goto LABEL_36;
  }
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&v35, self);
  geomapregion::Polygon::Polygon((void **)&v31, &v39.var0.var0);
  v21 = *(Point **)&v35;
  v22 = *(double **)&v31;
  v6 = geomapregion::Polygon::contains(*(geomapregion::Polygon **)&v35, *(Point **)&v36, *(double **)&v31, v32);
  if (v22)
  {
    v32 = v22;
    operator delete(v22);
    v21 = *(Point **)&v35;
  }
  if (v21)
  {
    v36 = *(double *)&v21;
    v23 = v21;
LABEL_38:
    operator delete(v23);
  }
  return v6;
}

- (BOOL)intersectsMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  char v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double *v21;
  double *v22;
  double *v24;
  double *v25;
  double *v26;
  double *v27;
  double v28[4];
  double *v29;
  double v30;
  double v31;
  double v32;
  void *__p;
  Point *v34;
  $140BDABED96B4E653C9F0DB440664A5C v35;

  var1 = a3.var0.var1;
  var0 = a3.var0.var0;
  v35 = a3;
  v5 = fabs(a3.var0.var0);
  v6 = fabs(a3.var0.var1);
  if (v5 == INFINITY || v6 == INFINITY)
    return 0;
  v9 = a3.var1.var1;
  v10 = a3.var1.var0;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&__p, self);
  v11 = var0 + v10;
  if (var0 >= 0.0 && v11 <= 268435456.0)
  {
    geomapregion::Polygon::Polygon((void **)&v29, &v35.var0.var0);
    v21 = v29;
    v8 = geomapregion::Polygon::intersects((geomapregion::Polygon *)__p, v34, v29, *(double **)&v30);
    if (!v21)
      goto LABEL_33;
    v30 = *(double *)&v21;
    goto LABEL_32;
  }
  v13 = 0.0;
  v14 = INFINITY;
  v15 = v11 <= 268435456.0;
  v16 = v11 + -268435456.0;
  if (v15)
    v17 = INFINITY;
  else
    v17 = 0.0;
  if (v15)
    v16 = 0.0;
  else
    v14 = var1;
  if (!v15)
    v13 = v9;
  if (var0 < 0.0)
  {
    v17 = var0 + 268435456.0;
    v14 = var1;
    v16 = v5;
  }
  v29 = *(double **)&v17;
  v30 = v14;
  if (var0 < 0.0)
    v13 = v9;
  v31 = v16;
  v32 = v13;
  v28[0] = GEOMapRectIntersection(var0, var1, v10, v9, 0.0, 0.0, 268435456.0, 268435456.0);
  v28[1] = v18;
  v28[2] = v19;
  v28[3] = v20;
  geomapregion::Polygon::Polygon((void **)&v26, (double *)&v29);
  v21 = v26;
  if ((geomapregion::Polygon::intersects((geomapregion::Polygon *)__p, v34, v26, v27) & 1) == 0)
  {
    geomapregion::Polygon::Polygon((void **)&v24, v28);
    v22 = v24;
    v8 = geomapregion::Polygon::intersects((geomapregion::Polygon *)__p, v34, v24, v25);
    if (v22)
    {
      v25 = v22;
      operator delete(v22);
    }
    v21 = v26;
    if (!v26)
      goto LABEL_33;
    goto LABEL_31;
  }
  v8 = 1;
  if (v21)
  {
LABEL_31:
    v27 = v21;
LABEL_32:
    operator delete(v21);
  }
LABEL_33:
  if (__p)
  {
    v34 = (Point *)__p;
    operator delete(__p);
  }
  return v8;
}

- (id)intersectionsOnPolyline:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _OWORD *v16;
  _BYTE *v17;
  double *v18;
  double *v19;
  double *v20;
  unint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double *v34;
  char *v35;
  uint64_t v36;
  double *v37;
  GEOLatLng *v38;
  id v40;
  uint64_t v41;
  id obj;
  void *v43;
  uint64_t v44;
  id v45;
  double v46[4];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *__p;
  _BYTE *v52;
  _OWORD v53[2];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  geomapregion::Polygon::Polygon((geomapregion::Polygon *)&__p, self);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v40;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v4)
  {
    v5 = 0;
    i = *(_QWORD *)v48;
    v41 = *(_QWORD *)v48;
    do
    {
      v7 = 0;
      v8 = v5;
      v44 = v4;
      do
      {
        if (*(_QWORD *)v48 != i)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v7);
        if (v8)
        {
          objc_msgSend(v8, "coordinate");
          v11 = v10;
          v13 = v12;
          objc_msgSend(v9, "coordinate");
          v46[0] = v13;
          v46[1] = v11;
          v46[2] = v15;
          v46[3] = v14;
          v16 = __p;
          v17 = v52;
          if (v52 != __p && v52 - (_BYTE *)__p != 16)
          {
            v43 = v9;
            v18 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            do
            {
              v24 = v23 + 1;
              v25 = v16[v23 + 1];
              v53[0] = v16[v23];
              v53[1] = v25;
              v26 = geomapregion::Polygon::Line::segment_intersection((double *)v53, v46);
              v28 = v26;
              if ((*(_QWORD *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
              {
                v29 = v27;
                if ((unint64_t)v22 >= v21)
                {
                  v30 = ((char *)v22 - (char *)v20) >> 4;
                  v31 = v30 + 1;
                  if ((unint64_t)(v30 + 1) >> 60)
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  if ((uint64_t)(v21 - (_QWORD)v20) >> 3 > v31)
                    v31 = (uint64_t)(v21 - (_QWORD)v20) >> 3;
                  if (v21 - (unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
                    v32 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v32 = v31;
                  if (v32)
                    v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<google::protobuf::Descriptor const*,int>>>(v32);
                  else
                    v33 = 0;
                  v34 = (double *)(v32 + 16 * v30);
                  *v34 = v28;
                  *((_QWORD *)v34 + 1) = v29;
                  if (v22 == v20)
                  {
                    v18 = (double *)(v32 + 16 * v30);
                  }
                  else
                  {
                    v35 = (char *)(v32 + 16 * v30);
                    do
                    {
                      *((_OWORD *)v35 - 1) = *((_OWORD *)v22 - 1);
                      v35 -= 16;
                      v22 -= 2;
                    }
                    while (v22 != v20);
                    v20 = v18;
                    v18 = (double *)v35;
                  }
                  v21 = v32 + 16 * v33;
                  v19 = v34 + 2;
                  if (v20)
                    operator delete(v20);
                  v20 = v18;
                }
                else
                {
                  *v22 = v26;
                  *((_QWORD *)v22 + 1) = v27;
                  v19 = v22 + 2;
                }
                v16 = __p;
                v17 = v52;
                v22 = v19;
              }
              if (v17 == (_BYTE *)v16)
                v36 = 0;
              else
                v36 = ((v17 - (_BYTE *)v16) >> 4) - 1;
              v23 = v24;
            }
            while (v24 != v36);
            v37 = v18;
            for (i = v41; v37 != v19; v37 += 2)
            {
              v38 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v37[1], *v37);
              objc_msgSend(v45, "addObject:", v38);

            }
            v9 = v43;
            if (v18)
              operator delete(v18);
          }
          v4 = v44;
        }
        v5 = v9;

        ++v7;
        v8 = v5;
      }
      while (v7 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v4);

  }
  if (__p)
  {
    v52 = __p;
    operator delete(__p);
  }

  return v45;
}

- (void)setHasSouthLat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (void)setHasWestLng:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (void)setHasNorthLat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (void)setHasEastLng:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (void)setVertexs:(id)a3
{
  objc_storeStrong((id *)&self->_vertexs, a3);
}

- (void)clearVertexs
{
  -[NSMutableArray removeAllObjects](self->_vertexs, "removeAllObjects");
}

- (unint64_t)vertexsCount
{
  return -[NSMutableArray count](self->_vertexs, "count");
}

- (id)vertexAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_vertexs, "objectAtIndex:", a3);
}

+ (Class)vertexType
{
  return (Class)objc_opt_class();
}

- (int)mapRegionSourceType
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_mapRegionSourceType;
  else
    return 1;
}

- (void)setMapRegionSourceType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_mapRegionSourceType = a3;
}

- (void)setHasMapRegionSourceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasMapRegionSourceType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)mapRegionSourceTypeAsString:(int)a3
{
  if ((a3 - 1) < 0xD)
    return off_1E1C13BC0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapRegionSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BASEMAP_CURATED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REV_POLYGON_FIT")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REV_POLYGON_PADDED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REV_POINT_PADDED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEMINI_CURATED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEMINI_POLYGON_FIT")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEMINI_POINT_PADDED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACES_POINT_PADDED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_CALCULATED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPATCHER_CALCULATED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_CALCULATED")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_FALLBACK")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOMapRegion;
  -[GEOMapRegion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapRegion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOMapRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOMapRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOMapRegion)initWithDictionary:(id)a3
{
  return (GEOMapRegion *)-[GEOMapRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEOLatLng *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("southLat"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setSouthLat:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("westLng"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setWestLng:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("northLat"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        objc_msgSend(a1, "setNorthLat:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eastLng"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setEastLng:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vertex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v5;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = [GEOLatLng alloc];
                if ((a3 & 1) != 0)
                  v18 = -[GEOLatLng initWithJSON:](v17, "initWithJSON:", v16);
                else
                  v18 = -[GEOLatLng initWithDictionary:](v17, "initWithDictionary:", v16);
                v19 = (void *)v18;
                objc_msgSend(a1, "addVertex:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v13);
        }

        v5 = v24;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapRegionSourceType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v22 = 1;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("BASEMAP_CURATED")) & 1) != 0)
        {
          v22 = 2;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("REV_POLYGON_FIT")) & 1) != 0)
        {
          v22 = 12;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("REV_POLYGON_PADDED")) & 1) != 0)
        {
          v22 = 3;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("REV_POINT_PADDED")) & 1) != 0)
        {
          v22 = 4;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("GEMINI_CURATED")) & 1) != 0)
        {
          v22 = 5;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("GEMINI_POLYGON_FIT")) & 1) != 0)
        {
          v22 = 13;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("GEMINI_POINT_PADDED")) & 1) != 0)
        {
          v22 = 6;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("PLACES_POINT_PADDED")) & 1) != 0)
        {
          v22 = 7;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_CALCULATED")) & 1) != 0)
        {
          v22 = 10;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DISPATCHER_CALCULATED")) & 1) != 0)
        {
          v22 = 8;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("ROUTING_CALCULATED")) & 1) != 0)
        {
          v22 = 9;
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("ROUTING_FALLBACK")))
        {
          v22 = 11;
        }
        else
        {
          v22 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_57:

          goto LABEL_58;
        }
        v22 = objc_msgSend(v20, "intValue");
      }
      objc_msgSend(a1, "setMapRegionSourceType:", v22);
      goto LABEL_57;
    }
  }
LABEL_58:

  return a1;
}

- (GEOMapRegion)initWithJSON:(id)a3
{
  return (GEOMapRegion *)-[GEOMapRegion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapRegionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_vertexs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_vertexs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _QWORD *v9;

  v9 = a3;
  -[GEOMapRegion readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v9[4] = *(_QWORD *)&self->_southLat;
    *((_BYTE *)v9 + 60) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_15:
      v9[3] = *(_QWORD *)&self->_northLat;
      *((_BYTE *)v9 + 60) |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v9[6] = *(_QWORD *)&self->_westLng;
  *((_BYTE *)v9 + 60) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_15;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    v9[2] = *(_QWORD *)&self->_eastLng;
    *((_BYTE *)v9 + 60) |= 1u;
  }
LABEL_6:
  if (-[GEOMapRegion vertexsCount](self, "vertexsCount"))
  {
    objc_msgSend(v9, "clearVertexs");
    v5 = -[GEOMapRegion vertexsCount](self, "vertexsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOMapRegion vertexAtIndex:](self, "vertexAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addVertex:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v9 + 14) = self->_mapRegionSourceType;
    *((_BYTE *)v9 + 60) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(double *)(v5 + 32) = self->_southLat;
    *(_BYTE *)(v5 + 60) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_westLng;
  *(_BYTE *)(v5 + 60) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  *(double *)(v5 + 24) = self->_northLat;
  *(_BYTE *)(v5 + 60) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_eastLng;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
LABEL_6:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_vertexs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v6, "addVertex:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_mapRegionSourceType;
    *(_BYTE *)(v6 + 60) |= 0x10u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *vertexs;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOMapRegion readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 60);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_southLat != *((double *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_westLng != *((double *)v4 + 6))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_northLat != *((double *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_eastLng != *((double *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_29;
  }
  vertexs = self->_vertexs;
  if ((unint64_t)vertexs | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](vertexs, "isEqual:"))
    {
LABEL_29:
      v8 = 0;
      goto LABEL_30;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 60);
  }
  v8 = (v6 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapRegionSourceType != *((_DWORD *)v4 + 14))
      goto LABEL_29;
    v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double southLat;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double westLng;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double northLat;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double eastLng;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;

  -[GEOMapRegion readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    southLat = self->_southLat;
    v6 = -southLat;
    if (southLat >= 0.0)
      v6 = self->_southLat;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 8) != 0)
  {
    westLng = self->_westLng;
    v11 = -westLng;
    if (westLng >= 0.0)
      v11 = self->_westLng;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 2) != 0)
  {
    northLat = self->_northLat;
    v16 = -northLat;
    if (northLat >= 0.0)
      v16 = self->_northLat;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 1) != 0)
  {
    eastLng = self->_eastLng;
    v21 = -eastLng;
    if (eastLng >= 0.0)
      v21 = self->_eastLng;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v24 = -[NSMutableArray hash](self->_vertexs, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v25 = 2654435761 * self->_mapRegionSourceType;
  else
    v25 = 0;
  return v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_southLat = *((double *)v4 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_westLng = *((double *)v4 + 6);
  *(_BYTE *)&self->_flags |= 8u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  self->_northLat = *((double *)v4 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_5:
    self->_eastLng = *((double *)v4 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[GEOMapRegion addVertex:](self, "addVertex:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    self->_mapRegionSourceType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_flags |= 0x10u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOMapRegion readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_vertexs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

@end
