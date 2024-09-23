@implementation GEOMapRegionE7

- (GEOMapRegionE7)initWithMapRegion:(id)a3
{
  id v4;
  GEOMapRegionE7 *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  GEOLatLngE7 *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOMapRegionE7;
  v5 = -[GEOMapRegionE7 init](&v21, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hasSouthLat"))
    {
      objc_msgSend(v4, "southLat");
      -[GEOMapRegionE7 setSouthLatE7:](v5, "setSouthLatE7:", (int)(v6 * 10000000.0));
    }
    if (objc_msgSend(v4, "hasWestLng"))
    {
      objc_msgSend(v4, "westLng");
      -[GEOMapRegionE7 setWestLngE7:](v5, "setWestLngE7:", (int)(v7 * 10000000.0));
    }
    if (objc_msgSend(v4, "hasNorthLat"))
    {
      objc_msgSend(v4, "northLat");
      -[GEOMapRegionE7 setNorthLatE7:](v5, "setNorthLatE7:", (int)(v8 * 10000000.0));
    }
    if (objc_msgSend(v4, "hasEastLng"))
    {
      objc_msgSend(v4, "eastLng");
      -[GEOMapRegionE7 setEastLngE7:](v5, "setEastLngE7:", (int)(v9 * 10000000.0));
    }
    if (objc_msgSend(v4, "vertexsCount"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v4, "vertexs", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            v15 = -[GEOLatLngE7 initWithLatLng:]([GEOLatLngE7 alloc], "initWithLatLng:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
            -[GEOMapRegionE7 addVertexE7:](v5, "addVertexE7:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v12);
      }

    }
  }

  return v5;
}

- (GEOMapRegion)mapRegion
{
  GEOMapRegion *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(self, &mapRegion_ComputedNonE7RegionCacheKey);
  v3 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(GEOMapRegion);
    if (-[GEOMapRegionE7 hasSouthLatE7](self, "hasSouthLatE7"))
      -[GEOMapRegion setSouthLat:](v3, "setSouthLat:", (double)-[GEOMapRegionE7 southLatE7](self, "southLatE7") * 0.0000001);
    if (-[GEOMapRegionE7 hasWestLngE7](self, "hasWestLngE7"))
      -[GEOMapRegion setWestLng:](v3, "setWestLng:", (double)-[GEOMapRegionE7 westLngE7](self, "westLngE7") * 0.0000001);
    if (-[GEOMapRegionE7 hasNorthLatE7](self, "hasNorthLatE7"))
      -[GEOMapRegion setNorthLat:](v3, "setNorthLat:", (double)-[GEOMapRegionE7 northLatE7](self, "northLatE7") * 0.0000001);
    if (-[GEOMapRegionE7 hasEastLngE7](self, "hasEastLngE7"))
      -[GEOMapRegion setEastLng:](v3, "setEastLng:", (double)-[GEOMapRegionE7 eastLngE7](self, "eastLngE7") * 0.0000001);
    if (-[GEOMapRegionE7 vertexE7sCount](self, "vertexE7sCount"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      -[GEOMapRegionE7 vertexE7s](self, "vertexE7s", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "latLng");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOMapRegion addVertex:](v3, "addVertex:", v9);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
    objc_setAssociatedObject(self, &mapRegion_ComputedNonE7RegionCacheKey, v3, (void *)1);
  }
  return v3;
}

- (GEOMapRegionE7)initWithLatitude:(double)a3 longitude:(double)a4
{
  GEOMapRegionE7 *v6;
  GEOMapRegionE7 *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOMapRegionE7;
  v6 = -[GEOMapRegionE7 init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOMapRegionE7 setSouthLatE7:](v6, "setSouthLatE7:", (int)(a3 * 10000000.0));
    -[GEOMapRegionE7 setWestLngE7:](v7, "setWestLngE7:", (int)(a4 * 10000000.0));
    -[GEOMapRegionE7 setNorthLatE7:](v7, "setNorthLatE7:", (int)(a3 * 10000000.0));
    -[GEOMapRegionE7 setEastLngE7:](v7, "setEastLngE7:", (int)(a4 * 10000000.0));
  }
  return v7;
}

- (GEOMapRegionE7)initWithCoordinateRegion:(id)a3
{
  GEOMapRectForCoordinateRegion(a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  return -[GEOMapRegionE7 initWithMapRect:](self, "initWithMapRect:");
}

- (GEOMapRegionE7)initWithMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  GEOMapRegionE7 *v7;
  GEOMapRegionE7 *v8;
  objc_super v10;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapRegionE7;
  v7 = -[GEOMapRegionE7 init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[GEOMapRegionE7 setMapRect:](v7, "setMapRect:", v6, v5, var0, var1);
  return v8;
}

- (GEOMapRegionE7)initWithRadialPlace:(id)a3
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

  return -[GEOMapRegionE7 initWithMapRect:](self, "initWithMapRect:", (double)GEOMapRectMakeWithRadialDistance(v6, v8, v10));
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
    v28 = GEOCoordinate2DForMapPoint(a3.var0.var0, a3.var0.var1);
    v30 = v29;
    v31 = GEOCoordinate2DForMapPoint(v6, v4 + var1);
    v33 = v32;
    -[GEOMapRegionE7 setNorthLatE7:](self, "setNorthLatE7:", (int)(v28 * 10000000.0));
    -[GEOMapRegionE7 setWestLngE7:](self, "setWestLngE7:", (int)(v30 * 10000000.0));
    -[GEOMapRegionE7 setSouthLatE7:](self, "setSouthLatE7:", (int)(v31 * 10000000.0));
    -[GEOMapRegionE7 setEastLngE7:](self, "setEastLngE7:", (int)(v33 * 10000000.0));
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
      v8 = v11;
    v34 = v8;
    v14 = GEOMapRectIntersection(a3.var0.var0, v4, a3.var1.var0, var1, 0.0, 0.0, 268435456.0, 268435456.0);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[GEOMapRegionE7 setNorthLatE7:](self, "setNorthLatE7:", (int)(GEOCoordinate2DForMapPoint(v14, v15) * 10000000.0));
    -[GEOMapRegionE7 setSouthLatE7:](self, "setSouthLatE7:", (int)(GEOCoordinate2DForMapPoint(v14, v16 + v20) * 10000000.0));
    if (v14 < v12)
      v21 = v12;
    else
      v21 = v14;
    if (v14 < v12)
      v22 = v13;
    else
      v22 = v16;
    if (v14 < v12)
      v23 = v14;
    else
      v23 = v12;
    if (v14 < v12)
      v24 = v16;
    else
      v24 = v13;
    v25 = v34;
    if (v14 < v12)
      v25 = v18;
    GEOCoordinate2DForMapPoint(v23 + v25, v24);
    -[GEOMapRegionE7 setEastLngE7:](self, "setEastLngE7:", (int)(v26 * 10000000.0));
    GEOCoordinate2DForMapPoint(v21, v22);
    -[GEOMapRegionE7 setWestLngE7:](self, "setWestLngE7:", (int)(v27 * 10000000.0));
  }
}

