@implementation NURenderJobStatisticsHistogram

- (NURenderJobStatisticsHistogram)initWithBins:(unint64_t)a3 millisPerBin:(double)a4
{
  double v7;
  NURenderJobStatisticsHistogram *v8;
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
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = log2((double)a3);
  if (ceil(v7) != floor(v7))
  {
    NUAssertLogger_19521();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("binCount must be a power of 2"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v24;
        v45 = 2114;
        v46 = v28;
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
      v44 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram initWithBins:millisPerBin:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2096, CFSTR("binCount must be a power of 2"), v29, v30, v31, v32, (uint64_t)v42.receiver);
  }
  if (a3 <= 0x3F)
  {
    NUAssertLogger_19521();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("binCount should be >= 64"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        v45 = 2114;
        v46 = v37;
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
      v44 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram initWithBins:millisPerBin:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2097, CFSTR("binCount should be >= 64"), v38, v39, v40, v41, (uint64_t)v42.receiver);
  }
  v42.receiver = self;
  v42.super_class = (Class)NURenderJobStatisticsHistogram;
  v8 = -[NURenderJobStatisticsHistogram init](&v42, sel_init);
  if (v8)
  {
    v8->_prepareLatencyHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_prepareDurationHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_renderLatencyHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_renderDurationHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_completeLatencyHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_completeDurationHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_totalDurationHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_totalLatencyHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_totalHistogram = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_millisPerBin = a4;
    v8->_binCount = a3;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_prepareLatencyHistogram);
  free(self->_prepareDurationHistogram);
  free(self->_renderLatencyHistogram);
  free(self->_renderDurationHistogram);
  free(self->_completeLatencyHistogram);
  free(self->_completeDurationHistogram);
  free(self->_totalDurationHistogram);
  free(self->_totalLatencyHistogram);
  free(self->_totalHistogram);
  v3.receiver = self;
  v3.super_class = (Class)NURenderJobStatisticsHistogram;
  -[NURenderJobStatisticsHistogram dealloc](&v3, sel_dealloc);
}

- (void)addStatisticsToHistogram:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  double v6;
  double v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NURenderJobStatisticsHistogram_addStatisticsToHistogram___block_invoke;
  v8[3] = &unk_1E5063260;
  v8[4] = self;
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85C1564](v8);
  objc_msgSend(v4, "prepareLatency");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_prepareLatencyHistogram, &self->_prepareLatencyHistogramCount);
  objc_msgSend(v4, "prepareDuration");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_prepareDurationHistogram, &self->_prepareDurationHistogramCount);
  objc_msgSend(v4, "renderLatency");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_renderLatencyHistogram, &self->_renderLatencyHistogramCount);
  objc_msgSend(v4, "renderDuration");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_renderDurationHistogram, &self->_renderDurationHistogramCount);
  objc_msgSend(v4, "completeLatency");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_completeLatencyHistogram, &self->_completeLatencyHistogramCount);
  objc_msgSend(v4, "completeDuration");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_completeDurationHistogram, &self->_completeDurationHistogramCount);
  objc_msgSend(v4, "duration");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_totalDurationHistogram, &self->_totalDurationHistogramCount);
  objc_msgSend(v4, "latency");
  ((void (**)(_QWORD, int64_t *, int64_t *))v5)[2](v5, self->_totalLatencyHistogram, &self->_totalLatencyHistogramCount);
  objc_msgSend(v4, "totalDuration");
  v7 = v6;

  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), int64_t *, int64_t *, double))v5[2])(v5, self->_totalHistogram, &self->_totalHistogramCount, v7);
}

