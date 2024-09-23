@implementation NRMutableDeviceCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childMap, 0);
  objc_storeStrong((id *)&self->_deviceCollection, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NRMutableDeviceCollection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NRDeviceDiffType *v13;
  NRDeviceCollectionDiff *v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self;
  v6 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NRMutableDeviceCollection objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRMutableDevice diffFrom:to:](NRMutableDevice, "diffFrom:to:", 0, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", v12, 0);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

      }
      v7 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v14 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:]([NRDeviceCollectionDiff alloc], "initWithDeviceCollectionDiffDeviceDiffs:", v4);
  v15 = (id)objc_msgSend(v17, "applyDiff:upOnly:notifyParent:unconditional:", v14, 0, 0, 1);

  return v17;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  v8 = (void *)-[NSMutableDictionary copy](self->_deviceCollection, "copy");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (NRMutableDeviceCollection)init
{
  NRMutableDeviceCollection *v2;
  uint64_t v3;
  NSMutableDictionary *deviceCollection;
  uint64_t v5;
  NSMutableDictionary *childMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRMutableDeviceCollection;
  v2 = -[NRMutableStateBase init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    deviceCollection = v2->_deviceCollection;
    v2->_deviceCollection = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    childMap = v2->_childMap;
    v2->_childMap = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  NRMutableDeviceCollection *v11;
  NRMutableDeviceCollection *v12;
  uint64_t v13;
  id v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSMutableDictionary *childMap;
  NRMutableDevice *v23;
  id v24;
  NSMutableDictionary *v25;
  _BOOL8 v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v35;
  void *v36;
  void *context;
  id v38;
  NRMutableDeviceCollection *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    v35 = v7;
    context = (void *)MEMORY[0x1A1B01C40]();
    v11 = self;
    v12 = v11;
    v13 = (uint64_t)v11;
    if (!v6)
    {
      v13 = -[NRMutableDeviceCollection copyWithZone:](v11, "copyWithZone:", 0);

    }
    v36 = (void *)v13;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v38 = v10;
    v14 = v10;
    v42 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v42)
    {
      v40 = v14;
      v41 = *(_QWORD *)v44;
      v39 = v12;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v44 != v41)
            objc_enumerationMutation(v14);
          v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "diff");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v12->_deviceCollection, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v18)
          {
LABEL_13:
            objc_msgSend(v20, "setParentDelegate:", 0);
            -[NSMutableDictionary removeObjectForKey:](v12->_deviceCollection, "removeObjectForKey:", v16);
            childMap = v12->_childMap;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v20);
            v23 = (NRMutableDevice *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](childMap, "removeObjectForKey:", v23);
LABEL_16:

            v14 = v40;
            goto LABEL_17;
          }
          if (!v19)
          {
            v23 = objc_alloc_init(NRMutableDevice);
            v24 = -[NRMutableDevice applyDiff:upOnly:notifyParent:unconditional:](v23, "applyDiff:upOnly:notifyParent:unconditional:", v18, 0, 0, 1);
            if (-[NRMutableDevice count](v23, "count"))
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_deviceCollection, "setObject:forKeyedSubscript:", v23, v16);
              v25 = v12->_childMap;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v23);
              v26 = v8;
              v27 = v6;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v16, v28);

              v6 = v27;
              v8 = v26;
              v12 = v39;
              -[NRMutableStateBase setParentDelegate:](v23, "setParentDelegate:", v39);
            }
            goto LABEL_16;
          }
          if (!v8)
          {
            v21 = (id)objc_msgSend(v19, "applyDiff:upOnly:notifyParent:unconditional:", v18, 0, 0, v6);
            if (!objc_msgSend(v20, "count"))
              goto LABEL_13;
          }
