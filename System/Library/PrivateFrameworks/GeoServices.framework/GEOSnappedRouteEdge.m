@implementation GEOSnappedRouteEdge

- (GEOSnappedRouteEdge)initWithRoadPath:(const void *)a3 sectionRect:(id *)a4
{
  char *v6;
  char *v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  zilch::GeoPolyline *v17;
  unint64_t v18;
  unint64_t v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  zilch::GeoCoordinates *Point;
  double v43;
  double v44;
  double v45;
  double v46;
  float32x2_t *v47;
  double v48;
  float64x2_t v49;
  float64x2_t v50;
  double v51;
  float32x2_t v52;
  unint64_t v53;
  float32x2_t *v54;
  float32x2_t *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  float32x2_t *v61;
  float32x2_t v62;
  double *v63;
  zilch::Latitude *v64;
  unsigned int v65;
  unsigned int v66;
  Longitude v67;
  Latitude v68;
  unsigned int v69;
  BOOL *v70;
  double *v71;
  zilch::Latitude *v72;
  unsigned int v73;
  unsigned int v74;
  Longitude v75;
  Latitude v76;
  unint64_t v77;
  unint64_t v78;
  float32x2_t *v79;
  uint64_t v80;
  double var1;
  double *v82;
  float32x2_t *v83;
  double v84;
  float64x2_t v85;
  float64x2_t v86;
  double v87;
  zilch::GeoCoordinates *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  float64x2_t v94;
  float64x2_t v95;
  double v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  double *v101;
  double *v102;
  uint64_t v103;
  $F24F406B2B787EFB06265DBA3D28CBD5 v104;
  double v105;
  float32x2_t v106;
  int v107;
  void *__p;
  double *v109;
  uint64_t v110;
  std::__shared_weak_count *v111;
  objc_super v112;

  v112.receiver = self;
  v112.super_class = (Class)GEOSnappedRouteEdge;
  v6 = -[GEOSnappedRouteEdge init](&v112, sel_init);
  v7 = v6;
  if (v6)
  {
    var0 = a4->var0;
    *($F24F406B2B787EFB06265DBA3D28CBD5 *)(v6 + 24) = a4->var1;
    *($F24F406B2B787EFB06265DBA3D28CBD5 *)(v6 + 8) = var0;
    v9 = *((_QWORD *)a3 + 3);
    v10 = (std::__shared_weak_count *)*((_QWORD *)a3 + 4);
    v110 = v9;
    v111 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    v14 = (std::__shared_weak_count *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 5) = v9;
    *((_QWORD *)v6 + 6) = v10;
    if (v14)
    {
      v15 = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = (zilch::GeoPolyline *)((char *)a3 + 40);
    v18 = zilch::GeoPolyline::size((zilch::GeoPolyline *)((char *)a3 + 40));
    v19 = v18;
    v20 = (void **)(v7 + 96);
    v21 = *((_QWORD *)v7 + 12);
    v103 = (uint64_t)(v7 + 112);
    if (v18 > (*((_QWORD *)v7 + 14) - v21) >> 3)
    {
      if (v18 >> 61)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v22 = *((_QWORD *)v7 + 13);
      v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>(v103, v18);
      v24 = &v23[(v22 - v21) & 0xFFFFFFFFFFFFFFF8];
      v26 = &v23[8 * v25];
      v28 = (char *)*((_QWORD *)v7 + 12);
      v27 = (char *)*((_QWORD *)v7 + 13);
      v29 = v24;
      if (v27 != v28)
      {
        do
        {
          v30 = *((_QWORD *)v27 - 1);
          v27 -= 8;
          *((_QWORD *)v29 - 1) = v30;
          v29 -= 8;
        }
        while (v27 != v28);
        v27 = (char *)*v20;
      }
      *((_QWORD *)v7 + 12) = v29;
      *((_QWORD *)v7 + 13) = v24;
      *((_QWORD *)v7 + 14) = v26;
      if (v27)
        operator delete(v27);
    }
    v31 = *((_QWORD *)v7 + 7);
    if (v19 > (*((_QWORD *)v7 + 9) - v31) >> 3)
    {
      if (v19 >> 61)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v32 = *((_QWORD *)v7 + 8);
      v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)(v7 + 72), v19);
      v34 = &v33[(v32 - v31) & 0xFFFFFFFFFFFFFFF8];
      v36 = &v33[8 * v35];
      v38 = (char *)*((_QWORD *)v7 + 7);
      v37 = (char *)*((_QWORD *)v7 + 8);
      v39 = v34;
      if (v37 != v38)
      {
        do
        {
          v40 = *((_QWORD *)v37 - 1);
          v37 -= 8;
          *((_QWORD *)v39 - 1) = v40;
          v39 -= 8;
        }
        while (v37 != v38);
        v37 = (char *)*((_QWORD *)v7 + 7);
      }
      *((_QWORD *)v7 + 7) = v39;
      *((_QWORD *)v7 + 8) = v34;
      *((_QWORD *)v7 + 9) = v36;
      if (v37)
        operator delete(v37);
    }
    (*(void (**)(void **__return_ptr))(**((_QWORD **)v7 + 5) + 48))(&__p);
    v101 = (double *)__p;
    v102 = v109;
    if (v19)
    {
      v41 = 0;
      while (1)
      {
        Point = (zilch::GeoCoordinates *)zilch::GeoPolyline::getPoint(v17, v41);
        v106.i32[0] = zilch::GeoCoordinates::y(Point);
        v44 = zilch::Latitude::toDegrees((zilch::Latitude *)&v106, v43);
        v107 = zilch::GeoCoordinates::x(Point);
        v46 = zilch::Longitude::toDegrees((zilch::Longitude *)&v107, v45);
        v48 = GEOTilePointForCoordinate(v44, v46, 20.0);
        v49.f64[0] = a4->var0.var0;
        v50.f64[1] = a4->var1.var1;
        v50.f64[0] = v48;
        v49.f64[1] = v51 - a4->var0.var1;
        v52 = vcvt_f32_f64(vdivq_f64(vsubq_f64(v50, v49), (float64x2_t)a4->var1));
        v54 = (float32x2_t *)*((_QWORD *)v7 + 13);
        v53 = *((_QWORD *)v7 + 14);
        if ((unint64_t)v54 >= v53)
        {
          v47 = (float32x2_t *)*v20;
          v56 = ((char *)v54 - (_BYTE *)*v20) >> 3;
          v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 61)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          v58 = v53 - (_QWORD)v47;
          if (v58 >> 2 > v57)
            v57 = v58 >> 2;
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8)
            v59 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v59 = v57;
          if (v59)
          {
            v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>(v103, v59);
            v47 = (float32x2_t *)*((_QWORD *)v7 + 12);
            v54 = (float32x2_t *)*((_QWORD *)v7 + 13);
          }
          else
          {
            v60 = 0;
          }
          v61 = (float32x2_t *)&v60[8 * v56];
          *v61 = v52;
          v55 = v61 + 1;
          if (v54 != v47)
          {
            do
            {
              v62 = v54[-1];
              --v54;
              v61[-1] = v62;
              --v61;
            }
            while (v54 != v47);
            v47 = (float32x2_t *)*v20;
          }
          *((_QWORD *)v7 + 12) = v61;
          *((_QWORD *)v7 + 13) = v55;
          *((_QWORD *)v7 + 14) = &v60[8 * v59];
          if (v47)
            operator delete(v47);
        }
        else
        {
          *v54 = v52;
          v55 = v54 + 1;
        }
        *((_QWORD *)v7 + 13) = v55;
        if (!v41)
          break;
        if (v41 == v19 - 1)
        {
          v63 = v109;
          v64 = (zilch::Latitude *)zilch::Longitude::fromDegrees((zilch::Longitude *)v47, *(v109 - 1));
          v65 = v64;
          v66 = zilch::Latitude::fromDegrees(v64, *(v63 - 2));
          v67.var0 = v65;
          v68.var0 = v66;
          zilch::GeoCoordinates::GeoCoordinates((uint64_t)&v106, v67, v68);
          v69 = zilch::GeoCoordinates::distanceTo(Point, (const zilch::GeoCoordinates *)&v106);
          v70 = (BOOL *)(v7 + 89);
LABEL_47:
          *v70 = v69 > 1;
        }
        if (++v41 == v19)
          goto LABEL_49;
      }
      v71 = (double *)__p;
      v72 = (zilch::Latitude *)zilch::Longitude::fromDegrees((zilch::Longitude *)v47, *((double *)__p + 1));
      v73 = v72;
      v74 = zilch::Latitude::fromDegrees(v72, *v71);
      v75.var0 = v73;
      v76.var0 = v74;
      zilch::GeoCoordinates::GeoCoordinates((uint64_t)&v106, v75, v76);
      v69 = zilch::GeoCoordinates::distanceTo(Point, (const zilch::GeoCoordinates *)&v106);
      v70 = (BOOL *)(v7 + 88);
      goto LABEL_47;
    }
