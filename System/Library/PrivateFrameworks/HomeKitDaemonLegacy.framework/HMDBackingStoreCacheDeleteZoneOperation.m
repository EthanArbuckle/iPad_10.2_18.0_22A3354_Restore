@implementation HMDBackingStoreCacheDeleteZoneOperation

- (HMDBackingStoreCacheDeleteZoneOperation)initWithZone:(id)a3 resultBlock:(id)a4
{
  id v7;
  HMDBackingStoreCacheDeleteZoneOperation *v8;
  HMDBackingStoreCacheDeleteZoneOperation *v9;
  HMDBackingStoreCacheDeleteZoneOperation *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreCacheDeleteZoneOperation;
  v8 = -[HMDBackingStoreOperation initWithResultBlock:](&v12, sel_initWithResultBlock_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_zone, a3);
    v10 = v9;
  }

  return v9;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t i;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD aBlock[4];
  id v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__16441;
  v67 = __Block_byref_object_dispose__16442;
  v68 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HMDBackingStoreCacheDeleteZoneOperation_mainReturningError__block_invoke;
  aBlock[3] = &unk_1E89A6118;
  v62 = &v63;
  v50 = v3;
  v61 = v50;
  v49 = _Block_copy(aBlock);
  -[HMDBackingStoreOperation store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_begin");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v64[5];
  v64[5] = v6;

  if (v64[5])
  {
    -[HMDBackingStoreOperation store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "local");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_rollback");

  }
  else
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[HMDBackingStoreCacheDeleteZoneOperation zone](self, "zone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "groups");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v57 != v48)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v50, "removeAllObjects");
          -[HMDBackingStoreOperation store](self, "store");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "local");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_fetchRecordsWithGroupID:callback:", objc_msgSend(v12, "groupID"), v49);

          if (v64[5])
            goto LABEL_24;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v15 = v50;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v53;
LABEL_12:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v17)
                objc_enumerationMutation(v15);
              v19 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v18);
              -[HMDBackingStoreOperation store](self, "store");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "local");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "_deleteRecordWithGroupID:recordName:", objc_msgSend(v12, "groupID"), v19);
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v64[5];
              v64[5] = v22;

              if (v64[5])
                break;
              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
                if (v16)
                  goto LABEL_12;
                break;
              }
            }
          }

          if (v64[5])
            goto LABEL_24;
          -[HMDBackingStoreOperation store](self, "store");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "local");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_deleteGroupWithID:", objc_msgSend(v12, "groupID"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v64[5];
          v64[5] = v26;

          if (v64[5])
          {
LABEL_24:
            -[HMDBackingStoreOperation store](self, "store");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "local");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "_rollback");

            v10 = (id)v64[5];
            goto LABEL_25;
          }
        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
        if (v47)
          continue;
        break;
      }
    }

    -[HMDBackingStoreOperation store](self, "store");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "local");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheDeleteZoneOperation zone](self, "zone");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_deleteZoneWithID:", objc_msgSend(v30, "zoneID"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v64[5];
    v64[5] = v31;

    if (v64[5])
    {
      -[HMDBackingStoreOperation store](self, "store");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "local");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_rollback");

    }
    else
    {
      -[HMDBackingStoreOperation store](self, "store");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "local");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "_commit");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v64[5];
      v64[5] = v40;

      if (v64[5])
      {
        -[HMDBackingStoreOperation store](self, "store");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "local");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "_rollback");
      }
      else
      {
        -[HMDBackingStoreOperation store](self, "store");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "local");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "zoneCache");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreCacheDeleteZoneOperation zone](self, "zone");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "removeObject:", v45);

      }
    }
  }
  v10 = (id)v64[5];
LABEL_25:

  _Block_object_dispose(&v63, 8);
  return v10;
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (void)setCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (HMDBackingStoreCacheZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong(&self->_creationBlock, 0);
}

uint64_t __61__HMDBackingStoreCacheDeleteZoneOperation_mainReturningError__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v16 = a2;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v23 || *(_QWORD *)(v24 + 40))
  {
    objc_storeStrong((id *)(v24 + 40), a10);
    v25 = 0;
  }
  else
  {
    if (v16)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
    v25 = 1;
  }

  return v25;
}

@end