LABEL_17:

        }
        v42 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v42);
    }

    if (v6)
    {
      v10 = v38;
      v29 = v36;
      if (!v14)
        goto LABEL_27;
    }
    else
    {
      v29 = v36;
      objc_msgSend((id)objc_opt_class(), "diffFrom:to:", v36, v12);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v14;
      v14 = (id)v32;

      v10 = v38;
      if (!v14)
      {
LABEL_27:

        objc_autoreleasePoolPop(context);
        v31 = v14;
        v30 = v31;
        goto LABEL_28;
      }
    }
    if (v35)
      -[NRMutableStateBase notifyParentWithDiff:](v12, "notifyParentWithDiff:", v14);
    -[NRMutableStateBase notifyObserversWithDiff:](v12, "notifyObserversWithDiff:", v14);
    goto LABEL_27;
  }
  v30 = 0;
  v31 = v10;
LABEL_28:

  return v30;
}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  id *v7;
  id *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NRDeviceDiffType *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NRDeviceDiffType *v36;
  NRDeviceCollectionDiff *v37;
  id obj;
  id *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (id *)v5;
  v8 = (id *)v6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x1ECE21000uLL;
  v40 = v8;
  if (objc_msgSend(v7, "count"))
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7[5], "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8[5], "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "minusSet:", v17);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          v24 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", 0, 2);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v20);
    }

    v10 = 0x1ECE21000uLL;
  }
  if (objc_msgSend(v8, "count"))
  {
    v25 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8[5], "allKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v27;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(obj);
          v32 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          if (v7)
          {
            objc_msgSend(*(id *)((char *)v7 + *(int *)(v10 + 3904)), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = 0;
          }
          objc_msgSend(*(id *)((char *)v8 + *(int *)(v10 + 3904)), "objectForKeyedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[NRMutableDevice diffFrom:to:](NRMutableDevice, "diffFrom:to:", v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v36 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", v35, v33 != 0);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, v32);

            v8 = v40;
          }

          v10 = 0x1ECE21000;
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v29);
    }

  }
  if (objc_msgSend(v9, "count"))
    v37 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:]([NRDeviceCollectionDiff alloc], "initWithDeviceCollectionDiffDeviceDiffs:", v9);
  else
    v37 = 0;

  return v37;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_deviceCollection, "count");
}

- (void)setDevice:(id)a3 forPairingID:(id)a4
{
  id v6;
  NSMutableDictionary *deviceCollection;
  id v8;
  void *v9;
  void *v10;
  NRDeviceDiffType *v11;
  NRDeviceCollectionDiff *v12;
  void *v13;
  NRDeviceCollectionDiff *v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  deviceCollection = self->_deviceCollection;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](deviceCollection, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRMutableDevice diffFrom:to:](NRMutableDevice, "diffFrom:to:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", v10, 1);
    v12 = [NRDeviceCollectionDiff alloc];
    v16 = v6;
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:](v12, "initWithDeviceCollectionDiffDeviceDiffs:", v13);

    v15 = -[NRMutableStateBase applyDiff:](self, "applyDiff:", v14);
  }

}

- (void)removeDeviceForPairingID:(id)a3
{
  id v4;
  NRDeviceDiffType *v5;
  NRDeviceCollectionDiff *v6;
  void *v7;
  NRDeviceCollectionDiff *v8;
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", 0, 2);
  v6 = [NRDeviceCollectionDiff alloc];
  v10 = v4;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:](v6, "initWithDeviceCollectionDiffDeviceDiffs:", v7);
  v9 = -[NRMutableStateBase applyDiff:](self, "applyDiff:", v8);

}

- (id)deviceForPairingID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceCollection, "objectForKeyedSubscript:", a3);
}

- (id)allPairingIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_deviceCollection, "allKeys");
}

