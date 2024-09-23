@implementation _GEOThrottlerShort

- (double)timeUntilReset
{
  double v3;
  double v4;
  double timeWindow;
  double v6;
  BOOL v7;
  double result;

  if (self->_lastRequestTimes.__end_ == self->_lastRequestTimes.__begin_)
    return 0.0;
  GEOGetMonotonicTime();
  v4 = (double)(uint64_t)v3 - (double)*((uint64_t *)self->_lastRequestTimes.__begin_ + self->_currentIndex);
  timeWindow = self->_timeWindow;
  v6 = timeWindow - v4;
  v7 = v4 < timeWindow;
  result = 0.0;
  if (v7)
    return v6;
  return result;
}

- (BOOL)isExpired
{
  Timestamp *begin;
  uint64_t v3;
  uint64_t v5;
  uint64_t currentIndex;
  uint64_t v7;
  uint64_t v8;
  double v9;

  begin = self->_lastRequestTimes.__begin_;
  v3 = self->_lastRequestTimes.__end_ - begin;
  if (!v3)
    return 1;
  v5 = v3 >> 3;
  currentIndex = self->_currentIndex;
  if (!(_DWORD)currentIndex)
    currentIndex = v5;
  v7 = currentIndex;
  while (1)
  {
    --v7;
    v8 = *((_QWORD *)begin + v7);
    if (v8)
      break;
    if (!v7)
      v7 = v5;
    if (v7 == currentIndex)
    {
      v8 = 0x8000000000000000;
      break;
    }
  }
  GEOGetMonotonicTime();
  return v9 - (double)v8 > self->_timeWindow * 1.5;
}

- (unint64_t)remainingEntries
{
  double v3;
  Timestamp *begin;
  Timestamp *end;
  unint64_t result;
  double v7;
  uint64_t v8;

  if (self->_lastRequestTimes.__end_ == self->_lastRequestTimes.__begin_)
    return -1;
  GEOGetMonotonicTime();
  begin = self->_lastRequestTimes.__begin_;
  end = self->_lastRequestTimes.__end_;
  if (begin == end)
    return 0;
  result = 0;
  v7 = (double)(uint64_t)v3;
  do
  {
    v8 = *(_QWORD *)begin;
    begin = (Timestamp *)((char *)begin + 8);
    if (self->_timeWindow <= v7 - (double)v8)
      ++result;
  }
  while (begin != end);
  return result;
}

- (BOOL)addRequestTimestamp
{
  double v3;
  uint64_t currentIndex;
  Timestamp *begin;

  if (self->_lastRequestTimes.__end_ == self->_lastRequestTimes.__begin_)
    return 1;
  GEOGetMonotonicTime();
  currentIndex = self->_currentIndex;
  begin = self->_lastRequestTimes.__begin_;
  if ((double)(uint64_t)v3 - (double)*((uint64_t *)begin + currentIndex) >= self->_timeWindow)
  {
    *((_QWORD *)begin + currentIndex) = (uint64_t)v3;
    self->_currentIndex = (currentIndex + 1)
                        % (unint64_t)((self->_lastRequestTimes.__end_ - begin) >> 3);
    return 1;
  }
  return 0;
}

- (id)captureState
{
  return 0;
}

