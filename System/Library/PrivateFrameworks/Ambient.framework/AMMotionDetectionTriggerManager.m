@implementation AMMotionDetectionTriggerManager

- (AMMotionDetectionTriggerManager)initWithAWClientOverride:(id)a3
{
  id v5;
  AMMotionDetectionTriggerManager *v6;
  AMMotionDetectionTriggerManager *v7;

  v5 = a3;
  v6 = -[AMMotionDetectionTriggerManager init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_awClientOverride, a3);

  return v7;
}

- (AMMotionDetectionTriggerManager)init
{
  AMMotionDetectionTriggerManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  uint64_t v5;
  AMMotionDetectionSettings *settings;
  uint64_t v7;
  _AMMotionDetectionDataSample *dataSample;
  uint64_t v9;
  _AMMotionDetectionDataSample *filteredMotionDensity;
  uint64_t v11;
  _AMMotionDetectionDataSample *motionDensityBackground;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMMotionDetectionTriggerManager;
  v2 = -[AMMotionDetectionTriggerManager init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Ambient.MotionDetectionQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    +[AMMotionDetectionDomain rootSettings](AMMotionDetectionDomain, "rootSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (AMMotionDetectionSettings *)v5;

    -[PTSettings addKeyObserver:](v2->_settings, "addKeyObserver:", v2);
    v2->_enabledTriggers = -[AMMotionDetectionSettings enabledTriggers](v2->_settings, "enabledTriggers");
    +[_AMMotionDetectionDataSample zeroMotionDataWithTimestamp:](_AMMotionDetectionDataSample, "zeroMotionDataWithTimestamp:", 0.0);
    v7 = objc_claimAutoreleasedReturnValue();
    dataSample = v2->_dataSample;
    v2->_dataSample = (_AMMotionDetectionDataSample *)v7;

    +[_AMMotionDetectionDataSample zeroMotionDataWithTimestamp:](_AMMotionDetectionDataSample, "zeroMotionDataWithTimestamp:", 0.0);
    v9 = objc_claimAutoreleasedReturnValue();
    filteredMotionDensity = v2->_filteredMotionDensity;
    v2->_filteredMotionDensity = (_AMMotionDetectionDataSample *)v9;

    +[_AMMotionDetectionDataSample zeroMotionDataWithTimestamp:](_AMMotionDetectionDataSample, "zeroMotionDataWithTimestamp:", 0.0);
    v11 = objc_claimAutoreleasedReturnValue();
    motionDensityBackground = v2->_motionDensityBackground;
    v2->_motionDensityBackground = (_AMMotionDetectionDataSample *)v11;

    v2->_watchdogTimeout = 10.0;
  }
  return v2;
}

- (BOOL)isMotionDetectionEnabled
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__AMMotionDetectionTriggerManager_isMotionDetectionEnabled__block_invoke;
  v5[3] = &unk_25075FA40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__AMMotionDetectionTriggerManager_isMotionDetectionEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (void)setMotionDetectionEnabled:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__AMMotionDetectionTriggerManager_setMotionDetectionEnabled___block_invoke;
  v4[3] = &unk_25075FA68;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __61__AMMotionDetectionTriggerManager_setMotionDetectionEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int8 *)(*(_QWORD *)(result + 32) + 56) != *(unsigned __int8 *)(result + 40))
  {
    v1 = result;
    AMLogMotion();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(unsigned __int8 *)(v1 + 40);
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_235FFE000, v2, OS_LOG_TYPE_DEFAULT, "Ambient motion detection enabled : %{BOOL}d", (uint8_t *)v4, 8u);
    }

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 56) = *(_BYTE *)(v1 + 40);
    return objc_msgSend(*(id *)(v1 + 32), "_setMotionDetectionMonitoringEnabled:", *(unsigned __int8 *)(v1 + 40));
  }
  return result;
}

- (unint64_t)triggerState
{
  NSObject *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__AMMotionDetectionTriggerManager_triggerState__block_invoke;
  v5[3] = &unk_25075FA40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AMMotionDetectionTriggerManager_triggerState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  AMMotionDetectionTriggerManager *v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__AMMotionDetectionTriggerManager_addObserver_queue___block_invoke;
  block[3] = &unk_25075FA90;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, block);

}

