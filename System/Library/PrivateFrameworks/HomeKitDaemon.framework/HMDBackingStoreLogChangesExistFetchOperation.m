@implementation HMDBackingStoreLogChangesExistFetchOperation

- (HMDBackingStoreLogChangesExistFetchOperation)initWithNeedsPushTo:(unint64_t)a3 result:(id)a4
{
  id v6;
  HMDBackingStoreLogChangesExistFetchOperation *v7;
  void *v8;
  id fetchBlock;
  HMDBackingStoreLogChangesExistFetchOperation *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreLogChangesExistFetchOperation;
  v7 = -[HMDBackingStoreOperation init](&v12, sel_init);
  if (v7)
  {
    v8 = _Block_copy(v6);
    fetchBlock = v7->_fetchBlock;
    v7->_fetchBlock = v8;

    v7->_maskValue = a3 | (a3 << 16);
    v7->_compareValue = a3;
    v10 = v7;
  }

  return v7;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v13;
  _QWORD v15[4];
  id v16;
  HMDBackingStoreLogChangesExistFetchOperation *v17;
  id v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__178660;
  v26 = __Block_byref_object_dispose__178661;
  v27 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  -[HMDBackingStoreOperation store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreLogChangesExistFetchOperation maskValue](self, "maskValue");
  v8 = -[HMDBackingStoreLogChangesExistFetchOperation compareValue](self, "compareValue");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__HMDBackingStoreLogChangesExistFetchOperation_mainReturningError__block_invoke;
  v15[3] = &unk_24E78D618;
  v19 = &v22;
  v9 = v3;
  v20 = v21;
  v16 = v9;
  v17 = self;
  v10 = v4;
  v18 = v10;
  objc_msgSend(v6, "_selectLogWithMask:compare:callback:", v7, v8, v15);

  -[HMDBackingStoreLogChangesExistFetchOperation fetchBlock](self, "fetchBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v23[5])
    {
      -[HMDBackingStoreLogChangesExistFetchOperation fetchBlock](self, "fetchBlock");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, 0, v23[5]);
    }
    else
    {
      -[HMDBackingStoreLogChangesExistFetchOperation fetchBlock](self, "fetchBlock");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, _QWORD))v12)[2](v12, v9, v10, 0);
    }

  }
  v13 = (id)v23[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

- (id)fetchBlock
{
  return self->_fetchBlock;
}

- (void)setFetchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
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
  objc_storeStrong(&self->_fetchBlock, 0);
}

BOOL __66__HMDBackingStoreLogChangesExistFetchOperation_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = v10;
    v14 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else
  {
    if (!v9)
      goto LABEL_4;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v14, v9);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_QWORD *)(v17 + 24) != a3)
    {
      *(_QWORD *)(v17 + 24) = a3;
      objc_msgSend(*(id *)(a1 + 40), "store");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "local");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_selectLogOptionsWithID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = *(void **)(a1 + 48);
        objc_msgSend(v20, "label");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v22);

      }
    }
  }

LABEL_4:
  return v11 != 0;
}

@end
