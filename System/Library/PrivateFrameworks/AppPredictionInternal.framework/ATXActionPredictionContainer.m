@implementation ATXActionPredictionContainer

- (ATXActionPredictionContainer)initWithScoredAction:(id)a3 slotSet:(id)a4 minimalSlotResolutionParameters:(id)a5 score:(float)a6 actionKey:(id)a7 predictionItem:(ATXPredictionItem *)a8
{
  id v14;
  id v15;
  id v16;
  ATXActionPredictionContainer *v17;
  id v18;
  ATXGuardedActionPredictionContainerData *v19;
  double v20;
  ATXGuardedActionPredictionContainerData *v21;
  uint64_t v22;
  _PASLock *lock;
  id v25;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v25 = a5;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ATXActionPredictionContainer;
  v17 = -[ATXActionPredictionContainer init](&v26, sel_init);
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0D815F0]);
    v19 = [ATXGuardedActionPredictionContainerData alloc];
    *(float *)&v20 = a6;
    v21 = -[ATXGuardedActionPredictionContainerData initWithScoredAction:slotSet:score:](v19, "initWithScoredAction:slotSet:score:", v14, v15, v20);
    v22 = objc_msgSend(v18, "initWithGuardedData:", v21);
    lock = v17->_lock;
    v17->_lock = (_PASLock *)v22;

    objc_storeStrong((id *)&v17->_parameters, a5);
    objc_storeStrong((id *)&v17->_actionKey, a7);
    objc_storeStrong((id *)&v17->_predictionItem.key, a8->key);
    memcpy(&v17->_predictionItem.actionHash, &a8->actionHash, 0xCD2uLL);
  }

  return v17;
}

- (ATXActionPredictionContainer)initWithScoredAction:(id)a3 slotSet:(id)a4 actionKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t i;
  ATXActionPredictionContainer *v12;
  id v14[410];
  float v15;
  __int16 v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "score");
  v14[0] = 0;
  v15 = -31337.0;
  v16 = 0;
  for (i = 16; i != 3284; i += 4)
    *(float *)((char *)v14 + i) = -31337.0;
  if (self)
  {
    v12 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:](self, "initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:", v8, v9, 0, v10, v14);
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (ATXActionPredictionContainer)initWithMinimalSlotResolutionParameters:(id)a3 score:(float)a4 actionKey:(id)a5
{
  id v8;
  id v9;
  double v10;
  uint64_t i;
  id v13[410];
  float v14;
  __int16 v15;

  v8 = a3;
  v9 = a5;
  HIDWORD(v10) = -1059153344;
  v13[0] = 0;
  v14 = -31337.0;
  v15 = 0;
  for (i = 16; i != 3284; i += 4)
    *(float *)((char *)v13 + i) = -31337.0;
  if (self)
  {
    *(float *)&v10 = a4;
    self = -[ATXActionPredictionContainer initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:](self, "initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:", 0, 0, v8, v9, v13, v10);
  }
  else
  {

  }
  return self;
}

- (void)setScore:(float)a3
{
  _PASLock *lock;
  _QWORD v4[4];
  float v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__ATXActionPredictionContainer_setScore___block_invoke;
  v4[3] = &__block_descriptor_36_e49_v16__0__ATXGuardedActionPredictionContainerData_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

void *__41__ATXActionPredictionContainer_setScore___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  void *result;

  result = *(void **)(a2 + 8);
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "setScore:", a3);
  *(_DWORD *)(a2 + 24) = LODWORD(a3);
  return result;
}

