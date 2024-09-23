@implementation GEOPolylineCoordinateArray

- (unint64_t)count
{
  return self->_polylineCoordinates.__end_ - self->_polylineCoordinates.__begin_;
}

- (void)addCoordinate:(PolylineCoordinate)a3
{
  __compressed_pair<geo::PolylineCoordinate *, std::allocator<geo::PolylineCoordinate>> *p_end_cap;
  PolylineCoordinate *value;
  unint64_t mutationsCount;
  PolylineCoordinate *v8;
  PolylineCoordinate *v9;
  PolylineCoordinate **p_value;
  PolylineCoordinate *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  PolylineCoordinate *v17;
  PolylineCoordinate *v18;
  PolylineCoordinate *end;
  PolylineCoordinate *begin;
  PolylineCoordinate v21;

  value = self->_polylineCoordinates.__end_cap_.__value_;
  mutationsCount = self->_mutationsCount;
  p_end_cap = &self->_polylineCoordinates.__end_cap_;
  p_end_cap[1].__value_ = (PolylineCoordinate *)(mutationsCount + 1);
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v11 = p_end_cap[-2].__value_;
    v12 = v8 - v11;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v13 = (char *)value - (char *)v11;
    v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1))
      v14 = v12 + 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)p_end_cap, v15);
    else
      v16 = 0;
    v17 = (PolylineCoordinate *)&v16[8 * v12];
    v18 = (PolylineCoordinate *)&v16[8 * v15];
    *v17 = a3;
    v9 = v17 + 1;
    begin = self->_polylineCoordinates.__begin_;
    end = self->_polylineCoordinates.__end_;
    if (end != begin)
    {
      do
      {
        v21 = end[-1];
        --end;
        v17[-1] = v21;
        --v17;
      }
      while (end != begin);
      end = *p_value;
    }
    self->_polylineCoordinates.__begin_ = v17;
    self->_polylineCoordinates.__end_ = v9;
    self->_polylineCoordinates.__end_cap_.__value_ = v18;
    if (end)
      operator delete(end);
  }
  else
  {
    *v8 = a3;
    v9 = v8 + 1;
  }
  self->_polylineCoordinates.__end_ = v9;
}

- (PolylineCoordinate)coordinateAtIndex:(unint64_t)a3
{
  PolylineCoordinate *begin;
  PolylineCoordinate *v4;
  uint8_t v6[16];

  begin = self->_polylineCoordinates.__begin_;
  if (a3 >= self->_polylineCoordinates.__end_ - begin)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: index < _polylineCoordinates.size()", v6, 2u);
    }
    v4 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  }
  else
  {
    v4 = &begin[a3];
  }
  return *v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  unint64_t v9;

  var0 = a3->var0;
  v6 = self->_polylineCoordinates.__end_ - self->_polylineCoordinates.__begin_ - a3->var0;
  if (v6 >= a5)
    v6 = a5;
  if (v6)
  {
    v7 = var0;
    v8 = a4;
    v9 = v6;
    do
    {
      *v8++ = &self->_polylineCoordinates.__begin_[v7++];
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

- (GEOPolylineCoordinateArray)initWithCoder:(id)a3
{
  id v4;
  GEOPolylineCoordinateArray *v5;
  char *v6;
  PolylineCoordinate *begin;
  unint64_t v8;
  unint64_t v9;
  uint64_t value;
  uint64_t v11;
  unint64_t v12;
  void **p_end;
  uint64_t v14;
  PolylineCoordinate *end;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  PolylineCoordinate *v19;
  char *v20;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOPolylineCoordinateArray;
  v5 = -[GEOPolylineCoordinateArray init](&v23, sel_init);
  if (v5)
  {
    v22 = 0;
    v6 = (char *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("_polylineCoordinates"), &v22);
    begin = v5->_polylineCoordinates.__begin_;
    v8 = v22;
    v9 = v22 >> 3;
    value = (uint64_t)v5->_polylineCoordinates.__end_cap_.__value_;
    if (v22 >> 3 <= (unint64_t)((value - (uint64_t)begin) >> 3))
    {
      p_end = (void **)&v5->_polylineCoordinates.__end_;
      end = v5->_polylineCoordinates.__end_;
      v16 = end - begin;
      if (v16 < v9)
      {
        v17 = (unint64_t)v22 >> 3;
        if (end != begin)
        {
          memmove(v5->_polylineCoordinates.__begin_, v6, (char *)end - (char *)begin);
          begin = (PolylineCoordinate *)*p_end;
        }
        v18 = 8 * v17 - 8 * v16;
        if (v16 == v17)
          goto LABEL_21;
        v19 = begin;
        v20 = &v6[8 * v16];
        goto LABEL_20;
      }
    }
    else
    {
      if (begin)
      {
        v5->_polylineCoordinates.__end_ = begin;
        operator delete(begin);
        value = 0;
        v5->_polylineCoordinates.__begin_ = 0;
        v5->_polylineCoordinates.__end_ = 0;
        v5->_polylineCoordinates.__end_cap_.__value_ = 0;
      }
      if ((v8 & 0x8000000000000000) != 0)
        goto LABEL_23;
      v11 = value >> 2;
      if (value >> 2 <= v9)
        v11 = v9;
      v12 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v11;
      if (v12 >> 61)
LABEL_23:
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      begin = (PolylineCoordinate *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v5->_polylineCoordinates.__end_cap_, v12);
      v5->_polylineCoordinates.__end_ = begin;
      p_end = (void **)&v5->_polylineCoordinates.__end_;
      v5->_polylineCoordinates.__begin_ = begin;
      v5->_polylineCoordinates.__end_cap_.__value_ = &begin[v14];
    }
    v18 = v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 < 8)
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
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_polylineCoordinates.__begin_, (char *)self->_polylineCoordinates.__end_ - (char *)self->_polylineCoordinates.__begin_, CFSTR("_polylineCoordinates"));
}

- (id)description
{
  void *v3;
  unint64_t i;
  PolylineCoordinate v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOPolylineCoordinateArray count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[GEOPolylineCoordinateArray count](self, "count"); ++i)
  {
    v5 = -[GEOPolylineCoordinateArray coordinateAtIndex:](self, "coordinateAtIndex:", i);
    v6 = (void *)MEMORY[0x1E0CB3940];
    GEOPolylineCoordinateAsString(*(_QWORD *)&v5, 1, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%d]: %@"), i, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  PolylineCoordinate *begin;

  begin = self->_polylineCoordinates.__begin_;
  if (begin)
  {
    self->_polylineCoordinates.__end_ = begin;
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
