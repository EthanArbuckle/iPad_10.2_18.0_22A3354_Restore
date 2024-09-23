@implementation MOVStreamSampleTimeList

- (MOVStreamSampleTimeList)initWithTimes:(const void *)a3
{
  MOVStreamSampleTimeList *v4;
  char *p_times;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOVStreamSampleTimeList;
  v4 = -[MOVStreamSampleTimeList init](&v8, sel_init);
  p_times = (char *)&v4->_times;
  if (v4)
    v6 = p_times == a3;
  else
    v6 = 1;
  if (!v6)
    std::vector<CMTime>::__assign_with_size[abi:ne180100]<CMTime*,CMTime*>(p_times, *(char **)a3, *((_QWORD *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  return v4;
}

- (MOVStreamSampleTimeList)init
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_ERROR, "❌ ERROR: Do not call -[%{public}@ init].", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v6;
  CMTimeEpoch v7;
  void *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  unint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CMTime time;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 4);
  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (begin == end)
  {
    v9 = self->_times.__begin_;
  }
  else
  {
    v6 = 1;
    do
    {
      if (v6 != 1)
      {
        objc_msgSend(v3, "appendString:", CFSTR(", "));
        if (v6 > 4)
          break;
      }
      v7 = *((_QWORD *)begin + 2);
      *(_OWORD *)&time.value = *(_OWORD *)begin;
      time.epoch = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v8);

      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
      ++v6;
    }
    while (begin != end);
    begin = self->_times.__begin_;
    v9 = self->_times.__end_;
  }
  -[MOVStreamSampleTimeList name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[MOVStreamSampleTimeList name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" name=%@"), v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_24CA45E28;
  }
  v14 = 0xAAAAAAAAAAAAAAABLL * ((v9 - begin) >> 3);

  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v3, "copy");
  if (v14 < 5)
  {
    objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p%@ sampleCount=%@ samples=[%@]>"), v17, self, v13, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14 - 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p%@ sampleCount=%@ samples=[%@... and %@ more]>"), v17, self, v13, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (_NSRange)frameRangeFrom:(id *)a3 to:(id *)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v9;
  char *v10;
  __int128 v11;
  int32_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  CMTimeEpoch v17;
  NSUInteger v18;
  NSUInteger v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  CMTime time1;
  _NSRange result;

  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (end == begin)
  {
    v13 = self->_times.__begin_;
  }
  else
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
    do
    {
      v10 = (char *)begin + 24 * (v9 >> 1);
      v11 = *(_OWORD *)v10;
      time1.epoch = *((_QWORD *)v10 + 2);
      *(_OWORD *)&time1.value = v11;
      v20 = *a3;
      v12 = CMTimeCompare(&time1, (CMTime *)&v20);
      if (v12 < 0)
        v9 += ~(v9 >> 1);
      else
        v9 >>= 1;
      if (v12 < 0)
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 24);
    }
    while (v9);
    end = begin;
    begin = self->_times.__begin_;
    v13 = self->_times.__end_;
  }
  if (v13 == end)
    v14 = 0;
  else
    v14 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  if (v13 != begin)
  {
    v15 = 0xAAAAAAAAAAAAAAABLL * ((v13 - begin) >> 3);
    do
    {
      v16 = (char *)begin + 24 * (v15 >> 1);
      time1 = (CMTime)*a4;
      v17 = *((_QWORD *)v16 + 2);
      *(_OWORD *)&v20.var0 = *(_OWORD *)v16;
      v20.var3 = v17;
      if (CMTimeCompare(&time1, (CMTime *)&v20) < 0)
      {
        v15 >>= 1;
      }
      else
      {
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v16 + 24);
        v15 += ~(v15 >> 1);
      }
    }
    while (v15);
    v13 = begin;
    begin = self->_times.__end_;
  }
  if (begin == v13)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = 0xAAAAAAAAAAAAAAABLL * ((v13 - end) >> 3);
  v19 = v14;
  result.length = v18;
  result.location = v19;
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeFrom:(SEL)a3 to:(unint64_t)a4
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  CMTime v16;
  CMTime start;
  CMTimeRange v18;

  v6 = MEMORY[0x24BDC0D70];
  v7 = *(_OWORD *)(MEMORY[0x24BDC0D70] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x24BDC0D70];
  *(_OWORD *)&retstr->var0.var3 = v7;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v6 + 32);
  v8 = *(_QWORD *)&self->var0.var1;
  v9 = 0xAAAAAAAAAAAAAAABLL * ((self->var0.var3 - v8) >> 3);
  if (v9 > a4)
  {
    if (v9 <= a5)
      v10 = v9 - 1;
    else
      v10 = a5;
    v11 = (__int128 *)(v8 + 24 * a4);
    v12 = *v11;
    start.epoch = *((_QWORD *)v11 + 2);
    *(_OWORD *)&start.value = v12;
    v13 = (__int128 *)(v8 + 24 * v10);
    v14 = *v13;
    v16.epoch = *((_QWORD *)v13 + 2);
    *(_OWORD *)&v16.value = v14;
    self = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeFromTimeToTime(&v18, &start, &v16);
    v15 = *(_OWORD *)&v18.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v18.start.value;
    *(_OWORD *)&retstr->var0.var3 = v15;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v18.duration.timescale;
  }
  return self;
}

- (NSArray)times
{
  NSArray *cached_times;
  void *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  __int128 v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  CMTime v12;

  cached_times = self->_cached_times;
  if (!cached_times)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((self->_times.__end_ - self->_times.__begin_) >> 3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    begin = self->_times.__begin_;
    for (i = self->_times.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
    {
      v7 = *(_OWORD *)begin;
      v12.epoch = *((_QWORD *)begin + 2);
      *(_OWORD *)&v12.value = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&v12));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    v9 = (NSArray *)objc_msgSend(v4, "copy");
    v10 = self->_cached_times;
    self->_cached_times = v9;

    cached_times = self->_cached_times;
  }
  return cached_times;
}

- (NSArray)cmtimes
{
  NSArray *cached_cmtimes;
  void *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  cached_cmtimes = self->_cached_cmtimes;
  if (!cached_cmtimes)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((self->_times.__end_ - self->_times.__begin_) >> 3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    begin = self->_times.__begin_;
    for (i = self->_times.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
    {
      objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", begin, "{?=qiIq}");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "addObject:", v7);

    }
    v8 = (NSArray *)objc_msgSend(v4, "copy");
    v9 = self->_cached_cmtimes;
    self->_cached_cmtimes = v8;

    cached_cmtimes = self->_cached_cmtimes;
  }
  return cached_cmtimes;
}

- (unint64_t)count
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_times.__end_ - self->_times.__begin_) >> 3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtIndex:(SEL)a3
{
  uint64_t v4;
  unint64_t v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;

  v4 = *(_QWORD *)&self->var1;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((self->var3 - v4) >> 3);
  v6 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v4 + 24 * a4);
  if (v5 <= a4)
    v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x24BDC0D38];
  else
    v7 = v6;
  *retstr = *v7;
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)cached_times
{
  return self->_cached_times;
}

- (NSArray)cached_cmtimes
{
  return self->_cached_cmtimes;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_cached_cmtimes, 0);
  objc_storeStrong((id *)&self->_cached_times, 0);
  objc_storeStrong((id *)&self->_name, 0);
  begin = self->_times.__begin_;
  if (begin)
  {
    self->_times.__end_ = begin;
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
