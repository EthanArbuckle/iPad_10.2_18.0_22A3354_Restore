@implementation NUHistogram

- (NUHistogram)init
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21352);
  v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_21352);
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_21352);
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHistogram init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 33, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v17, v18, v19, v20, v16);
}

- (NUHistogram)initWithBinCount:(int64_t)a3 range:(id)a4
{
  double var1;
  double var0;
  NUHistogram *v7;
  double *v8;
  uint64_t value;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;
  _BYTE buf[12];
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "count > 0");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v24;
        v38 = 2114;
        v39 = v26;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v27 = "count > 0";
    v28 = 38;
LABEL_22:

    _NUAssertFailHandler((uint64_t)"-[NUHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", v28, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)v27);
  }
  var1 = a4.var1;
  var0 = a4.var0;
  if (a4.var0 >= a4.var1)
  {
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "range.min < range.max");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v21)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v29;
        v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v27 = "range.min < range.max";
    v28 = 39;
    goto LABEL_22;
  }
  v36.receiver = self;
  v36.super_class = (Class)NUHistogram;
  v7 = -[NUHistogram init](&v36, sel_init);
  v8 = (double *)operator new();
  *v8 = var0;
  v8[1] = var1;
  *(_QWORD *)buf = 0;
  std::vector<long>::vector((_QWORD *)v8 + 2, a3, buf);
  v8[5] = 0.0;
  value = (uint64_t)v7->_histogram.__ptr_.__value_;
  v7->_histogram.__ptr_.__value_ = v8;
  if (value)
    std::default_delete<NU::Histogram<long,double>>::operator()[abi:ne180100](value);
  return v7;
}

- (NUHistogram)initWithHistogram:(id)a3
{
  _QWORD *v4;
  NUHistogram *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t value;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v17;
        v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram initWithHistogram:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 51, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"other != nil");
  }
  v24.receiver = self;
  v24.super_class = (Class)NUHistogram;
  v5 = -[NUHistogram init](&v24, sel_init);
  v6 = operator new();
  v7 = v4[1];
  *(_OWORD *)v6 = *(_OWORD *)v7;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>((_QWORD *)(v6 + 16), *(const void **)(v7 + 16), *(_QWORD *)(v7 + 24), (uint64_t)(*(_QWORD *)(v7 + 24) - *(_QWORD *)(v7 + 16)) >> 3);
  *(_QWORD *)(v6 + 40) = *(_QWORD *)(v7 + 40);
  value = (uint64_t)v5->_histogram.__ptr_.__value_;
  v5->_histogram.__ptr_.__value_ = (void *)v6;
  if (value)
    std::default_delete<NU::Histogram<long,double>>::operator()[abi:ne180100](value);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NUHistogram initWithHistogram:](+[NUMutableHistogram allocWithZone:](NUMutableHistogram, "allocWithZone:", a3), "initWithHistogram:", self);
}

- (int64_t)binCount
{
  return (uint64_t)(*((_QWORD *)self->_histogram.__ptr_.__value_ + 3) - *((_QWORD *)self->_histogram.__ptr_.__value_ + 2)) >> 3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  double *value;
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  value = (double *)self->_histogram.__ptr_.__value_;
  v3 = *value;
  v4 = value[1];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (int64_t)sampleCount
{
  return *((_QWORD *)self->_histogram.__ptr_.__value_ + 5);
}

- (const)values
{
  return (const int64_t *)*((_QWORD *)self->_histogram.__ptr_.__value_ + 2);
}

- (double)percentile:(double)a3
{
  double *value;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v16;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0 || a3 > 1.0)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "p >= 0.0 && p <= 1.0");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram percentile:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 94, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"p >= 0.0 && p <= 1.0");
  }
  value = (double *)self->_histogram.__ptr_.__value_;
  if (a3 <= 0.0)
    return NU::Histogram<long,double>::minimum((uint64_t)value);
  if (a3 >= 1.0)
    return NU::Histogram<long,double>::maximum((uint64_t)value);
  v5 = *((_QWORD *)value + 5);
  if (!v5)
    return *value + a3 * (value[1] - *value);
  v6 = *((_QWORD *)value + 2);
  v7 = *((_QWORD *)value + 3) - v6;
  if (v7 < 1)
    return *value;
  v8 = 0;
  v9 = 0;
  v10 = (double)v5;
  v11 = llround((double)v5 * a3);
  v12 = v7 >> 3;
  if (v7 >> 3 <= 1)
    v13 = 1;
  else
    v13 = v7 >> 3;
  while (1)
  {
    v14 = *(_QWORD *)(v6 + 8 * v9);
    if (v14 + v8 >= v11)
      break;
    ++v9;
    v8 += v14;
    if (v13 == v9)
      return *value;
  }
  v16 = (value[1] - *value) / (double)v12;
  return *value + (double)v9 * v16 + -((double)v8 - a3 * v10) / (double)v14 * v16;
}

