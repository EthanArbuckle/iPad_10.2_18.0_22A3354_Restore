@implementation NUKeyframeSequence

- (NUKeyframeSequence)init
{
  NUKeyframeSequence *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUKeyframeSequence;
  result = -[NUKeyframeSequence init](&v3, sel_init);
  result->_interpolation = 0;
  result->_count = 0;
  return result;
}

- (NUKeyframeSequence)initWithInterpolation:(int64_t)a3 count:(unint64_t)a4 times:(id *)a5
{
  NUKeyframeSequence *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUKeyframeSequence;
  v8 = -[NUKeyframeSequence init](&v11, sel_init);
  v8->_interpolation = a3;
  v8->_count = a4;
  if (a4)
  {
    v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_calloc(a4, 0x18uLL, 0x1000040504FFAC1uLL);
    v8->_times = v9;
    v8->_ownsTimes = 1;
    memcpy(v9, a5, 24 * a4);
  }
  return v8;
}

- (NUKeyframeSequence)initWithKeyframeSequence:(id)a3
{
  _QWORD *v4;
  NUKeyframeSequence *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUKeyframeSequence;
  v5 = -[NUKeyframeSequence init](&v8, sel_init);
  v5->_interpolation = objc_msgSend(v4, "interpolation");
  v5->_count = objc_msgSend(v4, "count");
  if (v4)
    v6 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v4[2];
  else
    v6 = 0;
  v5->_times = v6;
  v5->_ownsTimes = 0;

  return v5;
}

- (void)dealloc
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *times;
  objc_super v4;

  times = self->_times;
  if (times && self->_ownsTimes)
    free(times);
  v4.receiver = self;
  v4.super_class = (Class)NUKeyframeSequence;
  -[NUKeyframeSequence dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  return self->_count;
}

- (int64_t)indexOfKeyframeAtOrBeforeTime:(id *)a3
{
  int64_t count;
  int64_t v5;
  int64_t v8;
  int v9;
  uint64_t v10;
  int64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v12;
  __int128 v13;
  uint64_t v15;
  char *v16;
  __int128 v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  CMTime time1;

  if ((a3->var2 & 1) == 0)
    return 0;
  if (!self->_times)
    return 0;
  count = self->_count;
  if (count < 2)
    return 0;
  v5 = count - 1;
  if ((unint64_t)count < 5)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 9;
    do
    {
      v10 = v5 - v8;
      if (v5 < v8)
        ++v10;
      v11 = v8 + (v10 >> 1);
      v12 = &self->_times[v11];
      v13 = *(_OWORD *)&v12->var0;
      time1.epoch = v12->var3;
      *(_OWORD *)&time1.value = v13;
      v18 = *a3;
      if (CMTimeCompare(&time1, (CMTime *)&v18) >= 1)
        v5 = v11;
      else
        v8 = v11;
    }
    while (v5 - v8 >= 4 && v9-- != 0);
  }
  if (v5 <= v8)
    v5 = v8;
  v15 = 24 * v8 + 24;
  while (v5 != v8)
  {
    ++v8;
    v16 = (char *)self->_times + v15;
    v17 = *(_OWORD *)v16;
    time1.epoch = *((_QWORD *)v16 + 2);
    *(_OWORD *)&time1.value = v17;
    v18 = *a3;
    v15 += 24;
    if (CMTimeCompare(&time1, (CMTime *)&v18) >= 1)
      return v8 - 1;
  }
  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOfKeyframeAtIndex:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  int64_t v7;
  uint64_t v8;

  if (self->var3)
  {
    v6 = self;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE count](self, "count");
    v7 = (int64_t)&self[-1].var3 + 7;
    if ((uint64_t)&self[-1].var3 + 7 >= a4)
      v7 = a4;
    v8 = v6->var3 + 24 * (v7 & ~(v7 >> 63));
  }
  else
  {
    v8 = MEMORY[0x1E0CA2E18];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v8;
  retstr->var3 = *(_QWORD *)(v8 + 16);
  return self;
}

