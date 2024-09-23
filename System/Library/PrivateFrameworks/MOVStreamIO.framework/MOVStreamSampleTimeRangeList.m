@implementation MOVStreamSampleTimeRangeList

- (MOVStreamSampleTimeRangeList)initWithTimeRanges:(const void *)a3
{
  MOVStreamSampleTimeRangeList *v4;
  char *p_ranges;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOVStreamSampleTimeRangeList;
  v4 = -[MOVStreamSampleTimeRangeList init](&v8, sel_init);
  p_ranges = (char *)&v4->_ranges;
  if (v4)
    v6 = p_ranges == a3;
  else
    v6 = 1;
  if (!v6)
    std::vector<CMTimeRange>::__assign_with_size[abi:ne180100]<CMTimeRange*,CMTimeRange*>(p_ranges, *(char **)a3, *((_QWORD *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4));
  return v4;
}

- (MOVStreamSampleTimeRangeList)initWithTimeRange:(id *)a3
{
  _OWORD *v5;
  __int128 v6;
  MOVStreamSampleTimeRangeList *v7;
  void *__p;
  void *v10;
  _OWORD *v11;

  v5 = operator new(0x30uLL);
  v10 = v5 + 3;
  v11 = v5 + 3;
  v6 = *(_OWORD *)&a3->var0.var3;
  *v5 = *(_OWORD *)&a3->var0.var0;
  v5[1] = v6;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  __p = v5;
  v7 = -[MOVStreamSampleTimeRangeList initWithTimeRanges:](self, "initWithTimeRanges:", &__p);
  if (__p)
  {
    v10 = __p;
    operator delete(__p);
  }
  return v7;
}

- (MOVStreamSampleTimeRangeList)init
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

- (BOOL)containsTimeRange:(id *)a3
{
  CMTimeFlags v4;
  CMTimeEpoch v5;
  CMTimeValue v6;
  CMTimeScale v7;
  CMTimeFlags v8;
  uint64_t v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v11;
  unint64_t v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  int32_t v17;
  CMTimeValue v18;
  BOOL result;
  __int128 v20;
  uint64_t v21;
  CMTimeScale v22;
  CMTimeValue v23;
  CMTimeEpoch v24;
  CMTimeRange otherRange;
  CMTimeRange v26;
  CMTime time2;
  CMTimeRange range;
  CMTime time1;
  CMTimeValue v30;
  CMTimeScale v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30 = *MEMORY[0x24BDC0D70];
  v4 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 12);
  v31 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 16);
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 24);
  v7 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 32);
  v8 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 36);
  v9 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 40);
  begin = self->_ranges.__begin_;
  v11 = self->_ranges.__end_ - begin;
  if (v11)
  {
    v21 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 40);
    v22 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 32);
    v23 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 24);
    v24 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 16);
    v13 = 0xAAAAAAAAAAAAAAABLL * (v11 >> 4);
    do
    {
      v14 = (_OWORD *)((char *)begin + 48 * (v13 >> 1));
      v15 = *v14;
      v16 = v14[2];
      *(_OWORD *)&range.start.epoch = v14[1];
      *(_OWORD *)&range.duration.timescale = v16;
      *(_OWORD *)&range.start.value = v15;
      CMTimeRangeGetEnd(&time1, &range);
      time2 = (CMTime)a3->var0;
      v17 = CMTimeCompare(&time1, &time2);
      if (v17 < 0)
        v13 += ~(v13 >> 1);
      else
        v13 >>= 1;
      if (v17 < 0)
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v14 + 3);
    }
    while (v13);
    v6 = v23;
    v5 = v24;
    v7 = v22;
    v9 = v21;
    if (begin != self->_ranges.__end_)
    {
      v18 = *(_QWORD *)begin;
      v4 = *((_DWORD *)begin + 3);
      v31 = *((_DWORD *)begin + 2);
      v30 = v18;
      v5 = *((_QWORD *)begin + 2);
      v6 = *((_QWORD *)begin + 3);
      v7 = *((_DWORD *)begin + 8);
      v8 = *((_DWORD *)begin + 9);
      v9 = *((_QWORD *)begin + 5);
    }
  }
  result = 0;
  if ((v4 & 1) != 0 && (v8 & 1) != 0 && !v9 && (v6 & 0x8000000000000000) == 0)
  {
    v26.start.value = v30;
    v26.start.timescale = v31;
    v26.start.flags = v4;
    v26.start.epoch = v5;
    v26.duration.value = v6;
    v26.duration.timescale = v7;
    v26.duration.flags = v8;
    v26.duration.epoch = 0;
    v20 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&otherRange.start.epoch = v20;
    *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    return CMTimeRangeContainsTimeRange(&v26, &otherRange) != 0;
  }
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  uint64_t v4;
  __int128 v5;
  int64_t var3;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CMTimeRange v13;
  CMTimeRange range;
  CMTimeRange v15;

  v4 = MEMORY[0x24BDC0D70];
  v5 = *(_OWORD *)(MEMORY[0x24BDC0D70] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x24BDC0D70];
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v4 + 32);
  v7 = *(__int128 **)&self->var0.var1;
  var3 = self->var0.var3;
  if ((__int128 *)var3 != v7)
  {
    v8 = *v7;
    v9 = v7[2];
    *(_OWORD *)&range.start.epoch = v7[1];
    *(_OWORD *)&range.duration.timescale = v9;
    *(_OWORD *)&range.start.value = v8;
    v10 = *(_OWORD *)(var3 - 48);
    v11 = *(_OWORD *)(var3 - 16);
    *(_OWORD *)&v13.start.epoch = *(_OWORD *)(var3 - 32);
    *(_OWORD *)&v13.duration.timescale = v11;
    *(_OWORD *)&v13.start.value = v10;
    self = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeGetUnion(&v15, &range, &v13);
    v12 = *(_OWORD *)&v15.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v15.start.value;
    *(_OWORD *)&retstr->var0.var3 = v12;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v15.duration.timescale;
  }
  return self;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeAtIndex:(SEL)a3
{
  uint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  __int128 v8;

  v4 = *(_QWORD *)&self->var0.var1;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((self->var0.var3 - v4) >> 4);
  v6 = (_OWORD *)(v4 + 48 * a4);
  if (v5 <= a4)
    v7 = (_OWORD *)MEMORY[0x24BDC0D70];
  else
    v7 = v6;
  v8 = v7[1];
  *(_OWORD *)&retstr->var0.var0 = *v7;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = v7[2];
  return self;
}

