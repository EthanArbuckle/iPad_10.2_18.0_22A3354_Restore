@implementation NUDataSet

- (const)_const_data
{
  return &self->_data;
}

- (NUDataSet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUDataSet;
  return -[NUDataSet init](&v3, sel_init);
}

- (NUDataSet)initWithValue:(double)a3
{
  double v4;

  v4 = a3;
  return -[NUDataSet initWithValues:count:](self, "initWithValues:count:", &v4, 1);
}

- (NUDataSet)initWithValues:(const double *)a3 count:(int64_t)a4
{
  NUDataSet *v6;
  void *v7;
  double *begin;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  uint8_t buf[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "values != NULL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
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
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v25;
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
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = "values != NULL";
    v27 = 80;
LABEL_25:

    _NUAssertFailHandler((uint64_t)"-[NUDataSet initWithValues:count:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", v27, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)v26);
  }
  if (!a4)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "count != 0");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v20)
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
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = "count != 0";
    v27 = 81;
    goto LABEL_25;
  }
  v35.receiver = self;
  v35.super_class = (Class)NUDataSet;
  v6 = -[NUDataSet init](&v35, sel_init);
  if ((unint64_t)a4 >> 61)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  v7 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a4);
  memmove(v7, a3, 8 * a4);
  memset(buf, 0, sizeof(buf));
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(buf, v7, (uint64_t)v7 + 8 * a4, (8 * a4) >> 3);
  begin = v6->_data._values.__begin_;
  if (begin)
  {
    v6->_data._values.__end_ = begin;
    operator delete(begin);
    v6->_data._values.__begin_ = 0;
    v6->_data._values.__end_ = 0;
    v6->_data._values.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v6->_data._values.__begin_ = *(_OWORD *)buf;
  v6->_data._values.__end_cap_.__value_ = *(double **)&buf[16];
  if (v7)
    operator delete(v7);
  return v6;
}

- (NUDataSet)initWithDataSet:(id)a3
{
  NUDataSet *v4;
  NUDataSet *v5;
  NUDataSet *v6;
  double *begin;
  DataSet *p_data;
  double *v9;
  double *end;
  size_t v11;
  unint64_t v12;
  uint64_t value;
  uint64_t v14;
  unint64_t v15;
  void **p_end;
  double *v17;
  unint64_t v18;
  double *v19;
  double *v20;
  double *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  NSObject *v27;
  void *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (NUDataSet *)a3;
  if (!v4)
  {
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v34;
        v44 = 2114;
        v45 = v36;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet initWithDataSet:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 92, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"other != nil");
  }
  v41.receiver = self;
  v41.super_class = (Class)NUDataSet;
  v5 = -[NUDataSet init](&v41, sel_init);
  v6 = v5;
  if (v5 != v4)
  {
    p_data = &v5->_data;
    begin = v5->_data._values.__begin_;
    v9 = v4->_data._values.__begin_;
    end = v4->_data._values.__end_;
    v11 = (char *)end - (char *)v9;
    v12 = end - v9;
    value = (uint64_t)v5->_data._values.__end_cap_.__value_;
    if (v12 <= (value - (uint64_t)begin) >> 3)
    {
      p_end = (void **)&v5->_data._values.__end_;
      v17 = v5->_data._values.__end_;
      v18 = v17 - begin;
      if (v18 < v12)
      {
        v19 = &v9[v18];
        if (v17 != begin)
        {
          memmove(v5->_data._values.__begin_, v4->_data._values.__begin_, (char *)v17 - (char *)begin);
          begin = (double *)*p_end;
        }
        v11 = (char *)end - (char *)v19;
        if (end == v19)
          goto LABEL_21;
        v20 = begin;
        v21 = v19;
        goto LABEL_20;
      }
    }
    else
    {
      if (begin)
      {
        v5->_data._values.__end_ = begin;
        operator delete(begin);
        value = 0;
        p_data->_values.__begin_ = 0;
        v6->_data._values.__end_ = 0;
        v6->_data._values.__end_cap_.__value_ = 0;
      }
      if ((v11 & 0x8000000000000000) != 0)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v14 = value >> 2;
      if (value >> 2 <= v12)
        v14 = end - v9;
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFF8)
        v15 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v15 = v14;
      std::vector<double>::__vallocate[abi:ne180100](&v6->_data._values.__begin_, v15);
      p_end = (void **)&v6->_data._values.__end_;
      begin = v6->_data._values.__end_;
    }
    if (end == v9)
    {
LABEL_21:
      *p_end = (char *)begin + v11;
      goto LABEL_22;
    }
    v20 = begin;
    v21 = v9;
