@implementation _ANEPerformanceStats

+ (unsigned)driverMaskForANEFMask:(unsigned int)a3
{
  if (a3 <= 0xF)
    return a3 & 1 | (2 * ((a3 >> 3) & 1)) & 0xFFFFFFF3 | (4 * ((a3 >> 1) & 3));
  else
    return 0;
}

- (id)stringForPerfCounter:(int)a3
{
  if (a3 > 0x17)
    return CFSTR("kANE_UKNOWN");
  else
    return off_1E9516338[a3];
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_ANEPerformanceStats hwExecutionTime](self, "hwExecutionTime");
  -[_ANEPerformanceStats performanceCounters](self, "performanceCounters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { hwExecutionTime=%llu : perfCounterData=%@} "), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (_ANEPerformanceStats)new
{
  return 0;
}

- (_ANEPerformanceStats)init
{

  return 0;
}

- (_ANEPerformanceStats)initWithHardwareExecution:(unint64_t)a3 perfCounterData:(id)a4 ANEStatsRawData:(id)a5
{
  id v9;
  id v10;
  _ANEPerformanceStats *v11;
  _ANEPerformanceStats *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_ANEPerformanceStats;
  v11 = -[_ANEPerformanceStats init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_hwExecutionTime = a3;
    objc_storeStrong((id *)&v11->_perfCounterData, a4);
    objc_storeStrong((id *)&v12->_pStatsRawData, a5);
  }

  return v12;
}

- (_ANEPerformanceStats)initWithRequestPerformanceBuffer:(void *)a3 statsBufferSize:(unsigned int *)a4
{
  unsigned int v8;
  unint64_t v9;
  NSObject *v10;
  _ANEPerformanceStats *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void **v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    +[_ANELog common](_ANELog, "common");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v21;
      v25 = 2048;
      v26 = a3;
      v27 = 2048;
      v28 = *(double *)&a4;
      _os_log_error_impl(&dword_1D3352000, v10, OS_LOG_TYPE_ERROR, "%@: Invalid argument. requestPerfStatsBuffer=%p : requestStatsBufferSize=%p", buf, 0x20u);

    }
    v11 = 0;
    goto LABEL_24;
  }
  v8 = *a4;
  if (*a4 >= 0x10)
  {
    v9 = *((_QWORD *)*a3 + 1);
    +[_ANELog common](_ANELog, "common");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v13;
      v25 = 2048;
      v26 = (void **)v9;
      v27 = 2048;
      v28 = (float)((float)v9 / 1000000.0);
      _os_log_impl(&dword_1D3352000, v12, OS_LOG_TYPE_INFO, "%@: HW Execution time: %llu ns (%.2f ms)", buf, 0x20u);

    }
  }
  else
  {
    v9 = 0;
  }
  if (a4[2] >= 0xE0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)a3[2] + 8, 216);
    v10 = objc_claimAutoreleasedReturnValue();
    +[_ANELog common](_ANELog, "common");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEPerformanceStats initWithRequestPerformanceBuffer:statsBufferSize:].cold.2(v17, (uint64_t)buf, v16);
    }

    v14 = a4[1];
    if (v14 < 0x228)
    {
      v15 = 0;
      goto LABEL_23;
    }
LABEL_20:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3[1], v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANELog common](_ANELog, "common");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEPerformanceStats initWithRequestPerformanceBuffer:statsBufferSize:].cold.1(v19, (uint64_t)&v22, v18);
    }

    goto LABEL_23;
  }
  v14 = a4[1];
  if (v14 >= 0x228)
  {
    v10 = 0;
    goto LABEL_20;
  }
  v10 = 0;
  v15 = 0;
  if (v8 >= 0x10)
  {
LABEL_23:
    self = -[_ANEPerformanceStats initWithHardwareExecution:perfCounterData:ANEStatsRawData:](self, "initWithHardwareExecution:perfCounterData:ANEStatsRawData:", v9, v10, v15);

    v11 = self;
LABEL_24:

    goto LABEL_25;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

- (_ANEPerformanceStats)initWithReconstructedData:(id)a3 hardwareExecutionNS:(unint64_t)a4
{
  return -[_ANEPerformanceStats initWithHardwareExecution:perfCounterData:ANEStatsRawData:](self, "initWithHardwareExecution:perfCounterData:ANEStatsRawData:", a4, a3, 0);
}

+ (_ANEPerformanceStats)statsWithRequestPerformanceBuffer:(void *)a3 statsBufferSize:(unsigned int *)a4
{
  return (_ANEPerformanceStats *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRequestPerformanceBuffer:statsBufferSize:", a3, a4);
}

+ (_ANEPerformanceStats)statsWithHardwareExecutionNS:(unint64_t)a3
{
  return (_ANEPerformanceStats *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithHardwareExecution:perfCounterData:ANEStatsRawData:", a3, 0, 0);
}

+ (_ANEPerformanceStats)statsWithReconstructed:(id)a3 hardwareExecutionNS:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReconstructedData:hardwareExecutionNS:", v6, a4);

  return (_ANEPerformanceStats *)v7;
}

- (id)performanceCounters
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[_ANEPerformanceStats perfCounterData](self, "perfCounterData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_ANEPerformanceStats perfCounterData](self, "perfCounterData");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "bytes");

    v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    -[_ANEPerformanceStats perfCounterData](self, "perfCounterData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8 >= 8)
    {
      v9 = 0;
      v10 = v8 >> 3;
      do
      {
        -[_ANEPerformanceStats stringForPerfCounter:](self, "stringForPerfCounter:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v5 + 8 * v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

        ++v9;
      }
      while (v10 != v9);
    }
    v13 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)emitPerfcounterSignpostsWithModelStringID:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (kdebug_is_enabled())
  {
    -[_ANEPerformanceStats perfCounterData](self, "perfCounterData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_ANEPerformanceStats perfCounterData](self, "perfCounterData");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "bytes");

      -[_ANEPerformanceStats perfCounterData](self, "perfCounterData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (unint64_t)objc_msgSend(v6, "length") >> 3;

      v8 = v7 - 3 * ((v7 * (unsigned __int128)0x5555555555555556uLL) >> 64);
      kdebug_trace();
      if (v7 >= v8)
        v9 = 3 * ((v7 * (unsigned __int128)0x5555555555555556uLL) >> 64);
      else
        v9 = 0;
      if (v7 > v8)
      {
        v10 = 0;
        do
        {
          kdebug_trace();
          v10 += 3;
        }
        while (v10 < v9);
      }
      if (v8)
        kdebug_trace();
      kdebug_trace();
    }
  }
}

- (unint64_t)hwExecutionTime
{
  return self->_hwExecutionTime;
}

- (NSData)pStatsRawData
{
  return self->_pStatsRawData;
}

- (NSData)perfCounterData
{
  return self->_perfCounterData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfCounterData, 0);
  objc_storeStrong((id *)&self->_pStatsRawData, 0);
}

- (void)initWithRequestPerformanceBuffer:(NSObject *)a3 statsBufferSize:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, a2, a3, "%@: Write ane stats raw data", (uint8_t *)a2);

}

- (void)initWithRequestPerformanceBuffer:(NSObject *)a3 statsBufferSize:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, a2, a3, "%@: Write perf counters", (uint8_t *)a2);

}

@end
