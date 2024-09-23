@implementation SGHarvestQueueMetricsTimer

- (SGHarvestQueueMetricsTimer)initWithName:(id)a3
{
  id v5;
  char *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGHarvestQueueMetricsTimer;
  v6 = -[SGHarvestQueueMetricsTimer init](&v13, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = clock();
    *((_QWORD *)v6 + 2) = 0;
    *((_QWORD *)v6 + 3) = mach_absolute_time();
    *(int64x2_t *)(v6 + 56) = vdupq_n_s64(0x7FF8000000000000uLL);
    objc_storeStrong((id *)v6 + 6, a3);
    v6[40] = 0;
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v11 = objc_msgSend(*((id *)v6 + 6), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v15 = v11;
      _os_signpost_emit_with_name_impl(&dword_1C3607000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SGHarvestQueueMetrics", "%s", buf, 0xCu);
    }

    *((_QWORD *)v6 + 4) = v8;
  }

  return (SGHarvestQueueMetricsTimer *)v6;
}

- (void)done:(BOOL)a3
{
  clock_t v5;
  unint64_t cpuStart;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t signpostId;
  const char *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = clock();
  cpuStart = self->_cpuStart;
  if (v5 <= cpuStart)
    v7 = self->_cpuStart;
  else
    v7 = v5;
  self->_cpuEnd = v7;
  self->_cpu = (double)(v7 - cpuStart) / 1000000.0;
  v8 = mach_absolute_time() - self->_durationStart;
  if (SGMachTimeToNanoseconds_onceToken != -1)
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
  self->_duration = (double)(v8
                           * SGMachTimeToNanoseconds_machTimebaseInfo
                           / *(unsigned int *)algn_1ED52979C)
                  / 1000000000.0;
  self->_significantWork = a3;
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = -[NSString UTF8String](self->_name, "UTF8String");
    v13 = 136315138;
    v14 = v12;
    _os_signpost_emit_with_name_impl(&dword_1C3607000, v10, OS_SIGNPOST_INTERVAL_END, signpostId, "SGHarvestQueueMetrics", "%s", (uint8_t *)&v13, 0xCu);
  }

}

- (void)applyAdjustmentIfSane:(id)a3
{

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGHarvestQueueMetricsTimer name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGHarvestQueueMetricsTimer duration](self, "duration");
  v8 = v7;
  -[SGHarvestQueueMetricsTimer cpu](self, "cpu");
  v10 = v9;
  v11 = -[SGHarvestQueueMetricsTimer significantWork](self, "significantWork");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ duration: %.6f cpu: %.6f enrichment: %@>"), v5, v6, v8, v10, v12);

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (double)cpu
{
  return self->_cpu;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)significantWork
{
  return self->_significantWork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