LABEL_20:
    memmove(v20, v21, v11);
    goto LABEL_21;
  }
LABEL_22:
  v22 = *(_OWORD *)&v4->_stats.sum;
  *(_OWORD *)&v6->_stats.max = *(_OWORD *)&v4->_stats.max;
  *(_OWORD *)&v6->_stats.sum = v22;
  v23 = *(_OWORD *)&v4->_stats.geomean;
  v24 = *(_OWORD *)&v4->_stats.variance;
  v25 = *(_OWORD *)&v4->_stats.stderr;
  *(_OWORD *)&v6->_stats.cv = *(_OWORD *)&v4->_stats.cv;
  *(_OWORD *)&v6->_stats.stderr = v25;
  *(_OWORD *)&v6->_stats.variance = v24;
  *(_OWORD *)&v6->_stats.geomean = v23;
  v6->_flags = v4->_flags;

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NUDataSet initWithDataSet:](+[NUMutableDataSet allocWithZone:](NUMutableDataSet, "allocWithZone:", a3), "initWithDataSet:", self);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p count=%lu>"), objc_opt_class(), self, -[NUDataSet count](self, "count"));
}

- (int64_t)count
{
  return self->_data._values.__end_ - self->_data._values.__begin_;
}

- (double)valueAtIndex:(int64_t)a3
{
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3 < 0)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "index >= 0");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v7;
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
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        v36 = 2114;
        v37 = v22;
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
      v35 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet valueAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 126, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"index >= 0");
  }
  if (-[NUDataSet count](self, "count") <= a3)
  {
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "index < self.count");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v27;
        v36 = 2114;
        v37 = v29;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet valueAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 127, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"index < self.count");
  }
  return self->_data._values.__begin_[a3];
}

- (void)enumerateValues:(id)a3
{
  double *end;
  double *begin;
  void (**v6)(double);

  v6 = (void (**)(double))a3;
  begin = self->_data._values.__begin_;
  end = self->_data._values.__end_;
  while (begin != end)
    v6[2](*begin++);

}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUDataSet;
  return -[NUDataSet hash](&v3, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NUDataSet isEqualToDataSet:](self, "isEqualToDataSet:", v4);

  return v5;
}