- (id)graphHistogram:(int64_t *)a3 label:(id)a4
{
  id v6;
  unint64_t binCount;
  double v8;
  char *v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t i;
  void *v14;
  uint64_t v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  int v24;
  int v25;
  double v26;
  uint64_t j;
  uint64_t v28;
  const __CFString *v30;
  uint64_t v31;
  unint64_t v32;
  double v33;
  int v34;
  unint64_t k;
  int v36;
  unint64_t m;
  NSObject *v39;
  void *v40;
  void *specific;
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
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  binCount = self->_binCount;
  v8 = log2((double)binCount);
  if (ceil(v8) != floor(v8))
  {
    NUAssertLogger_19521();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("binCount is not power of 2"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v40;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E0CB3978];
        v55 = v53;
        objc_msgSend(v54, "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v53;
        v75 = 2114;
        v76 = v57;
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
      v74 = v45;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram graphHistogram:label:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2156, CFSTR("binCount is not power of 2"), v58, v59, v60, v61, v71);
  }
  if (binCount <= 0x3F)
  {
    NUAssertLogger_19521();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("binCount should be >= 64"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v47;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v63 = (void *)MEMORY[0x1E0CB3978];
        v64 = v62;
        objc_msgSend(v63, "callStackSymbols");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v62;
        v75 = 2114;
        v76 = v66;
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
      v74 = v52;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram graphHistogram:label:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2157, CFSTR("binCount should be >= 64"), v67, v68, v69, v70, v71);
  }
  v9 = (char *)malloc_type_calloc(0x40uLL, 8uLL, 0x100004000313F17uLL);
  v10 = v9;
  v11 = self->_binCount;
  v12 = v11 >> 6;
  if (v11)
  {
    for (i = 0; i != v11; ++i)
      *(_QWORD *)&v9[8 * (i / v12)] += a3[i];
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2048);
  objc_msgSend(v14, "appendFormat:", CFSTR("%@\n"), v6);
  v15 = 0;
  v16 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v17 = 0uLL;
  do
  {
    v18 = *(int64x2_t *)&v10[v15];
    v17 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v18, v17), (int8x16_t)v18, (int8x16_t)v17);
    v16 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v16, v18), (int8x16_t)v18, (int8x16_t)v16);
    v15 += 16;
  }
  while (v15 != 512);
  v72 = v6;
  v19 = vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL).u64[0];
  v20 = (uint64_t)vbsl_s8((int8x8_t)vcgtd_s64(v19, v16.i64[0]), *(int8x8_t *)v16.i8, (int8x8_t)v19);
  v21 = vextq_s8((int8x16_t)v17, (int8x16_t)v17, 8uLL).u64[0];
  v22 = (double)(*(_QWORD *)&vbsl_s8((int8x8_t)vcgtd_s64(v17.i64[0], v21), *(int8x8_t *)v17.i8, (int8x8_t)v21) - v20)
      / 20.0;
  v23 = (double)v20;
  v24 = 20;
  do
  {
    v25 = v24;
    if (v24)
    {
      v26 = v23 + v22 * (double)v24;
      objc_msgSend(v14, "appendFormat:", CFSTR("%5.0f |"), *(_QWORD *)&v26, v72);
    }
    else
    {
      objc_msgSend(v14, "appendFormat:", CFSTR("  > 0 |"));
      v26 = v23 + v22 * 0.0;
    }
    for (j = 0; j != 512; j += 8)
    {
      v28 = *(_QWORD *)&v10[j];
      if (v26 > (double)v28 || v28 <= 0)
        v30 = CFSTR(" ");
      else
        v30 = CFSTR(".");
      objc_msgSend(v14, "appendString:", v30);
    }
    objc_msgSend(v14, "appendString:", CFSTR("\n"));
    v24 = v25 - 1;
  }
  while (v25);
  v31 = 73;
  do
  {
    objc_msgSend(v14, "appendString:", CFSTR("-"));
    --v31;
  }
  while (v31);
  objc_msgSend(v14, "appendString:", CFSTR("\n     "));
  v32 = 0;
  v33 = (double)v12;
  do
  {
    if (-1431655765 * v32 > 0x55555555
      || (v34 = (int)(self->_millisPerBin * (double)v32 * v33), v34 <= 99))
    {
      objc_msgSend(v14, "appendString:", CFSTR(" "));
    }
    else
    {
      objc_msgSend(v14, "appendFormat:", CFSTR("%i"), (656 * (v34 % 0x3E8u)) >> 16);
    }
    ++v32;
  }
  while (v32 != 69);
  objc_msgSend(v14, "appendString:", CFSTR("\n      "));
  for (k = 0; k != 69; ++k)
  {
    if (-1431655765 * k > 0x55555555
      || (v36 = (int)(self->_millisPerBin * (double)k * v33), v36 <= 9))
    {
      objc_msgSend(v14, "appendString:", CFSTR(" "));
    }
    else
    {
      objc_msgSend(v14, "appendFormat:", CFSTR("%i"), (103 * (v36 % 0x64u)) >> 10);
    }
  }
  objc_msgSend(v14, "appendString:", CFSTR("\n      "));
  for (m = 0; m != 69; ++m)
  {
    if (-1431655765 * m < 0x55555556)
      objc_msgSend(v14, "appendFormat:", CFSTR("%i"), ((int)(self->_millisPerBin * (double)m * v33) % 10));
    else
      objc_msgSend(v14, "appendString:", CFSTR(" "));
  }
  free(v10);

  return v14;
}