void __53__AMMotionDetectionTriggerManager_addObserver_queue___block_invoke(_QWORD *a1)
{
  _AMMotionDetectionTriggerManagerObserverContext *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _AMMotionDetectionTriggerManagerObserverContext *v7;

  v2 = -[_AMMotionDetectionTriggerManagerObserverContext initWithObserver:queue:]([_AMMotionDetectionTriggerManagerObserverContext alloc], "initWithObserver:queue:", a1[4], a1[5]);
  v3 = *(void **)(a1[6] + 64);
  v7 = v2;
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = a1[6];
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

    v2 = v7;
    v3 = *(void **)(a1[6] + 64);
  }
  objc_msgSend(v3, "addObject:", v2);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AMMotionDetectionTriggerManager_removeObserver___block_invoke;
  block[3] = &unk_25075F920;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __50__AMMotionDetectionTriggerManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "observer", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          if (!v5)
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
          objc_msgSend(v5, "addObject:", v8);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectsInArray:", v5);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 64);
      *(_QWORD *)(v11 + 64) = 0;

    }
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3)
    -[AMMotionDetectionTriggerManager _setEnabledTriggers:](self, "_setEnabledTriggers:", objc_msgSend(a3, "enabledTriggers"));
}

- (void)_injectSyntheticMotionData:(id)a3 timestampSeconds:(double)a4
{
  id v6;
  _AMMotionDetectionDataSample *v7;
  NSObject *accessQueue;
  _AMMotionDetectionDataSample *v9;
  _QWORD v10[5];
  _AMMotionDetectionDataSample *v11;

  v6 = a3;
  v7 = objc_alloc_init(_AMMotionDetectionDataSample);
  -[_AMMotionDetectionDataSample setData:](v7, "setData:", v6);

  -[_AMMotionDetectionDataSample setTimestampSeconds:](v7, "setTimestampSeconds:", a4);
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__AMMotionDetectionTriggerManager__injectSyntheticMotionData_timestampSeconds___block_invoke;
  v10[3] = &unk_25075F920;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(accessQueue, v10);

}

uint64_t __79__AMMotionDetectionTriggerManager__injectSyntheticMotionData_timestampSeconds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMotionDataSample:", *(_QWORD *)(a1 + 40));
}

- (double)watchdogTimeout
{
  NSObject *accessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__AMMotionDetectionTriggerManager_watchdogTimeout__block_invoke;
  v5[3] = &unk_25075FA40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __50__AMMotionDetectionTriggerManager_watchdogTimeout__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 104);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setWatchdogTimeout:(double)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__AMMotionDetectionTriggerManager_setWatchdogTimeout___block_invoke;
  v4[3] = &unk_25075FAB8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

double __54__AMMotionDetectionTriggerManager_setWatchdogTimeout___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 104) = result;
  return result;
}

- (void)_updateMotionDetectionTriggerMaskWithDataSample:(id)a3 andFilteredDataSample:(id)a4
{
  NSObject *accessQueue;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  accessQueue = self->_accessQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(accessQueue);
  v9 = -[AMMotionDetectionTriggerManager _computeThresholdMaskFromMotionData:filtered:](self, "_computeThresholdMaskFromMotionData:filtered:", v8, 0);

  v10 = -[AMMotionDetectionTriggerManager _computeThresholdMaskFromMotionData:filtered:](self, "_computeThresholdMaskFromMotionData:filtered:", v7, 1);
  v11 = v10 | v9;
  if (v11 != self->_triggerState)
  {
    self->_triggerState = v11;
    AMLogMotion();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109376;
      v13[1] = v11 != 0;
      v14 = 2048;
      v15 = v11;
      _os_log_impl(&dword_235FFE000, v12, OS_LOG_TYPE_DEFAULT, "Ambient motion detect : %{BOOL}d : 0x%04llx", (uint8_t *)v13, 0x12u);
    }

    -[AMMotionDetectionTriggerManager _accessQueue_updatePublishedTriggers](self, "_accessQueue_updatePublishedTriggers");
  }
}

- (void)_setEnabledTriggers:(unint64_t)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__AMMotionDetectionTriggerManager__setEnabledTriggers___block_invoke;
  v4[3] = &unk_25075FAB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

uint64_t __55__AMMotionDetectionTriggerManager__setEnabledTriggers___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_updatePublishedTriggers");
}

- (void)_accessQueue_updatePublishedTriggers
{
  unint64_t triggerState;
  unint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  triggerState = self->_triggerState;
  if (triggerState == 0x8000000000000000)
    v4 = 0x8000000000000000;
  else
    v4 = self->_enabledTriggers & triggerState;
  -[AMMotionDetectionTriggerManager _accessQueue_setPublishedTriggers:](self, "_accessQueue_setPublishedTriggers:", v4);
}