LABEL_49:
    *((_QWORD *)v7 + 10) = 0;
    if (v7[88])
    {
      v77 = (char *)v102 - (char *)v101;
      v78 = ((char *)v102 - (char *)v101) >> 4;
      if (v7[89])
      {
        if (v77 >= 0x10)
        {
          if ((v77 & 0x8000000000000000) != 0)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          v79 = (float32x2_t *)operator new(8 * v78);
        }
        else
        {
          v79 = 0;
        }
        if (v102 != v101)
        {
          if (v78 <= 1)
            v80 = 1;
          else
            v80 = ((char *)v102 - (char *)v101) >> 4;
          var1 = a4->var0.var1;
          v104 = a4->var1;
          v105 = a4->var0.var0;
          v82 = (double *)((char *)__p + 8);
          v83 = v79;
          do
          {
            v84 = GEOTilePointForCoordinate(*(v82 - 1), *v82, 20.0);
            v85.f64[1] = v104.var1;
            v85.f64[0] = v84;
            v86.f64[0] = v105;
            v86.f64[1] = v87 - var1;
            *v83++ = vcvt_f32_f64(vdivq_f64(vsubq_f64(v85, v86), (float64x2_t)v104));
            v82 += 2;
            --v80;
          }
          while (v80);
        }
        v88 = (zilch::GeoCoordinates *)zilch::GeoPolyline::getPoint(v17, 0);
        v106.i32[0] = zilch::GeoCoordinates::y(v88);
        v90 = zilch::Latitude::toDegrees((zilch::Latitude *)&v106, v89);
        v107 = zilch::GeoCoordinates::x(v88);
        v92 = zilch::Longitude::toDegrees((zilch::Longitude *)&v107, v91);
        v93 = GEOTilePointForCoordinate(v90, v92, 20.0);
        v94.f64[0] = a4->var0.var0;
        v95.f64[1] = a4->var1.var1;
        v95.f64[0] = v93;
        v94.f64[1] = v96 - a4->var0.var1;
        v106 = vcvt_f32_f64(vdivq_f64(vsubq_f64(v95, v94), (float64x2_t)a4->var1));
        v107 = 0;
        gm::Matrix<float,2,1>::distanceSquaredToPolyline<int,void>((float *)&v106, v78 - v19 + 1, (uint64_t)v79, (_QWORD *)v7 + 10, (float *)&v107);
        if (v79)
          operator delete(v79);
      }
      else
      {
        *((_QWORD *)v7 + 10) = v78 - v19;
      }
    }
    if (__p)
    {
      v109 = (double *)__p;
      operator delete(__p);
    }
    v97 = v111;
    if (v111)
    {
      v98 = (unint64_t *)&v111->__shared_owners_;
      do
        v99 = __ldaxr(v98);
      while (__stlxr(v99 - 1, v98));
      if (!v99)
      {
        ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
        std::__shared_weak_count::__release_weak(v97);
      }
    }
  }
  return (GEOSnappedRouteEdge *)v7;
}

