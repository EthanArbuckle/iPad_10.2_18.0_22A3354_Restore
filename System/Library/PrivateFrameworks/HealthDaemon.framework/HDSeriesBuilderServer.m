@implementation HDSeriesBuilderServer

- (HDSeriesBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSeriesBuilderServer *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  HKSeriesBuilderConfiguration *configuration;
  NSObject *v16;
  _QWORD block[4];
  HDSeriesBuilderServer *v19;
  objc_super v20;

  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDSeriesBuilderServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v20, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_msgSend(v10, "copy");
    configuration = v11->_configuration;
    v11->_configuration = (HKSeriesBuilderConfiguration *)v14;

    v11->_queue_state = 0;
    v16 = v11->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HDSeriesBuilderServer_initWithUUID_configuration_client_delegate___block_invoke;
    block[3] = &unk_1E6CE80E8;
    v19 = v11;
    dispatch_async(v16, block);

  }
  return v11;
}

void __68__HDSeriesBuilderServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 48));
    objc_msgSend((id)v1, "taskUUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    +[HDSeriesBuilderEntity persistentEntityForBuilderIdentifier:profile:error:](HDSeriesBuilderEntity, "persistentEntityForBuilderIdentifier:profile:error:", v2, v3, &v17);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v17;
    v6 = *(void **)(v1 + 72);
    *(_QWORD *)(v1 + 72) = v4;

    if (v5)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
LABEL_4:

        return;
      }
      *(_DWORD *)buf = 138543362;
      v19 = v5;
      v15 = "Couldn't recover series builder with error %{public}@";
LABEL_12:
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
      goto LABEL_4;
    }
    if (*(_QWORD *)(v1 + 72))
    {
      objc_msgSend((id)v1, "queue_recoverBuilder");
    }
    else
    {
      objc_msgSend((id)v1, "taskUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v1, "seriesSample");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sampleType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(v1 + 56);
      objc_msgSend((id)v1, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      +[HDSeriesBuilderEntity createPersistentEntityForBuilderIdentifier:seriesType:state:profile:error:](HDSeriesBuilderEntity, "createPersistentEntityForBuilderIdentifier:seriesType:state:profile:error:", v8, v10, v11, v12, &v16);
      v13 = objc_claimAutoreleasedReturnValue();
      v5 = v16;
      v14 = *(void **)(v1 + 72);
      *(_QWORD *)(v1 + 72) = v13;

      if (v5)
      {
        _HKInitializeLogging();
        v7 = *MEMORY[0x1E0CB5380];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          goto LABEL_4;
        *(_DWORD *)buf = 138543362;
        v19 = v5;
        v15 = "Couldn't create persistent entity for series builder with error %{public}@";
        goto LABEL_12;
      }
    }
  }
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDStandardTaskServer taskUUID](self, "taskUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSeriesBuilderStateToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)associateToWorkoutBuilderWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  id v11;

  v4 = (void (**)(id, _QWORD, id))a3;
  -[HKSeriesBuilderConfiguration workoutBuilderID](self->_configuration, "workoutBuilderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDSeriesBuilderServer seriesSample](self, "seriesSample");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSeriesBuilderConfiguration workoutBuilderID](self->_configuration, "workoutBuilderID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDStandardTaskServer profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v9 = +[HDWorkoutBuilderAssociatedSeriesEntity associateSeries:toWorkoutBuilderID:profile:error:](HDWorkoutBuilderAssociatedSeriesEntity, "associateSeries:toWorkoutBuilderID:profile:error:", v6, v7, v8, &v11);
    v10 = v11;

    if ((unint64_t)(v9 - 1) >= 2)
    {
      if (!v9)
        v4[2](v4, 0, v10);
    }
    else
    {
      v4[2](v4, 1, 0);
    }

  }
  else
  {
    v4[2](v4, 1, 0);
  }

}

- (void)createSeriesSampleIfNeeded:(id)a3 errorHandler:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)canAddMetadata:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  int v8;

  v6 = a3;
  if (!v6
    || (-[HDStandardTaskServer client](self, "client"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "hd_validateMetadataKeysAndValuesWithClient:error:", v7, a4),
        v7,
        v8))
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)queue_canInsertDataWithError:(id *)a3
{
  unint64_t queue_state;
  const __CFString *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_state = self->_queue_state;
  if (queue_state < 2)
    return 1;
  if (queue_state - 2 > 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Unknown state %ld"), self->_queue_state);
  }
  else
  {
    if (queue_state == 2)
      v6 = CFSTR("completed");
    else
      v6 = CFSTR("discarded");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Workout route is already %@."), v6);
  }
  return 0;
}