- (float)score
{
  _PASLock *lock;
  float v3;
  _QWORD v5[5];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ATXActionPredictionContainer_score__block_invoke;
  v5[3] = &unk_1E82DFC68;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__ATXActionPredictionContainer_score__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  int v5;
  _QWORD *v6;

  v3 = a2;
  v4 = (void *)v3[1];
  if (v4)
  {
    v6 = v3;
    objc_msgSend(v4, "score");
    v3 = v6;
  }
  else
  {
    v5 = *((_DWORD *)v3 + 6);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;

}

- (void)initializeScoredActionAndSlotSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _PASLock *lock;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  -[ATXMinimalSlotResolutionParameters actionAndSlotSet](self->_parameters, "actionAndSlotSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "copyWithParameterWhitelist:", v8);

    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = v5;
  if (v5)
  {
LABEL_5:
    lock = self->_lock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__ATXActionPredictionContainer_initializeScoredActionAndSlotSet__block_invoke;
    v11[3] = &unk_1E82DFC90;
    v12 = v9;
    v13 = v7;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

  }
LABEL_6:

  objc_autoreleasePoolPop(v3);
}

void __64__ATXActionPredictionContainer_initializeScoredActionAndSlotSet__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CF9090]);
  LODWORD(v4) = *((_DWORD *)v7 + 6);
  v5 = objc_msgSend(v3, "initWithPredictedItem:score:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)*((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = v5;

  objc_storeStrong((id *)v7 + 2, *(id *)(a1 + 40));
}

- (id)scoredAction
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ATXActionPredictionContainer_scoredAction__block_invoke;
  v5[3] = &unk_1E82DFCB8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__ATXActionPredictionContainer_scoredAction__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  v3 = a2;
  v4 = (void *)v3[1];
  v5 = v3;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "initializeScoredActionAndSlotSet");
    v4 = (void *)v5[1];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

- (id)slotSet
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ATXActionPredictionContainer_slotSet__block_invoke;
  v5[3] = &unk_1E82DFCB8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__ATXActionPredictionContainer_slotSet__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  v3 = a2;
  v4 = (void *)v3[2];
  v5 = v3;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "initializeScoredActionAndSlotSet");
    v4 = (void *)v5[2];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXActionPredictionContainer *v4;
  uint64_t v5;
  _PASLock *lock;
  id v7;
  void *v8;
  _PASLock *v9;
  id v10;
  void *v11;
  void *v12;
  _PASLock *v13;
  int v14;
  NSString *actionKey;
  NSString *v16;
  double v17;
  NSString *v19;
  _BYTE v20[3282];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = +[ATXActionPredictionContainer allocWithZone:](ATXActionPredictionContainer, "allocWithZone:", a3);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__35;
  v28 = __Block_byref_object_dispose__35;
  v29 = 0;
  v5 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __45__ATXActionPredictionContainer_copyWithZone___block_invoke;
  v23[3] = &unk_1E82DFC68;
  v23[4] = &v24;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v23);
  v7 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  v8 = (void *)objc_msgSend(v7, "copy");
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__35;
  v28 = __Block_byref_object_dispose__35;
  v29 = 0;
  v9 = self->_lock;
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __45__ATXActionPredictionContainer_copyWithZone___block_invoke_2;
  v22[3] = &unk_1E82DFC68;
  v22[4] = &v24;
  -[_PASLock runWithLockAcquired:](v9, "runWithLockAcquired:", v22);
  v10 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  v11 = (void *)objc_msgSend(v10, "copy");
  v12 = (void *)-[ATXMinimalSlotResolutionParameters copy](self->_parameters, "copy");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  LODWORD(v27) = 0;
  v13 = self->_lock;
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __45__ATXActionPredictionContainer_copyWithZone___block_invoke_3;
  v21[3] = &unk_1E82DFC68;
  v21[4] = &v24;
  -[_PASLock runWithLockAcquired:](v13, "runWithLockAcquired:", v21);
  v14 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  actionKey = self->_actionKey;
  v16 = self->_predictionItem.key;
  v19 = v16;
  memcpy(v20, &self->_predictionItem.actionHash, sizeof(v20));
  if (v4)
  {
    LODWORD(v17) = v14;
    v4 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:](v4, "initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:", v8, v11, v12, actionKey, &v19, v17);
  }
  else
  {

  }
  return v4;
}

