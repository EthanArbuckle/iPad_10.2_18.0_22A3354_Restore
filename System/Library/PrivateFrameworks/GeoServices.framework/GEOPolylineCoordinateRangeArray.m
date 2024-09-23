@implementation GEOPolylineCoordinateRangeArray

- (unint64_t)count
{
  return self->_polylineCoordinateRanges.__end_ - self->_polylineCoordinateRanges.__begin_;
}

- (void)addCoordinateRange:(GEOPolylineCoordinateRange)a3
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  __compressed_pair<GEOPolylineCoordinateRange *, std::allocator<GEOPolylineCoordinateRange>> *p_end_cap;
  GEOPolylineCoordinateRange *v7;
  GEOPolylineCoordinateRange *value;
  GEOPolylineCoordinateRange *v9;
  GEOPolylineCoordinateRange *v10;
  GEOPolylineCoordinateRange **p_value;
  GEOPolylineCoordinateRange *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  GEOPolylineCoordinateRange *v18;
  GEOPolylineCoordinateRange *v19;
  GEOPolylineCoordinateRange *v20;
  GEOPolylineCoordinateRange *begin;

  end = a3.end;
  start = a3.start;
  value = self->_polylineCoordinateRanges.__end_cap_.__value_;
  p_end_cap = &self->_polylineCoordinateRanges.__end_cap_;
  v7 = value;
  v9 = p_end_cap[-1].__value_;
  if (v9 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v12 = p_end_cap[-2].__value_;
    v13 = v9 - v12;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v15 = (char *)v7 - (char *)v12;
    if (v15 >> 3 > v14)
      v14 = v15 >> 3;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
      v16 = 0xFFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)p_end_cap, v16);
    else
      v17 = 0;
    v18 = (GEOPolylineCoordinateRange *)&v17[16 * v13];
    v19 = (GEOPolylineCoordinateRange *)&v17[16 * v16];
    v18->start = start;
    v18->end = end;
    v10 = v18 + 1;
    begin = self->_polylineCoordinateRanges.__begin_;
    v20 = self->_polylineCoordinateRanges.__end_;
    if (v20 != begin)
    {
      do
      {
        v18[-1] = v20[-1];
        --v18;
        --v20;
      }
      while (v20 != begin);
      v20 = *p_value;
    }
    self->_polylineCoordinateRanges.__begin_ = v18;
    self->_polylineCoordinateRanges.__end_ = v10;
    self->_polylineCoordinateRanges.__end_cap_.__value_ = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *v9 = a3;
    v10 = v9 + 1;
  }
  self->_polylineCoordinateRanges.__end_ = v10;
  ++self->_mutationsCount;
}

