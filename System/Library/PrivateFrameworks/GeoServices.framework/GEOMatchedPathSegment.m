@implementation GEOMatchedPathSegment

- (GEOMatchedPathSegment)init
{
  GEOMatchedPathSegment *result;

  result = (GEOMatchedPathSegment *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMatchedPathSegment)initWithRoute:(id)a3 road:(id)a4 coordinates:(const void *)a5 roadRange:(GEOPolylineCoordinateRange)a6
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v12;
  id v13;
  GEOMatchedPathSegment *v14;
  GEOMatchedPathSegment *v15;
  GEOMatchedPathSegment *v16;
  __int128 v17;
  vector<std::pair<GEOLocationCoordinate3D, geo::PolylineCoordinate>, std::allocator<std::pair<GEOLocationCoordinate3D, geo::PolylineCoordinate>>> *p_coordinates;
  id v19;
  __int128 *v20;
  __int128 *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t value;
  _QWORD *begin;
  uint64_t v26;
  unint64_t v27;
  void **p_end;
  uint64_t v29;
  char *v30;
  _OWORD *v31;
  __int128 v32;
  _BYTE *v33;
  unint64_t v34;
  __int128 *v35;
  char *v36;
  _OWORD *v37;
  __int128 v38;
  int64_t v39;
  _QWORD *v40;
  BOOL v41;
  char v42;
  unsigned int v43;
  BOOL v44;
  BOOL v45;
  id v47;
  objc_super v48;

  end = a6.end;
  start = a6.start;
  v12 = a3;
  v13 = a4;
  v48.receiver = self;
  v48.super_class = (Class)GEOMatchedPathSegment;
  v14 = -[GEOMatchedPathSegment init](&v48, sel_init);
  v15 = v14;
  v16 = v14;
  if (!v14)
    goto LABEL_41;
  objc_storeStrong((id *)&v14->_route, a3);
  objc_storeStrong((id *)&v15->_road, a4);
  p_coordinates = &v15->_coordinates;
  if (&v15->_coordinates != a5)
  {
    v47 = v13;
    v19 = v12;
    v21 = *(__int128 **)a5;
    v20 = (__int128 *)*((_QWORD *)a5 + 1);
    v22 = (uint64_t)v20 - *(_QWORD *)a5;
    v23 = v22 >> 5;
    value = (uint64_t)v16->_coordinates.__end_cap_.__value_;
    begin = v16->_coordinates.__begin_;
    if (v22 >> 5 <= (unint64_t)((value - (uint64_t)begin) >> 5))
    {
      p_end = &v16->_coordinates.__end_;
      v33 = v16->_coordinates.__end_;
      v34 = (v33 - (_BYTE *)begin) >> 5;
      if (v34 < v23)
      {
        v35 = &v21[2 * v34];
        v12 = v19;
        v13 = v47;
        if (v33 != (_BYTE *)begin)
        {
          do
          {
            v17 = *v21;
            begin[2] = *((_QWORD *)v21 + 2);
            *(_OWORD *)begin = v17;
            begin[3] = *((_QWORD *)v21 + 3);
            v21 += 2;
            begin += 4;
          }
          while (v21 != v35);
          begin = *p_end;
        }
        v36 = (char *)begin;
        if (v35 != v20)
        {
          v36 = (char *)begin;
          v37 = begin;
          do
          {
            v17 = *v35;
            v38 = v35[1];
            v35 += 2;
            *v37 = v17;
            v37[1] = v38;
            v37 += 2;
            v36 += 32;
          }
          while (v35 != v20);
        }
        v39 = v36 - (char *)begin;
        goto LABEL_29;
      }
      v12 = v19;
      v13 = v47;
      v30 = (char *)v16->_coordinates.__begin_;
      if (v21 != v20)
      {
        v40 = v16->_coordinates.__begin_;
        do
        {
          v17 = *v21;
          v40[2] = *((_QWORD *)v21 + 2);
          *(_OWORD *)v40 = v17;
          v40[3] = *((_QWORD *)v21 + 3);
          v30 += 32;
          v21 += 2;
          v40 += 4;
        }
        while (v21 != v20);
      }
    }
    else
    {
      if (begin)
      {
        v16->_coordinates.__end_ = begin;
        operator delete(begin);
        value = 0;
        p_coordinates->__begin_ = 0;
        p_coordinates->__end_ = 0;
        p_coordinates->__end_cap_.__value_ = 0;
      }
      if (v22 < 0)
        goto LABEL_42;
      v26 = value >> 4;
      if (value >> 4 <= v23)
        v26 = v22 >> 5;
      v27 = (unint64_t)value >= 0x7FFFFFFFFFFFFFE0 ? 0x7FFFFFFFFFFFFFFLL : v26;
      if (v27 >> 59)
LABEL_42:
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v12 = v19;
      v13 = v47;
      begin = std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v16->_coordinates.__end_cap_, v27);
      v16->_coordinates.__end_ = begin;
      p_end = &v16->_coordinates.__end_;
      v16->_coordinates.__begin_ = begin;
      v16->_coordinates.__end_cap_.__value_ = &begin[4 * v29];
      v30 = (char *)begin;
      if (v21 != v20)
      {
        v30 = (char *)begin;
        v31 = begin;
        do
        {
          v17 = *v21;
          v32 = v21[1];
          v21 += 2;
          *v31 = v17;
          v31[1] = v32;
          v31 += 2;
          v30 += 32;
        }
        while (v21 != v20);
      }
    }
    v39 = v30 - (char *)begin;
LABEL_29:
    *p_end = (char *)begin + v39;
  }
  v16->_roadRange.start = start;
  v16->_roadRange.end = end;
  *(float *)&v17 = start.offset;
  v41 = start.offset > 0.0;
  if (start.offset == 0.0)
    v41 = 0;
  if (start.index)
    v42 = 1;
  else
    v42 = v41;
  v16->_isPartialStart = v42;
  v43 = -[GEOMapFeatureLine coordinateCount](v16->_road, "coordinateCount", *(double *)&v17) - 1;
  v44 = end.offset < 0.0;
  if (end.offset == 0.0)
    v44 = 0;
  if (v43 == end.index)
    v45 = v44;
  else
    v45 = v43 > end.index;
  v16->_isPartialEnd = v45;