void __45__ATXActionPredictionContainer_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __45__ATXActionPredictionContainer_copyWithZone___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

float __45__ATXActionPredictionContainer_copyWithZone___block_invoke_3(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 24);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)copy
{
  ATXActionPredictionContainer *v3;
  uint64_t v4;
  _PASLock *lock;
  id v6;
  void *v7;
  _PASLock *v8;
  id v9;
  void *v10;
  void *v11;
  _PASLock *v12;
  int v13;
  NSString *actionKey;
  NSString *v15;
  double v16;
  NSString *v18;
  _BYTE v19[3282];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = [ATXActionPredictionContainer alloc];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__35;
  v27 = __Block_byref_object_dispose__35;
  v28 = 0;
  v4 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __36__ATXActionPredictionContainer_copy__block_invoke;
  v22[3] = &unk_1E82DFC68;
  v22[4] = &v23;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v22);
  v6 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  v7 = (void *)objc_msgSend(v6, "copy");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__35;
  v27 = __Block_byref_object_dispose__35;
  v28 = 0;
  v8 = self->_lock;
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __36__ATXActionPredictionContainer_copy__block_invoke_2;
  v21[3] = &unk_1E82DFC68;
  v21[4] = &v23;
  -[_PASLock runWithLockAcquired:](v8, "runWithLockAcquired:", v21);
  v9 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = (void *)-[ATXMinimalSlotResolutionParameters copy](self->_parameters, "copy");
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  LODWORD(v26) = 0;
  v12 = self->_lock;
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __36__ATXActionPredictionContainer_copy__block_invoke_3;
  v20[3] = &unk_1E82DFC68;
  v20[4] = &v23;
  -[_PASLock runWithLockAcquired:](v12, "runWithLockAcquired:", v20);
  v13 = *((_DWORD *)v24 + 6);
  _Block_object_dispose(&v23, 8);
  actionKey = self->_actionKey;
  v15 = self->_predictionItem.key;
  v18 = v15;
  memcpy(v19, &self->_predictionItem.actionHash, sizeof(v19));
  if (v3)
  {
    LODWORD(v16) = v13;
    v3 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:](v3, "initWithScoredAction:slotSet:minimalSlotResolutionParameters:score:actionKey:predictionItem:", v7, v10, v11, actionKey, &v18, v16);
  }
  else
  {

  }
  return v3;
}

void __36__ATXActionPredictionContainer_copy__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __36__ATXActionPredictionContainer_copy__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

float __36__ATXActionPredictionContainer_copy__block_invoke_3(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 24);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  _PASLock *lock;
  id v5;
  uint64_t v6;
  _PASLock *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  _PASLock *v11;
  uint64_t v12;
  float v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  float *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = (float *)&v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__35;
  v22 = __Block_byref_object_dispose__35;
  v23 = 0;
  v3 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __36__ATXActionPredictionContainer_hash__block_invoke;
  v17[3] = &unk_1E82DFC68;
  v17[4] = &v18;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v17);
  v5 = *((id *)v19 + 5);
  _Block_object_dispose(&v18, 8);

  v6 = objc_msgSend(v5, "hash");
  v18 = 0;
  v19 = (float *)&v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__35;
  v22 = __Block_byref_object_dispose__35;
  v23 = 0;
  v7 = self->_lock;
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __36__ATXActionPredictionContainer_hash__block_invoke_2;
  v16[3] = &unk_1E82DFC68;
  v16[4] = &v18;
  -[_PASLock runWithLockAcquired:](v7, "runWithLockAcquired:", v16);
  v8 = *((id *)v19 + 5);
  _Block_object_dispose(&v18, 8);

  v9 = objc_msgSend(v8, "hash");
  v10 = -[ATXMinimalSlotResolutionParameters hash](self->_parameters, "hash");
  v18 = 0;
  v19 = (float *)&v18;
  v20 = 0x2020000000;
  LODWORD(v21) = 0;
  v11 = self->_lock;
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __36__ATXActionPredictionContainer_hash__block_invoke_3;
  v15[3] = &unk_1E82DFC68;
  v15[4] = &v18;
  -[_PASLock runWithLockAcquired:](v11, "runWithLockAcquired:", v15);
  v12 = v10 - (v9 - v6 + 32 * v6) + 32 * (v9 - v6 + 32 * v6);
  v13 = v19[6];
  _Block_object_dispose(&v18, 8);
  return -[NSString hash](self->_actionKey, "hash")
       - ((unint64_t)v13
        - v12
        + 32 * v12)
       + 32 * ((unint64_t)v13 - v12 + 32 * v12);
}