- (int)centerLatE7
{
  int v3;
  uint64_t v4;

  v3 = -[GEOMapRegionE7 southLatE7](self, "southLatE7");
  v4 = -[GEOMapRegionE7 northLatE7](self, "northLatE7") + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- (int)centerLngE7
{
  int v3;
  uint64_t v4;

  v3 = -[GEOMapRegionE7 westLngE7](self, "westLngE7");
  v4 = -[GEOMapRegionE7 eastLngE7](self, "eastLngE7") + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- (int)spanLatE7
{
  int v3;
  int v4;

  v3 = -[GEOMapRegionE7 northLatE7](self, "northLatE7");
  v4 = v3 - -[GEOMapRegionE7 southLatE7](self, "southLatE7");
  if (v4 >= 0)
    return v4;
  else
    return -v4;
}

- (int)spanLngE7
{
  int v3;
  int v4;

  v3 = -[GEOMapRegionE7 eastLngE7](self, "eastLngE7");
  v4 = v3 - -[GEOMapRegionE7 westLngE7](self, "westLngE7");
  if (v4 >= 0)
    return v4;
  else
    return -v4;
}

- (BOOL)isValid
{
  return -[GEOMapRegionE7 hasRectangleVertices](self, "hasRectangleVertices")
      || -[GEOMapRegionE7 vertexE7sCount](self, "vertexE7sCount") != 0;
}

- (BOOL)hasRectangleVertices
{
  return -[GEOMapRegionE7 hasNorthLatE7](self, "hasNorthLatE7")
      && -[GEOMapRegionE7 hasSouthLatE7](self, "hasSouthLatE7")
      && -[GEOMapRegionE7 hasEastLngE7](self, "hasEastLngE7")
      && -[GEOMapRegionE7 hasWestLngE7](self, "hasWestLngE7");
}

- (id)coordinatesE7
{
  void *v3;
  GEOLatLngE7 *v4;
  GEOLatLngE7 *v5;
  GEOLatLngE7 *v6;
  GEOLatLngE7 *v7;

  if (-[GEOMapRegionE7 vertexE7sCount](self, "vertexE7sCount"))
  {
    -[GEOMapRegionE7 vertexE7s](self, "vertexE7s");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[GEOMapRegionE7 hasRectangleVertices](self, "hasRectangleVertices"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[GEOLatLngE7 initWithE7Latitude:longitude:]([GEOLatLngE7 alloc], "initWithE7Latitude:longitude:", -[GEOMapRegionE7 northLatE7](self, "northLatE7"), -[GEOMapRegionE7 eastLngE7](self, "eastLngE7"));
    objc_msgSend(v3, "addObject:", v4);

    v5 = -[GEOLatLngE7 initWithE7Latitude:longitude:]([GEOLatLngE7 alloc], "initWithE7Latitude:longitude:", -[GEOMapRegionE7 northLatE7](self, "northLatE7"), -[GEOMapRegionE7 westLngE7](self, "westLngE7"));
    objc_msgSend(v3, "addObject:", v5);

    v6 = -[GEOLatLngE7 initWithE7Latitude:longitude:]([GEOLatLngE7 alloc], "initWithE7Latitude:longitude:", -[GEOMapRegionE7 southLatE7](self, "southLatE7"), -[GEOMapRegionE7 westLngE7](self, "westLngE7"));
    objc_msgSend(v3, "addObject:", v6);

    v7 = -[GEOLatLngE7 initWithE7Latitude:longitude:]([GEOLatLngE7 alloc], "initWithE7Latitude:longitude:", -[GEOMapRegionE7 southLatE7](self, "southLatE7"), -[GEOMapRegionE7 eastLngE7](self, "eastLngE7"));
    objc_msgSend(v3, "addObject:", v7);

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
  GEOMapRegionE7 *v4;
  double var1;
  double v6;
  double v7;
  GEOMapRegionE7 *v8;

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
          v8 = [GEOMapRegionE7 alloc];
          GEOMapRectForCoordinateRegion(var0, var1, v6, v7);
          v4 = -[GEOMapRegionE7 initWithMapRect:](v8, "initWithMapRect:");
        }
      }
    }
  }
  return v4;
}