- (BOOL)isEqualToDataSet:(id)a3
{
  _QWORD *v4;
  double *end;
  double *begin;
  double *v7;
  double *v8;
  double v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  if (v4
    && (begin = self->_data._values.__begin_,
        end = self->_data._values.__end_,
        v7 = (double *)v4[14],
        (char *)end - (char *)begin == v4[15] - (_QWORD)v7))
  {
    if (begin == end)
    {
      v10 = 1;
    }
    else
    {
      v8 = begin + 1;
      do
      {
        v9 = *v7++;
        v10 = *(v8 - 1) == v9;
        v11 = *(v8 - 1) != v9 || v8 == end;
        ++v8;
      }
      while (!v11);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_resetStats
{
  *(_WORD *)&self->_flags = 0;
}

- (double)sum
{
  double result;

  if ((*(_WORD *)&self->_flags & 1) != 0)
    return self->_stats.sum;
  result = NU::Sum(&self->_data._values.__begin_, (const DataSet *)a2);
  self->_stats.sum = result;
  *(_WORD *)&self->_flags |= 1u;
  return result;
}

- (double)mean
{
  double v3;
  int64_t v4;
  double result;

  if ((*(_WORD *)&self->_flags & 8) != 0)
    return self->_stats.mean;
  v3 = NU::Sum(&self->_data._values.__begin_, (const DataSet *)a2);
  v4 = (char *)self->_data._values.__end_ - (char *)self->_data._values.__begin_;
  if (v4)
    result = v3 / (double)(v4 >> 3);
  else
    result = 0.0;
  self->_stats.mean = result;
  *(_WORD *)&self->_flags |= 8u;
  return result;
}

- (double)geometricMean
{
  double result;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
    return self->_stats.geomean;
  result = NU::GeometricMean((NU *)&self->_data, (const NU::DataSet *)a2);
  self->_stats.geomean = result;
  *(_WORD *)&self->_flags |= 0x10u;
  return result;
}

- (double)median
{
  double result;

  if ((*(_WORD *)&self->_flags & 0x20) != 0)
    return self->_stats.median;
  result = NU::Percentile((NU *)&self->_data, (const NU::DataSet *)a2, 0.5);
  self->_stats.median = result;
  *(_WORD *)&self->_flags |= 0x20u;
  return result;
}

- (double)min
{
  double result;

  if ((*(_WORD *)&self->_flags & 2) != 0)
    return self->_stats.min;
  result = NU::Min(&self->_data._values.__begin_, (const DataSet *)a2);
  self->_stats.min = result;
  *(_WORD *)&self->_flags |= 2u;
  return result;
}

- (double)max
{
  double result;

  if ((*(_WORD *)&self->_flags & 4) != 0)
    return self->_stats.max;
  result = NU::Max(&self->_data._values.__begin_, (const DataSet *)a2);
  self->_stats.max = result;
  *(_WORD *)&self->_flags |= 4u;
  return result;
}

- (double)variance
{
  const NU::DataSet *v3;
  double v4;
  double result;

  if ((*(_WORD *)&self->_flags & 0x40) != 0)
    return self->_stats.variance;
  -[NUDataSet mean](self, "mean");
  result = NU::Variance((NU *)&self->_data, v3, v4);
  self->_stats.variance = result;
  *(_WORD *)&self->_flags |= 0x40u;
  return result;
}

- (double)standardDeviation
{
  double v3;
  double result;

  if ((*(_WORD *)&self->_flags & 0x80) != 0)
    return self->_stats.stddev;
  -[NUDataSet variance](self, "variance");
  result = sqrt(v3);
  self->_stats.stddev = result;
  *(_WORD *)&self->_flags |= 0x80u;
  return result;
}

- (double)standardError
{
  double v3;
  double v4;
  uint64_t v5;
  double result;

  if ((*(_WORD *)&self->_flags & 0x100) != 0)
    return self->_stats.stderr;
  -[NUDataSet standardDeviation](self, "standardDeviation");
  v4 = v3;
  v5 = -[NUDataSet count](self, "count");
  if (v5)
    result = v4 / sqrt((double)v5);
  else
    result = 0.0;
  self->_stats.stderr = result;
  *(_WORD *)&self->_flags |= 0x100u;
  return result;
}

- (double)confidenceInterval95
{
  unsigned int v3;
  double v4;
  double result;
  int v6;
  double v7;

  if ((*(_WORD *)&self->_flags & 0x200) != 0)
    return self->_stats.ci95;
  v3 = -[NUDataSet count](self, "count");
  if (v3 >= 2)
  {
    v6 = v3 - 1;
    if (v3 - 1 >= 0x1F4)
      v6 = 500;
    v4 = gT95[v6 - 1];
  }
  else
  {
    v4 = NAN;
  }
  -[NUDataSet standardError](self, "standardError");
  result = v4 * v7;
  self->_stats.ci95 = result;
  *(_WORD *)&self->_flags |= 0x200u;
  return result;
}

- (double)coefficientOfVariation
{
  double v3;
  double v4;
  double v5;
  double result;

  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    return self->_stats.cv;
  -[NUDataSet mean](self, "mean");
  v4 = v3;
  -[NUDataSet standardDeviation](self, "standardDeviation");
  result = v5 / v4;
  self->_stats.cv = result;
  *(_WORD *)&self->_flags |= 0x400u;
  return result;
}

- (double)medianAbsoluteDeviation
{
  double v3;
  const NU::DataSet *v4;
  double *v5;
  double *v6;
  double *v7;
  double *v9;
  double *v10;

  if ((*(_WORD *)&self->_flags & 0x800) == 0)
  {
    -[NUDataSet median](self, "median");
    NU::operator+((uint64_t)&self->_data, &v9, -v3);
    v6 = v9;
    v5 = v10;
    if (v9 != v10)
    {
      v7 = v9;
      do
      {
        *v7 = fabs(*v7);
        ++v7;
      }
      while (v7 != v5);
    }
    self->_stats.mad = NU::Percentile((NU *)&v9, v4, 0.5);
    if (v6)
      operator delete(v6);
  }
  return self->_stats.mad;
}

- (double)estimatedStandardDeviation
{
  double v2;

  -[NUDataSet medianAbsoluteDeviation](self, "medianAbsoluteDeviation");
  return v2 * 1.4826;
}

- (double)estimatedStandardError
{
  double v3;
  double v4;
  uint64_t v5;

  -[NUDataSet estimatedStandardDeviation](self, "estimatedStandardDeviation");
  v4 = v3;
  v5 = -[NUDataSet count](self, "count");
  if (v5)
    return v4 / sqrt((double)v5);
  else
    return 0.0;
}

- (double)estimatedConfidenceInterval95
{
  unsigned int v3;
  double v4;
  int v5;
  double v6;

  v3 = -[NUDataSet count](self, "count");
  if (v3 >= 2)
  {
    v5 = v3 - 1;
    if (v3 - 1 >= 0x1F4)
      v5 = 500;
    v4 = gT95[v5 - 1];
  }
  else
  {
    v4 = NAN;
  }
  -[NUDataSet estimatedStandardError](self, "estimatedStandardError");
  return v4 * v6;
}

- (double)estimatedCoefficientOfVariation
{
  double v3;
  double v4;
  double v5;

  -[NUDataSet median](self, "median");
  v4 = v3;
  -[NUDataSet estimatedStandardDeviation](self, "estimatedStandardDeviation");
  return v5 / v4;
}

- (double)percentile:(double)a3
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
  {
    NUAssertLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "p >= 0.0");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v18;
        v34 = 2114;
        v35 = v20;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet percentile:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 326, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"p >= 0.0");
  }
  if (a3 > 1.0)
  {
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "p <= 1.0");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        v34 = 2114;
        v35 = v27;
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
      v33 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet percentile:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 327, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"p <= 1.0");
  }
  return NU::Percentile((NU *)&self->_data, (const NU::DataSet *)a2, a3);
}