- (void)invalidate
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)NRMutableDeviceCollection;
  -[NRMutableStateBase invalidate](&v13, sel_invalidate);
  -[NSMutableDictionary removeAllObjects](self->_childMap, "removeAllObjects");
  -[NSMutableDictionary allValues](self->_deviceCollection, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_deviceCollection, "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)child:(id)a3 didApplyDiff:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NRDeviceDiffType *v9;
  id v10;
  uint64_t v11;
  NRDeviceDiffType *v12;
  NSMutableDictionary *childMap;
  void *v14;
  void *v15;
  NRDeviceCollectionDiff *v16;
  void *v17;
  NRDeviceCollectionDiff *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  v9 = [NRDeviceDiffType alloc];
  if (v8)
  {
    v10 = v6;
    v11 = 1;
  }
  else
  {
    v10 = 0;
    v11 = 2;
  }
  v12 = -[NRDeviceDiffType initWithDiff:andChangeType:](v9, "initWithDiff:andChangeType:", v10, v11);
  childMap = self->_childMap;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](childMap, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [NRDeviceCollectionDiff alloc];
  v19 = v15;
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:](v16, "initWithDeviceCollectionDiffDeviceDiffs:", v17);

  if (v18)
  {
    -[NRMutableStateBase notifyParentWithDiff:](self, "notifyParentWithDiff:", v18);
    -[NRMutableStateBase notifyObserversWithDiff:](self, "notifyObserversWithDiff:", v18);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_createIndex
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *childMap;
  void *v12;
  NSMutableDictionary *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_deviceCollection;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v7, CFSTR("device collection dictionary key"), v8, self);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceCollection, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v9, CFSTR("device collection dictionary value"), v10, self);

        objc_msgSend(v9, "setParentDelegate:", self);
        childMap = self->_childMap;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](childMap, "setObject:forKeyedSubscript:", v7, v12);

      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (NRMutableDeviceCollection)initWithCoder:(id)a3
{
  id v4;
  NRMutableDeviceCollection *v5;
  uint64_t v6;
  void *v7;
  NRPBMutableDeviceCollection *v8;
  NRMutableDeviceCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *deviceCollection;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRMutableDeviceCollection init](self, "init");
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("devices"));
    v13 = objc_claimAutoreleasedReturnValue();
    deviceCollection = v5->_deviceCollection;
    v5->_deviceCollection = (NSMutableDictionary *)v13;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_deviceCollection, CFSTR("device collection dictionary"), v5);
    -[NRMutableDeviceCollection _createIndex](v5, "_createIndex");
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBMutableDeviceCollection initWithData:]([NRPBMutableDeviceCollection alloc], "initWithData:", v6);
  v9 = -[NRMutableDeviceCollection initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (NRMutableDeviceCollection)initWithProtobuf:(id)a3
{
  id v4;
  NRMutableDeviceCollection *v5;
  NSMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NRMutableDevice *v15;
  void *v16;
  unint64_t v17;
  NSMutableDictionary *deviceCollection;

  v4 = a3;
  v5 = -[NRMutableDeviceCollection init](self, "init");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v4, "pairingIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length") == 16)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v11), "bytes"));
          objc_msgSend(v4, "devices");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = -[NRMutableDevice initWithProtobuf:]([NRMutableDevice alloc], "initWithProtobuf:", v14);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v15, v12);

        }
        ++v9;
        objc_msgSend(v4, "pairingIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v9 < v17);
    }
    deviceCollection = v5->_deviceCollection;
    v5->_deviceCollection = v6;

    -[NRMutableDeviceCollection _createIndex](v5, "_createIndex");
  }

  return v5;
}

- (NRPBMutableDeviceCollection)protobuf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPairingIDs:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDevices:", v5);

  v6 = (void *)-[NSMutableDictionary copy](self->_deviceCollection, "copy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "pairingIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "fromUUID:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        objc_msgSend(v3, "devices");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "protobuf");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return (NRPBMutableDeviceCollection *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRMutableDeviceCollection protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (unint64_t)hash
{
  NSMutableDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_deviceCollection;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash", (_QWORD)v9) - v6 + 32 * v6;
      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NRMutableDeviceCollection *v4;
  NRMutableDeviceCollection *v5;
  NSMutableDictionary *deviceCollection;
  char v7;

  v4 = (NRMutableDeviceCollection *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_6;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = 0;
    goto LABEL_8;
  }
  deviceCollection = self->_deviceCollection;
  if (deviceCollection == v5->_deviceCollection)
LABEL_6:
    v7 = 1;
  else
    v7 = -[NSMutableDictionary isEqual:](deviceCollection, "isEqual:");
LABEL_8:

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_deviceCollection, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = &stru_1E4499C68;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v11 = (void *)MEMORY[0x1A1B01C40]();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceCollection, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByPaddingToLength:withString:startingAtIndex:", 36, CFSTR(" "), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRTextFormattingUtilities prefixLinesWithString:withText:](NRTextFormattingUtilities, "prefixLinesWithString:withText:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v16);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v11);
        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1E4499C68;
  }

  return v7;
}