- (void)calculateRouteOffsetsBetweenA:(PolylineCoordinate)a3 andB:(PolylineCoordinate)a4 overLength:(float)a5 onRoute:(id)a6
{
  GeoCodecsVectorTilePoint *end;
  GeoCodecsVectorTilePoint *begin;
  float *v10;
  float *v11;
  float *v12;
  unint64_t v13;
  float v14;
  float *v15;
  float v16;
  float v17;
  float *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  float *v23;
  int v24;
  float64x2_t v30;
  double v31;
  double v32;
  PolylineCoordinate *value;
  __compressed_pair<geo::PolylineCoordinate *, std::allocator<geo::PolylineCoordinate>> *p_end_cap;
  vector<geo::PolylineCoordinate, std::allocator<geo::PolylineCoordinate>> *p_routeOffsets;
  PolylineCoordinate *v36;
  PolylineCoordinate *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  PolylineCoordinate *v43;
  PolylineCoordinate *v44;
  PolylineCoordinate *v45;
  PolylineCoordinate *v46;
  PolylineCoordinate v47;
  uint64_t v48;
  float v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  PolylineCoordinate *v54;
  PolylineCoordinate *v55;
  PolylineCoordinate *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  PolylineCoordinate *v62;
  PolylineCoordinate *v63;
  PolylineCoordinate *v64;
  PolylineCoordinate v65;
  PolylineCoordinate *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  PolylineCoordinate *v72;
  PolylineCoordinate *v73;
  PolylineCoordinate *v74;
  PolylineCoordinate *v75;
  PolylineCoordinate v76;
  $D4775485B13497D55C4F339E01923D43 size;
  id v79;
  uint64_t v80;
  PolylineCoordinate v81;

  v81 = a4;
  v79 = a6;
  begin = self->_points.__begin_;
  end = self->_points.__end_;
  if ((unint64_t)((char *)end - (char *)begin) < 9)
  {
    v10 = 0;
    v18 = 0;
    v14 = 0.0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 1;
    v14 = 0.0;
    do
    {
      v15 = (float *)&begin[v13];
      v16 = *(v15 - 1) - v15[1];
      v17 = sqrtf((float)((float)((float)(*(v15 - 2) - *v15) * (float)(*(v15 - 2) - *v15)) + 0.0) + (float)(v16 * v16));
      if (v11 >= v12)
      {
        v19 = v11 - v10;
        v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 62)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        if (((char *)v12 - (char *)v10) >> 1 > v20)
          v20 = ((char *)v12 - (char *)v10) >> 1;
        if ((unint64_t)((char *)v12 - (char *)v10) >= 0x7FFFFFFFFFFFFFFCLL)
          v21 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        if (v21)
        {
          if (v21 >> 62)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = (char *)operator new(4 * v21);
        }
        else
        {
          v22 = 0;
        }
        v23 = (float *)&v22[4 * v19];
        *v23 = v17;
        v18 = v23 + 1;
        while (v11 != v10)
        {
          v24 = *((_DWORD *)v11-- - 1);
          *((_DWORD *)v23-- - 1) = v24;
        }
        v12 = (float *)&v22[4 * v21];
        if (v10)
        {
          operator delete(v10);
          begin = self->_points.__begin_;
          end = self->_points.__end_;
        }
        v10 = v23;
      }
      else
      {
        *v11 = v17;
        v18 = v11 + 1;
      }
      v14 = v14 + v17;
      ++v13;
      v11 = v18;
    }
    while (v13 < end - begin);
  }
  __asm { FMOV            V1.2D, #0.5 }
  size = self->_localBounds.size;
  v30 = vaddq_f64((float64x2_t)self->_localBounds.origin, vmulq_f64((float64x2_t)size, _Q1));
  v31 = GEOCoordinate2DForMapPoint(v30.f64[0], v30.f64[1]);
  v32 = GEOMapPointsPerMeterAtLatitude(v31);
  p_end_cap = &self->_routeOffsets.__end_cap_;
  value = self->_routeOffsets.__end_cap_.__value_;
  p_routeOffsets = &self->_routeOffsets;
  v36 = self->_routeOffsets.__end_;
  if (v36 >= value)
  {
    v38 = v36 - p_routeOffsets->__begin_;
    if ((unint64_t)(v38 + 1) >> 61)
      goto LABEL_88;
    v39 = (char *)value - (char *)p_routeOffsets->__begin_;
    v40 = v39 >> 2;
    if (v39 >> 2 <= (unint64_t)(v38 + 1))
      v40 = v38 + 1;
    if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
      v41 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v41 = v40;
    if (v41)
      v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&self->_routeOffsets.__end_cap_, v41);
    else
      v42 = 0;
    v43 = (PolylineCoordinate *)&v42[8 * v38];
    v44 = (PolylineCoordinate *)&v42[8 * v41];
    *v43 = a3;
    v37 = v43 + 1;
    v46 = self->_routeOffsets.__begin_;
    v45 = self->_routeOffsets.__end_;
    if (v45 != v46)
    {
      do
      {
        v47 = v45[-1];
        --v45;
        v43[-1] = v47;
        --v43;
      }
      while (v45 != v46);
      v45 = p_routeOffsets->__begin_;
    }
    self->_routeOffsets.__begin_ = v43;
    self->_routeOffsets.__end_ = v37;
    self->_routeOffsets.__end_cap_.__value_ = v44;
    if (v45)
      operator delete(v45);
  }
  else
  {
    *v36 = a3;
    v37 = v36 + 1;
  }
  self->_routeOffsets.__end_ = v37;
  if ((char *)v18 - (char *)v10 != 4)
  {
    v48 = 0;
    v49 = a5 / v14;
    v50 = v32 / size.width;
    v51 = v49;
    if ((unint64_t)(v18 - v10 - 1) <= 1)
      v52 = 1;
    else
      v52 = v18 - v10 - 1;
    do
    {
      v53 = objc_msgSend(v79, "coordinateAtOffset:fromRouteCoordinate:", *(_QWORD *)&p_routeOffsets->__begin_[v48], v10[v48] / v50 * v51, size);
      v80 = v53;
      if (v81.index > v53 || v81.index == (_DWORD)v53 && v81.offset > *((float *)&v53 + 1))
        v54 = (PolylineCoordinate *)&v80;
      else
        v54 = &v81;
      v56 = self->_routeOffsets.__end_;
      v55 = self->_routeOffsets.__end_cap_.__value_;
      if (v56 >= v55)
      {
        v57 = v56 - p_routeOffsets->__begin_;
        if ((unint64_t)(v57 + 1) >> 61)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v58 = (char *)v55 - (char *)p_routeOffsets->__begin_;
        v59 = v58 >> 2;
        if (v58 >> 2 <= (unint64_t)(v57 + 1))
          v59 = v57 + 1;
        if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8)
          v60 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v60 = v59;
        if (v60)
          v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&self->_routeOffsets.__end_cap_, v60);
        else
          v61 = 0;
        v62 = (PolylineCoordinate *)&v61[8 * v57];
        *v62 = *v54;
        v37 = v62 + 1;
        v64 = self->_routeOffsets.__begin_;
        v63 = self->_routeOffsets.__end_;
        if (v63 != v64)
        {
          do
          {
            v65 = v63[-1];
            --v63;
            v62[-1] = v65;
            --v62;
          }
          while (v63 != v64);
          v63 = p_routeOffsets->__begin_;
        }
        self->_routeOffsets.__begin_ = v62;
        self->_routeOffsets.__end_ = v37;
        self->_routeOffsets.__end_cap_.__value_ = (PolylineCoordinate *)&v61[8 * v60];
        if (v63)
          operator delete(v63);
      }
      else
      {
        *v56 = *v54;
        v37 = v56 + 1;
      }
      self->_routeOffsets.__end_ = v37;
      ++v48;
    }
    while (v48 != v52);
  }
  if (v37 < p_end_cap->__value_)
  {
    *v37 = v81;
    v66 = v37 + 1;
    goto LABEL_82;
  }
  v67 = v37 - p_routeOffsets->__begin_;
  if ((unint64_t)(v67 + 1) >> 61)
