@implementation ATXAmbientLightMonitor

- (void)addSampleWithXValue:(id)a3 YValue:(id)a4 ZValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableArray *sampledAmbientLightValues;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1CAA48B6C]();
  if ((unint64_t)-[NSMutableArray count](self->_sampledAmbientLightValues, "count") > 4)
  {
    v14[0] = v8;
    v14[1] = v9;
    v14[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_sampledAmbientLightValues, "setObject:atIndexedSubscript:", v13, self->_sampledAmbientLightValuesCurrentIndex);
  }
  else
  {
    sampledAmbientLightValues = self->_sampledAmbientLightValues;
    v15[0] = v8;
    v15[1] = v9;
    v15[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](sampledAmbientLightValues, "addObject:", v13);
  }

  objc_autoreleasePoolPop(v11);
  self->_sampledAmbientLightValuesCurrentIndex = (self->_sampledAmbientLightValuesCurrentIndex + 1) % 5uLL;

}

+ (ATXAmbientLightMonitor)sharedInstance
{
  if (sharedInstance__pasOnceToken2_3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_3, &__block_literal_global_184);
  return (ATXAmbientLightMonitor *)(id)sharedInstance__pasExprOnceResult_44;
}

void __40__ATXAmbientLightMonitor_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_44;
  sharedInstance__pasExprOnceResult_44 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXAmbientLightMonitor)init
{
  ATXAmbientLightMonitor *v2;
  uint64_t v3;
  NSMutableArray *sampledAmbientLightValues;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXAmbientLightMonitor;
  v2 = -[ATXAmbientLightMonitor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sampledAmbientLightValues = v2->_sampledAmbientLightValues;
    v2->_sampledAmbientLightValues = (NSMutableArray *)v3;

    v2->_sampledAmbientLightValuesCurrentIndex = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("ATXAmbientLightMonitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    -[ATXAmbientLightMonitor start](v2, "start");
  }
  return v2;
}

- (ATXAmbientLightMonitor)initWithoutMonitoring
{
  ATXAmbientLightMonitor *v2;
  uint64_t v3;
  NSMutableArray *sampledAmbientLightValues;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXAmbientLightMonitor;
  v2 = -[ATXAmbientLightMonitor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sampledAmbientLightValues = v2->_sampledAmbientLightValues;
    v2->_sampledAmbientLightValues = (NSMutableArray *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("ATXAmbientLightMonitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)start
{
  __IOHIDEventSystemClient *v3;

  v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  self->_client = v3;
  if (v3)
  {
    IOHIDEventSystemClientScheduleWithDispatchQueue();
    IOHIDEventSystemClientRegisterEventCallback();
    IOHIDEventSystemClientSetProperty(self->_client, CFSTR("ClientEventFilter"), &unk_1E83D04F0);
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_client)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    IOHIDEventSystemClientCancel();
    IOHIDEventSystemClientCancel();
    CFRelease(self->_client);
    self->_client = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXAmbientLightMonitor;
  -[ATXAmbientLightMonitor dealloc](&v3, sel_dealloc);
}

- (int)getCurrentAmbientLightType
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_client)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__87;
    v30 = __Block_byref_object_dispose__87;
    v31 = (id)objc_opt_new();
    v3 = dispatch_semaphore_create(0);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__ATXAmbientLightMonitor_getCurrentAmbientLightType__block_invoke;
    block[3] = &unk_1E82E0520;
    block[4] = self;
    v25 = &v26;
    v5 = v3;
    v24 = v5;
    dispatch_async(queue, block);
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v5, 1.0))
    {
      v6 = 7;
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = (id)v27[5];
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
      if (v8)
      {
        v9 = 0;
        v10 = *(_QWORD *)v20;
        v11 = &unk_1E83CDA50;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v14 = objc_msgSend((id)v27[5], "countForObject:", v13, (_QWORD)v19);
            v15 = v14;
            if (v14 <= v9)
            {
              if (v14 != v9)
                continue;
              v17 = objc_msgSend(v13, "integerValue");
              if (v17 >= objc_msgSend(v11, "integerValue"))
                continue;
            }
            v16 = v13;

            v11 = v16;
            v9 = v15;
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
        }
        while (v8);
      }
      else
      {
        v11 = &unk_1E83CDA50;
      }

      v6 = objc_msgSend(v11, "intValue");
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    -[ATXAmbientLightMonitor start](self, "start");
    return 7;
  }
  return v6;
}

intptr_t __52__ATXAmbientLightMonitor_getCurrentAmbientLightType__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0, (_QWORD)v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = v9;

        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_opt_class(), "getAmbientLightTypeForXValue:YValue:ZValue:", v10, v13, v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v18);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)getCurrentSampledValues
{
  return self->_sampledAmbientLightValues;
}

+ (int)getAmbientLightTypeForXValue:(double)a3 YValue:(double)a4 ZValue:(double)a5
{
  double v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;

  if (a4 < 4.0)
    return 0;
  if (a5 < a4 && a4 < 100.0 && a5 < a3)
    return 1;
  v8 = a3 * 0.8;
  if (a4 < 200.0 && v8 <= a5)
    return 2;
  if (a4 < 1000.0)
  {
    v9 = v8 == a5;
    v10 = v8 < a5;
  }
  else
  {
    v9 = 1;
    v10 = 0;
  }
  if (!v10 && !v9)
    return 3;
  if (a4 < 30000.0)
  {
    v11 = v8 == a5;
    v12 = v8 < a5;
  }
  else
  {
    v11 = 1;
    v12 = 0;
  }
  if (!v12 && !v11)
    return 4;
  if (a4 >= 10000.0)
    return 6;
  return 5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampledAmbientLightValues, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