- (int)southLatE7
{
  return self->_southLatE7;
}

- (void)setSouthLatE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_southLatE7 = a3;
}

- (void)setHasSouthLatE7:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSouthLatE7
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)westLngE7
{
  return self->_westLngE7;
}

- (void)setWestLngE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_westLngE7 = a3;
}

- (void)setHasWestLngE7:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWestLngE7
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)northLatE7
{
  return self->_northLatE7;
}

- (void)setNorthLatE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_northLatE7 = a3;
}

- (void)setHasNorthLatE7:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNorthLatE7
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)eastLngE7
{
  return self->_eastLngE7;
}

- (void)setEastLngE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_eastLngE7 = a3;
}

- (void)setHasEastLngE7:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEastLngE7
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSMutableArray)vertexE7s
{
  return self->_vertexE7s;
}

- (void)setVertexE7s:(id)a3
{
  objc_storeStrong((id *)&self->_vertexE7s, a3);
}

- (void)clearVertexE7s
{
  -[NSMutableArray removeAllObjects](self->_vertexE7s, "removeAllObjects");
}

- (void)addVertexE7:(id)a3
{
  id v4;
  NSMutableArray *vertexE7s;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  vertexE7s = self->_vertexE7s;
  v8 = v4;
  if (!vertexE7s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_vertexE7s;
    self->_vertexE7s = v6;

    v4 = v8;
    vertexE7s = self->_vertexE7s;
  }
  -[NSMutableArray addObject:](vertexE7s, "addObject:", v4);

}

- (unint64_t)vertexE7sCount
{
  return -[NSMutableArray count](self->_vertexE7s, "count");
}

- (id)vertexE7AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_vertexE7s, "objectAtIndex:", a3);
}