LABEL_88:
    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
  v68 = (char *)p_end_cap->__value_ - (char *)p_routeOffsets->__begin_;
  v69 = v68 >> 2;
  if (v68 >> 2 <= (unint64_t)(v67 + 1))
    v69 = v67 + 1;
  if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8)
    v70 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v70 = v69;
  if (v70)
    v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&self->_routeOffsets.__end_cap_, v70);
  else
    v71 = 0;
  v72 = (PolylineCoordinate *)&v71[8 * v67];
  v73 = (PolylineCoordinate *)&v71[8 * v70];
  *v72 = v81;
  v66 = v72 + 1;
  v75 = self->_routeOffsets.__begin_;
  v74 = self->_routeOffsets.__end_;
  if (v74 != v75)
  {
    do
    {
      v76 = v74[-1];
      --v74;
      v72[-1] = v76;
      --v72;
    }
    while (v74 != v75);
    v74 = p_routeOffsets->__begin_;
  }
  self->_routeOffsets.__begin_ = v72;
  self->_routeOffsets.__end_ = v66;
  self->_routeOffsets.__end_cap_.__value_ = v73;
  if (v74)
    operator delete(v74);
LABEL_82:
  self->_routeOffsets.__end_ = v66;
  if (v10)
    operator delete(v10);

}

