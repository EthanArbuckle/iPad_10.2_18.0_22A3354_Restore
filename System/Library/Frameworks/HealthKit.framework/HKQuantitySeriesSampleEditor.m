@implementation HKQuantitySeriesSampleEditor

- (HKQuantitySeriesSampleEditor)initWithHealthStore:(id)a3 quantitySample:(id)a4
{
  id v7;
  id v8;
  HKQuantitySeriesSampleEditor *v9;
  char isKindOfClass;
  _QWORD *v11;
  uint64_t v12;
  HKQuantitySample *quantitySample;
  uint64_t v14;
  NSUUID *identifier;
  HKQuantitySeriesSampleEditorTaskServerConfiguration *v16;
  HKTaskServerProxyProvider *v17;
  HKTaskServerProxyProvider *proxyProvider;
  NSMutableSet *v19;
  NSMutableSet *datesIntervalsToRemove;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HKQuantitySeriesSampleEditor;
  v9 = -[HKQuantitySeriesSampleEditor init](&v22, sel_init);
  if (v9)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = (_QWORD *)MEMORY[0x1E0C99778];
    if ((isKindOfClass & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v11, CFSTR("A valid %@ object is required."), objc_opt_class());
    if (objc_msgSend(v8, "count") <= 1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v11, CFSTR("A quantity sample with count = %ld is invalid. A count greater than 1 is required."), objc_msgSend(v8, "count"));
    v12 = objc_msgSend(v8, "copy");
    quantitySample = v9->_quantitySample;
    v9->_quantitySample = (HKQuantitySample *)v12;

    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v14;

    v16 = -[HKQuantitySeriesSampleEditorTaskServerConfiguration initWithQuantitySample:]([HKQuantitySeriesSampleEditorTaskServerConfiguration alloc], "initWithQuantitySample:", v9->_quantitySample);
    v17 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v9->_healthStore, CFSTR("HKQuantitySeriesSampleEditorTaskServerIdentifier"), v9, v9->_identifier);
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v17;

    -[HKProxyProvider setShouldRetryOnInterruption:](v9->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v9->_proxyProvider, "setTaskConfiguration:", v16);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_state = 0;
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    datesIntervalsToRemove = v9->_datesIntervalsToRemove;
    v9->_datesIntervalsToRemove = v19;

  }
  return v9;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_state == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQuantitySeriesSampleEditor.m"), 84, CFSTR("Editor %@ must be committed or discarded prior to deallocation"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySeriesSampleEditor;
  -[HKQuantitySeriesSampleEditor dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_state - 1;
  if (v5 > 3)
    v6 = CFSTR("Not Started");
  else
    v6 = off_1E37F22D0[v5];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), v4, self, self->_identifier, v6);
}

- (BOOL)removeQuantityForDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HKQuantitySeriesSampleEditor_removeQuantityForDateInterval_error___block_invoke_2;
  v9[3] = &unk_1E37E6980;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = -[HKQuantitySeriesSampleEditor _performWithError:stateValidator:lockedBlock:](self, "_performWithError:stateValidator:lockedBlock:", a4, &__block_literal_global_89, v9);

  return (char)a4;
}

BOOL __68__HKQuantitySeriesSampleEditor_removeQuantityForDateInterval_error___block_invoke(uint64_t a1, unint64_t a2)
{
  return a2 < 2;
}

uint64_t __68__HKQuantitySeriesSampleEditor_removeQuantityForDateInterval_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  return result;
}

- (void)commitWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  BOOL v7;
  id v8;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v10[4];
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[4];
  void (**v13)(_QWORD, _QWORD, _QWORD);
  _QWORD *v14;
  _QWORD v15[6];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__39;
  v17[4] = __Block_byref_object_dispose__39;
  v18 = 0;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v4);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_2;
  v15[3] = &unk_1E37E6810;
  v15[4] = self;
  v15[5] = v17;
  v7 = -[HKQuantitySeriesSampleEditor _performWithError:stateValidator:lockedBlock:](self, "_performWithError:stateValidator:lockedBlock:", &v16, &__block_literal_global_27_0, v15);
  v8 = v16;
  if (v7)
  {
    proxyProvider = self->_proxyProvider;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_3;
    v12[3] = &unk_1E37F2290;
    v14 = v17;
    v13 = v5;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_4;
    v10[3] = &unk_1E37E6B38;
    v11 = v13;
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v8);
  }

  _Block_object_dispose(v17, 8);
}

BOOL __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 1;
}

void __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 2;
}

uint64_t __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_commitRemovedDatums:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)discard
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "%{public}@: error performing discard: %{public}@", (uint8_t *)&v3, 0x16u);
}

BOOL __39__HKQuantitySeriesSampleEditor_discard__block_invoke(uint64_t a1, unint64_t a2)
{
  return a2 < 2;
}

uint64_t __39__HKQuantitySeriesSampleEditor_discard__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 3;
  return result;
}

- (int64_t)unitTest_state
{
  os_unfair_lock_s *p_lock;
  int64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)_performWithError:(id *)a3 stateValidator:(id)a4 lockedBlock:(id)a5
{
  void (**v8)(_QWORD);
  uint64_t (**v9)(id, unint64_t);
  unint64_t state;
  char v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v8 = (void (**)(_QWORD))a5;
  v9 = (uint64_t (**)(id, unint64_t))a4;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  v11 = v9[2](v9, state);

  if ((v11 & 1) != 0)
  {
    v8[2](v8);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if (state - 1 > 3)
      v12 = CFSTR("Not Started");
    else
      v12 = off_1E37F22D0[state - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state \"%@\"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 3, v13);
    if (state == 3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
      if (state <= 1)
        self->_state = 4;
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v14)
    {
      objc_msgSend(v14, "raise");

    }
  }

  return v11;
}

+ (id)serverInterface
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FB88);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_commitRemovedDatums_completion_, 0, 0);
  return v2;
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return +[HKQuantitySeriesSampleEditor serverInterface](HKQuantitySeriesSampleEditor, "serverInterface");
}

- (HKQuantitySample)quantitySample
{
  return (HKQuantitySample *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantitySample, 0);
  objc_storeStrong((id *)&self->_datesIntervalsToRemove, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
