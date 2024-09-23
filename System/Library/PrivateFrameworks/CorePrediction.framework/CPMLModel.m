@implementation CPMLModel

+ (id)initCPModelPath:(id)a3 withConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  CPMLModel *v8;
  CPMLModel *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("machineLearningAlgorithm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("KMEANS")))
    v8 = (CPMLModel *)objc_opt_new();
  else
    v8 = objc_alloc_init(CPMLModel);
  v9 = v8;
  -[CPMLModel initializeModel:withConfiguration:](v8, "initializeModel:withConfiguration:", v5, v6);

  return v9;
}

- (CPMLModel)initWithModelPath:(id)a3 withPropertyListPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_storeStrong((id *)&self->_savedPlistPath, a4);
  -[CPMLModel getPropertyList](self, "getPropertyList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    self = -[CPMLModel initWithModelPath:withConfiguration:](self, "initWithModelPath:withConfiguration:", v6, v7);

  return self;
}

- (CPMLModel)initWithModelPath:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  CPMLModel *v8;
  CPMLModel *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPMLModel;
  v8 = -[CPMLModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[CPMLModel initializeModel:withConfiguration:](v8, "initializeModel:withConfiguration:", v6, v7);

  return v9;
}

- (void)initializeModel:(id)a3 withConfiguration:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *dispatch_queue;
  CPMLModelEvaluate *v10;
  CPMLModelEvaluate *cpModelEvaluate;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;

  v15 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_modelPath, a3);
  v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreprediction.mdb", 0);
  dispatch_queue = self->_dispatch_queue;
  self->_dispatch_queue = v8;

  v10 = -[CPMLModelEvaluate initWithModel:withPropertyList:]([CPMLModelEvaluate alloc], "initWithModel:withPropertyList:", v15, v7);
  cpModelEvaluate = self->cpModelEvaluate;
  self->cpModelEvaluate = v10;

  v12 = -[CPMLModelEvaluate getModelData](self->cpModelEvaluate, "getModelData");
  self->_mData = v12;
  if (v12)
  {
    v13 = *v12;
    self->_realBase = (double *)&v12[*v12];
    v14 = (unint64_t)*(double *)&v12[v13];
    self->_totalBytesIntSection = v13;
    self->_totalBytesRealSection = v14;
  }

}

- (id)getPropertyList
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", self->_savedPlistPath);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    v8 = 100;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v2, 0, &v8, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v4)
    {
      NSLog(CFSTR("%s plist invalid"), "-[CPMLModel getPropertyList]");
      v5 = 0;
    }
    else
    {
      v5 = v3;
    }

  }
  else
  {
    NSLog(CFSTR("%s plist incorrect."), "-[CPMLModel getPropertyList]");
    v5 = 0;
  }

  return v5;
}

- (id)evalString:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__CPMLModel_evalString___block_invoke;
  block[3] = &unk_24C256258;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatch_queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __24__CPMLModel_evalString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "evalString:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)evalNSObjectV:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__CPMLModel_evalNSObjectV___block_invoke;
  block[3] = &unk_24C256258;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatch_queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __27__CPMLModel_evalNSObjectV___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "evalNSObjectV:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)evalArray:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__CPMLModel_evalArray___block_invoke;
  block[3] = &unk_24C256258;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatch_queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __23__CPMLModel_evalArray___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "evalArray:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)evalDict:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__CPMLModel_evalDict___block_invoke;
  block[3] = &unk_24C256258;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatch_queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __22__CPMLModel_evalDict___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "evalDict:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)boundResult:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_queue = self->_dispatch_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__CPMLModel_boundResult___block_invoke;
  v7[3] = &unk_24C256280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatch_queue, v7);

}

uint64_t __25__CPMLModel_boundResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "boundResult:", *(_QWORD *)(a1 + 40));
}

- (BOOL)updateModelWithDB:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  _QWORD block[4];
  id v9;
  CPMLModel *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__CPMLModel_updateModelWithDB___block_invoke;
  block[3] = &unk_24C2562A8;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(dispatch_queue, block);
  LOBYTE(dispatch_queue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)dispatch_queue;
}

void __31__CPMLModel_updateModelWithDB___block_invoke(_QWORD *a1)
{
  CPMLDB *v2;

  v2 = -[CPMLDB initWithDBName:withPlistPath:withWriteOptions:]([CPMLDB alloc], "initWithDBName:withPlistPath:withWriteOptions:", a1[4], *(_QWORD *)(a1[5] + 8), 1);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[5] + 64), "updateModel:");

}

- (BOOL)updateModelWithCPDB:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  _QWORD block[5];
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
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CPMLModel_updateModelWithCPDB___block_invoke;
  block[3] = &unk_24C256258;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dispatch_queue, block);
  LOBYTE(dispatch_queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dispatch_queue;
}

uint64_t __33__CPMLModel_updateModelWithCPDB___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 64), "updateModel:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)reset
{
  NSObject *dispatch_queue;
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
  dispatch_queue = self->_dispatch_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __18__CPMLModel_reset__block_invoke;
  v5[3] = &unk_24C2562D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatch_queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __18__CPMLModel_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  CPMLModelEvaluate *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v12 = 0;
  v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v12);
  v7 = v12;

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "getPropertyList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[CPMLModelEvaluate initWithModel:withPropertyList:]([CPMLModelEvaluate alloc], "initWithModel:withPropertyList:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v8);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 64);
      *(_QWORD *)(v10 + 64) = v9;

    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
  else
  {
    NSLog(CFSTR("%s Cannot remove model."), "-[CPMLModel reset]_block_invoke");
  }

}

- (void)setCPMLAlgorithm:(id)a3
{
  -[CPMLModelEvaluate setCPMLAlgorithm:](self->cpModelEvaluate, "setCPMLAlgorithm:", a3);
}

- (void)setCPMLAlgorithmEngine:(id)a3
{
  -[CPMLModelEvaluate setCPMLAlgorithmEngine:](self->cpModelEvaluate, "setCPMLAlgorithmEngine:", a3);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatch_queue, a3);
}

- (CPMLModelEvaluate)cpModelEvaluate
{
  return (CPMLModelEvaluate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCpModelEvaluate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cpModelEvaluate, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
  objc_storeStrong((id *)&self->_savedPlistPath, 0);
}

@end
