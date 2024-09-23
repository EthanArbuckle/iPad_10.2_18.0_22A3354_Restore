@implementation HKWorkoutRouteBuilder

- (HKWorkoutRouteBuilder)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKWorkoutRouteBuilder)initWithHealthStore:(HKHealthStore *)healthStore device:(HKDevice *)device
{
  return -[HKWorkoutRouteBuilder initWithHealthStore:identifier:device:workoutBuilderID:](self, "initWithHealthStore:identifier:device:workoutBuilderID:", healthStore, 0, device, 0);
}

- (HKWorkoutRouteBuilder)initWithHealthStore:(id)a3 identifier:(id)a4 device:(id)a5 workoutBuilderID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKSeriesBuilderConfiguration *v14;
  HKWorkoutRouteBuilder *v15;
  objc_super v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[HKSeriesBuilderConfiguration initWithDevice:workoutBuilderID:]([HKSeriesBuilderConfiguration alloc], "initWithDevice:workoutBuilderID:", v11, v10);

  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutRouteBuilder;
  v15 = -[HKSeriesBuilder _initWithHealthStore:identifier:configuration:](&v17, sel__initWithHealthStore_identifier_configuration_, v13, v12, v14);

  return v15;
}

- (void)insertRouteData:(NSArray *)routeData completion:(void *)completion
{
  NSArray *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSArray *v12;
  _QWORD block[5];
  NSArray *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = routeData;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(v10, block);

}

void __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_insertRouteData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_resourceQueue_insertRouteData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HKSeriesBuilder retryableOperation](self, "retryableOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke;
  v11[3] = &unk_1E37E6B60;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "_queue_performRetryableOperation:completion:", v11, v7);

}

void __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxyProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_2;
  v9[3] = &unk_1E37F3698;
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_4;
  v7[3] = &unk_1E37E6B38;
  v8 = v11;
  v6 = v11;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v9, v7);

}

void __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_3;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_insertRouteData:completion:", v3, v4);

}

uint64_t __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion
{
  NSDictionary *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSDictionary *v12;
  _QWORD block[5];
  NSDictionary *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = metadata;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke;
  aBlock[3] = &unk_1E37E67C0;
  aBlock[4] = self;
  v17 = v7;
  v9 = _Block_copy(aBlock);
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(v10, block);

}

void __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addMetadata:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)finishRouteWithWorkout:(HKWorkout *)workout metadata:(NSDictionary *)metadata completion:(void *)completion
{
  HKWorkout *v8;
  NSDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSDictionary *v15;
  HKWorkout *v16;
  _QWORD v17[5];
  HKWorkout *v18;
  NSDictionary *v19;
  id v20;
  _QWORD aBlock[5];
  id v22;

  v8 = workout;
  v9 = metadata;
  v10 = completion;
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke;
    aBlock[3] = &unk_1E37F36C0;
    aBlock[4] = self;
    v22 = v10;
    v12 = _Block_copy(aBlock);

  }
  else
  {
    v12 = &__block_literal_global_99;
  }
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_14;
  v17[3] = &unk_1E37E68A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v12;
  v14 = v12;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

void __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_2;
  block[3] = &unk_1E37E6710;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    v4 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_3_cold_1((uint64_t)v3, v4);
  }

}

uint64_t __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_finishRouteWithWorkout:metadata:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_resourceQueue_finishRouteWithWorkout:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HKSeriesBuilder proxyProvider](self, "proxyProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke;
  v19[3] = &unk_1E37F3728;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke_2;
  v17[3] = &unk_1E37E6B38;
  v18 = v22;
  v14 = v22;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v12, "fetchProxyWithHandler:errorHandler:", v19, v17);

}

uint64_t __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_finishRouteWithWorkout:metadata:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)taskServerIdentifier
{
  return CFSTR("HKWorkoutRouteBuilderServerIdentifier");
}

+ (id)clientInterface
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FE28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureClientInterface:", v3);
  return v3;
}

+ (id)serverInterface
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FE88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureServerInterface:", v3);
  return v3;
}

+ (void)configureClientInterface:(id)a3
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKWorkoutRouteBuilder;
  objc_msgSendSuper2(&v3, sel_configureClientInterface_, a3);
}

+ (void)configureServerInterface:(id)a3
{
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKWorkoutRouteBuilder;
  v3 = a3;
  objc_msgSendSuper2(&v6, sel_configureServerInterface_, v3);
  v4 = (id)objc_msgSend(v3, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertRouteData_completion_, 0, 0, v6.receiver, v6.super_class);
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_finishRouteWithWorkout_metadata_completion_, 1, 0);

}

- (id)exportedInterface
{
  return +[HKWorkoutRouteBuilder clientInterface](HKWorkoutRouteBuilder, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKWorkoutRouteBuilder serverInterface](HKWorkoutRouteBuilder, "serverInterface");
}

void __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "[routes] Couldn't finish workout route with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