- (void)_accessQueue_setPublishedTriggers:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_publishedTriggers != a3)
  {
    self->_publishedTriggers = a3;
    -[AMMotionDetectionTriggerManager _notifyObserversUpdateMotionDetectionTriggerState:](self, "_notifyObserversUpdateMotionDetectionTriggerState:", a3);
  }
}

- (void)_notifyObserversUpdateMotionDetectionTriggerState:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id obj;
  _QWORD block[4];
  id v17;
  AMMotionDetectionTriggerManager *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = (void *)-[NSMutableArray copy](self->_observerContexts, "copy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "observer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "queue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __85__AMMotionDetectionTriggerManager__notifyObserversUpdateMotionDetectionTriggerState___block_invoke;
        block[3] = &unk_25075FAE0;
        v17 = v12;
        v18 = self;
        v19 = a3;
        v14 = v12;
        dispatch_async(v13, block);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

uint64_t __85__AMMotionDetectionTriggerManager__notifyObserversUpdateMotionDetectionTriggerState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "motionDetectionManager:didUpdateMotionDetectionTriggerState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (unint64_t)_computeThresholdMaskFromMotionData:(id)a3 filtered:(BOOL)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  unint64_t v13;
  uint64_t i;
  float *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  float v20;
  void *v21;
  float v22;
  unint64_t v23;
  unint64_t v24;
  float *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  char v31;
  uint64_t v32;
  int64x2_t v33;
  char v34;
  uint64_t v35;
  __int128 v36;
  char v37;
  uint64_t v38;
  __int128 v39;
  char v40;
  uint64_t v41;
  __int128 v42;
  char v43;
  uint64_t v44;
  __int128 v45;
  char v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = 0x3E4CCCCD3DCCCCCDLL;
  v30 = xmmword_2360053D0;
  v31 = 0;
  v32 = 0x3E99999A3E19999ALL;
  v33 = vdupq_n_s64(4uLL);
  v34 = 0;
  v35 = 0x3F19999A3F000000;
  v36 = xmmword_2360053E0;
  v37 = 0;
  v38 = 0x3E4CCCCD3DCCCCCDLL;
  v39 = xmmword_2360053F0;
  v40 = 1;
  v41 = 0x3E99999A3E19999ALL;
  v42 = xmmword_236005400;
  v43 = 1;
  v44 = 0x3F19999A3F000000;
  v45 = xmmword_236005410;
  v46 = 1;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", 0, 0, sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v13 = 0;
  for (i = 0; i != 6; ++i)
  {
    v15 = (float *)(&v29 + 4 * i);
    if (*((unsigned __int8 *)v15 + 24) == v4)
    {
      v16 = *((_QWORD *)v15 + 1);
      v17 = objc_msgSend(v9, "count");
      if (v16 >= v17)
        v18 = v17;
      else
        v18 = v16;
      if (v18)
      {
        v19 = 0;
        v20 = 0.0;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "floatValue");
          v20 = v20 + v22;

          ++v19;
          v23 = objc_msgSend(v9, "count");
          if (v16 >= v23)
            v24 = v23;
          else
            v24 = v16;
        }
        while (v19 < v24);
      }
      else
      {
        v20 = 0.0;
      }
      v25 = (float *)(&v29 + 4 * i);
      if (v20 >= v25[1] || v12 >= *v15)
        v13 |= *((_QWORD *)v25 + 2);
    }
  }

  return v13;
}

- (id)_firstOrderLowPassArray:(id)a3 last:(id)a4 dt:(float)a5 tau:(float)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  double v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 16);
  v12 = 0;
  v13 = a5 / (float)(a5 + a6);
  LODWORD(v14) = 1.0;
  do
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v18 = v17;
    objc_msgSend(v16, "floatValue");
    *(float *)&v20 = (float)((float)(1.0 - v13) * v19) + (float)(v13 * v18);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:atIndexedSubscript:", v21, v12);

    ++v12;
  }
  while (v12 != 16);

  return v11;
}

- (id)_subtractArrayX:(id)a3 andY:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  double v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 16);
  for (i = 0; i != 16; ++i)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    *(float *)&v15 = v12 - v14;
    objc_msgSend(v9, "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v16, i);

  }
  return v7;
}

- (id)_unitIntervalClipArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  float v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 16);
  for (i = 0; i != 16; ++i)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = &unk_250762730;
    if (v7 >= 0.0)
    {
      v8 = &unk_250762740;
      if (v7 <= 1.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v4, "setObject:atIndexedSubscript:", v8, i);

  }
  return v4;
}

