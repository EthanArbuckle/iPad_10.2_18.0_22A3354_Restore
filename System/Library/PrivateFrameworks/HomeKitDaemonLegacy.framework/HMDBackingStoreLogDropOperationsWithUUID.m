@implementation HMDBackingStoreLogDropOperationsWithUUID

- (HMDBackingStoreLogDropOperationsWithUUID)initWithUUID:(id)a3 pushingTo:(unint64_t)a4 resultBlock:(id)a5
{
  id v9;
  HMDBackingStoreLogDropOperationsWithUUID *v10;
  HMDBackingStoreLogDropOperationsWithUUID *v11;
  HMDBackingStoreLogDropOperationsWithUUID *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreLogDropOperationsWithUUID;
  v10 = -[HMDBackingStoreOperation initWithResultBlock:](&v14, sel_initWithResultBlock_, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_uuid, a3);
    v11->_maskValue = a4;
    v11->_compareValue = a4;
    v12 = v11;
  }

  return v11;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__128855;
  v42 = __Block_byref_object_dispose__128856;
  v43 = 0;
  -[HMDBackingStoreOperation store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreOperation store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "root");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDBackingStoreLogDropOperationsWithUUID maskValue](self, "maskValue");
  v9 = -[HMDBackingStoreLogDropOperationsWithUUID compareValue](self, "compareValue");
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __62__HMDBackingStoreLogDropOperationsWithUUID_mainReturningError__block_invoke;
  v35[3] = &unk_1E89B6198;
  v37 = &v38;
  v35[4] = self;
  v10 = v3;
  v36 = v10;
  objc_msgSend(v5, "_selectLogWithRoot:after:mask:compare:callback:", v7, 0, v8, v9, v35);

  v11 = (void *)v39[5];
  if (v11)
    goto LABEL_3;
  -[HMDBackingStoreOperation store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "local");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_begin");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v39[5];
  v39[5] = v14;

  v11 = (void *)v39[5];
  if (v11)
  {
LABEL_3:
    v16 = v11;
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v32;
      while (2)
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v21);
          -[HMDBackingStoreOperation store](self, "store", (_QWORD)v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "local");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_deleteLog:", objc_msgSend(v22, "unsignedIntegerValue"));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v39[5];
          v39[5] = v25;

          if (v39[5])
          {
            -[HMDBackingStoreOperation store](self, "store");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "local");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "_rollback");

            v16 = (id)v39[5];
            goto LABEL_4;
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        if (v19)
          continue;
        break;
      }
    }

    -[HMDBackingStoreOperation store](self, "store");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "local");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_commit");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  _Block_object_dispose(&v38, 8);
  return v16;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
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
  objc_storeStrong((id *)&self->_uuid, 0);
}

BOOL __62__HMDBackingStoreLogDropOperationsWithUUID_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v23;

  v14 = a8;
  if (v14)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a8);
  }
  else
  {
    v23 = 0;
    +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", a7, a6, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    objc_msgSend(v15, "setObjectChangeType:", a5);
    if (v16
      || (objc_msgSend(v15, "uuid"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(*(id *)(a1 + 32), "uuid"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v17, "isEqual:", v18),
          v18,
          v17,
          v19))
    {
      v20 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

    }
  }

  return v14 != 0;
}

@end
