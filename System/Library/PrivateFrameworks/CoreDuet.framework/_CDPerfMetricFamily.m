@implementation _CDPerfMetricFamily

+ (_CDPerfMetricFamily)perfMetricFamilyWithName:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  if (_CDPerfMetricInitialized != -1)
    dispatch_once_f(&_CDPerfMetricInitialized, 0, (dispatch_function_t)_CDPerfMetricInitialize);
  v4 = _CDPerfMetricQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___CDPerfMetricFamily_perfMetricFamilyWithName___block_invoke;
  v8[3] = &unk_1E26E2E78;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (_CDPerfMetricFamily *)v6;
}

- (_CDPerfMetricFamily)initWithName:(id)a3
{
  id v5;
  _CDPerfMetricFamily *v6;
  _CDPerfMetricFamily *v7;
  uint64_t v8;
  NSMutableDictionary *perfMetrics;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CDPerfMetricFamily;
  v6 = -[_CDPerfMetricFamily init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = objc_opt_new();
    perfMetrics = v7->_perfMetrics;
    v7->_perfMetrics = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)perfMetricWithName:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v8 = _CDPerfMetricQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49___CDPerfMetricFamily_perfMetricWithName_string___block_invoke;
  v13[3] = &unk_1E26E2EA0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)perfMetricWithName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v5 = _CDPerfMetricQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___CDPerfMetricFamily_perfMetricWithName___block_invoke;
  block[3] = &unk_1E26E2CA8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allPerfMetrics
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37___CDPerfMetricFamily_allPerfMetrics__block_invoke;
  v4[3] = &unk_1E26E2E78;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)_CDPerfMetricQueue, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPerfMetricFamily name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[_CDPerfMetricFamily perfMetrics](self, "perfMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { name=%@, metrics.count=%@ }"), v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)perfMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
