@implementation AMSMetricsFigaroBagConfguration

+ (id)configurationPromiseWithBag:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "dictionaryForKey:", 0x1E254BA80);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continueWithBlock:", &__block_literal_global_88);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultModifier, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

id __50__AMSMetricsFigaroBagConfguration_prepareForFlush__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_generateModifiersIfNeeded");
}

void __44__AMSMetricsFigaroBagConfguration_overrides__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_generateModifiersIfNeeded");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)modifierForEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[AMSMetricsFigaroBagConfguration overrides](self, "overrides", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "fieldFiltersMatchEvent:", v4) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v11 = v10;

      if (v11)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
  }
  -[AMSMetricsFigaroBagConfguration defaultModifier](self, "defaultModifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v11;
}

- (NSArray)overrides
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__45;
  v11 = __Block_byref_object_dispose__45;
  v12 = 0;
  -[AMSMetricsFigaroBagConfguration queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AMSMetricsFigaroBagConfguration_overrides__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (AMSMetricsFigaroEventModifier)defaultModifier
{
  return self->_defaultModifier;
}

- (id)_generateModifiersIfNeeded
{
  AMSMetricsFigaroBagConfguration *v2;
  NSObject *v3;
  NSArray *overrides;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  AMSMetricsFigaroEventModifier *v17;
  AMSMetricsFigaroBagConfguration *v18;
  void *v19;
  AMSMetricsFigaroEventModifier *v20;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v2 = self;
  v30 = *MEMORY[0x1E0C80C00];
  -[AMSMetricsFigaroBagConfguration queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  overrides = v2->_overrides;
  if (overrides)
    return overrides;
  v24 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSMetricsFigaroBagConfguration metricsDictionary](v2, "metricsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("overrides"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;

          if (!v15)
            goto LABEL_20;
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("fieldFilters"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v16;
          else
            v14 = 0;

          if (objc_msgSend(v14, "count"))
          {
            v17 = [AMSMetricsFigaroEventModifier alloc];
            -[AMSMetricsFigaroBagConfguration metricsDictionary](v2, "metricsDictionary");
            v18 = v2;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[AMSMetricsFigaroEventModifier initWithMetricsDictionary:overrideDictionary:](v17, "initWithMetricsDictionary:overrideDictionary:", v19, v15);

            v2 = v18;
            -[NSArray addObject:](v24, "addObject:", v20);

          }
        }
        else
        {
          v15 = 0;
        }

LABEL_20:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v21 = v2->_overrides;
  v2->_overrides = v24;
  v22 = v24;

  v23 = v2->_overrides;
  return v23;
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

id __63__AMSMetricsFigaroBagConfguration_configurationPromiseWithBag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  AMSMetricsFigaroBagConfguration *v5;
  void *v6;

  v4 = a2;
  if (v4)
  {
    v5 = -[AMSMetricsFigaroBagConfguration initWithMetricsDictionary:]([AMSMetricsFigaroBagConfguration alloc], "initWithMetricsDictionary:", v4);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
  }
  else
  {
    AMSError(7, CFSTR("Figaro Bag Failure"), CFSTR("Failed to locate the figaro bag configuration"), a3);
    v5 = (AMSMetricsFigaroBagConfguration *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AMSMetricsFigaroBagConfguration)initWithMetricsDictionary:(id)a3
{
  id v5;
  AMSMetricsFigaroBagConfguration *v6;
  AMSMetricsFigaroBagConfguration *v7;
  AMSMetricsFigaroEventModifier *v8;
  AMSMetricsFigaroEventModifier *defaultModifier;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSMetricsFigaroBagConfguration;
  v6 = -[AMSMetricsFigaroBagConfguration init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metricsDictionary, a3);
    v8 = -[AMSMetricsFigaroEventModifier initWithMetricsDictionary:overrideDictionary:]([AMSMetricsFigaroEventModifier alloc], "initWithMetricsDictionary:overrideDictionary:", v5, 0);
    defaultModifier = v7->_defaultModifier;
    v7->_defaultModifier = v8;

    v10 = dispatch_queue_create("com.apple.AMSMetricsFigaroBagConfguration", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)prepareForFlush
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[AMSMetricsFigaroBagConfguration queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__AMSMetricsFigaroBagConfguration_prepareForFlush__block_invoke;
  v8[3] = &unk_1E253DBD8;
  v8[4] = self;
  v5 = v8;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_5;
  block[3] = &unk_1E253DC28;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

@end