LABEL_41:

  return v16;
}

- (id)initUnmatchedSegmentWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 isFailedSegment:(BOOL)a5
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v10;
  GEOMatchedPathSegment *v11;
  GEOMatchedPathSegment *v12;
  float v13;
  unsigned int v14;
  uint64_t v15;
  float v16;
  float v17;
  unsigned int v18;
  uint64_t v19;
  float v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t value;
  _QWORD *v29;
  _QWORD *v30;
  _BYTE *begin;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  __int128 v41;
  vector<std::pair<GEOLocationCoordinate3D, geo::PolylineCoordinate>, std::allocator<std::pair<GEOLocationCoordinate3D, geo::PolylineCoordinate>>> *p_coordinates;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  __int128 v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  _BYTE *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  __int128 v82;
  GEOMatchedPathSegment *v83;
  objc_super v85;

  end = a4.end;
  start = a4.start;
  v10 = a3;
  v85.receiver = self;
  v85.super_class = (Class)GEOMatchedPathSegment;
  v11 = -[GEOMatchedPathSegment init](&v85, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_route, a3);
    v12->_roadRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    *(_WORD *)&v12->_isPartialStart = 0;
    v12->_isFailedSegment = a5;
    v13 = start.offset - floorf(start.offset);
    v14 = vcvtms_u32_f32(start.offset) + start.index;
    if (start.offset >= 0.0)
      v15 = v14;
    else
      v15 = 0;
    if (start.offset >= 0.0)
      v16 = v13;
    else
      v16 = -1.0;
    v17 = end.offset - floorf(end.offset);
    v18 = vcvtms_u32_f32(end.offset) + end.index;
    if (end.offset >= 0.0)
      v19 = v18;
    else
      v19 = 0;
    if (end.offset >= 0.0)
      v20 = v17;
    else
      v20 = -1.0;
    if (v16 > 0.0)
    {
      v21 = v15 | ((unint64_t)LODWORD(v16) << 32);
      objc_msgSend(v10, "pointAtRouteCoordinate:", v21);
      v25 = v22;
      v26 = v23;
      v27 = v24;
      value = (unint64_t)v12->_coordinates.__end_cap_.__value_;
      v29 = v12->_coordinates.__end_;
      if ((unint64_t)v29 >= value)
      {
        begin = v12->_coordinates.__begin_;
        v32 = ((char *)v29 - begin) >> 5;
        v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 59)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v34 = value - (_QWORD)begin;
        if (v34 >> 4 > v33)
          v33 = v34 >> 4;
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFE0)
          v35 = 0x7FFFFFFFFFFFFFFLL;
        else
          v35 = v33;
        if (v35)
          v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v12->_coordinates.__end_cap_, v35);
        else
          v36 = 0;
        v37 = &v36[32 * v32];
        v38 = &v36[32 * v35];
        *(_QWORD *)v37 = v25;
        *((_QWORD *)v37 + 1) = v26;
        *((_QWORD *)v37 + 2) = v27;
        *((_QWORD *)v37 + 3) = v21;
        v30 = v37 + 32;
        v40 = (char *)v12->_coordinates.__begin_;
        v39 = (char *)v12->_coordinates.__end_;
        if (v39 != v40)
        {
          do
          {
            v41 = *((_OWORD *)v39 - 1);
            *((_OWORD *)v37 - 2) = *((_OWORD *)v39 - 2);
            *((_OWORD *)v37 - 1) = v41;
            v37 -= 32;
            v39 -= 32;
          }
          while (v39 != v40);
          v39 = (char *)v12->_coordinates.__begin_;
        }
        v12->_coordinates.__begin_ = v37;
        v12->_coordinates.__end_ = v30;
        v12->_coordinates.__end_cap_.__value_ = v38;
        if (v39)
          operator delete(v39);
      }
      else
      {
        *v29 = v22;
        v29[1] = v23;
        v29[2] = v24;
        v30 = v29 + 4;
        v29[3] = v21;
      }
      v12->_coordinates.__end_ = v30;
      LODWORD(v15) = v15 + 1;
    }
    if (v15 <= v19)
    {
      p_coordinates = &v12->_coordinates;
      do
      {
        objc_msgSend(v10, "pointAtRouteCoordinate:", v15);
        v46 = v43;
        v47 = v44;
        v48 = v45;
        v49 = v12->_coordinates.__end_;
        v50 = (unint64_t)v12->_coordinates.__end_cap_.__value_;
        if ((unint64_t)v49 >= v50)
        {
          v52 = ((char *)v49 - (char *)p_coordinates->__begin_) >> 5;
          v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 59)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          v54 = v50 - (unint64_t)p_coordinates->__begin_;
          if (v54 >> 4 > v53)
            v53 = v54 >> 4;
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFE0)
            v55 = 0x7FFFFFFFFFFFFFFLL;
          else
            v55 = v53;
          if (v55)
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v12->_coordinates.__end_cap_, v55);
          else
            v56 = 0;
          v57 = &v56[32 * v52];
          *(_QWORD *)v57 = v46;
          *((_QWORD *)v57 + 1) = v47;
          *((_QWORD *)v57 + 2) = v48;
          *((_QWORD *)v57 + 3) = v15;
          v59 = (char *)v12->_coordinates.__begin_;
          v58 = (char *)v12->_coordinates.__end_;
          v60 = v57;
          if (v58 != v59)
          {
            do
            {
              v61 = *((_OWORD *)v58 - 1);
              *((_OWORD *)v60 - 2) = *((_OWORD *)v58 - 2);
              *((_OWORD *)v60 - 1) = v61;
              v60 -= 32;
              v58 -= 32;
            }
            while (v58 != v59);
            v58 = (char *)p_coordinates->__begin_;
          }
          v51 = v57 + 32;
          v12->_coordinates.__begin_ = v60;
          v12->_coordinates.__end_ = v57 + 32;
          v12->_coordinates.__end_cap_.__value_ = &v56[32 * v55];
          if (v58)
            operator delete(v58);
        }
        else
        {
          *v49 = v43;
          v49[1] = v44;
          v49[2] = v45;
          v51 = v49 + 4;
          v49[3] = v15;
        }
        v12->_coordinates.__end_ = v51;
        LODWORD(v15) = v15 + 1;
      }
      while (v15 <= v19);
    }
    if (v20 > 0.0)
    {
      v62 = ((unint64_t)LODWORD(v20) << 32) | v19;
      objc_msgSend(v10, "pointAtRouteCoordinate:", v62);
      v66 = v63;
      v67 = v64;
      v68 = v65;
      v69 = (unint64_t)v12->_coordinates.__end_cap_.__value_;
      v70 = v12->_coordinates.__end_;
      if ((unint64_t)v70 >= v69)
      {
        v72 = v12->_coordinates.__begin_;
        v73 = ((char *)v70 - v72) >> 5;
        v74 = v73 + 1;
        if ((unint64_t)(v73 + 1) >> 59)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v75 = v69 - (_QWORD)v72;
        if (v75 >> 4 > v74)
          v74 = v75 >> 4;
        if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFE0)
          v76 = 0x7FFFFFFFFFFFFFFLL;
        else
          v76 = v74;
        if (v76)
          v77 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v12->_coordinates.__end_cap_, v76);
        else
          v77 = 0;
        v78 = &v77[32 * v73];
        v79 = &v77[32 * v76];
        *(_QWORD *)v78 = v66;
        *((_QWORD *)v78 + 1) = v67;
        *((_QWORD *)v78 + 2) = v68;
        *((_QWORD *)v78 + 3) = v62;
        v71 = v78 + 32;
        v81 = (char *)v12->_coordinates.__begin_;
        v80 = (char *)v12->_coordinates.__end_;
        if (v80 != v81)
        {
          do
          {
            v82 = *((_OWORD *)v80 - 1);
            *((_OWORD *)v78 - 2) = *((_OWORD *)v80 - 2);
            *((_OWORD *)v78 - 1) = v82;
            v78 -= 32;
            v80 -= 32;
          }
          while (v80 != v81);
          v80 = (char *)v12->_coordinates.__begin_;
        }
        v12->_coordinates.__begin_ = v78;
        v12->_coordinates.__end_ = v71;
        v12->_coordinates.__end_cap_.__value_ = v79;
        if (v80)
          operator delete(v80);
      }
      else
      {
        *v70 = v63;
        v70[1] = v64;
        v70[2] = v65;
        v71 = v70 + 4;
        v70[3] = v62;
      }
      v12->_coordinates.__end_ = v71;
    }
    v83 = v12;
  }

  return v12;
}