- (GEOPolylineCoordinateRange)coordinateRangeAtIndex:(unint64_t)a3
{
  GEOPolylineCoordinateRange *begin;
  __int128 *v4;
  PolylineCoordinate v5;
  PolylineCoordinate v6;
  uint8_t v7[16];
  GEOPolylineCoordinateRange result;

  begin = self->_polylineCoordinateRanges.__begin_;
  if (a3 >= self->_polylineCoordinateRanges.__end_ - begin)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: index < _polylineCoordinateRanges.size()", v7, 2u);
    }
    v4 = &GEOPolylineCoordinateRangeInvalid;
  }
  else
  {
    v4 = (__int128 *)&begin[a3];
  }
  v5 = *(PolylineCoordinate *)v4;
  v6 = (PolylineCoordinate)*((_QWORD *)v4 + 1);
  result.end = v6;
  result.start = v5;
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  unint64_t v9;

  var0 = a3->var0;
  v6 = self->_polylineCoordinateRanges.__end_ - self->_polylineCoordinateRanges.__begin_ - a3->var0;
  if (v6 >= a5)
    v6 = a5;
  if (v6)
  {
    v7 = var0;
    v8 = a4;
    v9 = v6;
    do
    {
      *v8++ = &self->_polylineCoordinateRanges.__begin_[v7++];
      --v9;
    }
    while (v9);
  }
  a3->var0 = v6 + var0;
  a3->var1 = a4;
  a3->var2 = &self->_mutationsCount;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPolylineCoordinateRangeArray)initWithCoder:(id)a3
{
  id v4;
  GEOPolylineCoordinateRangeArray *v5;
  char *v6;
  GEOPolylineCoordinateRange *begin;
  unint64_t v8;
  unint64_t v9;
  uint64_t value;
  uint64_t v11;
  unint64_t v12;
  void **p_end;
  uint64_t v14;
  GEOPolylineCoordinateRange *end;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  GEOPolylineCoordinateRange *v19;
  char *v20;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOPolylineCoordinateRangeArray;
  v5 = -[GEOPolylineCoordinateRangeArray init](&v23, sel_init);
  if (v5)
  {
    v22 = 0;
    v6 = (char *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("_polylineCoordinateRanges"), &v22);
    begin = v5->_polylineCoordinateRanges.__begin_;
    v8 = v22;
    v9 = v22 >> 4;
    value = (uint64_t)v5->_polylineCoordinateRanges.__end_cap_.__value_;
    if (v22 >> 4 <= (unint64_t)((value - (uint64_t)begin) >> 4))
    {
      p_end = (void **)&v5->_polylineCoordinateRanges.__end_;
      end = v5->_polylineCoordinateRanges.__end_;
      v16 = end - begin;
      if (v16 < v9)
      {
        v17 = (unint64_t)v22 >> 4;
        if (end != begin)
        {
          memmove(v5->_polylineCoordinateRanges.__begin_, v6, (char *)end - (char *)begin);
          begin = (GEOPolylineCoordinateRange *)*p_end;
        }
        v18 = 16 * v17 - 16 * v16;
        if (v16 == v17)
          goto LABEL_21;
        v19 = begin;
        v20 = &v6[16 * v16];
        goto LABEL_20;
      }
    }
    else
    {
      if (begin)
      {
        v5->_polylineCoordinateRanges.__end_ = begin;
        operator delete(begin);
        value = 0;
        v5->_polylineCoordinateRanges.__begin_ = 0;
        v5->_polylineCoordinateRanges.__end_ = 0;
        v5->_polylineCoordinateRanges.__end_cap_.__value_ = 0;
      }
      if ((v8 & 0x8000000000000000) != 0)
        goto LABEL_23;
      v11 = value >> 3;
      if (value >> 3 <= v9)
        v11 = v9;
      v12 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v11;
      if (v12 >> 60)
LABEL_23:
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      begin = (GEOPolylineCoordinateRange *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v5->_polylineCoordinateRanges.__end_cap_, v12);
      v5->_polylineCoordinateRanges.__end_ = begin;
      p_end = (void **)&v5->_polylineCoordinateRanges.__end_;
      v5->_polylineCoordinateRanges.__begin_ = begin;
      v5->_polylineCoordinateRanges.__end_cap_.__value_ = &begin[v14];
    }
    v18 = v8 & 0xFFFFFFFFFFFFFFF0;
    if (v8 < 0x10)
    {
LABEL_21:
      *p_end = (char *)begin + v18;
      goto LABEL_22;
    }
    v19 = begin;
    v20 = v6;
LABEL_20:
    memmove(v19, v20, v18);
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_polylineCoordinateRanges.__begin_, (char *)self->_polylineCoordinateRanges.__end_ - (char *)self->_polylineCoordinateRanges.__begin_, CFSTR("_polylineCoordinateRanges"));
}

- (id)description
{
  void *v3;
  unint64_t i;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOPolylineCoordinateRangeArray count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[GEOPolylineCoordinateRangeArray count](self, "count"); ++i)
  {
    v5 = -[GEOPolylineCoordinateRangeArray coordinateRangeAtIndex:](self, "coordinateRangeAtIndex:", i);
    v6 = (void *)MEMORY[0x1E0CB3940];
    GEOPolylineCoordinateRangeAsString(v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%d]: %@"), i, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  GEOPolylineCoordinateRange *begin;

  begin = self->_polylineCoordinateRanges.__begin_;
  if (begin)
  {
    self->_polylineCoordinateRanges.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