void __36__ATXActionPredictionContainer_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __36__ATXActionPredictionContainer_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

float __36__ATXActionPredictionContainer_hash__block_invoke_3(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 24);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ATXActionPredictionContainer *v4;
  ATXActionPredictionContainer *v5;
  BOOL v6;

  v4 = (ATXActionPredictionContainer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActionPredictionContainer isEqualToActionPredictionContainer:](self, "isEqualToActionPredictionContainer:", v5);

  return v6;
}

- (BOOL)isEqualToActionPredictionContainer:(id)a3
{
  char *v4;
  uint64_t v5;
  _PASLock *lock;
  id v7;
  void *v8;
  id v9;
  _PASLock *v10;
  id v11;
  void *v12;
  id v13;
  ATXMinimalSlotResolutionParameters *v14;
  ATXMinimalSlotResolutionParameters *v15;
  ATXMinimalSlotResolutionParameters *v16;
  BOOL v17;
  BOOL v18;
  _PASLock *v19;
  float v20;
  void *v21;
  float v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  NSString *key;
  uint64_t v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  uint64_t v37;
  float *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v4 = (char *)a3;
  v37 = 0;
  v38 = (float *)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__35;
  v41 = __Block_byref_object_dispose__35;
  v42 = 0;
  v5 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke;
  v36[3] = &unk_1E82DFC68;
  v36[4] = &v37;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v36);
  v7 = *((id *)v38 + 5);
  _Block_object_dispose(&v37, 8);

  v37 = 0;
  v38 = (float *)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__35;
  v41 = __Block_byref_object_dispose__35;
  v42 = 0;
  v8 = (void *)*((_QWORD *)v4 + 1);
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_2;
  v35[3] = &unk_1E82DFC68;
  v35[4] = &v37;
  objc_msgSend(v8, "runWithLockAcquired:", v35);
  v9 = *((id *)v38 + 5);
  _Block_object_dispose(&v37, 8);

  if (v7 == v9 || (objc_msgSend(v7, "isEqual:", v9) & 1) != 0)
  {
    v37 = 0;
    v38 = (float *)&v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__35;
    v41 = __Block_byref_object_dispose__35;
    v42 = 0;
    v10 = self->_lock;
    v34[0] = v5;
    v34[1] = 3221225472;
    v34[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_3;
    v34[3] = &unk_1E82DFC68;
    v34[4] = &v37;
    -[_PASLock runWithLockAcquired:](v10, "runWithLockAcquired:", v34);
    v11 = *((id *)v38 + 5);
    _Block_object_dispose(&v37, 8);

    v37 = 0;
    v38 = (float *)&v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__35;
    v41 = __Block_byref_object_dispose__35;
    v42 = 0;
    v12 = (void *)*((_QWORD *)v4 + 1);
    v33[0] = v5;
    v33[1] = 3221225472;
    v33[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_4;
    v33[3] = &unk_1E82DFC68;
    v33[4] = &v37;
    objc_msgSend(v12, "runWithLockAcquired:", v33);
    v13 = *((id *)v38 + 5);
    _Block_object_dispose(&v37, 8);

    if (v11 == v13 || (objc_msgSend(v11, "isEqual:", v13) & 1) != 0)
    {
      v30 = v11;
      v14 = self->_parameters;
      v15 = (ATXMinimalSlotResolutionParameters *)*((id *)v4 + 414);
      if (v14 == v15)
      {

      }
      else
      {
        v16 = v15;
        v17 = -[ATXMinimalSlotResolutionParameters isEqual:](v14, "isEqual:", v15);

        if (!v17)
          goto LABEL_13;
      }
      v37 = 0;
      v38 = (float *)&v37;
      v39 = 0x2020000000;
      LODWORD(v40) = 0;
      v19 = self->_lock;
      v32[0] = v5;
      v32[1] = 3221225472;
      v32[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_5;
      v32[3] = &unk_1E82DFC68;
      v32[4] = &v37;
      -[_PASLock runWithLockAcquired:](v19, "runWithLockAcquired:", v32, v30);
      v20 = v38[6];
      _Block_object_dispose(&v37, 8);
      v37 = 0;
      v38 = (float *)&v37;
      v39 = 0x2020000000;
      LODWORD(v40) = 0;
      v21 = (void *)*((_QWORD *)v4 + 1);
      v31[0] = v5;
      v31[1] = 3221225472;
      v31[2] = __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_6;
      v31[3] = &unk_1E82DFC68;
      v31[4] = &v37;
      objc_msgSend(v21, "runWithLockAcquired:", v31);
      v22 = v38[6];
      _Block_object_dispose(&v37, 8);
      v11 = v30;
      if (v20 == v22)
      {
        v23 = self->_actionKey;
        v24 = (NSString *)*((id *)v4 + 415);
        if (v23 == v24)
        {

        }
        else
        {
          v25 = v24;
          v26 = -[NSString isEqual:](v23, "isEqual:", v24);

          if ((v26 & 1) == 0)
          {
LABEL_13:
            v18 = 0;
            v11 = v30;
LABEL_17:

            goto LABEL_18;
          }
        }
        v11 = v30;
        if (!memcmp(self->_predictionItem.inputSignals, v4 + 32, 0xCC4uLL))
        {
          key = self->_predictionItem.key;
          v29 = *((_QWORD *)v4 + 2);
          if ((!((unint64_t)key | v29) || key && v29 && -[NSString isEqualToString:](key, "isEqualToString:"))
            && self->_predictionItem.score == *((float *)v4 + 825))
          {
            v18 = 1;
            goto LABEL_17;
          }
        }
      }
    }
    v18 = 0;
    goto LABEL_17;
  }
  v18 = 0;
LABEL_18:

  return v18;
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

float __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_5(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 24);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

float __67__ATXActionPredictionContainer_isEqualToActionPredictionContainer___block_invoke_6(uint64_t a1, uint64_t a2)
{
  float result;

  result = *(float *)(a2 + 24);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (ATXPredictionItem)predictionItem
{
  retstr->key = self->_predictionItem.key;
  return (ATXPredictionItem *)memcpy(&retstr->actionHash, &self->_predictionItem.actionHash, 0xCD2uLL);
}

- (void)setPredictionItem:(ATXPredictionItem *)a3
{
  objc_storeStrong((id *)&self->_predictionItem.key, a3->key);
  memcpy(&self->_predictionItem.actionHash, &a3->actionHash, 0xCD2uLL);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXActionPredictionContainer actionKey](self, "actionKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionPredictionContainer scoredAction](self, "scoredAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ATXPredictionContainer Action Key: %@; Scored Action: %@"),
                 v4,
                 v5);

  return v6;
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionKey, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (id).cxx_construct
{
  uint64_t i;

  *((_QWORD *)self + 2) = 0;
  *((float *)self + 825) = -31337.0;
  *((_WORD *)self + 1652) = 0;
  for (i = 32; i != 3300; i += 4)
    *(float *)((char *)self + i) = -31337.0;
  return self;
}

@end