- (id)trimmedSegmentWithinRange:(GEOPolylineCoordinateRange)a3
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  PolylineCoordinate v6;
  PolylineCoordinate v7;
  __int128 v8;
  double v9;
  float v10;
  unsigned int v11;
  __int128 v12;
  unsigned int v13;
  unsigned int v14;
  GEOMatchedPathSegment *v15;
  PolylineCoordinate v17;
  PolylineCoordinate v18;
  _BYTE *v19;
  _BYTE *begin;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  __int128 v72;
  PolylineCoordinate v73;
  __int128 v74;
  __int128 v75;
  void *__p;
  char *v77;
  char *v78;
  GEOPolylineCoordinateRange v79;

  end = a3.end;
  start = a3.start;
  v79 = a3;
  if (!-[GEOMatchedPathSegment pointCount](self, "pointCount"))
    goto LABEL_18;
  v6 = -[GEOMatchedPathSegment startRouteCoordinate](self, "startRouteCoordinate");
  v7 = -[GEOMatchedPathSegment endRouteCoordinate](self, "endRouteCoordinate");
  v10 = v6.offset - floorf(v6.offset);
  v11 = vcvtms_u32_f32(v6.offset) + v6.index;
  *(float *)&v12 = v7.offset - floorf(v7.offset);
  if (v7.offset < 0.0)
    *(float *)&v12 = -1.0;
  if (v6.offset >= 0.0)
    *(float *)&v8 = v10;
  else
    *(float *)&v8 = -1.0;
  if (v6.offset >= 0.0)
    v13 = v11;
  else
    v13 = 0;
  if (v13 == end.index)
  {
    if (*(float *)&v8 >= end.offset)
      goto LABEL_18;
  }
  else if (v13 > end.index)
  {
LABEL_18:
    v15 = 0;
    return v15;
  }
  v14 = vcvtms_u32_f32(v7.offset) + v7.index;
  if (v7.offset < 0.0)
    v14 = 0;
  *(float *)&v9 = start.offset;
  if (v14 == start.index)
  {
    if (*(float *)&v12 <= start.offset)
      goto LABEL_18;
  }
  else if (v14 < start.index)
  {
    goto LABEL_18;
  }
  if (v13 == start.index)
  {
    if (*(float *)&v8 < start.offset)
      goto LABEL_37;
  }
  else if (v13 <= start.index)
  {
    goto LABEL_37;
  }
  if (v13 == end.index)
  {
    if (*(float *)&v8 > end.offset)
      goto LABEL_37;
  }
  else if (v13 >= end.index)
  {
    goto LABEL_37;
  }
  if (v14 == start.index)
  {
    if (*(float *)&v12 < start.offset)
      goto LABEL_37;
  }
  else if (v14 <= start.index)
  {
    goto LABEL_37;
  }
  if (v14 == end.index)
  {
    *(float *)&v8 = end.offset;
    if (*(float *)&v12 <= end.offset)
      return self;
  }
  else if (v14 < end.index)
  {
    return self;
  }
