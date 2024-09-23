@implementation IMPerfProfiler

+ (id)instance
{
  if (qword_1EE1DDB50 != -1)
    dispatch_once(&qword_1EE1DDB50, &unk_1E2C42D48);
  return (id)qword_1EE1DDB48;
}

- (IMPerfProfiler)init
{
  IMPerfProfiler *v2;
  NSMutableArray *v3;
  NSMutableArray *sinks;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IMPerfProfiler;
  v2 = -[IMPerfProfiler init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sinks = v2->_sinks;
    v2->_sinks = v3;

    objc_msgSend_instance(IMPerfNSLogProfilerSink, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_instance(IMPerfProfilerDefaultBehavior, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSink_withBehavior_(v2, v13, (uint64_t)v8, (uint64_t)v12);

  }
  return v2;
}

- (void)addSink:(id)a3 withBehavior:(id)a4
{
  NSMutableArray *sinks;
  id v6;
  id v7;
  IMPerfSinkPair *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  sinks = self->_sinks;
  v6 = a4;
  v7 = a3;
  v8 = [IMPerfSinkPair alloc];
  v12 = (id)objc_msgSend_initWithBehavior_sink_(v8, v9, (uint64_t)v6, (uint64_t)v7);

  objc_msgSend_addObject_(sinks, v10, (uint64_t)v12, v11);
}

- (void)logMeasurement:(IMPerfMeasurement_t *)a3
{
  IMPerfProfiler *v4;
  NSMutableArray *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v4->_sinks;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend_behavior(v13, v7, v8, v9, (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sink(v13, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_perfProfiler_measurementDidFinish_withSink_(v14, v19, (uint64_t)v4, (uint64_t)a3, v18);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sinks, 0);
}

@end
