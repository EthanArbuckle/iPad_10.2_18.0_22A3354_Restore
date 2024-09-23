@implementation HMDBackingStoreLogFetchOperation

- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 mask:(int64_t)a4 compare:(int64_t)a5 fetchResult:(id)a6
{
  id v11;
  id v12;
  HMDBackingStoreLogFetchOperation *v13;
  HMDBackingStoreLogFetchOperation *v14;
  void *v15;
  id fetchBlock;
  HMDBackingStoreLogFetchOperation *v17;
  objc_super v19;

  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreLogFetchOperation;
  v13 = -[HMDBackingStoreOperation init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_sentinel, a3);
    v15 = _Block_copy(v12);
    fetchBlock = v14->_fetchBlock;
    v14->_fetchBlock = v15;

    v14->_maskValue = a4;
    v14->_compareValue = a5;
    v17 = v14;
  }

  return v14;
}

- (HMDBackingStoreLogFetchOperation)initWithNeedsPushTo:(unint64_t)a3 result:(id)a4
{
  return -[HMDBackingStoreLogFetchOperation initWithSentinel:needsPushTo:fetchResult:](self, "initWithSentinel:needsPushTo:fetchResult:", 0, a3, a4);
}

- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 needsPushTo:(unint64_t)a4 fetchResult:(id)a5
{
  return -[HMDBackingStoreLogFetchOperation initWithSentinel:mask:compare:fetchResult:](self, "initWithSentinel:mask:compare:fetchResult:", a3, (unsigned __int16)a4 | ((unint64_t)(unsigned __int16)a4 << 16), (unsigned __int16)a4, a5);
}

- (HMDBackingStoreLogFetchOperation)initWithAlreadyPushedTo:(unint64_t)a3 result:(id)a4
{
  return -[HMDBackingStoreLogFetchOperation initWithSentinel:alreadyPushedTo:fetchResult:](self, "initWithSentinel:alreadyPushedTo:fetchResult:", 0, a3, a4);
}

- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 alreadyPushedTo:(unint64_t)a4 fetchResult:(id)a5
{
  return -[HMDBackingStoreLogFetchOperation initWithSentinel:mask:compare:fetchResult:](self, "initWithSentinel:mask:compare:fetchResult:", a3, (unsigned __int16)a4 | ((unint64_t)(unsigned __int16)a4 << 16), (unsigned __int16)a4 | ((unint64_t)(unsigned __int16)a4 << 16), a5);
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  HMDBackingStoreLogFetchOperation *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__178660;
  v32 = __Block_byref_object_dispose__178661;
  v33 = 0;
  -[HMDBackingStoreOperation store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreOperation store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "root");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreLogFetchOperation sentinel](self, "sentinel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = -[HMDBackingStoreLogFetchOperation maskValue](self, "maskValue");
  v11 = -[HMDBackingStoreLogFetchOperation compareValue](self, "compareValue");
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __54__HMDBackingStoreLogFetchOperation_mainReturningError__block_invoke;
  v23 = &unk_24E78D5F0;
  v26 = &v28;
  v12 = v3;
  v27 = &v34;
  v24 = v12;
  v25 = self;
  objc_msgSend(v5, "_selectLogWithRoot:after:mask:compare:callback:", v7, v9, v10, v11, &v20);

  -[HMDBackingStoreLogFetchOperation fetchBlock](self, "fetchBlock", v20, v21, v22, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v29[5])
    {
      -[HMDBackingStoreLogFetchOperation fetchBlock](self, "fetchBlock");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, 0, v29[5]);
LABEL_6:

      goto LABEL_7;
    }
    if (objc_msgSend(v12, "count"))
    {
      -[HMDBackingStoreLogFetchOperation fetchBlock](self, "fetchBlock");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreOperation store](self, "store");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "local");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_selectLogOptionsWithID:", v35[3]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *, _QWORD))v14)[2](v14, v12, v17, 0);

      goto LABEL_6;
    }
  }
LABEL_7:
  v18 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

- (id)fetchBlock
{
  return self->_fetchBlock;
}

- (void)setFetchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)sentinel
{
  return self->_sentinel;
}

- (void)setSentinel:(id)a3
{
  objc_storeStrong(&self->_sentinel, a3);
}

- (int64_t)maskValue
{
  return self->_maskValue;
}

- (void)setMaskValue:(int64_t)a3
{
  self->_maskValue = a3;
}

- (int64_t)compareValue
{
  return self->_compareValue;
}

- (void)setCompareValue:(int64_t)a3
{
  self->_compareValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sentinel, 0);
  objc_storeStrong(&self->_fetchBlock, 0);
}

uint64_t __54__HMDBackingStoreLogFetchOperation_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;

  v15 = a8;
  if (!v15)
  {
    v28 = 0;
    +[HMDBackingStoreModelObject objectFromData:encoding:rowID:error:](HMDBackingStoreModelObject, "objectFromData:encoding:rowID:error:", a7, a6, a2, &v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v28;
    v19 = v28;
    objc_msgSend(v17, "setObjectChangeType:", a5);
    if (v19)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v18);
      objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    }
    else
    {
      v20 = *(void **)(a1 + 32);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == a3)
      {
        objc_msgSend(v20, "addObject:", v17);
        v16 = 0;
        goto LABEL_11;
      }
      if (!objc_msgSend(v20, "count"))
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 40), "fetchBlock");
      v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "store");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "local");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_selectLogOptionsWithID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = ((uint64_t (**)(_QWORD, uint64_t, void *, void *))v21)[2](v21, v22, v24, v25);

      if ((_DWORD)v22)
      {
LABEL_10:
        objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
        v16 = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
        goto LABEL_11;
      }
    }
    v16 = 1;
LABEL_11:

    goto LABEL_12;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a8);
  v16 = 1;
LABEL_12:

  return v16;
}

@end
