@implementation NURenderJobStatistics

- (void)renderJob:(id)a3 willRunStage:(int64_t)a4
{
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *specific;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = NUAbsoluteTime();
  switch(a4)
  {
    case 1:
      -[NURenderJobStatistics setWillPrepareTime:](self, "setWillPrepareTime:", v6);
      return;
    case 4:
      -[NURenderJobStatistics setWillRenderTime:](self, "setWillRenderTime:", v6);
      return;
    case 5:
      -[NURenderJobStatistics setWillCompleteTime:](self, "setWillCompleteTime:", v6);
      return;
    case 6:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      v7 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = v7;
        objc_msgSend(v8, "stringWithFormat:", CFSTR("Unexpected stage: %@"), CFSTR("Done"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v10;
        _os_log_impl(&dword_1A6553000, v9, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        v11 = _NULogOnceToken;
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v11 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
          goto LABEL_12;
        }
        if (v11 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      }
      else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
LABEL_12:
        v12 = (void *)_NUAssertLogger;
        if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = specific;
        v20 = v12;
        objc_msgSend(v18, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = specific;
        v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        goto LABEL_19;
      }
      v23 = (void *)_NUAssertLogger;
      if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v24 = (void *)MEMORY[0x1E0CB3978];
      v20 = v23;
      objc_msgSend(v24, "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v26;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_19:
LABEL_17:
      _NUAssertContinueHandler((uint64_t)"-[NURenderJobStatistics renderJob:willRunStage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1662, CFSTR("Unexpected stage: %@"), v13, v14, v15, v16, (uint64_t)CFSTR("Done"));
      return;
    default:
      return;
  }
}

- (void)renderJob:(id)a3 didRunStage:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  const char *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *specific;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = NUAbsoluteTime();
  switch(a4)
  {
    case 0:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      v8 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = v8;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("Unexpected stage: %@"), CFSTR("None"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v11;
        _os_log_impl(&dword_1A6553000, v10, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        v12 = _NULogOnceToken;
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v12 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
          goto LABEL_22;
        }
        if (v12 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      }
      else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
LABEL_22:
        v27 = (void *)_NUAssertLogger;
        if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = specific;
        v35 = v27;
        objc_msgSend(v33, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543618;
        v43 = specific;
        v44 = 2114;
        v45 = v37;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        goto LABEL_30;
      }
      v38 = (void *)_NUAssertLogger;
      if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v39 = (void *)MEMORY[0x1E0CB3978];
      v35 = v38;
      objc_msgSend(v39, "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v41;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_30:
LABEL_27:
      _NUAssertContinueHandler((uint64_t)"-[NURenderJobStatistics renderJob:didRunStage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1695, CFSTR("Unexpected stage: %@"), v28, v29, v30, v31, (uint64_t)CFSTR("None"));
LABEL_28:

      return;
    case 1:
      -[NURenderJobStatistics setDidPrepareTime:](self, "setDidPrepareTime:", v7);
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v13 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v14 = v13;
        -[NURenderJobStatistics didPrepareTime](self, "didPrepareTime");
        v16 = v15;
        -[NURenderJobStatistics willPrepareTime](self, "willPrepareTime");
        *(_DWORD *)buf = 134218240;
        v43 = v6;
        v44 = 2048;
        v45 = v16 - v17;
        v18 = "job %p didPrepare %0.4f s";
        goto LABEL_20;
      }
      goto LABEL_28;
    case 4:
      -[NURenderJobStatistics setDidRenderTime:](self, "setDidRenderTime:", v7);
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v19 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v14 = v19;
        -[NURenderJobStatistics didRenderTime](self, "didRenderTime");
        v21 = v20;
        -[NURenderJobStatistics willRenderTime](self, "willRenderTime");
        *(_DWORD *)buf = 134218240;
        v43 = v6;
        v44 = 2048;
        v45 = v21 - v22;
        v18 = "job %p didRender %0.4f s";
        goto LABEL_20;
      }
      goto LABEL_28;
    case 5:
      -[NURenderJobStatistics setDidCompleteTime:](self, "setDidCompleteTime:", v7);
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v23 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v14 = v23;
        -[NURenderJobStatistics didCompleteTime](self, "didCompleteTime");
        v25 = v24;
        -[NURenderJobStatistics willCompleteTime](self, "willCompleteTime");
        *(_DWORD *)buf = 134218240;
        v43 = v6;
        v44 = 2048;
        v45 = v25 - v26;
        v18 = "job %p didComplete %0.4f s";
LABEL_20:
        _os_log_debug_impl(&dword_1A6553000, v14, OS_LOG_TYPE_DEBUG, v18, buf, 0x16u);

      }
      goto LABEL_28;
    default:
      goto LABEL_28;
  }
}

- (double)prepareLatency
{
  double result;

  result = self->_willPrepareTime - self->_requestTime;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)prepareDuration
{
  double result;

  result = self->_didPrepareTime - self->_willPrepareTime;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)renderLatency
{
  double result;

  result = self->_willRenderTime - self->_didPrepareTime;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)renderDuration
{
  double result;

  result = self->_didRenderTime - self->_willRenderTime;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)completeLatency
{
  double result;

  result = self->_willCompleteTime - self->_didRenderTime;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)completeDuration
{
  double result;

  result = self->_didCompleteTime - self->_willCompleteTime;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)replyLatency
{
  double responseTime;
  double result;
  double didCompleteTime;

  responseTime = self->_responseTime;
  result = 0.0;
  if (responseTime != 0.0)
  {
    didCompleteTime = self->_didCompleteTime;
    if (didCompleteTime == 0.0)
    {
      didCompleteTime = self->_didRenderTime;
      if (didCompleteTime == 0.0)
      {
        didCompleteTime = self->_didPrepareTime;
        if (didCompleteTime == 0.0)
          didCompleteTime = self->_requestTime;
      }
    }
    return responseTime - didCompleteTime;
  }
  return result;
}

- (double)latency
{
  double v3;
  double v4;
  double v5;
  double result;

  -[NURenderJobStatistics totalDuration](self, "totalDuration");
  v4 = v3;
  -[NURenderJobStatistics duration](self, "duration");
  result = v4 - v5;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)duration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  -[NURenderJobStatistics prepareDuration](self, "prepareDuration");
  v4 = v3;
  -[NURenderJobStatistics renderDuration](self, "renderDuration");
  v6 = v4 + v5;
  -[NURenderJobStatistics completeDuration](self, "completeDuration");
  result = v6 + v7;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)lastRecordedTime
{
  double result;

  result = self->_responseTime;
  if (result <= 0.0)
  {
    result = self->_didCompleteTime;
    if (result <= 0.0)
    {
      result = self->_willCompleteTime;
      if (result <= 0.0)
      {
        result = self->_didRenderTime;
        if (result <= 0.0)
        {
          result = self->_willRenderTime;
          if (result <= 0.0)
          {
            result = self->_didPrepareTime;
            if (result <= 0.0)
            {
              result = self->_willPrepareTime;
              if (result <= 0.0)
                return fmax(self->_requestTime, 0.0);
            }
          }
        }
      }
    }
  }
  return result;
}

- (double)totalDuration
{
  double v3;
  double v4;
  double v5;

  -[NURenderJobStatistics lastRecordedTime](self, "lastRecordedTime");
  v4 = v3;
  -[NURenderJobStatistics requestTime](self, "requestTime");
  return v4 - v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  char v28[40];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2048);
  v4 = objc_opt_class();
  -[NURenderJobStatistics dependencies](self, "dependencies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p dependencies:%lu compiled: %s "), v4, self, objc_msgSend(v5, "count"), "Release");

  objc_msgSend(v3, "appendFormat:", CFSTR("{\n"));
  -[NURenderJobStatistics prepareLatency](self, "prepareLatency");
  if (v6 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v6 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  prepare     (wait) : %s\n"), v28);
  -[NURenderJobStatistics prepareDuration](self, "prepareDuration");
  if (v7 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v7 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  prepare  (execute) : %s\n"), v28);
  -[NURenderJobStatistics renderLatency](self, "renderLatency");
  if (v8 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v8 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  render      (wait) : %s\n"), v28);
  -[NURenderJobStatistics renderDuration](self, "renderDuration");
  if (v9 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v9 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  render   (execute) : %s\n"), v28);
  -[NURenderJobStatistics completeLatency](self, "completeLatency");
  if (v10 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v10 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  complete    (wait) : %s\n"), v28);
  -[NURenderJobStatistics completeDuration](self, "completeDuration");
  if (v11 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v11 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  complete (execute) : %s\n"), v28);
  -[NURenderJobStatistics replyLatency](self, "replyLatency");
  if (v12 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v12 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  reply       (wait) : %s\n"), v28);
  objc_msgSend(v3, "appendFormat:", CFSTR("      -----------------------\n"));
  -[NURenderJobStatistics latency](self, "latency");
  if (v13 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v13 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  total       (wait) : %s\n"), v28);
  -[NURenderJobStatistics duration](self, "duration");
  if (v14 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v14 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  total    (execute) : %s\n"), v28);
  -[NURenderJobStatistics duration](self, "duration");
  v16 = v15;
  -[NURenderJobStatistics latency](self, "latency");
  v18 = v16 + v17;
  if (v18 == 0.0)
    v28[0] = 0;
  else
    __sprintf_chk(v28, 0, 0x28uLL, "%.2f millis", v18 * 1000.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  total              : %s\n"), v28);
  objc_msgSend(v3, "appendFormat:", CFSTR("      -----------------------\n"));
  -[NURenderJobStatistics requestTime](self, "requestTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v19);
  objc_msgSend(v3, "appendFormat:", CFSTR("  request    (start) : %s\n"), v28);
  -[NURenderJobStatistics willPrepareTime](self, "willPrepareTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v20);
  objc_msgSend(v3, "appendFormat:", CFSTR("  prepare    (start) : %s\n"), v28);
  -[NURenderJobStatistics didPrepareTime](self, "didPrepareTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v21);
  objc_msgSend(v3, "appendFormat:", CFSTR("  prepare      (end) : %s\n"), v28);
  -[NURenderJobStatistics willRenderTime](self, "willRenderTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v22);
  objc_msgSend(v3, "appendFormat:", CFSTR("  render     (start) : %s\n"), v28);
  -[NURenderJobStatistics didRenderTime](self, "didRenderTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v23);
  objc_msgSend(v3, "appendFormat:", CFSTR("  render       (end) : %s\n"), v28);
  -[NURenderJobStatistics willCompleteTime](self, "willCompleteTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v24);
  objc_msgSend(v3, "appendFormat:", CFSTR("  complete   (start) : %s\n"), v28);
  -[NURenderJobStatistics didCompleteTime](self, "didCompleteTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v25);
  objc_msgSend(v3, "appendFormat:", CFSTR("  complete     (end) : %s\n"), v28);
  -[NURenderJobStatistics responseTime](self, "responseTime");
  __36__NURenderJobStatistics_description__block_invoke(v28, v26);
  objc_msgSend(v3, "appendFormat:", CFSTR("  response     (end) : %s\n"), v28);
  objc_msgSend(v3, "appendFormat:", CFSTR("} >\n"));
  return (NSString *)v3;
}

- (double)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(double)a3
{
  self->_requestTime = a3;
}

- (double)willPrepareTime
{
  return self->_willPrepareTime;
}

- (void)setWillPrepareTime:(double)a3
{
  self->_willPrepareTime = a3;
}

- (double)didPrepareTime
{
  return self->_didPrepareTime;
}

- (void)setDidPrepareTime:(double)a3
{
  self->_didPrepareTime = a3;
}

- (double)willRenderTime
{
  return self->_willRenderTime;
}

- (void)setWillRenderTime:(double)a3
{
  self->_willRenderTime = a3;
}

- (double)didRenderTime
{
  return self->_didRenderTime;
}

- (void)setDidRenderTime:(double)a3
{
  self->_didRenderTime = a3;
}

- (double)willCompleteTime
{
  return self->_willCompleteTime;
}

- (void)setWillCompleteTime:(double)a3
{
  self->_willCompleteTime = a3;
}

- (double)didCompleteTime
{
  return self->_didCompleteTime;
}

- (void)setDidCompleteTime:(double)a3
{
  self->_didCompleteTime = a3;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (NSArray)dependencies
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDependencies:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencies, 0);
}

char *__36__NURenderJobStatistics_description__block_invoke(char *a1, long double a2)
{
  double v3;
  tm *v4;
  long double __y;
  time_t v7;

  if (a2 == 0.0)
  {
    *a1 = 0;
  }
  else
  {
    v7 = (uint64_t)a2;
    v3 = modf(a2, &__y);
    v4 = gmtime(&v7);
    strftime(a1, 0x28uLL, "%H:%M:%S", v4);
    sprintf(a1 + 8, " +%i", (int)(v3 * 100000.0) % 100000);
  }
  return a1;
}

+ (NSMutableDictionary)history
{
  id v2;
  void *v3;

  if (!_history
    && +[NUGlobalSettings renderJobDebugCapturePerfStatHistory](NUGlobalSettings, "renderJobDebugCapturePerfStatHistory"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)_history;
    _history = (uint64_t)v2;

  }
  return (NSMutableDictionary *)(id)_history;
}

+ (void)addStatisticsToHistory:(id)a3 forJob:(id)a4 wasCanceled:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NURenderJobStatisticsHistory *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v18 = a3;
  v7 = a4;
  +[NURenderJobStatistics history](NURenderJobStatistics, "history");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = [NURenderJobStatisticsHistory alloc];
    objc_msgSend(v7, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NURenderJobStatisticsHistory initHistoryForJobsWithName:rollingHistoryMaxSize:](v12, "initHistoryForJobsWithName:rollingHistoryMaxSize:", v14, 50);

    +[NURenderJobStatistics history](NURenderJobStatistics, "history");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v17);

  }
  objc_msgSend(v11, "addStatisticsToHistory:wasCanceled:", v18, v5);

}

+ (void)recordJobCreatedToHistory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  +[NURenderJobStatistics history](NURenderJobStatistics, "history");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = -[NURenderJobStatisticsHistory initHistoryForJobsWithName:rollingHistoryMaxSize:]([NURenderJobStatisticsHistory alloc], "initHistoryForJobsWithName:rollingHistoryMaxSize:", v6, 50);
    +[NURenderJobStatistics history](NURenderJobStatistics, "history");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  objc_msgSend(v4, "recordJobCreated");

}

+ (id)aggregateStatistics:(id)a3
{
  id v3;
  void *v4;
  NURenderJobStatistics *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  NSObject *v45;
  void *v46;
  void *specific;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_19521();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "stats != nil");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v46;
      _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v49)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v59;
        v84 = 2114;
        v85 = v63;
        _os_log_error_impl(&dword_1A6553000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v51;
      _os_log_error_impl(&dword_1A6553000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NURenderJobStatistics aggregateStatistics:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1846, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"stats != nil");
  }
  v4 = v3;
  if (!objc_msgSend(v3, "count"))
  {
    NUAssertLogger_19521();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "stats.count != 0");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v53;
      _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (v54)
    {
      if (v56)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = (void *)MEMORY[0x1E0CB3978];
        v70 = v68;
        objc_msgSend(v69, "callStackSymbols");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v68;
        v84 = 2114;
        v85 = v72;
        _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v56)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v58;
      _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NURenderJobStatistics aggregateStatistics:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1847, CFSTR("Invalid parameter not satisfying: %s"), v73, v74, v75, v76, (uint64_t)"stats.count != 0");
  }
  v5 = objc_alloc_init(NURenderJobStatistics);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v78;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v78 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v10);
        -[NURenderJobStatistics requestTime](v5, "requestTime");
        if (v12 == 0.0
          || (objc_msgSend(v11, "requestTime"),
              v14 = v13,
              -[NURenderJobStatistics requestTime](v5, "requestTime"),
              v14 < v15))
        {
          objc_msgSend(v11, "requestTime");
          -[NURenderJobStatistics setRequestTime:](v5, "setRequestTime:");
        }
        -[NURenderJobStatistics willPrepareTime](v5, "willPrepareTime");
        if (v16 == 0.0
          || (objc_msgSend(v11, "willPrepareTime"),
              v18 = v17,
              -[NURenderJobStatistics willPrepareTime](v5, "willPrepareTime"),
              v18 < v19))
        {
          objc_msgSend(v11, "willPrepareTime");
          -[NURenderJobStatistics setWillPrepareTime:](v5, "setWillPrepareTime:");
        }
        -[NURenderJobStatistics didPrepareTime](v5, "didPrepareTime");
        if (v20 == 0.0
          || (objc_msgSend(v11, "didPrepareTime"),
              v22 = v21,
              -[NURenderJobStatistics didPrepareTime](v5, "didPrepareTime"),
              v22 < v23))
        {
          objc_msgSend(v11, "didPrepareTime");
          -[NURenderJobStatistics setDidPrepareTime:](v5, "setDidPrepareTime:");
        }
        -[NURenderJobStatistics willRenderTime](v5, "willRenderTime");
        if (v24 == 0.0
          || (objc_msgSend(v11, "willRenderTime"),
              v26 = v25,
              -[NURenderJobStatistics willRenderTime](v5, "willRenderTime"),
              v26 < v27))
        {
          objc_msgSend(v11, "willRenderTime");
          -[NURenderJobStatistics setWillRenderTime:](v5, "setWillRenderTime:");
        }
        -[NURenderJobStatistics didRenderTime](v5, "didRenderTime");
        if (v28 == 0.0
          || (objc_msgSend(v11, "didRenderTime"),
              v30 = v29,
              -[NURenderJobStatistics didRenderTime](v5, "didRenderTime"),
              v30 > v31))
        {
          objc_msgSend(v11, "didRenderTime");
          -[NURenderJobStatistics setDidRenderTime:](v5, "setDidRenderTime:");
        }
        -[NURenderJobStatistics willCompleteTime](v5, "willCompleteTime");
        if (v32 == 0.0
          || (objc_msgSend(v11, "willCompleteTime"),
              v34 = v33,
              -[NURenderJobStatistics willCompleteTime](v5, "willCompleteTime"),
              v34 > v35))
        {
          objc_msgSend(v11, "willCompleteTime");
          -[NURenderJobStatistics setWillCompleteTime:](v5, "setWillCompleteTime:");
        }
        -[NURenderJobStatistics didCompleteTime](v5, "didCompleteTime");
        if (v36 == 0.0
          || (objc_msgSend(v11, "didCompleteTime"),
              v38 = v37,
              -[NURenderJobStatistics didCompleteTime](v5, "didCompleteTime"),
              v38 > v39))
        {
          objc_msgSend(v11, "didCompleteTime");
          -[NURenderJobStatistics setDidCompleteTime:](v5, "setDidCompleteTime:");
        }
        -[NURenderJobStatistics responseTime](v5, "responseTime");
        if (v40 == 0.0
          || (objc_msgSend(v11, "responseTime"),
              v42 = v41,
              -[NURenderJobStatistics responseTime](v5, "responseTime"),
              v42 > v43))
        {
          objc_msgSend(v11, "responseTime");
          -[NURenderJobStatistics setResponseTime:](v5, "setResponseTime:");
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    }
    while (v8);
  }

  -[NURenderJobStatistics setDependencies:](v5, "setDependencies:", v6);
  return v5;
}

@end