- (int64_t)indexOfTimeRangeAtTime:(id *)a3
{
  CMTimeFlags v5;
  CMTimeEpoch v6;
  CMTimeValue v7;
  CMTimeScale v8;
  CMTimeFlags v9;
  uint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  int32_t v17;
  int64_t result;
  uint64_t v19;
  CMTimeScale v20;
  CMTimeValue v21;
  CMTimeEpoch v22;
  CMTime time;
  CMTimeRange v24;
  CMTime duration;
  CMTime start;
  CMTimeRange v27;
  CMTime time2;
  CMTimeRange range;
  CMTime time1;
  CMTimeValue v31;
  CMTimeScale v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  memset(&v27, 0, sizeof(v27));
  start = *(CMTime *)a3;
  CMTimeMake(&duration, 1, 0x7FFFFFFF);
  CMTimeRangeMake(&v27, &start, &duration);
  v31 = *MEMORY[0x24BDC0D70];
  v5 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 12);
  v32 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 24);
  v8 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 32);
  v9 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 36);
  v10 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 40);
  begin = self->_ranges.__begin_;
  end = self->_ranges.__end_;
  if (end != begin)
  {
    v19 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 40);
    v20 = *(_DWORD *)(MEMORY[0x24BDC0D70] + 32);
    v21 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 24);
    v22 = *(_QWORD *)(MEMORY[0x24BDC0D70] + 16);
    v13 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 4);
    do
    {
      v14 = (_OWORD *)((char *)begin + 48 * (v13 >> 1));
      v15 = *v14;
      v16 = v14[2];
      *(_OWORD *)&range.start.epoch = v14[1];
      *(_OWORD *)&range.duration.timescale = v16;
      *(_OWORD *)&range.start.value = v15;
      CMTimeRangeGetEnd(&time1, &range);
      time2 = v27.start;
      v17 = CMTimeCompare(&time1, &time2);
      if (v17 < 0)
        v13 += ~(v13 >> 1);
      else
        v13 >>= 1;
      if (v17 < 0)
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v14 + 3);
    }
    while (v13);
    end = begin;
    begin = self->_ranges.__end_;
    v7 = v21;
    v6 = v22;
    v8 = v20;
    v10 = v19;
  }
  if (begin != end)
  {
    v31 = *(_QWORD *)end;
    v5 = *((_DWORD *)end + 3);
    v32 = *((_DWORD *)end + 2);
    v6 = *((_QWORD *)end + 2);
    v7 = *((_QWORD *)end + 3);
    v8 = *((_DWORD *)end + 8);
    v9 = *((_DWORD *)end + 9);
    v10 = *((_QWORD *)end + 5);
  }
  if ((v5 & 1) == 0)
    return -1;
  result = -1;
  if ((v9 & 1) != 0 && !v10 && (v7 & 0x8000000000000000) == 0)
  {
    v24.start.value = v31;
    v24.start.timescale = v32;
    v24.start.flags = v5;
    v24.start.epoch = v6;
    v24.duration.value = v7;
    v24.duration.timescale = v8;
    v24.duration.flags = v9;
    v24.duration.epoch = 0;
    time = (CMTime)*a3;
    if (!CMTimeRangeContainsTime(&v24, &time))
      return -1;
    return 0xAAAAAAAAAAAAAAABLL * ((end - self->_ranges.__begin_) >> 4);
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)cached_ranges
{
  return self->_cached_ranges;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_cached_ranges, 0);
  objc_storeStrong((id *)&self->_name, 0);
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