- (void)remote_addMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HDSeriesBuilderServer_remote_addMetadata_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __55__HDSeriesBuilderServer_remote_addMetadata_completion___block_invoke(uint64_t a1)
{
  dispatch_queue_t *v1;
  void *v2;
  id v3;
  id v4;
  char v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v1 = *(dispatch_queue_t **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(v1[6]);
    v10 = 0;
    v5 = -[dispatch_queue_t queue_canInsertDataWithError:](v1, "queue_canInsertDataWithError:", &v10);
    v6 = v10;
    if ((v5 & 1) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke;
      v7[3] = &unk_1E6CEA160;
      v7[4] = v1;
      v8 = v3;
      v9 = v4;
      -[dispatch_queue_t createSeriesSampleIfNeeded:errorHandler:](v1, "createSeriesSampleIfNeeded:errorHandler:", v7, v9);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
    }

  }
}

- (void)remote_discardWithCompletion:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HDSeriesBuilderServer_remote_discardWithCompletion___block_invoke;
  block[3] = &unk_1E6CF7C30;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __54__HDSeriesBuilderServer_remote_discardWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD);
  uint64_t v6;
  void *v7;
  dispatch_queue_t *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if ((v2[7] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 48), CFSTR("Cannot discard a finished or discarded series"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v6 = v3;
LABEL_8:
    v17 = (id)v4;
    v5(v6, 0);

    return;
  }
  objc_msgSend(v2, "seriesSample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Unexpected error encoutered while discarding series"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void (**)(uint64_t, _QWORD))(v16 + 16);
    v6 = v16;
    goto LABEL_8;
  }
  v8 = *(dispatch_queue_t **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  if (v8)
  {
    dispatch_assert_queue_V2(v8[6]);
    -[dispatch_queue_t delegate](v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sampleSavingDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[dispatch_queue_t seriesSample](v8, "seriesSample");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sampleType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke;
    v20[3] = &unk_1E6CF7C80;
    v20[4] = v8;
    v21 = v9;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke_2;
    v18[3] = &unk_1E6CF7CA8;
    v19 = v21;
    objc_msgSend(v11, "performIfAuthorizedToDeleteObjectTypes:usingBlock:errorHandler:", v14, v20, v18);

  }
}

- (void)remote_freezeWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HDSeriesBuilderServer_remote_freezeWithCompletion___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __53__HDSeriesBuilderServer_remote_freezeWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_freezeBuilderWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)remote_recoverWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = v2[7];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6CE7DE0;
  v5 = v1;
  -[HDSeriesBuilderServer _setClientState:completion:](v2, v3, v4);

}

uint64_t __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setClientState:(void *)a3 completion:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD aBlock[5];
  id v18;
  uint64_t v19;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HDSeriesBuilderServer__setClientState_completion___block_invoke;
    aBlock[3] = &unk_1E6CF7C58;
    aBlock[4] = a1;
    v19 = a2;
    v8 = v5;
    v18 = v8;
    v9 = _Block_copy(aBlock);
    objc_msgSend(a1, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __52__HDSeriesBuilderServer__setClientState_completion___block_invoke_206;
    v14[3] = &unk_1E6CF28A8;
    v15 = v8;
    v16 = v9;
    v13 = v9;
    objc_msgSend(v12, "clientRemote_didChangeToState:completion:", a2, v14);

  }
}

void __52__HDSeriesBuilderServer__setClientState_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v6 = a1[4];
    v7 = a1[6];
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of state change to %ld with error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  v5 = a1[5];
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __52__HDSeriesBuilderServer__setClientState_completion___block_invoke_206(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  if (!a2)
  {
    v7 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_5;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = v5;
    (*(void (**)(void))(v6 + 16))();
LABEL_5:
    v5 = v7;
  }

}

void __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  v4 = objc_msgSend(v2, "canAddMetadata:errorOut:", v3, &v16);
  v5 = v16;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke_2;
    v13[3] = &unk_1E6CE7950;
    v8 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v8;
    v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSeriesBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, &v15, v13);
    v10 = v15;

    (*(void (**)(_QWORD, _BOOL8, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v9, v10, v11, v12);
    v5 = v10;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "persistentEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "insertMetadata:transaction:error:", *(_QWORD *)(a1 + 40), v6, a3);

  return v8;
}

- (void)queue_freezeBuilderWithCompletion:(id)a3
{
  id v5;
  const __CFString *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = CFSTR("No data was added to the workout route.");
  switch(self->_queue_state)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __59__HDSeriesBuilderServer_queue_freezeBuilderWithCompletion___block_invoke;
      v8[3] = &unk_1E6CE7DE0;
      v9 = v5;
      -[HDSeriesBuilderServer queue_setState:completion:](self, "queue_setState:completion:", 2, v8);
      v7 = v9;
      goto LABEL_8;
    case 2:
      v6 = CFSTR("Workout route already finished.");
      goto LABEL_6;
    case 3:
      v6 = CFSTR("Workout route was discarded.");
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v7);
LABEL_8:

}

