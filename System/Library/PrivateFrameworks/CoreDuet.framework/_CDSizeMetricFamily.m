@implementation _CDSizeMetricFamily

+ (id)sizeMetricFamilyWithName:(uint64_t)a1
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = a2;
  objc_opt_self();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  if (_CDSizeMetricInitialized != -1)
    dispatch_once_f(&_CDSizeMetricInitialized, 0, (dispatch_function_t)_CDSizeMetricInitialize);
  v3 = _CDSizeMetricQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___CDSizeMetricFamily_sizeMetricFamilyWithName___block_invoke;
  v7[3] = &unk_1E26E2E78;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (_QWORD)initWithName:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_CDSizeMetricFamily;
    v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      v6 = objc_opt_new();
      v7 = (void *)a1[2];
      a1[2] = v6;

    }
  }

  return a1;
}

- (id)sizeMetricWithName:(void *)a3 string:(uint64_t)a4 scale:
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__29;
    v21 = __Block_byref_object_dispose__29;
    v22 = 0;
    v9 = _CDSizeMetricQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___CDSizeMetricFamily_sizeMetricWithName_string_scale___block_invoke;
    block[3] = &unk_1E26E70E8;
    v15 = &v17;
    block[4] = a1;
    v13 = v7;
    v14 = v8;
    v16 = a4;
    dispatch_sync(v9, block);
    v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *v5;
  void *v6;
  id v7;
  void *v8;
  SEL v9;
  id Property;
  id v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v7 = objc_getProperty(self, v5, 8, 1);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    Property = objc_getProperty(self, v9, 16, 1);
  }
  else
  {
    v7 = 0;
    Property = 0;
    v8 = (void *)MEMORY[0x1E0CB37E8];
  }
  v11 = Property;
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { name=%@, metrics.count=%@ }"), v6, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
