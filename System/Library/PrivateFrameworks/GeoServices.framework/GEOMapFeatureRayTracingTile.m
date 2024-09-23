@implementation GEOMapFeatureRayTracingTile

- (GEOMapFeatureRayTracingTile)initWithTileKey:(uint64_t)a3 tileData:(void *)a4
{
  id v7;
  unint64_t v8;
  __int128 v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  GEOMapRegion *v18;
  GEOMapRegion *boundingBox;
  GEOMapFeatureRayTracingTile *v20;
  unint64_t v22;
  unsigned __int8 v23;
  objc_super v24;

  v7 = a4;
  if ((*(_BYTE *)a3 & 0x7F) == 0xC
    && ((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) & 0xFFFC0) == 0x1640
    && (v24.receiver = a1,
        v24.super_class = (Class)GEOMapFeatureRayTracingTile,
        (a1 = -[GEOMapFeatureRayTracingTile init](&v24, sel_init)) != 0))
  {
    *((_QWORD *)&v9 + 1) = *(unsigned __int16 *)(a3 + 9) | ((unint64_t)*(unsigned __int8 *)(a3 + 11) << 16);
    *(_QWORD *)&v9 = *(_QWORD *)(a3 + 1);
    v8 = v9 >> 6;
    v10 = __clz(v8);
    v23 = (int)((63 - v10 + (((63 - v10) & 0x80u) >> 7)) << 24) >> 25;
    v22 = v8 - gloria::LEADING_BITS_VALUE_LUT[v23];
    v11 = gloria::TileId::ToBBOX((gloria::TileId *)&v22);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = objc_alloc_init(GEOMapRegion);
    boundingBox = a1->_boundingBox;
    a1->_boundingBox = v18;

    -[GEOMapRegion setNorthLat:](a1->_boundingBox, "setNorthLat:", v11);
    -[GEOMapRegion setSouthLat:](a1->_boundingBox, "setSouthLat:", v13);
    -[GEOMapRegion setEastLng:](a1->_boundingBox, "setEastLng:", v15);
    -[GEOMapRegion setWestLng:](a1->_boundingBox, "setWestLng:", v17);
    objc_storeStrong((id *)&a1->_tileData, a4);
    a1 = a1;
    v20 = a1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)readDataWithOptions:(unint64_t)a3 error:(id *)a4
{
  return -[GEOTileData readDataWithOptions:error:](self->_tileData, "readDataWithOptions:error:", a3, a4);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOMapRegion northLat](self->_boundingBox, "northLat");
  v5 = v4;
  -[GEOMapRegion westLng](self->_boundingBox, "westLng");
  v7 = v6;
  -[GEOMapRegion southLat](self->_boundingBox, "southLat");
  v9 = v8;
  -[GEOMapRegion eastLng](self->_boundingBox, "eastLng");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<GEOMapFeatureRayTracingTile %p: %f,%f %f,%f: %@>"), self, v5, v7, v9, v10, self->_tileData);
}

- (GEOMapRegion)boundingBox
{
  return self->_boundingBox;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBox, 0);
  objc_storeStrong((id *)&self->_tileData, 0);
}

@end
