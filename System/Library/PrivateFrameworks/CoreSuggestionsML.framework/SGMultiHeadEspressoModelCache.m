@implementation SGMultiHeadEspressoModelCache

- (SGMultiHeadEspressoModelCache)init
{
  SGMultiHeadEspressoModelCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *currentModel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGMultiHeadEspressoModelCache;
  v2 = -[SGMultiHeadEspressoModelCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE7A610]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    currentModel = v2->_currentModel;
    v2->_currentModel = (_PASLock *)v5;

  }
  return v2;
}

- (BOOL)setCachedEspressoClassifierWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASLock *currentModel;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  currentModel = self->_currentModel;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke;
  v16[3] = &unk_24DDC52A8;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  v20 = &v21;
  -[_PASLock runWithLockAcquired:](currentModel, "runWithLockAcquired:", v16);
  LOBYTE(v8) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)v8;
}

- (id)predict:(id)a3 withFile:(id)a4 inputName:(id)a5 headDimensionality:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASLock *currentModel;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1529;
  v31 = __Block_byref_object_dispose__1530;
  v32 = 0;
  currentModel = self->_currentModel;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __79__SGMultiHeadEspressoModelCache_predict_withFile_inputName_headDimensionality___block_invoke;
  v21[3] = &unk_24DDC52D0;
  v21[4] = self;
  v15 = v11;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  v26 = &v27;
  v18 = v10;
  v25 = v18;
  -[_PASLock runWithLockAcquired:](currentModel, "runWithLockAcquired:", v21);
  v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

- (id)predict:(id)a3 heads:(id)a4 withFile:(id)a5 inputName:(id)a6 headDimensionality:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _PASLock *currentModel;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1529;
  v36 = __Block_byref_object_dispose__1530;
  v37 = 0;
  currentModel = self->_currentModel;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __85__SGMultiHeadEspressoModelCache_predict_heads_withFile_inputName_headDimensionality___block_invoke;
  v25[3] = &unk_24DDC52F8;
  v25[4] = self;
  v18 = v14;
  v26 = v18;
  v19 = v15;
  v27 = v19;
  v20 = v16;
  v28 = v20;
  v31 = &v32;
  v21 = v12;
  v29 = v21;
  v22 = v13;
  v30 = v22;
  -[_PASLock runWithLockAcquired:](currentModel, "runWithLockAcquired:", v25);
  v23 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (unint64_t)inputNumParametersWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASLock *currentModel;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  currentModel = self->_currentModel;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__SGMultiHeadEspressoModelCache_inputNumParametersWithFile_inputName_headDimensionality___block_invoke;
  v17[3] = &unk_24DDC5320;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  v21 = &v22;
  -[_PASLock runWithLockAcquired:](currentModel, "runWithLockAcquired:", v17);
  v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)headDimensionalityWithFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASLock *currentModel;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1529;
  v26 = __Block_byref_object_dispose__1530;
  v27 = 0;
  currentModel = self->_currentModel;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__SGMultiHeadEspressoModelCache_headDimensionalityWithFile_inputName_headDimensionality___block_invoke;
  v17[3] = &unk_24DDC5320;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  v21 = &v22;
  -[_PASLock runWithLockAcquired:](currentModel, "runWithLockAcquired:", v17);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModel, 0);
}

void __89__SGMultiHeadEspressoModelCache_headDimensionalityWithFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "setCachedEspressoClassifierWithFile:inputName:headDimensionality:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    objc_msgSend(v8, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headDimensionality");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __89__SGMultiHeadEspressoModelCache_inputNumParametersWithFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "setCachedEspressoClassifierWithFile:inputName:headDimensionality:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    objc_msgSend(v5, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v4, "inputNumParameters");

  }
}

void __85__SGMultiHeadEspressoModelCache_predict_heads_withFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "setCachedEspressoClassifierWithFile:inputName:headDimensionality:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    objc_msgSend(v8, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predict:heads:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __79__SGMultiHeadEspressoModelCache_predict_withFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "setCachedEspressoClassifierWithFile:inputName:headDimensionality:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    objc_msgSend(v8, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predict:", *(_QWORD *)(a1 + 64));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "espressoModelFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    goto LABEL_7;
  objc_msgSend(v3, "inputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v3, "headDimensionality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToDictionary:", *(_QWORD *)(a1 + 48));

  if (v7)
  {
    objc_msgSend(v3, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    goto LABEL_11;
  }
LABEL_8:
  v10 = (void *)MEMORY[0x220753E80]();
  objc_msgSend(v3, "setEspressoModelFile:", 0);
  objc_msgSend(v3, "setInputName:", 0);
  objc_msgSend(v3, "setHeadDimensionality:", 0);
  objc_msgSend(v3, "setModel:", 0);
  objc_autoreleasePoolPop(v10);
  v11 = objc_alloc(MEMORY[0x24BE7A600]);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke_2;
  v14[3] = &unk_24DDC5280;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v12 = (void *)objc_msgSend(v11, "initWithBlock:idleTimeout:", v14, 60.0);
  objc_msgSend(v12, "result");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "setEspressoModelFile:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setInputName:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setHeadDimensionality:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setModel:", v12);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

LABEL_11:
}

id __98__SGMultiHeadEspressoModelCache_setCachedEspressoClassifierWithFile_inputName_headDimensionality___block_invoke_2(_QWORD *a1)
{
  return +[SGMultiHeadEspressoModel classifierWithEspressoModelFile:inputName:headDimensionality:](SGMultiHeadEspressoModel, "classifierWithEspressoModelFile:inputName:headDimensionality:", a1[4], a1[5], a1[6]);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_1539 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_1539, &__block_literal_global_1540);
  return (id)sharedInstance__pasExprOnceResult_1541;
}

void __47__SGMultiHeadEspressoModelCache_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1541;
  sharedInstance__pasExprOnceResult_1541 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
