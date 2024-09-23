@implementation GEOMapFeatureTransitAccessPoint

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEOMapFeatureTransitAccessPoint;
  -[GEOMapFeatureTransitAccessPoint dealloc](&v2, sel_dealloc);
}

- (BOOL)isEntrance
{
  return *((_BYTE *)self->_feature + 232) & 1;
}

- (BOOL)isExit
{
  return (*((unsigned __int8 *)self->_feature + 232) >> 1) & 1;
}

- (double)radiusMeters
{
  return *((float *)self->_feature + 59);
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

- (void).cxx_destruct
{
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_retainedTile);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (void)feature
{
  return self->_feature;
}

- (GEOMapFeatureTransitAccessPoint)initWithFeature:(void *)a3
{
  GEOMapFeatureTransitAccessPoint *v4;
  GEOMapFeatureTransitAccessPoint *v5;
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
  v21.super_class = (Class)GEOMapFeatureTransitAccessPoint;
  v4 = -[GEOMapFeatureTransitAccessPoint init](&v21, sel_init);
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
  }
  return v5;
}

@end
