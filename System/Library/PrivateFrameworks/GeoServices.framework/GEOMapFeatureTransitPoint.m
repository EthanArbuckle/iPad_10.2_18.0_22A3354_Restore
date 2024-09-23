@implementation GEOMapFeatureTransitPoint

- (void)dealloc
{
  objc_super v3;

  free(self->_polygonPoints);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureTransitPoint;
  -[GEOMapFeatureTransitPoint dealloc](&v3, sel_dealloc);
}

- (GEOMapFeatureTransitStop)stop
{
  return 0;
}

- (GEOMapFeatureTransitHall)hall
{
  return 0;
}

- (GEOMapFeatureTransitStation)station
{
  return 0;
}

- (unint64_t)transitID
{
  return *((_QWORD *)self->_feature + 5);
}

- (NSString)internalName
{
  void *v2;

  if (*((_QWORD *)self->_feature + 2))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSArray)internalSystemNames
{
  uint64_t v3;
  void *v4;
  unint64_t i;
  void *v6;
  uint64_t v8;

  v3 = *((_QWORD *)self->_feature + 29);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v8 = 0;
      geo::codec::transitNodeFeatureGetSystem((_QWORD *)self->_feature, i, &v8);
      if (v8 && *(_QWORD *)(v8 + 56))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

      }
    }
  }
  return (NSArray *)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[GEOMapFeatureTransitPoint internalName](self, "internalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapFeatureTransitPoint transitID](self, "transitID");
  -[GEOMapFeatureTransitPoint coordinate](self, "coordinate");
  v7 = v6;
  -[GEOMapFeatureTransitPoint coordinate](self, "coordinate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%llu) | %f, %f"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOMapFeatureTransitPoint internalSystemNames](self, "internalSystemNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" | %@"), v11);

  }
  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)boundingRadius
{
  return self->_boundingRadius;
}

- ($140BDABED96B4E653C9F0DB440664A5C)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  $140BDABED96B4E653C9F0DB440664A5C result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints
{
  return self->_polygonPoints;
}

- (unint64_t)polygonPointsCount
{
  return self->_polygonPointsCount;
}

- (void).cxx_destruct
{
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_retainedTile);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (float)tileKey
{
  float result;

  LODWORD(result) = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*(unsigned __int16 *)(*(_QWORD *)(a1 + 88) + 12) | (*(unsigned __int8 *)(*(_QWORD *)(a1 + 88) + 14) << 16)), (uint32x2_t)0xFFFFFFF0FFFFFFFELL), (int8x8_t)0xF00003FFFLL).u32[0];
  return result;
}

- (void)feature
{
  return self->_feature;
}

- (GEOMapFeatureTransitPoint)initWithFeature:(void *)a3
{
  GEOMapFeatureTransitPoint *v4;
  GEOMapFeatureTransitPoint *v5;
  std::__shared_weak_count *v6;
  shared_ptr<geo::codec::VectorTile> *p_retainedTile;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)GEOMapFeatureTransitPoint;
  v4 = -[GEOMapFeatureTransitPoint init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_feature = a3;
    v23 = 0uLL;
    v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
    if (v6)
    {
      *((_QWORD *)&v23 + 1) = std::__shared_weak_count::lock(v6);
      if (*((_QWORD *)&v23 + 1))
        *(_QWORD *)&v23 = *(_QWORD *)a3;
    }
    p_retainedTile = &v5->_retainedTile;
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v5->_retainedTile, &v23);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = *(_QWORD *)((char *)p_retainedTile->__ptr_ + 4);
    v12 = *((unsigned __int8 *)p_retainedTile->__ptr_ + 14);
    v13 = *((unsigned __int16 *)p_retainedTile->__ptr_ + 6);
    *(_QWORD *)((char *)&v23 + 1) = (v11 << 32) & 0xFFFFC00000000000 | ((unint64_t)((v11 >> 8) & 0x3F) << 40);
    LOBYTE(v23) = v11;
    *((_QWORD *)&v14 + 1) = BYTE4(v11) | ((((v11 >> 40) | (v13 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)(v13 >> 2) << 34) | ((unint64_t)(v12 & 0xF) << 48) | ((unint64_t)(v12 >> 4) << 52);
    *(_QWORD *)&v14 = v11 << 32;
    v22[0] = v23;
    v22[1] = v14 >> 56;
    v15 = GEOMapRectForGEOTileKey((uint64_t)v22);
    v5->_coordinate.latitude = GEOCoordinate2DForMapPoint(v15 + *((float *)a3 + 22) * v16, v17 + (float)(1.0 - *((float *)a3 + 23)) * v18);
    v5->_coordinate.longitude = v19;
    v5->_boundingRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)GEOMapRectNull;
    v5->_boundingRect.size = ($D4775485B13497D55C4F339E01923D43)unk_189CD23C0;
  }
  return v5;
}

