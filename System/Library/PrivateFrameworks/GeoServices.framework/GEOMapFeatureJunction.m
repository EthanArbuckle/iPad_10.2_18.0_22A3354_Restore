@implementation GEOMapFeatureJunction

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  long double latitude;
  double longitude;
  GeoCodecsTileKey *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  long double v15;
  char v16;
  _BYTE v17[15];
  uint64_t v18;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v18 = *MEMORY[0x1E0C80C00];
  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  if (fabs(longitude + 180.0) < 0.00000001 && fabs(latitude + 180.0) < 0.00000001)
  {
    v5 = -[GEOVectorTile tileKey](self->_tile, "tileKey");
    v6 = *(_QWORD *)v5;
    v7 = *(_QWORD *)v5 << 32;
    v8 = BYTE4(*(_QWORD *)v5) | ((((*(_QWORD *)v5 >> 40) | (*((unsigned __int16 *)v5 + 4) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned __int16 *)v5 + 4) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((_BYTE *)v5 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((_BYTE *)v5 + 10) >> 4) << 52);
    *(_QWORD *)v17 = v7 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v5 >> 8) & 0x3F) << 40);
    v16 = v6;
    *((_QWORD *)&v9 + 1) = v8;
    *(_QWORD *)&v9 = v7;
    *(_QWORD *)&v17[7] = v9 >> 56;
    v10 = GEOMapRectForGEOTileKey((uint64_t)&v16);
    v12 = v10 + self->_tilePoint.x * v11;
    v15 = exp(((v13 + (float)(1.0 - self->_tilePoint.y) * v14) * 0.0078125 + -1048576.0) / 333772.107);
    latitude = (atan(v15) * -2.0 + 1.57079633) * 57.2957795;
    longitude = v12 * 0.0078125 * 0.000171661377 + -180.0;
    self->_coordinate.latitude = latitude;
    self->_coordinate.longitude = longitude;
  }
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (GEOVectorTile)tile
{
  return self->_tile;
}