LABEL_37:
  __p = 0;
  v77 = 0;
  v78 = 0;
  v17 = self->_roadRange.start;
  v18 = self->_roadRange.end;
  begin = self->_coordinates.__begin_;
  v19 = self->_coordinates.__end_;
  if ((unint64_t)(v19 - begin) < 0x21)
    goto LABEL_131;
  v73 = self->_roadRange.end;
  v21 = 1;
  while (1)
  {
    v22 = &begin[32 * v21];
    v24 = *((_QWORD *)v22 + 3);
    v23 = v22 + 24;
    *(float *)&v12 = v79.start.offset;
    v25 = v24 >= v79.start.index;
    if ((_DWORD)v24 != v79.start.index)
      break;
    LODWORD(v8) = HIDWORD(*((_QWORD *)v22 + 3));
    if (*(float *)&v8 > v79.start.offset)
      goto LABEL_44;
LABEL_110:
    if (++v21 >= (unint64_t)((v19 - begin) >> 5))
    {
      v18 = v73;
      goto LABEL_131;
    }
  }
  if (!v25)
    goto LABEL_110;
LABEL_44:
  v26 = &begin[32 * v21 - 32];
  v27 = *((_QWORD *)v26 + 3);
  if ((_DWORD)v27 == v79.start.index)
  {
    LODWORD(v8) = HIDWORD(*((_QWORD *)v26 + 3));
    if (*((float *)&v27 + 1) >= v79.start.offset)
      goto LABEL_46;
LABEL_49:
    -[GEOMatchedPathSegment _interpolatedCoordinateFrom:routeCoordinate:](self, "_interpolatedCoordinateFrom:routeCoordinate:", v21 - 1, &v79, *(double *)&v12, *(double *)&v8, v9);
    v30 = v77;
    if (v77 >= v78)
    {
      v38 = (char *)__p;
      v39 = (v77 - (_BYTE *)__p) >> 5;
      v40 = v39 + 1;
      if ((unint64_t)(v39 + 1) >> 59)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v41 = v78 - (_BYTE *)__p;
      if ((v78 - (_BYTE *)__p) >> 4 > v40)
        v40 = v41 >> 4;
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFE0)
        v42 = 0x7FFFFFFFFFFFFFFLL;
      else
        v42 = v40;
      if (v42)
      {
        v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v42);
        v38 = (char *)__p;
        v30 = v77;
      }
      else
      {
        v43 = 0;
      }
      *(_QWORD *)&v12 = v74;
      *(_QWORD *)&v8 = v75;
      v47 = &v43[32 * v39];
      *(_OWORD *)v47 = v74;
      *((_OWORD *)v47 + 1) = v75;
      if (v30 == v38)
      {
        v49 = &v43[32 * v39];
      }
      else
      {
        v48 = &v43[32 * v39];
        do
        {
          v49 = v48 - 32;
          v12 = *((_OWORD *)v30 - 2);
          v8 = *((_OWORD *)v30 - 1);
          *((_OWORD *)v48 - 2) = v12;
          *((_OWORD *)v48 - 1) = v8;
          v30 -= 32;
          v48 -= 32;
        }
        while (v30 != v38);
      }
      v31 = v47 + 32;
      __p = v49;
      v77 = v47 + 32;
      v78 = &v43[32 * v42];
      if (v38)
        operator delete(v38);
    }
    else
    {
      *(_QWORD *)&v12 = v74;
      *(_QWORD *)&v8 = v75;
      *(_OWORD *)v77 = v74;
      *((_OWORD *)v30 + 1) = v75;
      v31 = v30 + 32;
    }
    v77 = v31;
    if (self->_road)
      v17 = -[GEOMatchedPathSegment _roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:](self, "_roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:", v21, *(_QWORD *)&v79.start, *(_QWORD *)&v79.end, v74, *(double *)&v75);
  }
  else
  {
    if (v27 < v79.start.index)
      goto LABEL_49;
LABEL_46:
    v28 = v77;
    if (v77 >= v78)
    {
      v32 = (char *)__p;
      v33 = (v77 - (_BYTE *)__p) >> 5;
      v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 59)
        goto LABEL_133;
      v35 = v78 - (_BYTE *)__p;
      if ((v78 - (_BYTE *)__p) >> 4 > v34)
        v34 = v35 >> 4;
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFE0)
        v36 = 0x7FFFFFFFFFFFFFFLL;
      else
        v36 = v34;
      if (v36)
      {
        v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v36);
        v32 = (char *)__p;
        v28 = v77;
      }
      else
      {
        v37 = 0;
      }
      v12 = *(_OWORD *)v26;
      v8 = *((_OWORD *)v26 + 1);
      v44 = &v37[32 * v33];
      *(_OWORD *)v44 = *(_OWORD *)v26;
      *((_OWORD *)v44 + 1) = v8;
      if (v28 == v32)
      {
        v46 = &v37[32 * v33];
      }
      else
      {
        v45 = &v37[32 * v33];
        do
        {
          v46 = v45 - 32;
          v12 = *((_OWORD *)v28 - 2);
          v8 = *((_OWORD *)v28 - 1);
          *((_OWORD *)v45 - 2) = v12;
          *((_OWORD *)v45 - 1) = v8;
          v28 -= 32;
          v45 -= 32;
        }
        while (v28 != v32);
      }
      v29 = v44 + 32;
      __p = v46;
      v77 = v44 + 32;
      v78 = &v37[32 * v36];
      if (v32)
        operator delete(v32);
    }
    else
    {
      v12 = *(_OWORD *)v26;
      v8 = *((_OWORD *)v26 + 1);
      *(_OWORD *)v77 = *(_OWORD *)v26;
      *((_OWORD *)v28 + 1) = v8;
      v29 = v28 + 32;
    }
    v77 = v29;
  }
  if (v79.end.index == *v23)
  {
    LODWORD(v12) = HIDWORD(*v23);
    *(float *)&v8 = v79.end.offset;
    if (v79.end.offset <= *(float *)&v12)
      goto LABEL_112;
    goto LABEL_90;
  }
  if (v79.end.index >= *v23)
  {
LABEL_90:
    begin = self->_coordinates.__begin_;
    v19 = self->_coordinates.__end_;
    if (v21 == ((v19 - begin) >> 5) - 1)
    {
      v50 = v77;
      if (v77 >= v78)
      {
        v52 = (char *)__p;
        v53 = (v77 - (_BYTE *)__p) >> 5;
        v54 = v53 + 1;
        if ((unint64_t)(v53 + 1) >> 59)
LABEL_133:
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v55 = v78 - (_BYTE *)__p;
        if ((v78 - (_BYTE *)__p) >> 4 > v54)
          v54 = v55 >> 4;
        if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFE0)
          v56 = 0x7FFFFFFFFFFFFFFLL;
        else
          v56 = v54;
        if (v56)
        {
          v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v56);
          v52 = (char *)__p;
          v50 = v77;
        }
        else
        {
          v57 = 0;
        }
        v12 = *(_OWORD *)v22;
        v8 = *((_OWORD *)v22 + 1);
        v58 = &v57[32 * v53];
        *(_OWORD *)v58 = *(_OWORD *)v22;
        *((_OWORD *)v58 + 1) = v8;
        if (v50 == v52)
        {
          v60 = &v57[32 * v53];
        }
        else
        {
          v59 = &v57[32 * v53];
          do
          {
            v60 = v59 - 32;
            v12 = *((_OWORD *)v50 - 2);
            v8 = *((_OWORD *)v50 - 1);
            *((_OWORD *)v59 - 2) = v12;
            *((_OWORD *)v59 - 1) = v8;
            v50 -= 32;
            v59 -= 32;
          }
          while (v50 != v52);
        }
        v51 = v58 + 32;
        __p = v60;
        v77 = v58 + 32;
        v78 = &v57[32 * v56];
        if (v52)
          operator delete(v52);
      }
      else
      {
        v12 = *(_OWORD *)v22;
        v8 = *((_OWORD *)v22 + 1);
        *(_OWORD *)v77 = *(_OWORD *)v22;
        *((_OWORD *)v50 + 1) = v8;
        v51 = v50 + 32;
      }
      v77 = v51;
      begin = self->_coordinates.__begin_;
      v19 = self->_coordinates.__end_;
    }
    goto LABEL_110;
  }
