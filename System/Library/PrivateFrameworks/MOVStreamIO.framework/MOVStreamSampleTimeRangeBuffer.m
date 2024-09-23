@implementation MOVStreamSampleTimeRangeBuffer

- (MOVStreamSampleTimeRangeBuffer)initWithCapacity:(unint64_t)a3
{
  MOVStreamSampleTimeRangeBuffer *v4;
  MOVStreamSampleTimeRangeBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOVStreamSampleTimeRangeBuffer;
  v4 = -[MOVStreamSampleTimeRangeBuffer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::vector<CMTimeRange>::reserve((void **)&v4->_ranges.__begin_, 100 * (a3 / 0x64) + 100);
  return v5;
}

- (MOVStreamSampleTimeRangeBuffer)init
{
  return -[MOVStreamSampleTimeRangeBuffer initWithCapacity:](self, "initWithCapacity:", 100);
}

- (void)appendTimeRange:(id *)a3
{
  __compressed_pair<CMTimeRange *, std::allocator<CMTimeRange>> *p_end_cap;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  __int128 v9;
  __int128 v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **p_value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  __int128 v21;
  __int128 v22;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __int128 v25;
  __int128 v26;

  value = self->_ranges.__end_cap_.__value_;
  p_end_cap = &self->_ranges.__end_cap_;
  v6 = value;
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v13 = p_end_cap[-2].__value_;
    v14 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v13) >> 4);
    v15 = v14 + 1;
    if (v14 + 1 > 0x555555555555555)
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    v16 = 0xAAAAAAAAAAAAAAABLL * ((v6 - v13) >> 4);
    if (2 * v16 > v15)
      v15 = 2 * v16;
    if (v16 >= 0x2AAAAAAAAAAAAAALL)
      v17 = 0x555555555555555;
    else
      v17 = v15;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTimeRange>>((uint64_t)p_end_cap, v17);
    else
      v18 = 0;
    v19 = &v18[48 * v14];
    v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v18[48 * v17];
    v21 = *(_OWORD *)&a3->var0.var0;
    v22 = *(_OWORD *)&a3->var1.var1;
    *((_OWORD *)v19 + 1) = *(_OWORD *)&a3->var0.var3;
    *((_OWORD *)v19 + 2) = v22;
    *(_OWORD *)v19 = v21;
    v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v19 + 48);
    begin = self->_ranges.__begin_;
    end = self->_ranges.__end_;
    if (end != begin)
    {
      do
      {
        v25 = *((_OWORD *)end - 3);
        v26 = *((_OWORD *)end - 1);
        *((_OWORD *)v19 - 2) = *((_OWORD *)end - 2);
        *((_OWORD *)v19 - 1) = v26;
        *((_OWORD *)v19 - 3) = v25;
        v19 -= 48;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 48);
      }
      while (end != begin);
      end = *p_value;
    }
    self->_ranges.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v19;
    self->_ranges.__end_ = v11;
    self->_ranges.__end_cap_.__value_ = v20;
    if (end)
      operator delete(end);
  }
  else
  {
    v9 = *(_OWORD *)&a3->var0.var0;
    v10 = *(_OWORD *)&a3->var1.var1;
    *((_OWORD *)v8 + 1) = *(_OWORD *)&a3->var0.var3;
    *((_OWORD *)v8 + 2) = v10;
    *(_OWORD *)v8 = v9;
    v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 48);
  }
  self->_ranges.__end_ = v11;
}

- (id)timeRangeList
{
  return -[MOVStreamSampleTimeRangeList initWithTimeRanges:]([MOVStreamSampleTimeRangeList alloc], "initWithTimeRanges:", &self->_ranges);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_ranges.__begin_;
  if (begin)
  {
    self->_ranges.__end_ = begin;
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