- ($94F468A8D4C62B317260615823C2B210)tilePoint
{
  float x;
  float y;
  $94F468A8D4C62B317260615823C2B210 result;

  x = self->_tilePoint.x;
  y = self->_tilePoint.y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (unint64_t)junctionIndex
{
  GeoCodecsConnectivityJunction *connectivityJunction;

  connectivityJunction = self->_connectivityJunction;
  if (connectivityJunction)
    return (int64_t)((uint64_t)connectivityJunction
                          - (unint64_t)-[GEOVectorTile junctions](self->_tile, "junctions")) >> 5;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (GeoCodecsConnectivityJunction)connectivityJunction
{
  return self->_connectivityJunction;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *($AB5116BA7E623E054F959CECB034F4E7 *)(v4 + 8) = self->_coordinate;
  *(_BYTE *)(v4 + 24) = self->_isOnTileBorder;
  *($38C3DEC81229B66F67FB6D350D75FF5A *)(v4 + 28) = self->_tilePoint;
  objc_storeStrong((id *)(v4 + 40), self->_tile);
  *(_QWORD *)(v4 + 48) = self->_connectivityJunction;
  return (id)v4;
}

- (id)description
{
  void *v3;
  GEOVectorTile *tile;
  GeoCodecsConnectivityJunction *connectivityJunction;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  GEOMapFeatureJunction *v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tile = self->_tile;
  connectivityJunction = self->_connectivityJunction;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __36__GEOMapFeatureJunction_description__block_invoke;
  v26 = &unk_1E1C13870;
  v27 = self;
  v6 = v3;
  v28 = v6;
  -[GEOVectorTile forEachEdgeOnJunction:visitor:](tile, "forEachEdgeOnJunction:visitor:", connectivityJunction, &v23);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[GEOMapFeatureJunction coordinate](self, "coordinate");
  v10 = v9;
  -[GEOMapFeatureJunction coordinate](self, "coordinate");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%f, %f"), v10, v11, v23, v24, v25, v26, v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Junction: %d"), -[GEOMapFeatureJunction junctionIndex](self, "junctionIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Roads: [%@]"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v16);

  v17 = -[GEOMapFeatureJunction primaryID](self, "primaryID");
  v18 = -[GEOMapFeatureJunction secondaryID](self, "secondaryID");
  if (v17 | v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PrimaryID: %llu, SecondaryID: %llu"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v19);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("onTileBorder: %d"), self->_isOnTileBorder);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v20);

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" | "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __36__GEOMapFeatureJunction_description__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "road");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (BOOL)isOnTileBorder
{
  return self->_isOnTileBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
}

- (unint64_t)primaryID
{
  GeoCodecsConnectivityJunction *connectivityJunction;

  connectivityJunction = self->_connectivityJunction;
  if (connectivityJunction)
    return connectivityJunction->var3;
  else
    return 0;
}

- (unint64_t)secondaryID
{
  GeoCodecsConnectivityJunction *connectivityJunction;

  connectivityJunction = self->_connectivityJunction;
  if (connectivityJunction)
    return connectivityJunction->var4;
  else
    return 0;
}

+ (id)junctionForRoadFeature:(id)a3 startJunction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  GEOMapFeatureJunction *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  $38C3DEC81229B66F67FB6D350D75FF5A v17;
  $38C3DEC81229B66F67FB6D350D75FF5A v19;
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0;
  v7 = objc_msgSend(a1, "connectivityJunctionForRoadFeature:startJunction:outError:", v6, v4, &v20);
  v8 = v20;
  if (v8)
  {
    GEOGetGEOMapFeatureAccessLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)*MEMORY[0x1E0C9AFA8];
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    v13 = 0;
  }
  else
  {
    objc_msgSend(v6, "feature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "containingTile");
    v9 = objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v15 = GEOMultiSectionFeaturePoints(v6, 0, buf);
    v16 = *(_QWORD *)buf - 1;
    if (v4)
      v16 = 0;
    v19 = ($38C3DEC81229B66F67FB6D350D75FF5A)v15[v16];
    v17 = v19;
    v13 = objc_alloc_init(GEOMapFeatureJunction);
    v13->_connectivityJunction = (GeoCodecsConnectivityJunction *)v7;
    objc_storeStrong((id *)&v13->_tile, v9);
    v13->_tilePoint = v17;
    v13->_isOnTileBorder = objc_msgSend(a1, "isPointOnTileBorder:", &v19);
    v13->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
  }

  return v13;
}

+ (GeoCodecsConnectivityJunction)connectivityJunctionForRoadFeature:(id)a3 startJunction:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t IndexforMultiSectionFeature;
  GeoCodecsConnectivityJunction *v22;
  unsigned int *v23;
  unint64_t v24;
  void *v25;
  uint64_t v27;

  v6 = a4;
  v7 = a3;
  v27 = 0;
  v8 = GEOMultiSectionFeaturePoints(v7, 0, &v27);
  if (v8 && v27)
  {
    objc_msgSend(v7, "feature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containingTile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "roadPointCount"))
    {
      v11 = objc_msgSend(v7, "roadPointIndex");
      v12 = v6 ? 0 : objc_msgSend(v7, "roadPointCount") - 1;
      v23 = *(unsigned int **)(objc_msgSend(v10, "sortedPointsOnRoad") + 8 * (v12 + v11));
      if (v23)
      {
        v24 = v23[3];
        if (v6)
        {
          if (!(_DWORD)v24)
            goto LABEL_21;
        }
        else if (v27 - 1 <= v24)
        {
LABEL_21:
          v22 = (GeoCodecsConnectivityJunction *)(objc_msgSend(v10, "junctions") + 32 * *v23);
          goto LABEL_18;
        }
      }
    }
LABEL_17:
    v22 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (a5)
  {
    objc_msgSend(v7, "feature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containingTile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v14, "tileKey");
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = *(unsigned __int16 *)(v15 + 8);
      v18 = *(_QWORD *)v15;
      objc_msgSend(v14, "lines");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      IndexforMultiSectionFeature = getIndexforMultiSectionFeature(v7, v20);
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Unable to find connectivity junction because no points found on road feature. Tile: %d.%d.%d | Feature index: %d | Points: %p, point count: %lu"), (v18 >> 14) & 0x3FFFFFF, ((v18 >> 40) | (v17 << 24)) & 0x3FFFFFF, (v18 >> 8) & 0x3F, IndexforMultiSectionFeature, v8, v27);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "feature");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("Unable to find connectivity junction because containing tile is missing for feature: %s."), objc_msgSend(v19, "name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -7, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v22 = 0;
LABEL_19:

  return v22;
}

+ (BOOL)isPointOnTileBorder:(GeoCodecsVectorTilePoint *)a3
{
  float var1;
  BOOL result;

  result = fabsf(a3->var0) < 0.000001
        || (var1 = a3->var1, fabsf(var1) < 0.000001)
        || fabsf(a3->var0 + -1.0) < 0.000001
        || fabsf(var1 + -1.0) < 0.000001;
  return result;
}

@end
