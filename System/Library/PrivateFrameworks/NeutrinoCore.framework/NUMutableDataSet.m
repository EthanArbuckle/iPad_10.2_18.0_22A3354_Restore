@implementation NUMutableDataSet

- (void)_data
{
  return &self->super._data;
}

- (NUMutableDataSet)initWithCapacity:(int64_t)a3
{
  NUMutableDataSet *v4;
  NUMutableDataSet *v5;
  double *begin;
  double *end;
  char *v8;
  double *v9;
  uint64_t v10;
  double *v11;
  double *v12;
  double *v13;
  double *v14;
  uint64_t v15;
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
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3 < 0)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "capacity >= 0");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v18;
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
        v33 = v24;
        v34 = 2114;
        v35 = v26;
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
      v33 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableDataSet initWithCapacity:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 371, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"capacity >= 0");
  }
  v31.receiver = self;
  v31.super_class = (Class)NUMutableDataSet;
  v4 = -[NUDataSet init](&v31, sel_init);
  v5 = v4;
  if (v4)
  {
    begin = v4->super._data._values.__begin_;
    if (a3 > (unint64_t)(v4->super._data._values.__end_cap_.__value_ - begin))
    {
      if ((unint64_t)a3 >> 61)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      end = v4->super._data._values.__end_;
      v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a3);
      v9 = (double *)&v8[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF8];
      v11 = (double *)&v8[8 * v10];
      v12 = v5->super._data._values.__begin_;
      v13 = v5->super._data._values.__end_;
      v14 = v9;
      if (v13 != v12)
      {
        v14 = v9;
        do
        {
          v15 = *((_QWORD *)v13-- - 1);
          *((_QWORD *)v14-- - 1) = v15;
        }
        while (v13 != v12);
      }
      v5->super._data._values.__begin_ = v14;
      v5->super._data._values.__end_ = v9;
      v5->super._data._values.__end_cap_.__value_ = v11;
      if (v12)
        operator delete(v12);
    }
  }
  return v5;
}

- (int64_t)capacity
{
  return self->super._data._values.__end_cap_.__value_ - self->super._data._values.__begin_;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NUDataSet initWithDataSet:](+[NUDataSet allocWithZone:](NUDataSet, "allocWithZone:", a3), "initWithDataSet:", self);
}

- (void)addValue:(double)a3
{
  double *value;
  double *end;
  double *v7;
  double *begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  double *v15;
  double *v16;
  uint64_t v17;

  end = self->super._data._values.__end_;
  value = self->super._data._values.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->super._data._values.__begin_;
    v9 = end - begin;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v11 = (char *)value - (char *)begin;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8;
    v13 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v12)
      v13 = v10;
    if (v13)
    {
      v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v13);
      begin = self->super._data._values.__begin_;
      end = self->super._data._values.__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = (double *)(v13 + 8 * v9);
    v16 = (double *)(v13 + 8 * v14);
    *v15 = a3;
    v7 = v15 + 1;
    while (end != begin)
    {
      v17 = *((_QWORD *)end-- - 1);
      *((_QWORD *)v15-- - 1) = v17;
    }
    self->super._data._values.__begin_ = v15;
    self->super._data._values.__end_ = v7;
    self->super._data._values.__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v7 = end + 1;
  }
  self->super._data._values.__end_ = v7;
  -[NUDataSet _resetStats](self, "_resetStats");
}

- (void)appendDataSet:(id)a3
{
  uint64_t **v5;
  size_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  double *value;
  double *end;
  double *begin;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  double *v20;
  double *v21;
  double *v22;
  double *v23;
  uint64_t v24;
  double *v25;
  double *v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  double *v30;
  double *v31;
  uint64_t v32;
  double *v33;
  double *v34;
  int64_t v35;
  double *v36;
  void *v37;
  uint64_t **v38;

  v5 = (uint64_t **)a3;
  v38 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NUDataSet.mm"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSet != nil"));

    v5 = 0;
  }
  v8 = v5[14];
  v7 = v5[15];
  if ((char *)v7 - (char *)v8 >= 1)
  {
    v9 = v7 - v8;
    end = self->super._data._values.__end_;
    value = self->super._data._values.__end_cap_.__value_;
    if (v9 <= value - end)
    {
      if (v9 <= 0)
      {
        v20 = self->super._data._values.__end_;
        v21 = &end[v9];
        v22 = &v20[-v9];
        v23 = v20;
        if (v22 < end)
        {
          v23 = self->super._data._values.__end_;
          do
          {
            v24 = *(_QWORD *)v22++;
            *(_QWORD *)v23++ = v24;
          }
          while (v22 < end);
        }
        self->super._data._values.__end_ = v23;
        if (v20 != v21)
          memmove(&v20[-(v20 - v21)], end, (char *)v20 - (char *)v21);
        v6 = 8 * v9;
        if (&v8[v9] != v8)
          memmove(end, v8, v6);
      }
      else
      {
        v18 = v5[14];
        v19 = (char *)v7 - (char *)v18;
        if (v7 != v18)
          memmove(self->super._data._values.__end_, v8, (char *)v7 - (char *)v18);
        self->super._data._values.__end_ = (double *)((char *)end + v19);
      }
    }
    else
    {
      begin = self->super._data._values.__begin_;
      v13 = end - begin;
      if ((unint64_t)(v13 + v9) >> 61)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v14 = (char *)value - (char *)begin;
      v15 = v14 >> 2;
      if (v14 >> 2 <= (unint64_t)(v13 + v9))
        v15 = v13 + v9;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
        v16 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v16 = v15;
      if (v16)
        v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v16);
      else
        v17 = 0;
      v25 = (double *)(v16 + 8 * v13);
      v26 = &v25[v9];
      v27 = 8 * v9;
      v28 = v25;
      do
      {
        v29 = *v8++;
        *(_QWORD *)v28++ = v29;
        v27 -= 8;
      }
      while (v27);
      v30 = self->super._data._values.__begin_;
      if (v30 != end)
      {
        v31 = end;
        do
        {
          v32 = *((_QWORD *)v31-- - 1);
          *((_QWORD *)v25-- - 1) = v32;
        }
        while (v31 != v30);
      }
      v33 = (double *)(v16 + 8 * v17);
      v34 = self->super._data._values.__end_;
      v35 = (char *)v34 - (char *)end;
      if (v34 != end)
        memmove(v26, end, (char *)v34 - (char *)end);
      v36 = self->super._data._values.__begin_;
      self->super._data._values.__begin_ = v25;
      self->super._data._values.__end_ = (double *)((char *)v26 + v35);
      self->super._data._values.__end_cap_.__value_ = v33;
      if (v36)
        operator delete(v36);
    }
  }
  -[NUDataSet _resetStats](self, "_resetStats", v6);

}

@end