LABEL_112:
  -[GEOMatchedPathSegment _interpolatedCoordinateFrom:routeCoordinate:](self, "_interpolatedCoordinateFrom:routeCoordinate:", v21 - 1, &v79.end, *(double *)&v12, *(double *)&v8, v9);
  v18 = v73;
  v61 = v77;
  if (v77 >= v78)
  {
    v63 = (char *)__p;
    v64 = (v77 - (_BYTE *)__p) >> 5;
    v65 = v64 + 1;
    if ((unint64_t)(v64 + 1) >> 59)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v66 = v78 - (_BYTE *)__p;
    if ((v78 - (_BYTE *)__p) >> 4 > v65)
      v65 = v66 >> 4;
    if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFE0)
      v67 = 0x7FFFFFFFFFFFFFFLL;
    else
      v67 = v65;
    if (v67)
    {
      v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v67);
      v63 = (char *)__p;
      v61 = v77;
    }
    else
    {
      v68 = 0;
    }
    v69 = &v68[32 * v64];
    v70 = &v68[32 * v67];
    *(_OWORD *)v69 = v74;
    *((_OWORD *)v69 + 1) = v75;
    v62 = v69 + 32;
    if (v61 == v63)
    {
      v71 = v69;
    }
    else
    {
      do
      {
        v71 = v69 - 32;
        v72 = *((_OWORD *)v61 - 1);
        *((_OWORD *)v69 - 2) = *((_OWORD *)v61 - 2);
        *((_OWORD *)v69 - 1) = v72;
        v61 -= 32;
        v69 -= 32;
      }
      while (v61 != v63);
    }
    __p = v71;
    v77 = v62;
    v78 = v70;
    if (v63)
      operator delete(v63);
  }
  else
  {
    *(_OWORD *)v77 = v74;
    *((_OWORD *)v61 + 1) = v75;
    v62 = v61 + 32;
  }
  v77 = v62;
  if (self->_road)
    v18 = -[GEOMatchedPathSegment _roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:](self, "_roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:", v21, *(_QWORD *)&v79.start, *(_QWORD *)&v79.end, v74, *(double *)&v75);