- (void)updateWithGeometryFeature:(void *)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *polygonPoints;
  std::__shared_weak_count *v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v20;
  unint64_t polygonPointsCount;
  double *p_var1;
  float *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  long double v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  polygonPoints = self->_polygonPoints;
  if (polygonPoints)
    free(polygonPoints);
  v6 = std::__shared_weak_count::lock(*((std::__shared_weak_count **)a3 + 1));
  v7 = *(_QWORD *)(*(_QWORD *)a3 + 4);
  v8 = *(unsigned __int8 *)(*(_QWORD *)a3 + 14);
  v9 = *(unsigned __int16 *)(*(_QWORD *)a3 + 12);
  *(_QWORD *)((char *)v38 + 1) = (v7 << 32) & 0xFFFFC00000000000 | ((unint64_t)((v7 >> 8) & 0x3F) << 40);
  LOBYTE(v38[0]) = v7;
  *((_QWORD *)&v10 + 1) = BYTE4(v7) | ((((v7 >> 40) | (v9 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)(v9 >> 2) << 34) | ((unint64_t)(v8 & 0xF) << 48) | ((unint64_t)(v8 >> 4) << 52);
  *(_QWORD *)&v10 = v7 << 32;
  v37[0] = v38[0];
  v37[1] = v10 >> 56;
  v11 = GEOMapRectForGEOTileKey((uint64_t)v37);
  v35 = v12;
  v36 = v11;
  v33 = v14;
  v34 = v13;
  v38[0] = 0;
  v15 = geo::codec::multiSectionFeaturePoints(a3, 0, v38);
  v16 = v38[0];
  self->_polygonPointsCount = v38[0];
  v17 = GEOTilePointForCoordinate(self->_coordinate.latitude, self->_coordinate.longitude, 20.0);
  v19 = v18;
  v20 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * v16, 0x1000040451B5BE8uLL);
  self->_polygonPoints = v20;
  polygonPointsCount = self->_polygonPointsCount;
  if (polygonPointsCount)
  {
    p_var1 = &v20->var1;
    v23 = (float *)v15 + 1;
    v24 = -1.79769313e308;
    v25 = 1.79769313e308;
    v26 = 1.79769313e308;
    v27 = -1.79769313e308;
    do
    {
      v28 = v36 + *(v23 - 1) * v34;
      v29 = v35 + (float)(1.0 - *v23) * v33;
      *(p_var1 - 1) = v28;
      *p_var1 = v29;
      v30 = GEOMetersBetweenMapPoints(v17, v19, v28, v29);
      if (self->_boundingRadius < v30)
        self->_boundingRadius = v30;
      v25 = fmin(v25, v28);
      v26 = fmin(v26, v29);
      v24 = fmax(v24, v28);
      p_var1 += 2;
      v23 += 2;
      v27 = fmax(v27, v29);
      --polygonPointsCount;
    }
    while (polygonPointsCount);
  }
  else
  {
    v26 = 1.79769313e308;
    v27 = -1.79769313e308;
    v24 = -1.79769313e308;
    v25 = 1.79769313e308;
  }
  self->_boundingRect.origin.x = v25;
  self->_boundingRect.origin.y = v26;
  self->_boundingRect.size.width = v24 - v25;
  self->_boundingRect.size.height = v27 - v26;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v32 = __ldaxr(p_shared_owners);
  while (__stlxr(v32 - 1, p_shared_owners));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

@end