- (uint64_t)interpolantAtTime:(uint64_t)a3@<X8>
{
  __int128 v4;
  void *v6;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  double v10;
  double v11;
  double v12;
  int8x16_t v13;
  int8x16_t v14;
  int64x2_t v15;
  int64x2_t v16;
  uint64_t v17;
  __int128 v18;
  int64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  CMTimeRange time2;
  CMTime start;
  CMTime duration;
  CMTimeRange toRange;
  CMTime rhs;
  CMTimeRange time1;
  CMTime lhs;
  CMTime v33;

  if ((*((_BYTE *)a2 + 12) & 1) == 0)
    goto LABEL_2;
  v6 = (void *)result;
  result = objc_msgSend((id)result, "interpolation");
  if (result == 2)
  {
    *(_OWORD *)&time1.start.value = *a2;
    time1.start.epoch = *((_QWORD *)a2 + 2);
    v7 = objc_msgSend(v6, "indexOfKeyframeAtOrBeforeTime:", &time1);
    memset(&time1, 0, 24);
    objc_msgSend(v6, "timeOfKeyframeAtIndex:", v7);
    memset(&time2, 0, 24);
    objc_msgSend(v6, "timeOfKeyframeAtIndex:", v7 + 1);
    if (v7 || (v33 = time1.start, lhs = *(CMTime *)a2, result = CMTimeCompare(&v33, &lhs), (int)result < 1))
    {
      result = objc_msgSend(v6, "count");
      if (v7 + 1 < result)
      {
        v8.i64[0] = 0;
        v9.i64[0] = v7;
        v24 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v9, v8).i64[0], 0);
        memset(&v33, 0, sizeof(v33));
        lhs = time2.start;
        rhs = time1.start;
        CMTimeSubtract(&v33, &lhs, &rhs);
        memset(&lhs, 0, sizeof(lhs));
        rhs = *(CMTime *)a2;
        start = time1.start;
        CMTimeSubtract(&lhs, &rhs, &start);
        v10 = (double)v33.value / (double)v33.timescale;
        v11 = (double)lhs.value / (double)lhs.timescale / v10;
        v12 = 1.0 - v11;
        *(double *)v13.i64 = (v11 * 2.0 + 1.0) * (v12 * v12);
        *(double *)&v13.i64[1] = v10 * (v11 * (v12 * v12));
        v25 = vbslq_s8(v24, (int8x16_t)v13.u64[0], v13);
        *(double *)v14.i64 = v11 * v11 * (v11 * -2.0 + 3.0);
        *(double *)&v14.i64[1] = v10 * -(v11 * v11 * (1.0 - v11));
        v23 = v14;
        result = objc_msgSend(v6, "count");
        v15.i64[0] = v7 + 2;
        v16.i64[0] = result;
        *(int8x16_t *)(a3 + 16) = vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_s64(v16, v15).i64[0], 0), v23, (int8x16_t)v23.u64[0]);
        v4 = (__int128)v25;
        goto LABEL_3;
      }
    }
    goto LABEL_2;
  }
  if (result != 1)
  {
    if (result)
      return result;
LABEL_2:
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    v4 = xmmword_1A671A2A0;
LABEL_3:
    *(_OWORD *)a3 = v4;
    return result;
  }
  *(_OWORD *)&time1.start.value = *a2;
  time1.start.epoch = *((_QWORD *)a2 + 2);
  v17 = objc_msgSend(v6, "indexOfKeyframeAtOrBeforeTime:", &time1);
  memset(&v33, 0, sizeof(v33));
  objc_msgSend(v6, "timeOfKeyframeAtIndex:", v17);
  if (!v17)
  {
    time1.start = v33;
    *(_OWORD *)&time2.start.value = *a2;
    time2.start.epoch = *((_QWORD *)a2 + 2);
    result = CMTimeCompare(&time1.start, &time2.start);
    if ((int)result >= 1)
      goto LABEL_2;
  }
  memset(&lhs, 0, sizeof(lhs));
  objc_msgSend(v6, "timeOfKeyframeAtIndex:", v17 + 1);
  time1.start = v33;
  time2.start = lhs;
  result = CMTimeCompare(&time1.start, &time2.start);
  if ((_DWORD)result)
  {
    memset(&time1, 0, sizeof(time1));
    time2.start = v33;
    rhs = lhs;
    CMTimeRangeFromTimeToTime(&time1, &time2.start, &rhs);
    memset(&rhs, 0, sizeof(rhs));
    CMTimeMake(&duration, 1, 1);
    *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68];
    time2.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    CMTimeRangeMake(&toRange, &time2.start, &duration);
    v18 = *a2;
    start.epoch = *((_QWORD *)a2 + 2);
    time2 = time1;
    *(_OWORD *)&start.value = v18;
    result = (uint64_t)CMTimeMapTimeFromRangeToRange(&rhs, &start, &time2, &toRange);
    v19.i64[0] = rhs.timescale - rhs.value;
    v19.i64[1] = rhs.value;
    v20 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)rhs.timescale), 0);
    v21 = vdivq_f64(vcvtq_f64_s64(v19), v20);
    v22 = vdivq_f64((float64x2_t)0, v20);
  }
  else
  {
    v21 = (float64x2_t)xmmword_1A671A2A0;
    v22 = 0uLL;
  }
  *(float64x2_t *)a3 = v21;
  *(float64x2_t *)(a3 + 16) = v22;
  return result;
}

- (int64_t)interpolation
{
  return self->_interpolation;
}

@end
