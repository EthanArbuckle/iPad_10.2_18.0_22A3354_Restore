@implementation HKHeartbeatSeriesBuilder

- (HKHeartbeatSeriesBuilder)initWithHealthStore:(HKHealthStore *)healthStore device:(HKDevice *)device startDate:(NSDate *)startDate
{
  NSDate *v8;
  HKDevice *v9;
  HKHealthStore *v10;
  HKSeriesBuilderConfiguration *v11;
  HKHeartbeatSeriesBuilder *v12;
  uint64_t v13;
  NSDate *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *mutableMetadata;
  NSMutableData *v17;
  NSMutableData *mutableHeartbeats;
  objc_super v20;

  v8 = startDate;
  v9 = device;
  v10 = healthStore;
  v11 = -[HKSeriesBuilderConfiguration initWithDevice:workoutBuilderID:]([HKSeriesBuilderConfiguration alloc], "initWithDevice:workoutBuilderID:", v9, 0);

  v20.receiver = self;
  v20.super_class = (Class)HKHeartbeatSeriesBuilder;
  v12 = -[HKSeriesBuilder _initWithHealthStore:identifier:configuration:](&v20, sel__initWithHealthStore_identifier_configuration_, v10, 0, v11);

  if (v12)
  {
    v13 = -[NSDate copy](v8, "copy");
    v14 = v12->_startDate;
    v12->_startDate = (NSDate *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableMetadata = v12->_mutableMetadata;
    v12->_mutableMetadata = v15;

    v17 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    mutableHeartbeats = v12->_mutableHeartbeats;
    v12->_mutableHeartbeats = v17;

    v12->_count = 0;
    v12->_lastHeartbeatTimeInterval = -1.0;
    -[HKSeriesBuilder setState:](v12, "setState:", 1);
  }

  return v12;
}

+ (NSUInteger)maximumCount
{
  return 1000;
}

- (void)addHeartbeatWithTimeIntervalSinceSeriesStartDate:(NSTimeInterval)timeIntervalSinceStart precededByGap:(BOOL)precededByGap completion:(void *)completion
{
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  NSTimeInterval v13;
  BOOL v14;

  v8 = completion;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__HKHeartbeatSeriesBuilder_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke;
  v11[3] = &unk_1E37EA978;
  v13 = timeIntervalSinceStart;
  v14 = precededByGap;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

uint64_t __102__HKHeartbeatSeriesBuilder_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate:precededByGap:completion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion
{
  NSDictionary *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSDictionary *v10;
  _QWORD block[5];
  NSDictionary *v12;
  id v13;

  v6 = metadata;
  v7 = completion;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HKHeartbeatSeriesBuilder_addMetadata_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __51__HKHeartbeatSeriesBuilder_addMetadata_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addMetadata:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)finishSeriesWithCompletion:(void *)completion
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completion;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HKHeartbeatSeriesBuilder_finishSeriesWithCompletion___block_invoke;
  v7[3] = &unk_1E37E66E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__HKHeartbeatSeriesBuilder_finishSeriesWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_finishSeriesWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate:(double)a3 precededByGap:(BOOL)a4 completion:(id)a5
{
  id v9;
  NSObject *v10;
  void (**v11)(void *, uint64_t, _QWORD);
  int64_t v12;
  unint64_t count;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  _QWORD aBlock[5];
  id v20;

  v9 = a5;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke;
  aBlock[3] = &unk_1E37E9540;
  aBlock[4] = self;
  v20 = v9;
  v11 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v12 = -[HKSeriesBuilder state](self, "state");
  if ((unint64_t)(v12 - 2) < 2 || !v12)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = objc_opt_class();
    v16 = CFSTR("Cannot add data to an inactive builder");
    goto LABEL_9;
  }
  if (v12 == 1)
  {
    count = self->_count;
    if (count >= +[HKHeartbeatSeriesBuilder maximumCount](HKHeartbeatSeriesBuilder, "maximumCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Cannot add more than %lu heartbeats per series"), +[HKHeartbeatSeriesBuilder maximumCount](HKHeartbeatSeriesBuilder, "maximumCount"));
      goto LABEL_10;
    }
    if (a3 >= 0.0 && self->_lastHeartbeatTimeInterval < a3)
    {
      HKHeartbeatSeriesAppendDatum(*(uint64_t *)&a3, a4, self->_mutableHeartbeats);
      ++self->_count;
      self->_lastHeartbeatTimeInterval = a3;
      v11[2](v11, 1, 0);
      goto LABEL_11;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = objc_opt_class();
    v16 = CFSTR("Heartbeats must be added in order and should have a time interval since the series start date greater than or equal to 0");
LABEL_9:
    objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v15, a2, v16, v18);
LABEL_10:
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, uint64_t, void *))v11)[2](v11, 0, v17);

  }
