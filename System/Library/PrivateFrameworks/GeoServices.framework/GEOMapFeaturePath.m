@implementation GEOMapFeaturePath

- (unint64_t)coordinateCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3);
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unint64_t)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  double *v4;
  double v5;
  double v6;
  double v7;
  $1AB5FA073B851C12C2339EC22442E995 result;

  begin = self->_coordinates.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - begin) >> 3) <= a3)
  {
    v7 = 1.79769313e308;
    v5 = -180.0;
    v6 = -180.0;
  }
  else
  {
    v4 = (double *)((char *)begin + 24 * a3);
    v5 = *v4;
    v6 = v4[1];
    v7 = v4[2];
  }
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GEOMapFeaturePath - %0.1f meters, %d coordinates, %d segments:"), *(_QWORD *)&self->_length, 0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3), -[NSArray count](self->_segments, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  begin = self->_coordinates.__begin_;
  for (i = self->_coordinates.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f, %f"), *(_QWORD *)begin, *((_QWORD *)begin + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)length
{
  return self->_length;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_segments, 0);
  begin = self->_coordinates.__begin_;
  if (begin)
  {
    self->_coordinates.__end_ = begin;
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
