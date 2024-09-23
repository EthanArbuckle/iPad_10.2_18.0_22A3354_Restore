@implementation GEOMapAccessTransitLink

- (GEOMapAccessTransitLink)initWithMap:(id)a3 transitEdge:(shared_ptr<geo::MapEdgeTransit>)a4
{
  MapEdgeTransit *ptr;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  GEOMapAccessTransitLink *v10;
  GEOMapAccessTransitLink *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  shared_ptr<geo::MapEdgeTransit> *p_transitEdge;
  uint64_t v16;
  MapEdgeTransit *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *cntrl;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  GEOMapAccessTransitStop *v28;
  GEOMapAccess *map;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  GEOMapTransitStop *stopFrom;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  GEOMapAccessTransitStop *v47;
  GEOMapAccess *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  GEOMapTransitStop *stopTo;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  uint64_t *v60;
  unint64_t v61;
  uint64_t v63;
  std::__shared_weak_count *v64;
  uint64_t v65;
  std::__shared_weak_count *v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  objc_super v69;
  MapEdgeTransit *v70;
  std::__shared_weak_count *v71;

  ptr = a4.__ptr_;
  v6 = a3;
  v7 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v70 = *(MapEdgeTransit **)ptr;
  v71 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v69.receiver = self;
  v69.super_class = (Class)GEOMapAccessTransitLink;
  v10 = -[GEOMapAccessLine initWithMap:edge:](&v69, sel_initWithMap_edge_, v6, &v70);
  v11 = v10;
  v12 = v71;
  if (!v71)
    goto LABEL_8;
  v13 = (unint64_t *)&v71->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (!v11)
      goto LABEL_69;
  }
  else
  {
LABEL_8:
    if (!v10)
      goto LABEL_69;
  }
  p_transitEdge = &v11->_transitEdge;
  v17 = *(MapEdgeTransit **)ptr;
  v16 = *((_QWORD *)ptr + 1);
  if (v16)
  {
    v18 = (unint64_t *)(v16 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  cntrl = (std::__shared_weak_count *)v11->_transitEdge.__cntrl_;
  p_transitEdge->__ptr_ = v17;
  v11->_transitEdge.__cntrl_ = (__shared_weak_count *)v16;
  if (cntrl)
  {
    v21 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v24 = *((_QWORD *)p_transitEdge->__ptr_ + 1);
  v23 = (std::__shared_weak_count *)*((_QWORD *)p_transitEdge->__ptr_ + 2);
  if (!v23)
    goto LABEL_22;
  v25 = (unint64_t *)&v23->__shared_owners_;
  do
    v26 = __ldxr(v25);
  while (__stxr(v26 + 1, v25));
  do
    v27 = __ldaxr(v25);
  while (__stlxr(v27 - 1, v25));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
    if (v24)
      goto LABEL_23;
  }
  else
  {
LABEL_22:
    if (v24)
    {
LABEL_23:
      v28 = [GEOMapAccessTransitStop alloc];
      map = v11->super._map;
      v30 = *(_QWORD *)(*(_QWORD *)ptr + 8);
      v31 = *(std::__shared_weak_count **)(*(_QWORD *)ptr + 16);
      v65 = v30;
      v66 = v31;
      if (v31)
      {
        v32 = (unint64_t *)&v31->__shared_owners_;
        do
          v33 = __ldxr(v32);
        while (__stxr(v33 + 1, v32));
        v67 = v30;
        v68 = v31;
        do
          v34 = __ldxr(v32);
        while (__stxr(v34 + 1, v32));
      }
      else
      {
        v67 = v30;
        v68 = 0;
      }
      v35 = -[GEOMapAccessTransitNodeBase initWithMap:node:](v28, "initWithMap:node:", map, &v67);
      stopFrom = v11->_stopFrom;
      v11->_stopFrom = (GEOMapTransitStop *)v35;

      v37 = v68;
      if (v68)
      {
        v38 = (unint64_t *)&v68->__shared_owners_;
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
      if (v66)
      {
        v40 = &v66->__shared_owners_;
        do
          v41 = __ldaxr((unint64_t *)v40);
        while (__stlxr(v41 - 1, (unint64_t *)v40));
        if (!v41)
        {
          ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
          std::__shared_weak_count::__release_weak(v66);
        }
      }
    }
  }
  v43 = *(_QWORD *)(*(_QWORD *)ptr + 24);
  v42 = *(std::__shared_weak_count **)(*(_QWORD *)ptr + 32);
  if (!v42)
    goto LABEL_49;
  v44 = (unint64_t *)&v42->__shared_owners_;
  do
    v45 = __ldxr(v44);
  while (__stxr(v45 + 1, v44));
  do
    v46 = __ldaxr(v44);
  while (__stlxr(v46 - 1, v44));
  if (!v46)
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
    if (!v43)
      goto LABEL_69;
  }
  else
  {
LABEL_49:
    if (!v43)
      goto LABEL_69;
  }
  v47 = [GEOMapAccessTransitStop alloc];
  v48 = v11->super._map;
  v49 = *(_QWORD *)(*(_QWORD *)ptr + 24);
  v50 = *(std::__shared_weak_count **)(*(_QWORD *)ptr + 32);
  v65 = v49;
  v66 = v50;
  if (v50)
  {
    v51 = (unint64_t *)&v50->__shared_owners_;
    do
      v52 = __ldxr(v51);
    while (__stxr(v52 + 1, v51));
    v63 = v49;
    v64 = v50;
    do
      v53 = __ldxr(v51);
    while (__stxr(v53 + 1, v51));
  }
  else
  {
    v63 = v49;
    v64 = 0;
  }
  v54 = -[GEOMapAccessTransitNodeBase initWithMap:node:](v47, "initWithMap:node:", v48, &v63);
  stopTo = v11->_stopTo;
  v11->_stopTo = (GEOMapTransitStop *)v54;

  v56 = v64;
  if (v64)
  {
    v57 = (unint64_t *)&v64->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v59 = v66;
  if (v66)
  {
    v60 = &v66->__shared_owners_;
    do
      v61 = __ldaxr((unint64_t *)v60);
    while (__stlxr(v61 - 1, (unint64_t *)v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
LABEL_69:

  return v11;
}

- (unint64_t)transitLineID
{
  return geo::MapEdgeTransit::lineID((geo::MapEdgeTransit *)self->_transitEdge.__ptr_);
}

- (NSString)internalLineName
{
  void *v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(MapEdgeTransit *, SEL))(*(_QWORD *)self->_transitEdge.__ptr_ + 64))(self->_transitEdge.__ptr_, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "name");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (unsigned)minimumTravelTime
{
  return *(_DWORD *)(*(_QWORD *)(*((_QWORD *)self->_transitEdge.__ptr_ + 6)
                               + ((*((_QWORD *)self->_transitEdge.__ptr_ + 9) >> 4) & 0xFFFFFFFFFFFFFF8))
                   + 32 * (*((_QWORD *)self->_transitEdge.__ptr_ + 9) & 0x7FLL)
                   + 24);
}

- (NSString)description
{
  void *v2;
  void **v3;
  void *v4;
  void *__p[2];
  char v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(void **__return_ptr))(*(_QWORD *)self->_transitEdge.__ptr_ + 88))(__p);
  if (v7 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 0)
    operator delete(__p[0]);
  return (NSString *)v4;
}

- (double)distanceInMetersFrom:(id)a3 outClosestCoordinateOnLine:(id *)a4
{
  double v4;
  double v5;
  double var1;
  double var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  var1 = a3.var1;
  var0 = a3.var0;
  if (!-[GEOMapAccessLine coordinateCount](self, "coordinateCount"))
    return 1.79769313e308;
  if (-[GEOMapAccessLine coordinateCount](self, "coordinateCount") == 1)
  {
    v10 = -[GEOMapAccessLine coordinates](self, "coordinates");
    v4 = v10->var0;
    v5 = v10->var1;
    v11 = GEOCalculateDistanceRadius(v10->var0, v5, var0, var1, 6367000.0);
  }
  else
  {
    v11 = 1.79769313e308;
  }
  if (-[GEOMapAccessLine coordinateCount](self, "coordinateCount") >= 2)
  {
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = -[GEOMapAccessLine coordinates](self, "coordinates") + v12 * 16;
      v15 = -[GEOMapAccessLine coordinates](self, "coordinates");
      v18 = GEOClosestCoordinateOnLineSegmentFromCoordinate(v14->var0, v14->var1, v15[v12 + 1].var0, v15[v12 + 1].var1, var0, var1, v16, v17);
      v20 = v19;
      v21 = GEOCalculateDistanceRadius(var0, var1, v18, v19, 6367000.0);
      if (v21 < v11)
      {
        v11 = v21;
        v4 = v18;
        v5 = v20;
      }
      ++v13;
      ++v12;
    }
    while (v13 < -[GEOMapAccessLine coordinateCount](self, "coordinateCount"));
  }
  if (a4)
  {
    a4->var0 = v4;
    a4->var1 = v5;
  }
  return v11;
}

- (GEOMapTransitStop)stopFrom
{
  return self->_stopFrom;
}

- (GEOMapTransitStop)stopTo
{
  return self->_stopTo;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_stopTo, 0);
  objc_storeStrong((id *)&self->_stopFrom, 0);
  begin = self->_coords.__begin_;
  if (begin)
  {
    self->_coords.__end_ = begin;
    operator delete(begin);
  }
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_transitEdge);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