LABEL_131:
  v15 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:]([GEOMatchedPathSegment alloc], "initWithRoute:road:coordinates:roadRange:", self->_route, self->_road, &__p, v17, v18);
  if (__p)
  {
    v77 = (char *)__p;
    operator delete(__p);
  }
  return v15;
}

- (unint64_t)pointCount
{
  return ((char *)self->_coordinates.__end_ - (char *)self->_coordinates.__begin_) >> 5;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinateAt:(unint64_t)a3
{
  double *v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  uint8_t buf[16];
  $1AB5FA073B851C12C2339EC22442E995 result;

  if (-[GEOMatchedPathSegment pointCount](self, "pointCount") <= a3)
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    v6 = -180.0;
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: index < self.pointCount", buf, 2u);
      v6 = -180.0;
    }
    v8 = 1.79769313e308;
    v7 = -180.0;
  }
  else
  {
    v5 = (double *)((char *)self->_coordinates.__begin_ + 32 * a3);
    v6 = *v5;
    v7 = v5[1];
    v8 = v5[2];
  }
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (PolylineCoordinate)routeCoordinateAt:(unint64_t)a3
{
  PolylineCoordinate *v5;
  uint8_t v7[16];

  if (-[GEOMatchedPathSegment pointCount](self, "pointCount") <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: index < self.pointCount", v7, 2u);
    }
    v5 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  }
  else
  {
    v5 = (PolylineCoordinate *)((char *)self->_coordinates.__begin_ + 32 * a3 + 24);
  }
  return *v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)startLocationCoordinate
{
  double v2;
  double v3;
  double v4;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOMatchedPathSegment locationCoordinateAt:](self, "locationCoordinateAt:", 0);
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endLocationCoordinate
{
  double v2;
  double v3;
  double v4;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOMatchedPathSegment locationCoordinateAt:](self, "locationCoordinateAt:", -[GEOMatchedPathSegment pointCount](self, "pointCount") - 1);
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (PolylineCoordinate)startRouteCoordinate
{
  PolylineCoordinate *begin;
  PolylineCoordinate *v3;

  begin = (PolylineCoordinate *)self->_coordinates.__begin_;
  if (self->_coordinates.__end_ == begin)
    v3 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  else
    v3 = begin + 3;
  return *v3;
}

- (PolylineCoordinate)endRouteCoordinate
{
  char *end;
  PolylineCoordinate *v3;

  end = (char *)self->_coordinates.__end_;
  if (end == self->_coordinates.__begin_)
    v3 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  else
    v3 = (PolylineCoordinate *)(end - 8);
  return *v3;
}