uint64_t __59__HDSeriesBuilderServer_queue_freezeBuilderWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queue_recoverBuilder
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[6];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HDSeriesBuilderServer_queue_recoverBuilder__block_invoke;
  v7[3] = &unk_1E6CEF700;
  v7[4] = self;
  v7[5] = &v9;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSeriesBuilderEntity, "performReadTransactionWithHealthDatabase:error:block:", v4, &v8, v7);
  v5 = v8;

  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Couldn't recover state for series builder with error %{public}@", buf, 0xCu);
    }
  }
  -[HDSeriesBuilderServer queue_setState:completion:](self, "queue_setState:completion:", v10[3], 0);
  _Block_object_dispose(&v9, 8);

}

uint64_t __45__HDSeriesBuilderServer_queue_recoverBuilder__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "stateWithTransaction:error:", a2, a3);
  return 1;
}

- (void)queue_setState:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  _QWORD v12[6];
  id v13;
  uint8_t buf[4];
  HDSeriesBuilderServer *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_queue_state = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__HDSeriesBuilderServer_queue_setState_completion___block_invoke;
  v12[3] = &unk_1E6CEF660;
  v12[4] = self;
  v12[5] = a3;
  v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSeriesBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, &v13, v12);
  v10 = v13;

  if (!v9)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v10;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist state change with error: %{public}@", buf, 0x16u);
    }
  }
  -[HDSeriesBuilderServer _setClientState:completion:](self, a3, v6);

}

uint64_t __51__HDSeriesBuilderServer_queue_setState_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "persistentEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setBuilderState:transaction:error:", *(_QWORD *)(a1 + 40), v6, a3);

  return v8;
}

- (HDSeriesBuilderEntity)persistentEntity
{
  HDSeriesBuilderEntity *persistentEntity;
  void *v5;
  void *v6;
  HDSeriesBuilderEntity *v7;
  id v8;
  HDSeriesBuilderEntity *v9;
  NSObject *v10;
  HDSeriesBuilderEntity *v11;
  id v12;
  uint8_t buf[4];
  HDSeriesBuilderServer *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  persistentEntity = self->_persistentEntity;
  if (persistentEntity)
    return persistentEntity;
  -[HDStandardTaskServer taskUUID](self, "taskUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  +[HDSeriesBuilderEntity persistentEntityForBuilderIdentifier:profile:error:](HDSeriesBuilderEntity, "persistentEntityForBuilderIdentifier:profile:error:", v5, v6, &v12);
  v7 = (HDSeriesBuilderEntity *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = self->_persistentEntity;
  self->_persistentEntity = v7;

  if (v8)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch series builer persistent entity: %{public}@", buf, 0x16u);
    }
  }
  v11 = self->_persistentEntity;

  return v11;
}

- (void)_discardSeriesWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__HDSeriesBuilderServer__discardSeriesWithCompletion___block_invoke;
    v6[3] = &unk_1E6CE9C08;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __54__HDSeriesBuilderServer__discardSeriesWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_queue_t *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  int v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v1 = *(dispatch_queue_t **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(v1[6]);
    -[dispatch_queue_t profile](v1, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[dispatch_queue_t seriesSample](v1, "seriesSample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v7 = objc_msgSend(v4, "deleteDataObjects:restrictedSourceEntities:failIfNotFound:recursiveDeleteAuthorizationBlock:error:", v6, 0, 1, 0, &v14);
    v8 = v14;

    v9 = objc_msgSend(v8, "hk_isErrorInDomain:code:", *MEMORY[0x1E0D297C0], 1);
    if ((v7 & 1) != 0 || v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __60__HDSeriesBuilderServer__queue_discardSeriesWithCompletion___block_invoke;
      v10[3] = &unk_1E6CEBC78;
      v12 = v2;
      v13 = v7;
      v11 = v8;
      -[dispatch_queue_t queue_setState:completion:](v1, "queue_setState:completion:", 3, v10);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v2 + 2))(v2, 0, v8);
    }

  }
}

uint64_t __60__HDSeriesBuilderServer__queue_discardSeriesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke(uint64_t a1)
{
  -[HDSeriesBuilderServer _discardSeriesWithCompletion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B38], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B38], "clientInterface");
}

- (void)connectionInvalidated
{
  void *v3;

  -[HKSeriesBuilderConfiguration workoutBuilderID](self->_configuration, "workoutBuilderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[HDSeriesBuilderServer _discardSeriesWithCompletion:]((uint64_t)self, &__block_literal_global_94);
}

void __46__HDSeriesBuilderServer_connectionInvalidated__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Couldn't discard invalidated series with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (HKSeriesBuilderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)queue_state
{
  return self->_queue_state;
}

- (HKSeriesSample)seriesSample
{
  return self->_seriesSample;
}

- (void)setSeriesSample:(id)a3
{
  objc_storeStrong((id *)&self->_seriesSample, a3);
}

- (void)setPersistentEntity:(id)a3
{
  objc_storeStrong((id *)&self->_persistentEntity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentEntity, 0);
  objc_storeStrong((id *)&self->_seriesSample, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