uint64_t __40__NRMutableDeviceCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 0);
  return v7;
}

- (void)setProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_protobuf, a3);
}

- (NRMutableDevice)activeDevice
{
  void *v3;
  void *v4;

  -[NRMutableDeviceCollection activeDeviceID](self, "activeDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRMutableDeviceCollection objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NRMutableDevice *)v4;
}

- (NSUUID)activeDeviceID
{
  NRMutableDeviceCollection *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self;
  v3 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NRMutableDeviceCollection objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v7, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isActive"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
        {
          v11 = v7;

          goto LABEL_11;
        }

      }
      v4 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return (NSUUID *)v11;
}

- (void)setActiveDeviceID:(id)a3
{
  NRDeviceCollectionDiff *v4;
  id v5;
  id v6;

  -[NRMutableDeviceCollection _diffsToChangeActiveDeviceToDeviceID:](self, "_diffsToChangeActiveDeviceToDeviceID:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:]([NRDeviceCollectionDiff alloc], "initWithDeviceCollectionDiffDeviceDiffs:", v6);
    v5 = -[NRMutableStateBase applyDiff:](self, "applyDiff:", v4);

  }
}

- (id)_diffsToChangeActiveDeviceToDeviceID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NRDeviceDiff *v9;
  void *v10;
  NRDeviceDiff *v11;
  NRDeviceDiffType *v12;
  NRDeviceDiff *v13;
  void *v14;
  NRDeviceDiff *v15;
  NRDeviceDiffType *v16;

  v4 = a3;
  -[NRMutableDeviceCollection activeDeviceID](self, "activeDeviceID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4 || (objc_msgSend(v5, "isEqual:", v4) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = [NRDeviceDiff alloc];
      +[NRMutableDevice diffsToActivate:withDate:](NRMutableDevice, "diffsToActivate:withDate:", 0, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NRDeviceDiff initWithDiffPropertyDiffs:](v9, "initWithDiffPropertyDiffs:", v10);

      v12 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", v11, 1);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v6);

    }
    if (v4)
    {
      v13 = [NRDeviceDiff alloc];
      +[NRMutableDevice diffsToActivate:withDate:](NRMutableDevice, "diffsToActivate:withDate:", 1, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[NRDeviceDiff initWithDiffPropertyDiffs:](v13, "initWithDiffPropertyDiffs:", v14);

      v16 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", v15, 1);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v4);

    }
  }

  return v7;
}

- (BOOL)paired
{
  NRMutableDeviceCollection *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self;
  v3 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        -[NRMutableDeviceCollection objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isPaired");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)allAltAccount
{
  NRMutableDeviceCollection *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self;
  v3 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v2);
        -[NRMutableDeviceCollection objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isPaired") && (objc_msgSend(v9, "isArchived") & 1) == 0)
        {
          v10 = objc_msgSend(v9, "isAltAccount");
          v5 |= v10;
          v6 |= v10 ^ 1;
        }

      }
      v4 = -[NRMutableDeviceCollection countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  return v5 & ~v6 & 1;
}

+ (void)parseDiff:(id)a3 forPropertyChange:(id)a4 withBlock:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(id, _QWORD, uint64_t, void *);
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21 = a4;
  v19 = (void (**)(id, _QWORD, uint64_t, void *))a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v20 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "diff");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "changeType");
          objc_msgSend(v15, "diff");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2](v19, v11, v16, v18);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

}

@end
