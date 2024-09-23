@implementation GEOMapAccessLine

- (GEOMapAccessLine)initWithMap:(id)a3 edge:(shared_ptr<geo::MapEdge>)a4
{
  uint64_t *ptr;
  id v7;
  GEOMapAccessLine *v8;
  GEOMapAccessLine *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  GEOMapAccessLine *v11;
  __int128 v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  objc_super v15;

  ptr = (uint64_t *)a4.__ptr_;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapAccessLine;
  v8 = -[GEOMapAccessLine init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_map, a3);
    std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::operator=[abi:ne180100](&v9->_edge.__ptr_, ptr);
    (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)*ptr + 48))(&v13);
    begin = v9->_coordinates.__begin_;
    if (begin)
    {
      v9->_coordinates.__end_ = begin;
      operator delete(begin);
      v9->_coordinates.__begin_ = 0;
      v9->_coordinates.__end_ = 0;
      v9->_coordinates.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_coordinates.__begin_ = v13;
    v9->_coordinates.__end_cap_.__value_ = v14;
    v11 = v9;
  }

  return v9;
}

- (unint64_t)coordinateCount
{
  return (self->_coordinates.__end_ - self->_coordinates.__begin_) >> 4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  return ($F24F406B2B787EFB06265DBA3D28CBD5 *)self->_coordinates.__begin_;
}

- (double)length
{
  double result;

  (*(void (**)(MapEdge *))(*(_QWORD *)self->_edge.__ptr_ + 56))(self->_edge.__ptr_);
  return result;
}

- (double)distanceFromCoordinate:(id)a3 outSegmentCoordinate:(PolylineCoordinate *)a4
{
  double var1;
  double var0;
  unsigned int v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v9;
  double v10;
  double v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v12;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double *p_var1;
  unsigned int v20;
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
  float v34;
  double v35;
  double v36;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = -[GEOMapAccessLine coordinateCount](self, "coordinateCount");
  if (!v8)
  {
    if (a4)
      *a4 = (PolylineCoordinate)0xBF80000000000000;
    return 1.79769313e308;
  }
  v9 = -[GEOMapAccessLine coordinates](self, "coordinates");
  v12 = v9;
  if (v8 != 1)
  {
    v15 = 0;
    v14 = 1.79769313e308;
    v16 = v9->var0;
    v17 = v9->var1;
    v18 = v8 - 1;
    p_var1 = &v9[1].var1;
    v36 = -180.0;
    v20 = -1;
    v35 = -180.0;
    do
    {
      v21 = v16;
      v22 = v17;
      v16 = *(p_var1 - 1);
      v17 = *p_var1;
      v23 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v21, v22, 1.79769313e308, v16, *p_var1, 1.79769313e308, v10, v11, var0, var1);
      v25 = v24;
      v26 = GEOCalculateDistanceRadius(var0, var1, v23, v24, 6367000.0);
      if (v14 > v26)
      {
        v35 = v25;
        v36 = v23;
        v20 = v15;
        v14 = v26;
      }
      ++v15;
      p_var1 += 2;
    }
    while (v18 != v15);
    if (!a4)
      return v14;
    v27 = v12[v20].var0;
    v28 = v12[v20 + 1].var0;
    if (vabdd_f64(v27, v28) <= 0.0000005)
    {
      v31 = v12[v20].var1;
      v32 = v12[v20 + 1].var1;
      v33 = 0.0;
      if (vabdd_f64(v31, v32) <= 0.0000005)
      {
LABEL_19:
        v34 = v33;
        if (v34 < 0.0)
          v34 = 0.0;
        if (v34 > 1.0)
          v34 = 1.0;
        a4->index = v20;
        a4->offset = v34;
        return v14;
      }
      v29 = v35 - v31;
      v30 = v32 - v31;
    }
    else
    {
      v29 = v36 - v27;
      v30 = v28 - v27;
    }
    v33 = v29 / v30;
    goto LABEL_19;
  }
  if (a4)
    *a4 = 0;
  return GEOCalculateDistanceRadius(v9->var0, v9->var1, var0, var1, 6367000.0);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_coordinates.__begin_;
  if (begin)
  {
    self->_coordinates.__end_ = begin;
    operator delete(begin);
  }
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_edge);
  objc_storeStrong((id *)&self->_map, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