- (GEOPolylineCoordinateRange)range
{
  PolylineCoordinate v3;
  PolylineCoordinate v4;
  PolylineCoordinate v5;
  GEOPolylineCoordinateRange result;

  v3 = -[GEOMatchedPathSegment startRouteCoordinate](self, "startRouteCoordinate");
  v4 = -[GEOMatchedPathSegment endRouteCoordinate](self, "endRouteCoordinate");
  v5 = v3;
  result.end = v4;
  result.start = v5;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinateForRouteCoordinate:(PolylineCoordinate)a3
{
  double v3;
  float *end;
  float *begin;
  unint64_t v6;
  float *v7;
  unint64_t v8;
  float *v9;
  unsigned int v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PolylineCoordinate v18;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v18 = a3;
  begin = (float *)self->_coordinates.__begin_;
  end = (float *)self->_coordinates.__end_;
  if (end == begin)
    goto LABEL_11;
  *(float *)&v3 = a3.offset;
  v6 = ((char *)end - (char *)begin) >> 5;
  v7 = (float *)self->_coordinates.__begin_;
  do
  {
    v8 = v6 >> 1;
    v9 = &v7[8 * (v6 >> 1)];
    v10 = *((_DWORD *)v9 + 6);
    if (v10 < a3.index || v10 == a3.index && v7[8 * v8 + 7] < a3.offset)
    {
      v7 = v9 + 8;
      v8 = v6 + ~v8;
    }
    v6 = v8;
  }
  while (v8);
  v11 = (char *)v7 - (char *)begin;
  if (!v11)
  {
LABEL_11:
    -[GEOMatchedPathSegment startLocationCoordinate](self, "startLocationCoordinate");
  }
  else if (v7 == end)
  {
    -[GEOMatchedPathSegment endLocationCoordinate](self, "endLocationCoordinate", v3);
  }
  else
  {
    -[GEOMatchedPathSegment _interpolatedCoordinateFrom:routeCoordinate:](self, "_interpolatedCoordinateFrom:routeCoordinate:", (v11 >> 5) - 1, &v18, v3);
    v12 = v15;
    v13 = v16;
    v14 = v17;
  }
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (pair<GEOLocationCoordinate3D,)_interpolatedCoordinateFrom:(GEOMatchedPathSegment *)self routeCoordinate:(SEL)a3
{
  int v5;
  char *begin;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned int index;
  uint64_t v14;
  float offset;
  BOOL v16;
  NSObject *v17;
  unint64_t v18;
  pair<GEOLocationCoordinate3D, geo::PolylineCoordinate> *result;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  double v26;
  id v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  __int128 v32;
  int v33;
  _BYTE v34[10];
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  begin = (char *)self->_coordinates.__begin_;
  if ((((char *)self->_coordinates.__end_ - (char *)begin) >> 5) - 1 <= a4)
  {
    GEOGetGEOPathMatcherLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v18 = (unint64_t)((char *)self->_coordinates.__end_ - (char *)self->_coordinates.__begin_) >> 5;
      v33 = 67109376;
      *(_DWORD *)v34 = v5;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v18;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_FAULT, "startIndex (%d) passed into _interpolatedCoordinateFrom: is outside _coordinates bounds (size: %d)", (uint8_t *)&v33, 0xEu);
    }

    goto LABEL_17;
  }
  v10 = &begin[32 * a4];
  v12 = *((_QWORD *)v10 + 3);
  v11 = (uint64_t *)(v10 + 24);
  index = a5->index;
  v14 = *((_QWORD *)v10 + 7);
  offset = a5->offset;
  v16 = v12 >= index;
  if ((_DWORD)v12 == index)
  {
    if (COERCE_FLOAT(HIDWORD(*((_QWORD *)v10 + 3))) > offset)
      goto LABEL_14;
  }
  else if (v16)
  {
    goto LABEL_14;
  }
  if (index == (_DWORD)v14)
  {
    if (offset <= *((float *)&v14 + 1))
      goto LABEL_11;
LABEL_14:
    GEOGetGEOPathMatcherLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      GEOPolylineCoordinateAsString((uint64_t)*a5, 1, 0, v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      GEOPolylineCoordinateAsString(*v11, 1, 0, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      GEOPolylineCoordinateAsString(*((_QWORD *)v10 + 7), 1, 0, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138413314;
      *(_QWORD *)v34 = v27;
      *(_WORD *)&v34[8] = 1024;
      v35 = v5;
      v36 = 2112;
      v37 = v29;
      v38 = 1024;
      v39 = v5 + 1;
      v40 = 2112;
      v41 = v31;
      _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_FAULT, "routeCoordinate [%@] passed into _interpolatedCoordinateFrom: is not between start (%d)[%@] and end (%d)[%@]", (uint8_t *)&v33, 0x2Cu);

    }
LABEL_17:
    *(_OWORD *)&retstr->var0.var0 = kGEOLocationCoordinate3DInvalid;
    retstr->var0.var2 = 1.79769313e308;
    retstr->var1 = (PolylineCoordinate)0xBF80000000000000;
    return result;
  }
  if (index >= v14)
    goto LABEL_14;
LABEL_11:
  result = (pair<GEOLocationCoordinate3D, geo::PolylineCoordinate> *)-[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](self->_route, "distanceBetweenRouteCoordinate:andRouteCoordinate:");
  if (v20 <= 0.0)
  {
    v32 = *((_OWORD *)v10 + 1);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v10;
    *(_OWORD *)&retstr->var0.var2 = v32;
  }
  else
  {
    v21 = v20;
    result = (pair<GEOLocationCoordinate3D, geo::PolylineCoordinate> *)-[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](self->_route, "distanceBetweenRouteCoordinate:andRouteCoordinate:", *v11, *a5);
    v23 = v22 / v21;
    v24 = *((double *)v10 + 2) + (*((double *)v10 + 6) - *((double *)v10 + 2)) * v23;
    *(float64x2_t *)&retstr->var0.var0 = vmlaq_n_f64(*(float64x2_t *)v10, vsubq_f64(*((float64x2_t *)v10 + 2), *(float64x2_t *)v10), v23);
    retstr->var0.var2 = v24;
    retstr->var1 = *a5;
  }
  return result;
}

- (PolylineCoordinate)_roadPolylineCoordinateForCoordinate:(id)a3 segmentCoordinateIndex:(unint64_t)a4 trimRange:(GEOPolylineCoordinateRange)a5
{
  uint64_t end;
  uint64_t start;
  int v7;
  double var1;
  double var0;
  unint64_t v11;
  uint64_t v12;
  $1AB5FA073B851C12C2339EC22442E995 *v13;
  double v14;
  double v15;
  $1AB5FA073B851C12C2339EC22442E995 *v16;
  double v17;
  float v18;
  int v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  _DWORD v25[2];
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  GEOMatchedPathSegment *v35;
  uint64_t v36;

  end = (uint64_t)a5.end;
  start = (uint64_t)a5.start;
  v7 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v36 = *MEMORY[0x1E0C80C00];
  v11 = self->_roadRange.start.index + a4;
  v12 = v11 - 1;
  if (v11 - 1 >= -[GEOMapFeatureLine coordinateCount](self->_road, "coordinateCount", a3.var0, a3.var1, a3.var2)
    || v11 >= -[GEOMapFeatureLine coordinateCount](self->_road, "coordinateCount"))
  {
    GEOGetGEOPathMatcherLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      v19 = -[GEOMapFeatureLine coordinateCount](self->_road, "coordinateCount");
      GEOPolylineCoordinateRangeAsString(*(_QWORD *)&self->_roadRange.start, *(_QWORD *)&self->_roadRange.end, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      GEOPolylineCoordinateRangeAsString(start, end, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = 67110402;
      v25[1] = v11;
      v26 = 1024;
      v27 = v19;
      v28 = 2112;
      v29 = v21;
      v30 = 1024;
      v31 = v7;
      v32 = 2112;
      v33 = v23;
      v34 = 2112;
      v35 = self;
      _os_log_impl(&dword_1885A9000, (os_log_t)v12, OS_LOG_TYPE_FAULT, "roadIndexB (%d) is greater than coordinate count on road (%d). Road range: %@, segmentCoordinateIndex: %d, trim range: %@ | %@", (uint8_t *)v25, 0x32u);

    }
    LODWORD(v12) = -[GEOMapFeatureLine coordinateCount](self->_road, "coordinateCount") - 1;
    v18 = 0.0;
  }
  else
  {
    v13 = -[GEOMapFeatureLine coordinates3d](self->_road, "coordinates3d") + 24 * v12;
    v14 = v13->var0;
    v15 = v13->var1;
    v16 = -[GEOMapFeatureLine coordinates3d](self->_road, "coordinates3d");
    v17 = GEOCalculateDistanceRadius(v14, v15, v16[v11].var0, v16[v11].var1, 6367000.0);
    v18 = GEOCalculateDistanceRadius(v14, v15, var0, var1, 6367000.0) / v17;
    if (v18 >= 1.0)
    {
      LODWORD(v12) = vcvtms_u32_f32(v18) + v12;
      v18 = v18 - (float)floorf(v18);
    }
  }
  return (PolylineCoordinate)(v12 | ((unint64_t)LODWORD(v18) << 32));
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PolylineCoordinate v11;
  PolylineCoordinate v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;

  -[GEOMatchedPathSegment locationCoordinateAt:](self, "locationCoordinateAt:", 0);
  v4 = v3;
  v6 = v5;
  -[GEOMatchedPathSegment locationCoordinateAt:](self, "locationCoordinateAt:", -[GEOMatchedPathSegment pointCount](self, "pointCount") - 1);
  v8 = v7;
  v10 = v9;
  v11 = -[GEOMatchedPathSegment routeCoordinateAt:](self, "routeCoordinateAt:", 0);
  v12 = -[GEOMatchedPathSegment routeCoordinateAt:](self, "routeCoordinateAt:", -[GEOMatchedPathSegment pointCount](self, "pointCount") - 1);
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[GEOMapFeatureRoad internalRoadName](self->_road, "internalRoadName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOMatchedPathSegment pointCount](self, "pointCount");
  GEOPolylineCoordinateAsString(*(_QWORD *)&v11, 1, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  GEOPolylineCoordinateAsString(*(_QWORD *)&v12, 1, 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ | %d points - [%@] - [%@] (%f, %f) - (%f, %f)"), v14, v15, v17, v19, v4, v6, v8, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PolylineCoordinate v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOMatchedPathSegment pointCount](self, "pointCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = ((int)log10((double)-[GEOMatchedPathSegment pointCount](self, "pointCount")) + 1);
  while (v4 < -[GEOMatchedPathSegment pointCount](self, "pointCount"))
  {
    -[GEOMatchedPathSegment locationCoordinateAt:](self, "locationCoordinateAt:", v4);
    v7 = v6;
    v9 = v8;
    v10 = -[GEOMatchedPathSegment routeCoordinateAt:](self, "routeCoordinateAt:", v4);
    -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", v10);
    v12 = v11;
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0CB3940];
    GEOPolylineCoordinateAsString(*(_QWORD *)&v10, 1, 1, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%*d: [%@] %f, %f (%0.1fm)"), v5, v4, v16, *(_QWORD *)&v7, *(_QWORD *)&v9, GEOCalculateDistanceRadius(v7, v9, v12, v14, 6367000.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v17);
    ++v4;
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureRoad internalRoadName](self->_road, "internalRoadName");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = CFSTR("(No road name)");
  objc_msgSend(v19, "addObject:", v22);

  v23 = (void *)MEMORY[0x1E0CB3940];
  -[GEOMapFeatureLine length](self->_road, "length");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%0.1f meters"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  GEOPolylineCoordinateRangeAsString(*(_QWORD *)&self->_roadRange.start, *(_QWORD *)&self->_roadRange.end, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Road range: %@"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v29);

  if (self->_isPartialStart)
  {
    if (self->_isPartialEnd)
      v30 = CFSTR("partial start and end");
    else
      v30 = CFSTR("partial start");
  }
  else
  {
    if (!self->_isPartialEnd)
      goto LABEL_14;
    v30 = CFSTR("partial end");
  }
  objc_msgSend(v19, "addObject:", v30);
LABEL_14:
  if (self->_isDivergentSegment)
    objc_msgSend(v19, "addObject:", CFSTR("Error: segment diverges from route"));
  if (self->_isFailedSegment)
    objc_msgSend(v19, "addObject:", CFSTR("Error: failed segment"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d points:\n"), -[GEOMatchedPathSegment pointCount](self, "pointCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v31);

  v32 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" | "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@%@"), v33, v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOMapFeatureRoad)road
{
  return self->_road;
}

- (GEOPolylineCoordinateRange)roadRange
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_roadRange.end;
  start = self->_roadRange.start;
  result.end = end;
  result.start = start;
  return result;
}

- (BOOL)isPartialStart
{
  return self->_isPartialStart;
}

- (BOOL)isPartialEnd
{
  return self->_isPartialEnd;
}

- (BOOL)isDivergentSegment
{
  return self->_isDivergentSegment;
}

- (void)setIsDivergentSegment:(BOOL)a3
{
  self->_isDivergentSegment = a3;
}

- (BOOL)isFailedSegment
{
  return self->_isFailedSegment;
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_coordinates.__begin_;
  if (begin)
  {
    self->_coordinates.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_road, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0xBF80000000000000;
  *((_QWORD *)self + 7) = 0xBF80000000000000;
  return self;
}

@end
