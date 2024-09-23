@implementation HMDBackgroundOperationGraph

- (HMDBackgroundOperationGraph)initWithOperations:(id)a3
{
  id v4;
  HMDBackgroundOperationGraph *v5;
  HMDBackgroundOperationGraph *v6;
  id v7;
  NSMapTable *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSMapTable *opGraph;
  uint64_t v25;
  NSMapTable *inDegrees;
  HMDBackgroundOperationGraph *v28;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *context;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMDBackgroundOperationGraph;
  v5 = -[HMDBackgroundOperationGraph init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    v28 = v5;
    v29 = v4;
    v7 = v4;
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v7;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          context = (void *)MEMORY[0x227676638]();
          objc_msgSend(v10, "operationUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "AllDependencies");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](v8, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v14, v11);

          }
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v15 = v12;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v36 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
                -[NSMapTable objectForKey:](v8, "objectForKey:", v20, v28);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v21)
                {
                  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v22, v20);

                }
                -[NSMapTable objectForKey:](v8, "objectForKey:", v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObject:", v11);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v17);
          }

          objc_autoreleasePoolPop(context);
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v32);
    }

    v6 = v28;
    opGraph = v28->_opGraph;
    v28->_opGraph = v8;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v25 = objc_claimAutoreleasedReturnValue();
    inDegrees = v28->_inDegrees;
    v28->_inDegrees = (NSMapTable *)v25;

    v4 = v29;
  }

  return v6;
}

- (void)addVertex:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[HMDBackgroundOperationGraph doesVertexAlreadyExistInGraph:](self, "doesVertexAlreadyExistInGraph:"))
  {
    -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v7);

    -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", &unk_24E96B3C0, v7);

  }
}

- (BOOL)doesVertexAlreadyExistInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)removeVertex:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if (-[HMDBackgroundOperationGraph doesVertexAlreadyExistInGraph:](self, "doesVertexAlreadyExistInGraph:"))
  {
    -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v11);

    -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v11);

    -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "nextObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      do
      {
        objc_msgSend(v9, "removeObject:", v11);
        objc_msgSend(v7, "nextObject");
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      while (v10);
    }

  }
}

- (void)addEdgeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMDBackgroundOperationGraph addVertex:](self, "addVertex:", v7);
  -[HMDBackgroundOperationGraph addVertex:](self, "addVertex:", v6);
  -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v7);
}

- (id)getIndependentVertices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEF0];
  -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  context = (void *)MEMORY[0x227676638]();
  -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __computeInDegrees(v6, v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntValue");

        if (!v16)
          objc_msgSend(v5, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(context);
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (BOOL)canAddEdgeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v8 = -[HMDBackgroundOperationGraph doesVertexAlreadyExistInGraph:](self, "doesVertexAlreadyExistInGraph:", v6);
  v9 = -[HMDBackgroundOperationGraph doesVertexAlreadyExistInGraph:](self, "doesVertexAlreadyExistInGraph:", v7);
  -[HMDBackgroundOperationGraph addEdgeFrom:to:](self, "addEdgeFrom:to:", v6, v7);
  v10 = -[HMDBackgroundOperationGraph doesCycleExist](self, "doesCycleExist");
  if (!v8)
    -[HMDBackgroundOperationGraph removeVertex:](self, "removeVertex:", v6);
  if (!v9)
    -[HMDBackgroundOperationGraph removeVertex:](self, "removeVertex:", v7);

  return v10;
}

- (BOOL)doesCycleExist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __computeInDegrees(v4, v5);

  objc_autoreleasePoolPop(v3);
  -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    return 0;
  v8 = 0;
  while (2)
  {
    context = (void *)MEMORY[0x227676638]();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v37;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
        -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntValue");

        if (!v17)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (v11)
            goto LABEL_5;
          goto LABEL_21;
        }
      }
      v18 = v14;

      -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __decrementInDegree(v19, v18);

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v33 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            -[HMDBackgroundOperationGraph inDegrees](self, "inDegrees");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            __decrementInDegree(v27, v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v23);
      }

      objc_autoreleasePoolPop(context);
      ++v8;
      -[HMDBackgroundOperationGraph opGraph](self, "opGraph");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v29 > v8)
        continue;
      return 0;
    }
    break;
  }
LABEL_21:

  objc_autoreleasePoolPop(context);
  return 1;
}

- (NSMapTable)opGraph
{
  return self->_opGraph;
}

- (void)setOpGraph:(id)a3
{
  objc_storeStrong((id *)&self->_opGraph, a3);
}

- (NSMapTable)inDegrees
{
  return self->_inDegrees;
}

- (void)setInDegrees:(id)a3
{
  objc_storeStrong((id *)&self->_inDegrees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inDegrees, 0);
  objc_storeStrong((id *)&self->_opGraph, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_107924 != -1)
    dispatch_once(&logCategory__hmf_once_t0_107924, &__block_literal_global_107925);
  return (id)logCategory__hmf_once_v1_107926;
}

void __42__HMDBackgroundOperationGraph_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_107926;
  logCategory__hmf_once_v1_107926 = v0;

}

@end