- (id)getPercentiles:(int64_t *)a3 numSamples:(int64_t)a4
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  unint64_t binCount;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[7];

  v35[6] = *MEMORY[0x1E0C80C00];
  v4 = (float)a4;
  v5 = (uint64_t)(v4 * 0.999);
  v6 = (uint64_t)(v4 * 0.99);
  if (v5 <= 1)
    v5 = 1;
  if (v6 <= 1)
    v6 = 1;
  v7 = (uint64_t)(v4 * 0.9);
  if (v7 <= 1)
    v7 = 1;
  v8 = (uint64_t)(v4 * 0.5);
  if (v8 <= 1)
    v8 = 1;
  v9 = (uint64_t)(v4 * 0.25);
  if (v9 <= 1)
    v9 = 1;
  v10 = 0.01;
  v11 = (uint64_t)(v4 * 0.01);
  if (v11 <= 1)
    v11 = 1;
  binCount = self->_binCount;
  if (binCount)
  {
    v13 = 0;
    v14 = 0;
    v10 = -1.0;
    v15 = -1.0;
    v16 = -1.0;
    v17 = -1.0;
    v18 = -1.0;
    v19 = -1.0;
    v20 = -1.0;
    do
    {
      v14 += a3[v13];
      if (v14 > v11 && v15 == -1.0)
        v15 = self->_millisPerBin * (double)(v13 + 1);
      if (v14 > v9 && v16 == -1.0)
        v16 = self->_millisPerBin * (double)(v13 + 1);
      if (v14 > v8 && v17 == -1.0)
        v17 = self->_millisPerBin * (double)(v13 + 1);
      if (v14 > v7 && v18 == -1.0)
        v18 = self->_millisPerBin * (double)(v13 + 1);
      ++v13;
      if (v14 > v6 && v19 == -1.0)
        v19 = self->_millisPerBin * (double)v13;
      if (v14 > v5 && v20 == -1.0)
        v20 = self->_millisPerBin * (double)v13;
    }
    while (binCount != v13);
  }
  else
  {
    v20 = -1.0;
    v19 = -1.0;
    v18 = -1.0;
    v17 = -1.0;
    v16 = -1.0;
    v15 = -1.0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20, v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 1024);
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_prepareLatencyHistogram, self->_prepareLatencyHistogramCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_prepareDurationHistogram, self->_prepareDurationHistogramCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_renderLatencyHistogram, self->_renderLatencyHistogramCount);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_renderDurationHistogram, self->_renderDurationHistogramCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_completeLatencyHistogram, self->_completeLatencyHistogramCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_completeDurationHistogram, self->_completeDurationHistogramCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_totalLatencyHistogram, self->_totalLatencyHistogramCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_totalDurationHistogram, self->_totalDurationHistogramCount);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJobStatisticsHistogram getPercentiles:numSamples:](self, "getPercentiles:numSamples:", self->_totalHistogram, self->_totalHistogramCount);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ , %p\n"), v9, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("Time Resolution: %.3f millis\n"), *(_QWORD *)&self->_millisPerBin);
  objc_msgSend(v3, "appendFormat:", CFSTR("Histogram Bins: %lu\n"), self->_binCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("Max Representable Time (> are clipped): %.1f millis\n"), self->_millisPerBin * (double)self->_binCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("Num Samples: %lli\n\n"), self->_totalDurationHistogramCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("Percentiles:          99.9%%     99%%     90%%     50%%     25%%     1%%\n"));
  __45__NURenderJobStatisticsHistogram_description__block_invoke(v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Prepare     (wait): %@\n"), v10);

  __45__NURenderJobStatisticsHistogram_description__block_invoke(v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Prepare  (execute): %@\n"), v11);

  __45__NURenderJobStatisticsHistogram_description__block_invoke(v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Render      (wait): %@\n"), v12);

  __45__NURenderJobStatisticsHistogram_description__block_invoke(v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Render   (execute): %@\n"), v13);

  __45__NURenderJobStatisticsHistogram_description__block_invoke(v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Complete    (wait): %@\n"), v14);

  __45__NURenderJobStatisticsHistogram_description__block_invoke(v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Complete (execute): %@\n"), v15);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  __45__NURenderJobStatisticsHistogram_description__block_invoke(v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Total       (wait): %@\n"), v16);

  __45__NURenderJobStatisticsHistogram_description__block_invoke(v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Total    (execute): %@\n"), v17);

  __45__NURenderJobStatisticsHistogram_description__block_invoke(v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Total             : %@\n"), v18);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  -[NURenderJobStatisticsHistogram graphHistogram:label:](self, "graphHistogram:label:", self->_totalDurationHistogram, CFSTR("Graph: Total (execute) (y = samples, x = millis):"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v19);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n>"));
  return v3;
}

- (unint64_t)binCount
{
  return self->_binCount;
}

- (double)millisPerBin
{
  return self->_millisPerBin;
}

- (int64_t)prepareLatencyHistogram
{
  return self->_prepareLatencyHistogram;
}

- (int64_t)prepareDurationHistogram
{
  return self->_prepareDurationHistogram;
}

- (int64_t)renderLatencyHistogram
{
  return self->_renderLatencyHistogram;
}

- (int64_t)renderDurationHistogram
{
  return self->_renderDurationHistogram;
}

- (int64_t)completeLatencyHistogram
{
  return self->_completeLatencyHistogram;
}

- (int64_t)completeDurationHistogram
{
  return self->_completeDurationHistogram;
}

- (int64_t)totalDurationHistogram
{
  return self->_totalDurationHistogram;
}

- (int64_t)totalLatencyHistogram
{
  return self->_totalLatencyHistogram;
}

- (int64_t)totalHistogram
{
  return self->_totalHistogram;
}

- (int64_t)prepareLatencyHistogramCount
{
  return self->_prepareLatencyHistogramCount;
}

- (int64_t)prepareDurationHistogramCount
{
  return self->_prepareDurationHistogramCount;
}

- (int64_t)renderLatencyHistogramCount
{
  return self->_renderLatencyHistogramCount;
}

- (int64_t)renderDurationHistogramCount
{
  return self->_renderDurationHistogramCount;
}

- (int64_t)completeLatencyHistogramCount
{
  return self->_completeLatencyHistogramCount;
}

- (int64_t)completeDurationHistogramCount
{
  return self->_completeDurationHistogramCount;
}

- (int64_t)totalDurationHistogramCount
{
  return self->_totalDurationHistogramCount;
}

- (int64_t)totalLatencyHistogramCount
{
  return self->_totalLatencyHistogramCount;
}

- (int64_t)totalHistogramCount
{
  return self->_totalHistogramCount;
}

id __45__NURenderJobStatisticsHistogram_description__block_invoke(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 100);
  if (objc_msgSend(v1, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "doubleValue");
      v6 = v5;

      if (v6 >= 0.0)
      {
        objc_msgSend(v1, "objectAtIndexedSubscript:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(v2, "appendFormat:", CFSTR("%6.2f  "), v8);

      }
      else
      {
        objc_msgSend(v2, "appendString:", CFSTR("        "));
      }
      ++v3;
    }
    while (v3 < objc_msgSend(v1, "count"));
  }

  return v2;
}

uint64_t __59__NURenderJobStatisticsHistogram_addStatisticsToHistogram___block_invoke(uint64_t result, uint64_t a2, _QWORD *a3, double a4)
{
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;

  if (a4 > 0.0)
  {
    v6 = result;
    v7 = a4 * 1000.0;
    objc_msgSend(*(id *)(result + 32), "millisPerBin");
    v9 = (unint64_t)(v7 / v8);
    result = objc_msgSend(*(id *)(v6 + 32), "binCount");
    if (result - 1 <= v9)
    {
      result = objc_msgSend(*(id *)(v6 + 32), "binCount");
      v9 = result - 1;
    }
    ++*(_QWORD *)(a2 + 8 * v9);
    ++*a3;
  }
  return result;
}

@end