- (_GEOThrottlerShort)initWithKeyPath:(id)a3 requestCount:(unint64_t)a4 interval:(double)a5 savedState:(id)a6
{
  id v10;
  id v11;
  _GEOThrottlerShort *v12;
  uint64_t v13;
  NSString *keyPath;
  Timestamp *begin;
  Timestamp *end;
  int64_t v17;
  unint64_t v18;
  Timestamp *value;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  Timestamp *v24;
  uint64_t v25;
  Timestamp *v26;
  objc_super v28;

  v10 = a3;
  v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_GEOThrottlerShort;
  v12 = -[_GEOThrottlerShort init](&v28, sel_init);
  if (!v12)
    goto LABEL_20;
  v13 = objc_msgSend(v10, "copy");
  keyPath = v12->_keyPath;
  v12->_keyPath = (NSString *)v13;

  v12->_timeWindow = a5;
  begin = v12->_lastRequestTimes.__begin_;
  end = v12->_lastRequestTimes.__end_;
  v17 = end - begin;
  v18 = (end - begin) >> 3;
  if (a4 <= v18)
  {
    if (a4 >= v18)
      goto LABEL_20;
    v26 = (Timestamp *)((char *)begin + 8 * a4);
LABEL_17:
    v12->_lastRequestTimes.__end_ = v26;
    goto LABEL_20;
  }
  value = v12->_lastRequestTimes.__end_cap_.__value_;
  if (a4 - v18 <= (value - end) >> 3)
  {
    memset_pattern16(v12->_lastRequestTimes.__end_, &unk_189CD7CF0, ((8 * a4 - v17 - 8) & 0xFFFFFFFFFFFFFFF8) + 8);
    v26 = (Timestamp *)((char *)end + 8 * (a4 - v18));
    goto LABEL_17;
  }
  if (a4 >> 61)
    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
  v20 = value - begin;
  v21 = v20 >> 2;
  if (v20 >> 2 <= a4)
    v21 = a4;
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
    v22 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v22 = v21;
  if (v22 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v23 = (char *)operator new(8 * v22);
  v24 = (Timestamp *)&v23[8 * v18];
  memset_pattern16(v24, &unk_189CD7CF0, ((8 * a4 - v17 - 8) & 0xFFFFFFFFFFFFFFF8) + 8);
  while (end != begin)
  {
    v25 = *((_QWORD *)end - 1);
    end = (Timestamp *)((char *)end - 8);
    *((_QWORD *)v24 - 1) = v25;
    v24 = (Timestamp *)((char *)v24 - 8);
  }
  v12->_lastRequestTimes.__begin_ = v24;
  v12->_lastRequestTimes.__end_ = (Timestamp *)&v23[8 * a4];
  v12->_lastRequestTimes.__end_cap_.__value_ = (Timestamp *)&v23[8 * v22];
  if (begin)
    operator delete(begin);
LABEL_20:

  return v12;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  Timestamp *begin;

  begin = self->_lastRequestTimes.__begin_;
  if (begin)
  {
    self->_lastRequestTimes.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (unsigned)maxReqCount
{
  return (unint64_t)(self->_lastRequestTimes.__end_ - self->_lastRequestTimes.__begin_) >> 3;
}

- (id)userInfoForError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("maxRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (self->_lastRequestTimes.__end_ - self->_lastRequestTimes.__begin_) >> 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("windowSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeWindow);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("timeUntilReset");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[_GEOThrottlerShort timeUntilReset](self, "timeUntilReset");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  v10[3] = CFSTR("short");
  v9[3] = CFSTR("intervalType");
  v9[4] = CFSTR("throttler.keyPath");
  v10[4] = self->_keyPath;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  double v5;
  Timestamp *end;
  Timestamp *begin;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" interval: %fs"), *(_QWORD *)&self->_timeWindow);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetMonotonicTime();
  begin = self->_lastRequestTimes.__begin_;
  end = self->_lastRequestTimes.__end_;
  if (end != begin)
  {
    v8 = 0;
    v9 = 0;
    v10 = (end - begin) >> 3;
    v11 = (double)(uint64_t)v5;
    do
    {
      v12 = *((_QWORD *)begin + (v8 + v10 + self->_currentIndex) % v10);
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%fs"), (double)v12 - v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        begin = self->_lastRequestTimes.__begin_;
        end = self->_lastRequestTimes.__end_;
      }
      ++v9;
      v10 = (end - begin) >> 3;
      --v8;
    }
    while (v9 < v10);
  }
  objc_msgSend(v3, "appendString:", CFSTR(" ages: {"));
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v14);

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return (NSString *)v3;
}

+ (BOOL)stateIsExpired:(id)a3
{
  return 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (double)timeWindow
{
  return self->_timeWindow;
}

@end
