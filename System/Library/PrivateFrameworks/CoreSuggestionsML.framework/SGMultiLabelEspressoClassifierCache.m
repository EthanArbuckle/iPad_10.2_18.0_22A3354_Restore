@implementation SGMultiLabelEspressoClassifierCache

- (SGMultiLabelEspressoClassifierCache)init
{
  SGMultiLabelEspressoClassifierCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *currentClassifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGMultiLabelEspressoClassifierCache;
  v2 = -[SGMultiLabelEspressoClassifierCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE7A610]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    currentClassifier = v2->_currentClassifier;
    v2->_currentClassifier = (_PASLock *)v5;

  }
  return v2;
}

- (BOOL)setCachedEspressoClassifierWithFile:(id)a3
{
  id v4;
  _PASLock *currentClassifier;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  currentClassifier = self->_currentClassifier;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke;
  v8[3] = &unk_24DDC3FA0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASLock runWithLockAcquired:](currentClassifier, "runWithLockAcquired:", v8);
  LOBYTE(currentClassifier) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)currentClassifier;
}

- (id)predict:(id)a3 withFile:(id)a4
{
  id v6;
  id v7;
  _PASLock *currentClassifier;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__55;
  v21 = __Block_byref_object_dispose__56;
  v22 = 0;
  currentClassifier = self->_currentClassifier;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__SGMultiLabelEspressoClassifierCache_predict_withFile___block_invoke;
  v13[3] = &unk_24DDC3FC8;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v16 = &v17;
  v10 = v6;
  v15 = v10;
  -[_PASLock runWithLockAcquired:](currentClassifier, "runWithLockAcquired:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (unint64_t)outputDimensionWithFile:(id)a3
{
  id v4;
  _PASLock *currentClassifier;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  currentClassifier = self->_currentClassifier;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SGMultiLabelEspressoClassifierCache_outputDimensionWithFile___block_invoke;
  v9[3] = &unk_24DDC3FF0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](currentClassifier, "runWithLockAcquired:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentClassifier, 0);
}

void __63__SGMultiLabelEspressoClassifierCache_outputDimensionWithFile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "setCachedEspressoClassifierWithFile:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v5, "classifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "outputDimension");

  }
}

void __56__SGMultiLabelEspressoClassifierCache_predict_withFile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "setCachedEspressoClassifierWithFile:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v8, "classifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predict:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(v3, "espressoModelFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(v3, "classifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x220753E80]();
    objc_msgSend(v3, "setEspressoModelFile:", 0);
    objc_msgSend(v3, "setClassifier:", 0);
    objc_autoreleasePoolPop(v8);
    v9 = objc_alloc(MEMORY[0x24BE7A600]);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke_2;
    v12[3] = &unk_24DDC3F78;
    v13 = *(id *)(a1 + 32);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:idleTimeout:", v12, 60.0);
    objc_msgSend(v10, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "setEspressoModelFile:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v3, "setClassifier:", v10);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

  }
}

uint64_t __75__SGMultiLabelEspressoClassifierCache_setCachedEspressoClassifierWithFile___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BE79AC8], "classifierWithEspressoModelFile:", *(_QWORD *)(a1 + 32));
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_62);
  return (id)sharedInstance__pasExprOnceResult;
}

void __53__SGMultiLabelEspressoClassifierCache_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