- (double)threshold:(double)a3
{
  double *value;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  value = (double *)self->_histogram.__ptr_.__value_;
  v4 = 1.0;
  if (*value <= a3)
  {
    v5 = value[1];
    v4 = 0.0;
    if (v5 > a3)
    {
      v6 = *((_QWORD *)value + 2);
      v7 = (*((_QWORD *)value + 3) - v6) >> 3;
      v8 = vcvtmd_s64_f64((a3 - *value) / ((v5 - *value) / (double)v7));
      v9 = 0.0;
      v10 = v7 <= v8;
      v11 = v7 - v8;
      if (!v10)
      {
        v12 = 0;
        v13 = (uint64_t *)(v6 + 8 * v8);
        do
        {
          v14 = *v13++;
          v12 += v14;
          --v11;
        }
        while (v11);
        v9 = (double)v12;
      }
      return v9 / (double)*((uint64_t *)value + 5);
    }
  }
  return v4;
}

- (double)minimum
{
  return NU::Histogram<long,double>::minimum((uint64_t)self->_histogram.__ptr_.__value_);
}

- (double)maximum
{
  return NU::Histogram<long,double>::maximum((uint64_t)self->_histogram.__ptr_.__value_);
}

- (double)median
{
  double result;

  -[NUHistogram percentile:](self, "percentile:", 0.5);
  return result;
}

- (double)mode
{
  _QWORD *value;
  double v3;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  uint64_t (*v11)();
  void *v12;
  uint64_t v13;
  uint64_t v14;

  value = self->_histogram.__ptr_.__value_;
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x4012000000;
  v10 = __Block_byref_object_copy__21355;
  v11 = __Block_byref_object_dispose__21356;
  v12 = &unk_1A674C0CB;
  v13 = value[1];
  v14 = 0;
  NU::Histogram<long,double>::edgeClamp((uint64_t)value);
  v5[4] = &v7;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___ZNK2NU9HistogramIldE4modeEv_block_invoke;
  v5[3] = &unk_1E5063500;
  NU::Histogram<long,double>::findAllModes((uint64_t)value, (uint64_t *)&v6, v5);
  v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)_samplerForSampleMode:(int64_t)a3
{
  _QWORD *value;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  _QWORD *v14;
  uint64_t v15;

  switch(a3)
  {
    case 0:
      value = self->_histogram.__ptr_.__value_;
      v4 = (uint64_t)(value[3] - value[2]) >> 3;
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v5 = ___ZNK2NU9HistogramIldE9zeroClampEv_block_invoke;
      goto LABEL_7;
    case 1:
      NU::Histogram<long,double>::edgeClamp((uint64_t)self->_histogram.__ptr_.__value_);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      value = self->_histogram.__ptr_.__value_;
      v4 = (uint64_t)(value[3] - value[2]) >> 3;
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v5 = ___ZNK2NU9HistogramIldE6mirrorEv_block_invoke;
      goto LABEL_7;
    case 3:
      value = self->_histogram.__ptr_.__value_;
      v4 = (uint64_t)(value[3] - value[2]) >> 3;
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v5 = ___ZNK2NU9HistogramIldE6repeatEv_block_invoke;
LABEL_7:
      v12 = v5;
      v13 = &__block_descriptor_48_e8_q16__0q8l;
      v14 = value;
      v15 = v4;
      v7 = MEMORY[0x1A85C1564](&v10, a2);
LABEL_8:
      v6 = (void *)v7;
      break;
    default:
      v6 = 0;
      break;
  }
  v8 = (void *)MEMORY[0x1A85C1564](v6, a2);

  return v8;
}

- (id)modalityAnalysisWithLimit:(int64_t)a3 sampleMode:(int64_t)a4
{
  return -[NUHistogram modalityAnalysisWithLimit:locality:sensitivity:sampleMode:](self, "modalityAnalysisWithLimit:locality:sensitivity:sampleMode:", a3, a4, 0.05, 0.1);
}