LABEL_11:

}

void __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke_2;
    block[3] = &unk_1E37E6798;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void (**v10)(void *, uint64_t, _QWORD);
  int64_t v11;
  char v12;
  id v13;
  id v14;
  _QWORD aBlock[5];
  id v16;

  v7 = a3;
  v8 = a4;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke;
  aBlock[3] = &unk_1E37E9540;
  aBlock[4] = self;
  v16 = v8;
  v10 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v11 = -[HKSeriesBuilder state](self, "state");
  if ((unint64_t)(v11 - 2) < 2 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Cannot add metadata to an inactive builder"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v11 == 1)
  {
    v14 = 0;
    v12 = objc_msgSend(v7, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", 1, 851968, &v14);
    v13 = v14;
    if ((v12 & 1) != 0)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->_mutableMetadata, "addEntriesFromDictionary:", v7);
      v10[2](v10, 1, 0);
LABEL_8:

      goto LABEL_9;
    }
LABEL_7:
    ((void (**)(void *, uint64_t, id))v10)[2](v10, 0, v13);
    goto LABEL_8;
  }
LABEL_9:

}

void __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2;
    block[3] = &unk_1E37E6798;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_resourceQueue_finishSeriesWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  NSDate *startDate;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD aBlock[5];
  id v26;

  v5 = a3;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37EA9A0;
  aBlock[4] = self;
  v26 = v5;
  v8 = _Block_copy(aBlock);
  v9 = -[HKSeriesBuilder state](self, "state");
  if ((unint64_t)(v9 - 2) < 2 || !v9)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = objc_opt_class();
    v21 = CFSTR("Cannot finish an inactive builder");
    goto LABEL_7;
  }
  if (v9 == 1)
  {
    -[HKSeriesBuilder setState:](self, "setState:", 2);
    if (self->_count)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", self->_startDate, self->_lastHeartbeatTimeInterval);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)-[NSMutableData copy](self->_mutableHeartbeats, "copy");
      startDate = self->_startDate;
      -[HKSeriesBuilder configuration](self, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)-[NSMutableDictionary copy](self->_mutableMetadata, "copy");
      +[HKHeartbeatSeriesSample _heartbeatSeriesSampleWithData:startDate:endDate:device:metadata:](HKHeartbeatSeriesSample, "_heartbeatSeriesSampleWithData:startDate:endDate:device:metadata:", v11, startDate, v10, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKSeriesBuilder store](self, "store");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v7;
      v22[1] = 3221225472;
      v22[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_3;
      v22[3] = &unk_1E37EA9F0;
      v22[4] = self;
      v23 = v16;
      v24 = v8;
      v18 = v16;
      objc_msgSend(v17, "saveObject:withCompletion:", v18, v22);

LABEL_8:
      goto LABEL_9;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = objc_opt_class();
    v21 = CFSTR("No data was added to this builder");
LABEL_7:
    objc_msgSend(v19, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v20, a2, v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v8 + 2))(v8, 0, v10);
    goto LABEL_8;
  }
LABEL_9:

}

void __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_2;
    block[3] = &unk_1E37E6710;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_3(id *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(a1[4], "completionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_4;
  v8[3] = &unk_1E37EA9C8;
  v12 = a2;
  v11 = a1[6];
  v9 = v5;
  v10 = a1[5];
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
    v4 = *(_QWORD *)(a1 + 40);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, *(_QWORD *)(a1 + 32));
}

- (void)discard
{
  NSObject *v3;
  _QWORD block[5];

  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HKHeartbeatSeriesBuilder_discard__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(v3, block);

}

void __35__HKHeartbeatSeriesBuilder_discard__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableHeartbeats, 0);
  objc_storeStrong((id *)&self->_mutableMetadata, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
