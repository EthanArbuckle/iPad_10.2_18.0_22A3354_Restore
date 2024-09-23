@implementation MTMetricsData

uint64_t __28__MTMetricsData_recordEvent__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

id __28__MTMetricsData_recordEvent__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "samplingEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "metricsKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampling");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && !objc_msgSend(v5, "isSampledInWithMetricsData:", v3))
    {
      +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "system");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordEvent:shouldSkipValidation:", v3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (BOOL)samplingEnabled
{
  return self->_samplingEnabled;
}

- (id)recordEvent
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  -[MTMetricsData toDictionary](self, "toDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTObject metricsKit](self, "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "eventDataTimeout") / 1000.0;

  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __28__MTMetricsData_recordEvent__block_invoke;
  v14[3] = &unk_24C7A0E40;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v14, v6);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __28__MTMetricsData_recordEvent__block_invoke_10;
  v12[3] = &unk_24C7A0E68;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v3, "addFinishBlock:", v12);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __28__MTMetricsData_recordEvent__block_invoke_2;
  v11[3] = &unk_24C7A03D0;
  v11[4] = self;
  objc_msgSend(v3, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addErrorBlock:", &__block_literal_global_13);

  return v9;
}

- (id)toDictionary
{
  MTMetricsData *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  MTMetricsData *v29;

  v2 = self;
  objc_sync_enter(v2);
  -[MTMetricsData composeFieldsMaps](v2, "composeFieldsMaps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData postProcessingBlocks](v2, "postProcessingBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(v2);
  +[MTPromise promiseWithComposition:](MTPromise, "promiseWithComposition:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __29__MTMetricsData_toDictionary__block_invoke;
  v27 = &unk_24C7A07E0;
  v28 = v5;
  v29 = v2;
  v7 = v5;
  objc_msgSend(v6, "thenWithBlock:", &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTObject metricsKit](v2, "metricsKit", v24, v25, v26, v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "system");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "treatmentFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "apply:", v8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v8;
  v15 = v14;

  -[MTObject metricsKit](v2, "metricsKit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "system");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "eventFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "apply:", v15);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v15;
  v22 = v21;

  return v22;
}

- (NSMutableArray)postProcessingBlocks
{
  return self->_postProcessingBlocks;
}

- (NSMutableDictionary)performanceData
{
  return self->_performanceData;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

- (void)setRegisteredEventData:(id)a3
{
  objc_storeStrong((id *)&self->_registeredEventData, a3);
}

- (void)setEventSpecificFields:(id)a3
{
  objc_storeStrong((id *)&self->_eventSpecificFields, a3);
}

- (void)setConfigBaseFields:(id)a3
{
  objc_storeStrong((id *)&self->_configBaseFields, a3);
}

- (void)setCallerSuppliedFields:(id)a3
{
  objc_storeStrong((id *)&self->_callerSuppliedFields, a3);
}

- (void)setBaseFields:(id)a3
{
  objc_storeStrong((id *)&self->_baseFields, a3);
}

- (void)setAdditionalEventData:(id)a3
{
  objc_storeStrong((id *)&self->_additionalEventData, a3);
}

- (void)setAdditionalBaseData:(id)a3
{
  objc_storeStrong((id *)&self->_additionalBaseData, a3);
}

id __29__MTMetricsData_toDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "mt_verifyEventData");
  +[MTReflectUtil mergeAndCleanDictionaries:](MTReflectUtil, "mergeAndCleanDictionaries:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "isAnonymous"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("dsId"));

  }
  if (objc_msgSend(v4, "count", (_QWORD)v20))
  {
    v17 = (void *)objc_msgSend(v4, "copy");
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v17);
  }
  else
  {
    MTError(301, CFSTR("The metrics data for the event is empty. Please make sure there are fields provided for the event."), v11, v12, v13, v14, v15, v16, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v17);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isAnonymous
{
  return self->_anonymous;
}

- (id)composeFieldsMaps
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData registeredEventData](self, "registeredEventData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[MTMetricsData registeredEventData](self, "registeredEventData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[MTMetricsData baseFields](self, "baseFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[MTMetricsData baseFields](self, "baseFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[MTMetricsData additionalBaseData](self, "additionalBaseData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[MTMetricsData additionalBaseData](self, "additionalBaseData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v12);

  }
  -[MTMetricsData eventSpecificFields](self, "eventSpecificFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[MTMetricsData eventSpecificFields](self, "eventSpecificFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  -[MTMetricsData additionalEventData](self, "additionalEventData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[MTMetricsData additionalEventData](self, "additionalEventData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v18);

  }
  -[MTMetricsData configBaseFields](self, "configBaseFields");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[MTMetricsData configBaseFields](self, "configBaseFields");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

  }
  -[MTMetricsData callerSuppliedFields](self, "callerSuppliedFields");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "eventData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    -[MTMetricsData callerSuppliedFields](self, "callerSuppliedFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "eventData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v25);

  }
  -[MTMetricsData additionalData](self, "additionalData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    -[MTMetricsData additionalData](self, "additionalData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v28);

  }
  v29 = (void *)objc_msgSend(v3, "copy");

  return v29;
}

- (MTPromise)configBaseFields
{
  return self->_configBaseFields;
}

- (MTCallerSuppliedFields)callerSuppliedFields
{
  return self->_callerSuppliedFields;
}

- (NSDictionary)baseFields
{
  return self->_baseFields;
}

- (NSMutableArray)additionalData
{
  return self->_additionalData;
}

