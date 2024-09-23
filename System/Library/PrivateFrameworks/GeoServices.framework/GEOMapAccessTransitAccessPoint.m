@implementation GEOMapAccessTransitAccessPoint

- (GEOMapAccessTransitAccessPoint)initWithMap:(id)a3 accessPoint:(shared_ptr<geo::MapAccessPointFeature>)a4
{
  MapAccessPointFeature *ptr;
  id v7;
  GEOMapAccessTransitAccessPoint *v8;
  GEOMapAccessTransitAccessPoint *v9;
  uint64_t v10;
  MapAccessPointFeature *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v16;
  objc_super v18;

  ptr = a4.__ptr_;
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapAccessTransitAccessPoint;
  v8 = -[GEOMapAccessTransitAccessPoint init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_map, a3);
    v11 = *(MapAccessPointFeature **)ptr;
    v10 = *((_QWORD *)ptr + 1);
    if (v10)
    {
      v12 = (unint64_t *)(v10 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    cntrl = (std::__shared_weak_count *)v9->_accessPoint.__cntrl_;
    v9->_accessPoint.__ptr_ = v11;
    v9->_accessPoint.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  MapAccessPointFeature *ptr;
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  ptr = self->_accessPoint.__ptr_;
  v3 = *(double *)ptr;
  v4 = *((double *)ptr + 1);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)transitID
{
  return *(_QWORD *)(*((_QWORD *)self->_accessPoint.__ptr_ + 2) + 40);
}

- (NSString)internalName
{
  void *v2;

  if (*(_QWORD *)(*((_QWORD *)self->_accessPoint.__ptr_ + 2) + 16))
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

- (unint64_t)stationID
{
  return *(_QWORD *)(*((_QWORD *)self->_accessPoint.__ptr_ + 2) + 224);
}

- (double)groundRadius
{
  return *(float *)(*((_QWORD *)self->_accessPoint.__ptr_ + 2) + 236);
}

- (unsigned)entranceExitType
{
  return *(_BYTE *)(*((_QWORD *)self->_accessPoint.__ptr_ + 2) + 232);
}

- (unsigned)accessType
{
  return *(_WORD *)(*((_QWORD *)self->_accessPoint.__ptr_ + 2) + 240);
}

- (double)distanceInMetersFrom:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;

  var1 = a3.var1;
  var0 = a3.var0;
  -[GEOMapAccessTransitAccessPoint coordinate](self, "coordinate");
  return GEOCalculateDistanceRadius(v5, v6, var0, var1, 6367000.0);
}

- ($140BDABED96B4E653C9F0DB440664A5C)boundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $140BDABED96B4E653C9F0DB440664A5C result;

  v2 = INFINITY;
  v3 = 0.0;
  v4 = 0.0;
  v5 = INFINITY;
  result.var1.var1 = v4;
  result.var1.var0 = v3;
  result.var0.var1 = v5;
  result.var0.var0 = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints
{
  return 0;
}

- (int64_t)polygonPointsCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)findGeometryWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if (v3)
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);

  return 0;
}

- (id)findStops:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (id)findStation:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  GEOMapAccess *map;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  GEOMapAccessTransitAccessPoint *v18;
  void (**v19)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!self->_station)
  {
    v10 = *(_QWORD *)(*((_QWORD *)self->_accessPoint.__ptr_ + 2) + 224);
    if (v10)
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __64__GEOMapAccessTransitAccessPoint_findStation_completionHandler___block_invoke;
      v17 = &unk_1E1C02B58;
      v18 = self;
      v19 = v6;
      v11 = (void *)MEMORY[0x18D765024](&v14);
      map = self->_map;
      -[GEOMapAccessTransitAccessPoint coordinate](self, "coordinate", v14, v15, v16, v17, v18);
      -[GEOMapAccess findTransitStationWithID:near:stationHandler:completionHandler:](map, "findTransitStationWithID:near:stationHandler:completionHandler:", v10, v11, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (v7)
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
      v9 = 0;
      goto LABEL_11;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  if (v6)
    v6[2](v6);
  if (!v8)
    goto LABEL_10;
  v8[2](v8, 0);
  v9 = 0;
LABEL_11:

  return v9;
}

void __64__GEOMapAccessTransitAccessPoint_findStation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, GEOMapAccessTransitAccessPoint *);
  void (**v7)(id, _QWORD);

  v6 = (void (**)(id, GEOMapAccessTransitAccessPoint *))a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (v6)
    v6[2](v6, self);
  if (v7)
    v7[2](v7, 0);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_station, 0);
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_accessPoint);
  objc_storeStrong((id *)&self->_map, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