+ (Class)vertexE7Type
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOMapRegionE7;
  -[GEOMapRegionE7 description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapRegionE7 dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapRegionE7 _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("southLatE7"));

    v5 = *(_BYTE *)(a1 + 40);
  }
  if ((v5 & 8) == 0)
  {
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 28));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("northLatE7"));

    if ((*(_BYTE *)(a1 + 40) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 36));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("westLngE7"));

  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 2) != 0)
    goto LABEL_26;
LABEL_6:
  if ((v5 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("eastLngE7"));

  }
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = *(id *)(a1 + 16);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("vertexE7"));
  }
  v16 = *(void **)(a1 + 8);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __44__GEOMapRegionE7__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v20 = v19;
      v26 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v25);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapRegionE7 _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOMapRegionE7__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapRegionE7)initWithDictionary:(id)a3
{
  return (GEOMapRegionE7 *)-[GEOMapRegionE7 _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOLatLngE7 *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("southLatE7"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSouthLatE7:", objc_msgSend(v6, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("westLngE7"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWestLngE7:", objc_msgSend(v7, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("northLatE7"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNorthLatE7:", objc_msgSend(v8, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eastLngE7"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEastLngE7:", objc_msgSend(v9, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vertexE7"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v21 = v10;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = [GEOLatLngE7 alloc];
                if ((a3 & 1) != 0)
                  v18 = -[GEOLatLngE7 initWithJSON:](v17, "initWithJSON:", v16);
                else
                  v18 = -[GEOLatLngE7 initWithDictionary:](v17, "initWithDictionary:", v16);
                v19 = (void *)v18;
                objc_msgSend(a1, "addVertexE7:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v13);
        }

        v10 = v21;
      }

    }
  }

  return a1;
}

- (GEOMapRegionE7)initWithJSON:(id)a3
{
  return (GEOMapRegionE7 *)-[GEOMapRegionE7 _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapRegionE7IsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapRegionE7ReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteSfixed32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSfixed32Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteSfixed32Field();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteSfixed32Field();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_vertexE7s;
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

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _DWORD *v9;

  v9 = a3;
  -[GEOMapRegionE7 readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v9[8] = self->_southLatE7;
    *((_BYTE *)v9 + 40) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_13:
      v9[7] = self->_northLatE7;
      *((_BYTE *)v9 + 40) |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v9[9] = self->_westLngE7;
  *((_BYTE *)v9 + 40) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    v9[6] = self->_eastLngE7;
    *((_BYTE *)v9 + 40) |= 1u;
  }
LABEL_6:
  if (-[GEOMapRegionE7 vertexE7sCount](self, "vertexE7sCount"))
  {
    objc_msgSend(v9, "clearVertexE7s");
    v5 = -[GEOMapRegionE7 vertexE7sCount](self, "vertexE7sCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOMapRegionE7 vertexE7AtIndex:](self, "vertexE7AtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addVertexE7:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
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
  v6 = (id *)v5;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_southLatE7;
    *(_BYTE *)(v5 + 40) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 36) = self->_westLngE7;
  *(_BYTE *)(v5 + 40) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  *(_DWORD *)(v5 + 28) = self->_northLatE7;
  *(_BYTE *)(v5 + 40) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_eastLngE7;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
LABEL_6:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_vertexE7s;
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
        objc_msgSend(v6, "addVertexE7:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *vertexE7s;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOMapRegionE7 readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_southLatE7 != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_westLngE7 != *((_DWORD *)v4 + 9))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_northLatE7 != *((_DWORD *)v4 + 7))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_eastLngE7 != *((_DWORD *)v4 + 6))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_24;
  }
  vertexE7s = self->_vertexE7s;
  if ((unint64_t)vertexE7s | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](vertexE7s, "isEqual:");
  else
    v6 = 1;
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOMapRegionE7 readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_southLatE7;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_westLngE7;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_vertexE7s, "hash");
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_northLatE7;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_eastLngE7;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_vertexE7s, "hash");
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
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_southLatE7 = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_westLngE7 = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_flags |= 8u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  self->_northLatE7 = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_5:
    self->_eastLngE7 = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
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
        -[GEOMapRegionE7 addVertexE7:](self, "addVertexE7:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
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
    -[GEOMapRegionE7 readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_vertexE7s;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexE7s, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
