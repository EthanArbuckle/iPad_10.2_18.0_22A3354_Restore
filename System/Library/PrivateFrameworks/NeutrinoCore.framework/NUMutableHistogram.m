@implementation NUMutableHistogram

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NUHistogram initWithHistogram:](+[NUHistogram allocWithZone:](NUHistogram, "allocWithZone:", a3), "initWithHistogram:", self);
}

- (void)increment:(int64_t)a3
{
  _QWORD *value;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 < 0 || -[NUHistogram binCount](self, "binCount") <= a3)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "index >= 0 && index < self.binCount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v13;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram increment:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 189, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"index >= 0 && index < self.binCount");
  }
  value = self->super._histogram.__ptr_.__value_;
  ++*(_QWORD *)(value[2] + 8 * a3);
  ++value[5];
}

- (void)write:(id)a3
{
  id v4;
  _QWORD *value;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)(id, _QWORD, int64_t);
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        v23 = 2114;
        v24 = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 196, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"block != nil");
  }
  value = self->super._histogram.__ptr_.__value_;
  v20 = (uint64_t (**)(id, _QWORD, int64_t))v4;
  value[5] += v20[2](v20, value[2], -[NUHistogram binCount](self, "binCount"));

}

- (void)observeValue:(double)a3
{
  double *value;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;

  value = (double *)self->super._histogram.__ptr_.__value_;
  v4 = *((_QWORD *)value + 2);
  v5 = (*((_QWORD *)value + 3) - v4) >> 3;
  v6 = vcvtmd_s64_f64((a3 - *value) / (value[1] - *value) * (double)v5);
  v7 = v5 - 1;
  if (v7 >= v6)
    v7 = v6;
  ++*(_QWORD *)(v4 + 8 * (v7 & ~(v7 >> 63)));
  ++*((_QWORD *)value + 5);
}

- (void)observeValuesInDataSet:(id)a3
{
  id v4;
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;
  double *value;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = v4;
  if (!v4)
  {
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dataSet != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        v35 = 2114;
        v36 = v27;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram observeValuesInDataSet:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 210, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"dataSet != nil");
  }
  v5 = objc_msgSend(v4, "_const_data");
  v6 = *(double **)v5;
  v7 = *(_QWORD *)(v5 + 8) - *(_QWORD *)v5;
  if (v7)
  {
    v8 = v7 >> 3;
    value = (double *)self->super._histogram.__ptr_.__value_;
    v10 = *value;
    v11 = value[1] - *value;
    v12 = *((_QWORD *)value + 2);
    v13 = (*((_QWORD *)value + 3) - v12) >> 3;
    v14 = (double)v13;
    v15 = v13 - 1;
    do
    {
      v16 = *v6++;
      v17 = vcvtmd_s64_f64((v16 - v10) / v11 * v14);
      if (v15 < v17)
        v17 = v15;
      ++*(_QWORD *)(v12 + 8 * (v17 & ~(v17 >> 63)));
      ++*((_QWORD *)value + 5);
      --v8;
    }
    while (v8);
  }

}

- (void)smoothWithFunction:(int64_t)a3 windowSize:(int64_t)a4 sampleMode:(int64_t)a5
{
  void *v8;
  void *v9;
  void *value;
  uint64_t v11;
  unint64_t v12;
  uint64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  int64x2_t v16;
  _QWORD *v17;
  int64x2_t v18;
  int32x2_t v19;
  int64x2_t v20;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *__p;
  _BYTE *v38;
  uint8_t buf[24];
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[NUHistogram _samplerForSampleMode:](self, "_samplerForSampleMode:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v8;
  if (a3 == 1)
  {
    if ((a4 & 0x8000000000000001) != 1)
      __assert_rtn("tent", "Histogram.hpp", 298, "size % 2 == 1");
    value = self->super._histogram.__ptr_.__value_;
    v36 = 0;
    std::vector<long>::vector(&__p, a4, &v36);
    v11 = 0;
    v12 = ((unint64_t)a4 >> 1) + 1;
    v13 = (uint64x2_t)vdupq_n_s64(a4 - 1);
    v14 = vdupq_n_s64(1uLL);
    v15 = vdupq_n_s64(2uLL);
    v16 = (int64x2_t)xmmword_1A671A270;
    v17 = __p;
    v18 = vdupq_n_s64(v12);
    do
    {
      v19 = vmovn_s64((int64x2_t)vcgeq_u64(v13, (uint64x2_t)v16));
      v20 = vabsq_s64(vaddq_s64(vsubq_s64(v16, v18), v14));
      if ((v19.i8[0] & 1) != 0)
        v17[v11] = v12 - v20.i64[0];
      if ((v19.i8[4] & 1) != 0)
        v17[v11 + 1] = v12 - v20.i64[1];
      v11 += 2;
      v16 = vaddq_s64(v16, v15);
    }
    while (((a4 + 1) & 0xFFFFFFFFFFFFFFFELL) != v11);
    memset(buf, 0, sizeof(buf));
    std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(buf, v17, (uint64_t)v38, (v38 - (_BYTE *)v17) >> 3);
    v40 = v12 * v12;
    if (__p)
    {
      v38 = __p;
      operator delete(__p);
    }
    NU::Histogram<long,double>::convolve((uint64_t)value, buf, (uint64_t)&v35);
  }
  else
  {
    if (a3)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_21352);
      v21 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown window function: %ld"), a3, v35);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v22;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_21352);
      v24 = (id)_NUAssertLogger;
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v25)
        {
          v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v30;
          _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v27;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram smoothWithFunction:windowSize:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 226, CFSTR("Unknown window function: %ld"), v31, v32, v33, v34, a3);
    }
    v9 = self->super._histogram.__ptr_.__value_;
    NU::Histogram<long,double>::Kernel::box(buf, a4);
    NU::Histogram<long,double>::convolve((uint64_t)v9, buf, (uint64_t)&v35);
  }
  if (*(_QWORD *)buf)
    operator delete(*(void **)buf);

}

@end
