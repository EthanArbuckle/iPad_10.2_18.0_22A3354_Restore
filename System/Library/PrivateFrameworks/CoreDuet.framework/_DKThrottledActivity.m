@implementation _DKThrottledActivity

- (void)performWithMinimumIntervalInSecondsOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, a3);

}

- (void)performWithDelayInSecondsOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, a3);

}

- (id)activityThrottler
{
  id v2;
  void *v3;

  if (a1)
  {
    if (activityThrottler_initialized != -1)
      dispatch_once(&activityThrottler_initialized, &__block_literal_global_48);
    v2 = (id)activityThrottler_sharedInstances;
    objc_sync_enter(v2);
    objc_msgSend((id)activityThrottler_sharedInstances, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 8));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = -[_DKActivityThrottler initWithStore:]([_DKActivityThrottler alloc], *(void **)(a1 + 16));
      objc_msgSend((id)activityThrottler_sharedInstances, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 8));
    }
    objc_sync_exit(v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)standardInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___DKThrottledActivity_standardInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (standardInstance_initialized != -1)
    dispatch_once(&standardInstance_initialized, block);
  return (id)standardInstance_standardInstance;
}

- (_DKThrottledActivity)initWithStore:(id)a3 namespace:(id)a4
{
  id v7;
  id v8;
  _DKThrottledActivity *v9;
  _DKThrottledActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKThrottledActivity;
  v9 = -[_DKThrottledActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_namespace, a4);
  }

  return v10;
}

- (void)performNoMoreOftenInSecondsThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, a3);

}

- (void)performNoMoreOftenInSecondsThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, a3);

}

- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  double v7;
  id v8;
  id v9;
  id v10;

  v7 = a3 * 60.0;
  v8 = a5;
  v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, v7);

}

- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, v9);

}

- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6 throttleBlock:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  double v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3 * 60.0;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v17, v12, v14, v15, v16);
  dispatch_get_current_queue();
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18 == v13)
  {
    -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v17, v12, v14, v15, v16);
  }
  else
  {
    v19 = objc_retainAutorelease(v12);
    objc_msgSend(v19, "UTF8String");
    v20 = (void *)os_transaction_create();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95___DKThrottledActivity_performNoMoreOftenInMinutesThan_name_queue_activityBlock_throttleBlock___block_invoke;
    v22[3] = &unk_1E26E59F8;
    v23 = v17;
    v28 = v16;
    v24 = v19;
    v26 = v14;
    v27 = v15;
    v25 = v20;
    v21 = v20;
    dispatch_async(v13, v22);

  }
}

- (void)performNoMoreOftenInHoursThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  double v7;
  id v8;
  id v9;
  id v10;

  v7 = a3 * 60.0 * 60.0;
  v8 = a5;
  v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, v7);

}

- (void)performNoMoreOftenInHoursThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 60.0 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, v9);

}

- (void)performNoMoreOftenInDaysThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  double v7;
  id v8;
  id v9;
  id v10;

  v7 = a3 * 24.0 * 60.0 * 60.0;
  v8 = a5;
  v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, v7);

}

- (void)performNoMoreOftenInDaysThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 24.0 * 60.0 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, v9);

}

- (void)performWithMinimumIntervalInMinutesOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, v9);

}

- (void)performWithMinimumIntervalInHoursOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 60.0 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, v9);

}

- (void)performWithMinimumIntervalInDaysOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 24.0 * 60.0 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, v9);

}

- (void)performWithDelayInMinutesOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, v9);

}

- (void)performWithDelayInHoursOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 60.0 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, v9);

}

- (void)performWithDelayInDaysOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3 * 24.0 * 60.0 * 60.0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, v9);

}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p: %@>"), v6, self, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)clearHistoryForName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler clearHistoryForName:](v5, v4);

}

- (void)setDate:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler keyForName:](v9, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKActivityThrottler setDate:forKey:]((uint64_t)v9, v7, v8);
}

- (_DKSimpleKeyValueStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
}

@end