- (id)filter:(id)a3
{
  id v4;
  NUMutableDataSet *v5;
  id v6;
  NUMutableDataSet *v7;
  NUMutableDataSet *v8;
  NUMutableDataSet *v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  NUMutableDataSet *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "filter != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
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
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v20;
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
      v29 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet filter:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 334, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"filter != nil");
  }
  v5 = -[NUMutableDataSet initWithCapacity:]([NUMutableDataSet alloc], "initWithCapacity:", -[NUDataSet count](self, "count"));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __20__NUDataSet_filter___block_invoke;
  v25[3] = &unk_1E5062AC8;
  v6 = v4;
  v27 = v6;
  v7 = v5;
  v26 = v7;
  -[NUDataSet enumerateValues:](self, "enumerateValues:", v25);
  v8 = v26;
  v9 = v7;

  return v9;
}

- (id)map:(id)a3
{
  id v4;
  NUMutableDataSet *v5;
  NUMutableDataSet *v6;
  id v7;
  void *v8;
  NUMutableDataSet *v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  NUMutableDataSet *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "mapper != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
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
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v20;
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
      v29 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet map:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 349, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"mapper != nil");
  }
  v5 = -[NUMutableDataSet initWithCapacity:]([NUMutableDataSet alloc], "initWithCapacity:", -[NUDataSet count](self, "count"));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __17__NUDataSet_map___block_invoke;
  v25[3] = &unk_1E5062AC8;
  v6 = v5;
  v26 = v6;
  v7 = v4;
  v27 = v7;
  -[NUDataSet enumerateValues:](self, "enumerateValues:", v25);
  v8 = v27;
  v9 = v6;

  return v9;
}

- (void).cxx_destruct
{
  double *begin;

  begin = self->_data._values.__begin_;
  if (begin)
  {
    self->_data._values.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  return self;
}

uint64_t __17__NUDataSet_map___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(v1, "addValue:");
}

uint64_t __20__NUDataSet_filter___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addValue:", a2);
  return result;
}

@end