- (GeoCodecsVectorTilePoint)points
{
  return self->_points.__begin_;
}

- (unint64_t)pointCount
{
  return self->_points.__end_ - self->_points.__begin_;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (%f - %f)"), geo::MapEdge::debugName((geo::MapEdge *)self->_mapEdge.__ptr_), (float)((float)-[GEOSnappedRouteEdge routeOffsetA](self, "routeOffsetA")+ COERCE_FLOAT((unint64_t)-[GEOSnappedRouteEdge routeOffsetA](self, "routeOffsetA") >> 32)), (float)((float)-[GEOSnappedRouteEdge routeOffsetB](self, "routeOffsetB")+ COERCE_FLOAT((unint64_t)-[GEOSnappedRouteEdge routeOffsetB](self, "routeOffsetB") >> 32)));
}

- (PolylineCoordinate)routeOffsets
{
  return self->_routeOffsets.__begin_;
}

- (PolylineCoordinate)routeOffsetA
{
  return *self->_routeOffsets.__begin_;
}

- (PolylineCoordinate)routeOffsetB
{
  return self->_routeOffsets.__end_[-1];
}

- (GEOMultiSectionFeature)feature
{
  return (GEOMultiSectionFeature *)geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_mapEdge.__ptr_);
}

- (shared_ptr<geo::MapEdgeRoad>)mapEdge
{
  MapEdgeRoad **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<geo::MapEdgeRoad> result;

  cntrl = self->_mapEdge.__cntrl_;
  *v2 = self->_mapEdge.__ptr_;
  v2[1] = (MapEdgeRoad *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MapEdgeRoad *)self;
  return result;
}

- (unint64_t)mapEdgeOffset
{
  return self->_mapEdgeOffset;
}

- (BOOL)clippedFront
{
  return self->_clippedFront;
}

- (BOOL)clippedBack
{
  return self->_clippedBack;
}

- (void).cxx_destruct
{
  GeoCodecsVectorTilePoint *begin;
  PolylineCoordinate *v4;

  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_routeOffsets.__begin_;
  if (v4)
  {
    self->_routeOffsets.__end_ = v4;
    operator delete(v4);
  }
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_mapEdge);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
