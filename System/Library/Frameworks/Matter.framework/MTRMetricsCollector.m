@implementation MTRMetricsCollector

+ (id)sharedInstance
{
  if (qword_256159260 != -1)
    dispatch_once(&qword_256159260, &unk_250502210);
  return (id)qword_256159258;
}

- (MTRMetricsCollector)init
{
  MTRMetricsCollector *v2;
  const char *v3;
  uint64_t v4;
  MTRMetricsCollector *v5;
  uint64_t v6;
  NSMutableDictionary *metricsDataCollection;
  MTRMetricsCollector *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRMetricsCollector;
  v2 = -[MTRMetricsCollector init](&v10, sel_init);
  v5 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    metricsDataCollection = v5->_metricsDataCollection;
    v5->_metricsDataCollection = (NSMutableDictionary *)v6;

    v5->_tracingBackendRegistered = 0;
    v8 = v5;
  }

  return v5;
}

- (void)registerTracingBackend
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  uint8_t v5[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_tracingBackendRegistered)
  {
    sub_2341C47B0(&self->_tracingBackend._vptr$Backend);
    sub_234117B80(0, "NotSpecified");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_233BF3000, v4, OS_LOG_TYPE_DEFAULT, "Registered tracing backend with the registry", v5, 2u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
    self->_tracingBackendRegistered = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterTracingBackend
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  uint8_t v5[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_tracingBackendRegistered)
  {
    sub_2341C4818(&self->_tracingBackend._vptr$Backend);
    sub_234117B80(0, "NotSpecified");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_233BF3000, v4, OS_LOG_TYPE_DEFAULT, "Unregistered tracing backend with the registry", v5, 2u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
    self->_tracingBackendRegistered = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)handleMetricEvent:(MetricEvent *)a3
{
  os_unfair_lock_s *p_lock;
  const char *v6;
  const __CFString *v7;
  void *v8;
  MTRMetricData *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  char *var1;
  void *v19;
  _BOOL4 v20;
  const char *v21;
  char *v22;
  uint8_t buf[4];
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (*((unsigned __int8 *)&a3->var2 + 4) <= 3u)
  {
    v7 = CFSTR("_end");
    if (a3->var0 != 1)
      v7 = CFSTR("_begin");
    if (a3->var0 == 2)
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("%s%@"), a3->var1, CFSTR("_event"));
    else
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("%s%@"), a3->var1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [MTRMetricData alloc];
    v12 = (void *)objc_msgSend_initWithMetricEvent_(v9, v10, (uint64_t)a3);
    if (a3->var0 == 1)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("%s%@"), a3->var1, CFSTR("_begin"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(self->_metricsDataCollection, v14, (uint64_t)v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend_setDurationFromMetricData_(v12, v15, (uint64_t)v16);
      }
      else
      {
        sub_234117B80(0, "NotSpecified");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          var1 = a3->var1;
          *(_DWORD *)buf = 136315138;
          v24 = var1;
          _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_ERROR, "Unable to find Begin event corresponding to Metric Event: %s", buf, 0xCu);
        }

        if (sub_234114844(1u))
        {
          v22 = a3->var1;
          sub_2341147D0(0, 1);
        }
      }

    }
    objc_msgSend_valueForKey_(self->_metricsDataCollection, v11, (uint64_t)v8, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
      objc_msgSend_setValue_forKey_(self->_metricsDataCollection, v21, (uint64_t)v12, v8);

  }
  os_unfair_lock_unlock(p_lock);
}

- (id)metricSnapshot:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  MTRMetrics *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  NSMutableDictionary *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [MTRMetrics alloc];
  v9 = objc_msgSend_count(self->_metricsDataCollection, v7, v8);
  v11 = (void *)objc_msgSend_initWithCapacity_(v6, v10, v9);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = self->_metricsDataCollection;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->_metricsDataCollection, v14, v18, (_QWORD)v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setMetricData_forKey_(v11, v20, (uint64_t)v19, v18);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v24, v28, 16);
    }
    while (v15);
  }

  if (v3)
    objc_msgSend_removeAllObjects(self->_metricsDataCollection, v21, v22);
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)resetMetrics
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeAllObjects(self->_metricsDataCollection, v4, v5);
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{

  sub_233CB66E0(&self->_tracingBackend.mPrev);
  objc_storeStrong((id *)&self->_metricsDataCollection, 0);
}

- (id).cxx_construct
{
  sub_2341C4674(&self->_tracingBackend._vptr$Backend);
  return self;
}

@end