- (id)modalityAnalysisWithLimit:(int64_t)a3 locality:(double)a4 sensitivity:(double)a5 sampleMode:(int64_t)a6
{
  _QWORD *value;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  _BYTE *v23;
  int64_t v24;
  char *v25;
  char *v26;
  int64_t v27;
  void *v28;
  double *v29;
  void *v30;
  NSObject *v32;
  void *v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  __n128 (*v81)(__n128 *, __n128 *);
  void (*v82)(uint64_t);
  void *v83;
  void *v84;
  char *v85;
  char *v86;
  _BYTE buf[24];
  void *v88;
  uint64_t *v89;
  _QWORD *v90;
  void *__p;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id *v95;
  unint64_t v96;
  int64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    NUAssertLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "limit > 0");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v55;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram modalityAnalysisWithLimit:locality:sensitivity:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 150, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"limit > 0");
  }
  if (a4 <= 0.0 || a4 > 1.0)
  {
    NUAssertLogger();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "0.0 < locality && locality <= 1.0");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v40;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v62;
        _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram modalityAnalysisWithLimit:locality:sensitivity:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 151, CFSTR("Invalid parameter not satisfying: %s"), v63, v64, v65, v66, (uint64_t)"0.0 < locality && locality <= 1.0");
  }
  if (a5 <= 0.0 || a5 > 1.0)
  {
    NUAssertLogger();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "0.0 < sensitivity && sensitivity <= 1.0");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v47;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v67;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v69;
        _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v52;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram modalityAnalysisWithLimit:locality:sensitivity:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 152, CFSTR("Invalid parameter not satisfying: %s"), v70, v71, v72, v73, (uint64_t)"0.0 < sensitivity && sensitivity <= 1.0");
  }
  -[NUHistogram _samplerForSampleMode:](self, "_samplerForSampleMode:", a6);
  v74 = (id)objc_claimAutoreleasedReturnValue();
  value = self->_histogram.__ptr_.__value_;
  v78 = 0;
  v79 = &v78;
  v80 = 0x4812000000;
  v81 = __Block_byref_object_copy__95;
  v82 = __Block_byref_object_dispose__96;
  v83 = &unk_1A674C0CB;
  v84 = 0;
  v85 = 0;
  v86 = 0;
  if ((unint64_t)a3 >= 0xFFFFFFFFFFFFFFFLL)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(a3 + 1);
  v16 = (char *)v84;
  v15 = v85;
  v17 = v13;
  if (v85 != v84)
  {
    do
    {
      *((_OWORD *)v17 - 1) = *((_OWORD *)v15 - 1);
      v17 -= 16;
      v15 -= 16;
    }
    while (v15 != v16);
    v15 = (char *)v84;
  }
  v84 = v17;
  v85 = v13;
  v86 = &v13[16 * v14];
  if (v15)
    operator delete(v15);
  v18 = value[5];
  v19 = (uint64_t)(value[3] - value[2]) >> 3;
  v20 = vcvtpd_s64_f64((double)v19 * a4);
  NU::Histogram<long,double>::Kernel::box(&v75, (v20 + (v20 < 0)) | 1);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZNK2NU9HistogramIldE16modalityAnalysisEmRKdS3_RU15__autoreleasingKU13block_pointerFllE_block_invoke;
  v88 = &unk_1E505F618;
  v90 = value;
  __p = 0;
  v92 = 0;
  v93 = 0;
  v21 = v75;
  std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(&__p, v75, v76, (v76 - (uint64_t)v75) >> 3);
  v95 = &v74;
  v96 = vcvtmd_s64_f64((double)(v18 / v19) * a5);
  v94 = v77;
  v89 = &v78;
  v97 = a3;
  NU::Histogram<long,double>::findAllModes((uint64_t)value, (uint64_t *)&v74, buf);
  v23 = (_BYTE *)v79[6];
  v22 = (_BYTE *)v79[7];
  v24 = v22 - v23;
  if (v22 == v23)
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    if (v24 < 0)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(v24 >> 4);
    memmove(v25, v23, v24);
    v26 = &v25[16 * (v24 >> 4)];
  }
  if (__p)
  {
    v92 = __p;
    operator delete(__p);
  }
  if (v21)
    operator delete(v21);
  _Block_object_dispose(&v78, 8);
  if (v84)
  {
    v85 = (char *)v84;
    operator delete(v84);
  }
  if ((v26 - v25) >> 4 >= (unint64_t)a3)
    v27 = a3;
  else
    v27 = (v26 - v25) >> 4;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v27);
  if (v27)
  {
    v29 = (double *)v25;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v30);

      v29 += 2;
      --v27;
    }
    while (v27);
    goto LABEL_34;
  }
  if (v25)
LABEL_34:
    operator delete(v25);

  return v28;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const int64_t *v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v5 = -[NUHistogram binCount](self, "binCount");
  -[NUHistogram range](self, "range");
  v7 = v6;
  -[NUHistogram range](self, "range");
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p> count=%ld, range: [%0.3f..%0.3f], sampleCount=%ld\n"), v4, self, v5, v7, v8, -[NUHistogram sampleCount](self, "sampleCount"));
  v9 = -[NUHistogram values](self, "values");
  v10 = -[NUHistogram binCount](self, "binCount");
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      -[NUHistogram range](self, "range");
      v13 = v12;
      -[NUHistogram range](self, "range");
      v15 = v14;
      -[NUHistogram range](self, "range");
      objc_msgSend(v3, "appendFormat:", CFSTR("\t%4ld\t%0.3f\t%6ld\t%0.5f\n"), i, v16 + (double)i / (double)(v10 - 1) * (v13 - v15), v9[i], (double)v9[i] / (double)-[NUHistogram sampleCount](self, "sampleCount"));
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  void *value;

  value = self->_histogram.__ptr_.__value_;
  self->_histogram.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<NU::Histogram<long,double>>::operator()[abi:ne180100]((uint64_t)value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
