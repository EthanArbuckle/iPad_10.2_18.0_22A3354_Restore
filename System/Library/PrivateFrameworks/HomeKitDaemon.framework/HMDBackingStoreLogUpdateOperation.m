@implementation HMDBackingStoreLogUpdateOperation

- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 mask:(int64_t)a4 set:(int64_t)a5
{
  id v9;
  HMDBackingStoreLogUpdateOperation *v10;
  HMDBackingStoreLogUpdateOperation *v11;
  HMDBackingStoreLogUpdateOperation *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreLogUpdateOperation;
  v10 = -[HMDBackingStoreOperation init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_values, a3);
    v11->_maskValue = a4;
    v11->_setValue = a5;
    v12 = v11;
  }

  return v11;
}

- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 successfullyPushedTo:(unint64_t)a4
{
  return -[HMDBackingStoreLogUpdateOperation initWithRowIDs:mask:set:](self, "initWithRowIDs:mask:set:", a3, a4 << 16, a4 << 16);
}

- (HMDBackingStoreLogUpdateOperation)initWithRowIDs:(id)a3 failedPushedTo:(unint64_t)a4
{
  return -[HMDBackingStoreLogUpdateOperation initWithRowIDs:mask:set:](self, "initWithRowIDs:mask:set:", a3, a4 << 16, 0);
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_begin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HMDBackingStoreLogUpdateOperation values](self, "values", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v19;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        if (v5)
          break;
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[HMDBackingStoreOperation store](self, "store");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "local");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_updateLog:mask:set:", objc_msgSend(v11, "unsignedIntegerValue"), -[HMDBackingStoreLogUpdateOperation maskValue](self, "maskValue"), -[HMDBackingStoreLogUpdateOperation setValue](self, "setValue"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            goto LABEL_4;

          if (!v5)
            goto LABEL_15;
LABEL_13:
          -[HMDBackingStoreOperation store](self, "store");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "local");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_rollback");
          goto LABEL_16;
        }
      }

      goto LABEL_13;
    }

LABEL_15:
    -[HMDBackingStoreOperation store](self, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "local");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_commit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  v16 = v5;

  return v16;
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (int64_t)maskValue
{
  return self->_maskValue;
}

- (void)setMaskValue:(int64_t)a3
{
  self->_maskValue = a3;
}

- (int64_t)setValue
{
  return self->_setValue;
}

- (void)setSetValue:(int64_t)a3
{
  self->_setValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