- (void)_updateFilteredMotionDensity:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _AMMotionDetectionDataSample *filteredMotionDensity;
  void *v15;
  float v16;
  double v17;
  double v18;
  void *v19;
  _AMMotionDetectionDataSample *motionDensityBackground;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  v26 = a3;
  -[_AMMotionDetectionDataSample timestampSeconds](self->_dataSample, "timestampSeconds");
  v5 = v4;
  objc_msgSend(v26, "timestampSeconds");
  v7 = v6;
  v8 = v6 - v5;
  if (v5 == 0.0)
    v9 = 0.0;
  else
    v9 = v8;
  if (v9 >= 0.0)
  {
    objc_msgSend(v26, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMMotionDetectionDataSample data](self->_motionDensityBackground, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMMotionDetectionTriggerManager _subtractArrayX:andY:](self, "_subtractArrayX:andY:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMMotionDetectionTriggerManager _unitIntervalClipArray:](self, "_unitIntervalClipArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    filteredMotionDensity = self->_filteredMotionDensity;
    -[_AMMotionDetectionDataSample data](filteredMotionDensity, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    LODWORD(v17) = 1045220557;
    *(float *)&v18 = v16;
    -[AMMotionDetectionTriggerManager _firstOrderLowPassArray:last:dt:tau:](self, "_firstOrderLowPassArray:last:dt:tau:", v13, v15, v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMMotionDetectionDataSample setData:](filteredMotionDensity, "setData:", v19);

    -[_AMMotionDetectionDataSample setTimestampSeconds:](self->_filteredMotionDensity, "setTimestampSeconds:", v7);
    motionDensityBackground = self->_motionDensityBackground;
    objc_msgSend(v26, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMMotionDetectionDataSample data](self->_motionDensityBackground, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1120403456;
    *(float *)&v24 = v16;
    -[AMMotionDetectionTriggerManager _firstOrderLowPassArray:last:dt:tau:](self, "_firstOrderLowPassArray:last:dt:tau:", v21, v22, v24, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMMotionDetectionDataSample setData:](motionDensityBackground, "setData:", v25);

    -[_AMMotionDetectionDataSample setTimestampSeconds:](self->_motionDensityBackground, "setTimestampSeconds:", v7);
  }

}

- (void)_handleMotionDataSample:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");

  if (v7 == 16)
  {
    AMLogMotion();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AMMotionDetectionTriggerManager _handleMotionDataSample:].cold.1((uint64_t)v5, v10);

    -[AMMotionDetectionTriggerManager _updateFilteredMotionDensity:](self, "_updateFilteredMotionDensity:", v5);
    -[AMMotionDetectionTriggerManager _updateMotionDetectionTriggerMaskWithDataSample:andFilteredDataSample:](self, "_updateMotionDetectionTriggerMaskWithDataSample:andFilteredDataSample:", v5, self->_filteredMotionDensity);
    objc_storeStrong((id *)&self->_dataSample, a3);
    -[AMMotionDetectionTriggerManager _updateWatchdogTimer](self, "_updateWatchdogTimer");
  }

}

- (void)_setMotionDetectionMonitoringEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSTimer *watchdogTimer;
  AWAttentionAwarenessClient *awClientOverride;
  AWAttentionAwarenessClient *v7;
  AWAttentionAwarenessClient *v8;
  id v9;
  AWAttentionAwarenessClient *v10;
  AWAttentionAwarenessClient *awClient;
  AWAttentionAwarenessClient *v12;
  OS_dispatch_queue *accessQueue;
  AWAttentionAwarenessClient *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  self->_triggerState = 0x8000000000000000;
  self->_publishedTriggers = 0x8000000000000000;
  if (v3)
  {
    watchdogTimer = (NSTimer *)objc_alloc_init(MEMORY[0x24BE09598]);
    -[NSTimer setIdentifier:](watchdogTimer, "setIdentifier:", CFSTR("com.apple.Ambient.MotionDetectionManager"));
    -[NSTimer setEventMask:](watchdogTimer, "setEventMask:", 128);
    -[NSTimer setSamplingInterval:](watchdogTimer, "setSamplingInterval:", 2.0);
    -[NSTimer setActivateMotionDetect:](watchdogTimer, "setActivateMotionDetect:", 1);
    -[NSTimer setAttentionLostTimeout:](watchdogTimer, "setAttentionLostTimeout:", 0.1);
    -[NSTimer setSampleWhileAbsent:](watchdogTimer, "setSampleWhileAbsent:", 1);
    awClientOverride = self->_awClientOverride;
    if (awClientOverride)
      v7 = awClientOverride;
    else
      v7 = (AWAttentionAwarenessClient *)objc_alloc_init(MEMORY[0x24BE09590]);
    awClient = self->_awClient;
    self->_awClient = v7;

    -[AWAttentionAwarenessClient setConfiguration:](self->_awClient, "setConfiguration:", watchdogTimer);
    objc_initWeak(&location, self);
    accessQueue = self->_accessQueue;
    v12 = self->_awClient;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __72__AMMotionDetectionTriggerManager__setMotionDetectionMonitoringEnabled___block_invoke;
    v18[3] = &unk_25075FB08;
    objc_copyWeak(&v19, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v12, "setEventHandlerWithQueue:block:", accessQueue, v18);
    v14 = self->_awClient;
    v17 = 0;
    -[AWAttentionAwarenessClient resumeWithError:](v14, "resumeWithError:", &v17);
    v9 = v17;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = self->_awClient;
    v16 = 0;
    -[AWAttentionAwarenessClient invalidateWithError:](v8, "invalidateWithError:", &v16);
    v9 = v16;
    v10 = self->_awClient;
    self->_awClient = 0;

    -[NSTimer invalidate](self->_watchdogTimer, "invalidate");
    watchdogTimer = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }

  if (v9)
  {
    AMLogMotion();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AMMotionDetectionTriggerManager _setMotionDetectionMonitoringEnabled:].cold.1(v3, v9, v15);

  }
}

