@implementation GEOMapAccessTransitNodeBase

- (GEOMapAccessTransitNodeBase)initWithMap:(id)a3 node:(shared_ptr<geo::MapNodeTransit>)a4
{
  MapNodeTransit *ptr;
  id v7;
  GEOMapAccessTransitNodeBase *v8;
  GEOMapAccessTransitNodeBase *v9;
  uint64_t v10;
  MapNodeTransit *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v16;
  objc_super v18;

  ptr = a4.__ptr_;
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapAccessTransitNodeBase;
  v8 = -[GEOMapAccessTransitNodeBase init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_map, a3);
    v11 = *(MapNodeTransit **)ptr;
    v10 = *((_QWORD *)ptr + 1);
    if (v10)
    {
      v12 = (unint64_t *)(v10 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    cntrl = (std::__shared_weak_count *)v9->_node.__cntrl_;
    v9->_node.__ptr_ = v11;
    v9->_node.__cntrl_ = (__shared_weak_count *)v10;
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
    v9->_polygonPointsCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_boundingRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)GEOMapRectNull;
    v9->_boundingRect.size = ($D4775485B13497D55C4F339E01923D43)unk_189CD23C0;
  }

  return v9;
}

- (void)dealloc
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *polygonPoints;
  objc_super v4;

  polygonPoints = self->_polygonPoints;
  if (polygonPoints)
    free(polygonPoints);
  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccessTransitNodeBase;
  -[GEOMapAccessTransitNodeBase dealloc](&v4, sel_dealloc);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  MapNodeTransit *ptr;
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  ptr = self->_node.__ptr_;
  v3 = *((double *)ptr + 1);
  v4 = *((double *)ptr + 2);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)transitID
{
  return *(_QWORD *)(*((_QWORD *)self->_node.__ptr_ + 5) + 40);
}

- (NSString)internalName
{
  void *v2;

  if (*(_QWORD *)(*((_QWORD *)self->_node.__ptr_ + 5) + 16))
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

- (NSString)description
{
  void *v2;
  void **v3;
  void *v4;
  void *__p[2];
  char v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(void **__return_ptr))(*(_QWORD *)self->_node.__ptr_ + 32))(__p);
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

- (id)findGeometryWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  GEOMapTransitGeometryFinder *v6;
  GEOMapAccess *map;
  unint64_t v8;
  GEOMapTransitGeometryFinder *v9;
  GEOMapTransitGeometryFinder *v10;
  GEOMapTransitGeometryFinder *v11;
  _QWORD v13[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_polygonPointsCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_polygonPointsCount = 0;
      v6 = [GEOMapTransitGeometryFinder alloc];
      map = self->_map;
      v8 = -[GEOMapAccessTransitNodeBase transitID](self, "transitID");
      -[GEOMapAccessTransitNodeBase coordinate](self, "coordinate");
      v9 = -[GEOMapTransitGeometryFinder initWithMap:transitID:coordinate:](v6, "initWithMap:transitID:coordinate:", map, v8);
      -[GEOMapRequest setCompletionHandler:](v9, "setCompletionHandler:", v5);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__GEOMapAccessTransitNodeBase_findGeometryWithCompletionHandler___block_invoke;
      v13[3] = &unk_1E1C02B08;
      v13[4] = self;
      -[GEOMapTransitGeometryFinder findTransitGeometryWithHandler:](v9, "findTransitGeometryWithHandler:", v13);
      if (-[GEOMapRequest isFinished](v9, "isFinished"))
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __65__GEOMapAccessTransitNodeBase_findGeometryWithCompletionHandler___block_invoke(uint64_t a1, const void *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v7;
  double *v10;
  size_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v7 = a3;
  v10 = *(double **)(a1 + 32);
  v10[5] = a4;
  v10[6] = a5;
  v10[7] = a6;
  v10[8] = a7;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = a3;
  v11 = 16 * a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = malloc_type_malloc(16 * a3, 0x7F2FC9B5uLL);
  memcpy(*(void **)(*(_QWORD *)(a1 + 32) + 72), a2, v11);
  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v14 = GEOTilePointForCoordinate(v12, v13, 20.0);
  if (v7)
  {
    v16 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 8);
    v17 = -1.0;
    v18 = 0.0;
    v19 = -1.0;
    do
    {
      v20 = *(v16 - 1);
      if (v18 < (v20 - v14) * (v20 - v14) + (*v16 - v15) * (*v16 - v15))
      {
        v19 = *(v16 - 1);
        v17 = *v16;
        v18 = (v20 - v14) * (v20 - v14) + (*v16 - v15) * (*v16 - v15);
      }
      v16 += 2;
      --v7;
    }
    while (v7);
  }
  else
  {
    v19 = -1.0;
    v17 = -1.0;
  }
  if (v19 <= 268435456.0 && v19 >= 0.0 && v17 >= 0.0 && v17 <= 268435456.0)
    *(long double *)(*(_QWORD *)(a1 + 32) + 32) = GEOMetersBetweenMapPoints(v14, v15, v19, v17);
}

- (double)distanceInMetersFrom:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;

  var1 = a3.var1;
  var0 = a3.var0;
  -[GEOMapAccessTransitNodeBase coordinate](self, "coordinate");
  return GEOCalculateDistanceRadius(v5, v6, var0, var1, 6367000.0);
}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  return 0;
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

- (int64_t)polygonPointsCount
{
  return self->_polygonPointsCount;
}

- (void).cxx_destruct
{
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_node);
  objc_storeStrong((id *)&self->_map, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
