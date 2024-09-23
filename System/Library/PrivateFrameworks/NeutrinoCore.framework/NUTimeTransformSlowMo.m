@implementation NUTimeTransformSlowMo

- (NUTimeTransformSlowMo)initWithSlowMoBeginTime:(id *)a3 endTime:(id *)a4 rate:(float)a5 assetDuration:(double)a6
{
  void *v10;
  id v11;
  void *v12;
  NUTimeTransformSlowMo *v13;
  NSObject *v15;
  void *v16;
  id v17;
  CMTime rhs;
  CMTime duration;
  CMTimeRange v20;
  CMTimeRange lhs;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(&v20, 0, sizeof(v20));
  lhs.start = (CMTime)*a4;
  rhs = *(CMTime *)a3;
  CMTimeSubtract(&duration, &lhs.start, &rhs);
  lhs.start = (CMTime)*a3;
  CMTimeRangeMake(&v20, &lhs.start, &duration);
  v17 = 0;
  lhs = v20;
  +[NUSlowMotionUtilities timeMapperForAssetDuration:rate:range:error:](NUSlowMotionUtilities, "timeMapperForAssetDuration:rate:range:error:", &lhs, &v17, a6, COERCE_DOUBLE(__PAIR64__(HIDWORD(v20.start.epoch), LODWORD(a5))));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v11)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_147_17062);
    v12 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      v15 = v12;
      objc_msgSend(v11, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(lhs.start.value) = 138412290;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v16;
      _os_log_debug_impl(&dword_1A6553000, v15, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&lhs, 0xCu);

    }
  }
  v13 = -[NUTimeTransformSlowMo initWithSlowMoTimeMapper:isInverse:](self, "initWithSlowMoTimeMapper:isInverse:", v10, 0);

  return v13;
}

- (NUTimeTransformSlowMo)initWithSlowMoTimeMapper:(id)a3 isInverse:(BOOL)a4
{
  id v7;
  NUTimeTransformSlowMo *v8;
  NUTimeTransformSlowMo *v9;
  NUSlowMotionTimeRangeMapper **p_timeMapper;
  NUTimeTransformSlowMo *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NUTimeTransformSlowMo;
  v8 = -[NUTimeTransformSlowMo init](&v13, sel_init);
  v9 = v8;
  if (v8
    && (v8->_isInverse = a4,
        p_timeMapper = &v8->_timeMapper,
        objc_storeStrong((id *)&v8->_timeMapper, a3),
        !*p_timeMapper))
  {
    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (NUTimeTransformSlowMo)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUTimeTransformSlowMo init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 717, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (id)inverseTransform
{
  NUTimeTransformSlowMo *v2;

  v2 = self;
  return -[NUTimeTransformSlowMo initWithSlowMoTimeMapper:isInverse:](v2, "initWithSlowMoTimeMapper:isInverse:", v2->_timeMapper, !v2->_isInverse);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  NUSlowMotionTimeRangeMapper *timeMapper;
  Float64 Seconds;
  float v7;
  Float64 v8;
  CMTime v10;

  timeMapper = self->_timeMapper;
  if (self->_isInverse)
  {
    v10 = *(CMTime *)a4;
    Seconds = CMTimeGetSeconds(&v10);
    *(float *)&Seconds = Seconds;
    -[NUSlowMotionTimeRangeMapper originalTimeForScaledTime:](timeMapper, "originalTimeForScaledTime:", Seconds);
  }
  else
  {
    v10 = *(CMTime *)a4;
    v8 = CMTimeGetSeconds(&v10);
    *(float *)&v8 = v8;
    -[NUSlowMotionTimeRangeMapper scaledTimeForOriginalTime:](timeMapper, "scaledTimeForOriginalTime:", v8);
  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v7, 1000000);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUTimeTransformSlowMo timeMapper=%@ isInverse=%d"), self->_timeMapper, self->_isInverse);
}

- (unint64_t)hash
{
  return (0x224CB1CC7EE42FLL * (uint64_t)self->_timeMapper) ^ (0x107A5804BC1A2BLL * self->_isInverse);
}

- (BOOL)isEqual:(id)a3
{
  NUTimeTransformSlowMo *v4;
  NUTimeTransformSlowMo *v5;
  NUSlowMotionTimeRangeMapper *timeMapper;
  NUSlowMotionTimeRangeMapper *v7;
  BOOL v8;
  _BOOL4 isInverse;

  v4 = (NUTimeTransformSlowMo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timeMapper = self->_timeMapper;
      -[NUTimeTransformSlowMo timeMapper](v5, "timeMapper");
      v7 = (NUSlowMotionTimeRangeMapper *)objc_claimAutoreleasedReturnValue();
      if (timeMapper == v7)
      {
        isInverse = self->_isInverse;
        v8 = isInverse == -[NUTimeTransformSlowMo isInverse](v5, "isInverse");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isInverse
{
  return self->_isInverse;
}

- (NUSlowMotionTimeRangeMapper)timeMapper
{
  return self->_timeMapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeMapper, 0);
}

@end