void __72__AMMotionDetectionTriggerManager__setMotionDetectionMonitoringEnabled___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char isKindOfClass;
  id v6;
  _AMMotionDetectionDataSample *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = v11;
    v7 = objc_alloc_init(_AMMotionDetectionDataSample);
    objc_msgSend(v6, "motionData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMMotionDetectionDataSample setData:](v7, "setData:", v8);

    objc_msgSend(v6, "timestamp");
    v10 = v9;

    -[_AMMotionDetectionDataSample setTimestampSeconds:](v7, "setTimestampSeconds:", v10);
    objc_msgSend(WeakRetained, "_handleMotionDataSample:", v7);

  }
}

- (void)_updateWatchdogTimer
{
  NSTimer *watchdogTimer;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[NSTimer invalidate](self->_watchdogTimer, "invalidate");
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = 0;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke;
  v4[3] = &unk_25075F848;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2;
    v5[3] = &unk_25075FB80;
    v5[4] = WeakRetained;
    objc_copyWeak(&v6, v1);
    dispatch_sync(v4, v5);
    objc_destroyWeak(&v6);
  }

}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 72))
  {
    v3 = (void *)MEMORY[0x24BDBCF40];
    v4 = *(double *)(v1 + 104);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_3;
    v9[3] = &unk_25075FB58;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 112);
    *(_QWORD *)(v6 + 112) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    {
      AMLogMotion();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2_cold_1(v8);

    }
    objc_destroyWeak(&v10);
  }
}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_3(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_4;
    block[3] = &unk_25075FB30;
    block[4] = v2;
    dispatch_async(v3, block);
  }

}

uint64_t __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 72))
  {
    v2 = result;
    *(_QWORD *)(v1 + 72) = 0;
    AMLogMotion();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 72);
      v5[0] = 67109376;
      v5[1] = v4 != 0;
      v6 = 2048;
      v7 = v4;
      _os_log_impl(&dword_235FFE000, v3, OS_LOG_TYPE_DEFAULT, "Ambient motion detect (watchdog) : %{BOOL}d : 0x%04llx", (uint8_t *)v5, 0x12u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "_accessQueue_updatePublishedTriggers");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_observerContexts, 0);
  objc_storeStrong((id *)&self->_filteredMotionDensity, 0);
  objc_storeStrong((id *)&self->_motionDensityBackground, 0);
  objc_storeStrong((id *)&self->_dataSample, 0);
  objc_storeStrong((id *)&self->_awClientOverride, 0);
  objc_storeStrong((id *)&self->_awClient, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_handleMotionDataSample:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_235FFE000, a2, OS_LOG_TYPE_DEBUG, "Handling motion data sample: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_setMotionDetectionMonitoringEnabled:(NSObject *)a3 .cold.1(char a1, void *a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a1 & 1;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_235FFE000, a3, OS_LOG_TYPE_ERROR, "Ambient motion detection monitoring: %{BOOL}d failed : %@", (uint8_t *)v6, 0x12u);

}

void __55__AMMotionDetectionTriggerManager__updateWatchdogTimer__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235FFE000, log, OS_LOG_TYPE_ERROR, "Watchdog timer creation failed.", v1, 2u);
}

@end