- (NSDictionary)eventSpecificFields
{
  return self->_eventSpecificFields;
}

- (NSArray)registeredEventData
{
  return self->_registeredEventData;
}

- (NSArray)additionalEventData
{
  return self->_additionalEventData;
}

- (NSArray)additionalBaseData
{
  return self->_additionalBaseData;
}

- (void)addFields:(id)a3
{
  id v4;
  MTMetricsData *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  id *v12;
  uint64_t v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTMetricsData getAdditionalData](v5, "getAdditionalData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)&v13;
  v7 = v4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "addObjectsFromArray:", v9);
      else
        objc_msgSend(v6, "addObject:", v9);
      v10 = v12++;
      v11 = *v10;

      v9 = v11;
    }
    while (v11);
  }

  objc_sync_exit(v5);
}

- (id)getAdditionalData
{
  NSMutableArray *additionalData;
  NSMutableArray *v4;
  NSMutableArray *v5;

  additionalData = self->_additionalData;
  if (!additionalData)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_additionalData;
    self->_additionalData = v4;

    additionalData = self->_additionalData;
  }
  return additionalData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingBlocks, 0);
  objc_storeStrong((id *)&self->_performanceData, 0);
  objc_storeStrong((id *)&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_callerSuppliedFields, 0);
  objc_storeStrong((id *)&self->_configBaseFields, 0);
  objc_storeStrong((id *)&self->_additionalEventData, 0);
  objc_storeStrong((id *)&self->_eventSpecificFields, 0);
  objc_storeStrong((id *)&self->_additionalBaseData, 0);
  objc_storeStrong((id *)&self->_baseFields, 0);
  objc_storeStrong((id *)&self->_registeredEventData, 0);
}

- (void)addFieldsWithDictionary:(id)a3
{
  -[MTMetricsData addFields:](self, "addFields:", a3, 0);
}

- (void)addFieldsWithPromise:(id)a3
{
  -[MTMetricsData addFields:](self, "addFields:", a3, 0);
}

- (id)getPostProcessingBlocks
{
  NSMutableArray *postProcessingBlocks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  postProcessingBlocks = self->_postProcessingBlocks;
  if (!postProcessingBlocks)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_postProcessingBlocks;
    self->_postProcessingBlocks = v4;

    postProcessingBlocks = self->_postProcessingBlocks;
  }
  return postProcessingBlocks;
}

- (void)addPostProcessingBlock:(id)a3
{
  MTMetricsData *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTMetricsData getPostProcessingBlocks](v4, "getPostProcessingBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x212BA8428](v7);
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)addPostProcessingBlocks:(id)a3
{
  MTMetricsData *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTMetricsData getPostProcessingBlocks](v4, "getPostProcessingBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_sync_exit(v4);
}

- (id)userAndClientIDFields
{
  void *v2;
  void *v3;

  -[MTMetricsData toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__MTMetricsData_userAndClientIDFields__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("dsId");
  v19[1] = CFSTR("userId");
  v19[2] = CFSTR("clientId");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)cancelUnfinishedPromisedEventData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MTMetricsData callerSuppliedFields](self, "callerSuppliedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v4);

  -[MTMetricsData baseFields](self, "baseFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v5);

  -[MTMetricsData additionalBaseData](self, "additionalBaseData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v6);

  -[MTMetricsData eventSpecificFields](self, "eventSpecificFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v7);

  -[MTMetricsData additionalEventData](self, "additionalEventData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v8);

  -[MTMetricsData configBaseFields](self, "configBaseFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v9);

  -[MTMetricsData additionalData](self, "additionalData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v10);

}

uint64_t __28__MTMetricsData_recordEvent__block_invoke(uint64_t a1)
{
  int v2;
  unsigned int v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = atomic_load(&_block_invoke_logCount);
  if (v2 <= 199)
  {
    do
      v3 = __ldxr(&_block_invoke_logCount);
    while (__stxr(v3 + 1, &_block_invoke_logCount));
    MTMetricsKitOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D758000, v4, OS_LOG_TYPE_DEBUG, "MetricsKit: Some promises in metrics data timed out", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "cancelUnfinishedPromisedEventData");
}

void __28__MTMetricsData_recordEvent__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  unsigned int v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = atomic_load(&_block_invoke_2_logCount);
  if (v3 <= 199)
  {
    do
      v4 = __ldxr(&_block_invoke_2_logCount);
    while (__stxr(v4 + 1, &_block_invoke_2_logCount));
    MTMetricsKitOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_20D758000, v5, OS_LOG_TYPE_ERROR, "MetricsKit: Metrics event was not recorded. Error: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData callerSuppliedFields](self, "callerSuppliedFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData baseFields](self, "baseFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData eventSpecificFields](self, "eventSpecificFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, callerSuppliedFields: %@\nbaseFields: %@\neventSpecificFields: %@"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTMetricsData performanceData](self, "performanceData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MTMetricsData performanceData](self, "performanceData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\nperformanceData: %@"), v11);

  }
  objc_msgSend(v9, "appendString:", CFSTR(">"));
  v12 = (void *)objc_msgSend(v9, "copy");

  return v12;
}

- (void)setAdditionalData:(id)a3
{
  objc_storeStrong((id *)&self->_additionalData, a3);
}

- (void)setPerformanceData:(id)a3
{
  objc_storeStrong((id *)&self->_performanceData, a3);
}

- (void)setPostProcessingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessingBlocks, a3);
}

- (void)setSamplingEnabled:(BOOL)a3
{
  self->_samplingEnabled = a3;
}

@end
