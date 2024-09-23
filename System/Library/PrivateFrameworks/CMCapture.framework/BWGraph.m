@implementation BWGraph

uint64_t __116__BWGraph__getNodesToPrepareSeriallyBeforeGraphStart_concurrentlyBeforeGraphStart_duringGraphStart_afterGraphStart___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  int v7;

  v5 = objc_msgSend(a2, "deferredPreparePriority");
  if (v5 > (int)objc_msgSend(a3, "deferredPreparePriority"))
    return -1;
  v7 = objc_msgSend(a2, "deferredPreparePriority");
  return v7 < (int)objc_msgSend(a3, "deferredPreparePriority");
}

- (BOOL)_resolveFormats:(id *)a3
{
  BOOL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  uint64_t j;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t k;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  int v30;
  int v31;
  const __CFString *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id *v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v4 = 1;
  v5 = -[BWGraph _reverseDepthFirstEnumeratorWithVertexOrdering:](self, "_reverseDepthFirstEnumeratorWithVertexOrdering:", 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    v9 = CFSTR("Sink");
    v38 = a3;
    v34 = *(_QWORD *)v48;
    v35 = v5;
    v33 = CFSTR("Sink");
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if ((const __CFString *)objc_msgSend(v39, "nodeType", v33, v34, v35) != v9)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          obj = (id)objc_msgSend(v39, "outputs");
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
          if (v42)
          {
            v41 = *(_QWORD *)v44;
            v36 = i;
            v37 = v7;
            while (2)
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v44 != v41)
                  objc_enumerationMutation(obj);
                v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                v13 = objc_msgSend((id)objc_msgSend(v12, "connection"), "input");
                if (v13)
                {
                  v14 = (void *)v13;
                  v15 = (void *)objc_msgSend(v12, "specifiedAttachedMediaKeys");
                  v16 = (void *)objc_msgSend(v14, "specifiedAttachedMediaKeys");
                  if (objc_msgSend(v15, "count") || objc_msgSend(v16, "count"))
                  {
                    v17 = objc_msgSend(v12, "_passthroughModeForUnspecifiedAttachedMedia");
                    v18 = objc_msgSend(v14, "_passthroughModeForUnspecifiedAttachedMedia");
                    v55 = 0u;
                    v56 = 0u;
                    v57 = 0u;
                    v58 = 0u;
                    v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
                    if (v19)
                    {
                      v20 = v19;
                      v21 = *(_QWORD *)v56;
                      v22 = 1;
                      do
                      {
                        for (k = 0; k != v20; ++k)
                        {
                          if (*(_QWORD *)v56 != v21)
                            objc_enumerationMutation(v15);
                          v24 = objc_msgSend(v16, "containsObject:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
                          if (v18)
                            v25 = 1;
                          else
                            v25 = v24;
                          if (!v25)
                            v22 = 0;
                        }
                        v20 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
                      }
                      while (v20);
                    }
                    else
                    {
                      v22 = 1;
                    }
                    v53 = 0u;
                    v54 = 0u;
                    v51 = 0u;
                    v52 = 0u;
                    v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
                    if (v26)
                    {
                      v27 = v26;
                      v28 = *(_QWORD *)v52;
                      do
                      {
                        for (m = 0; m != v27; ++m)
                        {
                          if (*(_QWORD *)v52 != v28)
                            objc_enumerationMutation(v16);
                          v30 = objc_msgSend(v15, "containsObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m));
                          if (v17)
                            v31 = 1;
                          else
                            v31 = v30;
                          if (!v31)
                            v22 = 0;
                        }
                        v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
                      }
                      while (v27);
                    }
                    if ((v22 & 1) == 0)
                      goto LABEL_49;
                  }
                  if (!objc_msgSend((id)objc_msgSend(v12, "connection"), "resolveCommonBufferFormat"))
                  {
LABEL_49:
                    v4 = 0;
                    if (v38)
                      *v38 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -666, 0);
                    return v4;
                  }
                }
                else
                {
                  objc_msgSend(v39, "nodeType");
                }
              }
              v8 = v34;
              v5 = v35;
              v9 = v33;
              i = v36;
              v7 = v37;
              v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
              if (v42)
                continue;
              break;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      v4 = 1;
    }
    while (v7);
  }
  return v4;
}

- (id)_sinkNodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_sinkNodes);
}

- (BOOL)addNode:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  char v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99750];
    v22 = CFSTR("Can't add a nil node");
    goto LABEL_32;
  }
  if (self->_running)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99750];
    v22 = CFSTR("Can't currently add nodes while running");
    goto LABEL_32;
  }
  if (!self->_beingConfigured)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99750];
    v22 = CFSTR("Can't add nodes outside of a begin/commit block");
LABEL_32:
    objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0));
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = (void *)objc_msgSend(a3, "outputs");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (!v7)
    goto LABEL_12;
  v8 = v7;
  v9 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v6);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "consumer"))
      {
        v20 = (void *)MEMORY[0x1E0C99DA0];
        v21 = *MEMORY[0x1E0C99778];
        v22 = CFSTR("Can't add a node with outputs which already have consumers");
        goto LABEL_32;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  }
  while (v8);
LABEL_12:
  objc_msgSend(a3, "setGraph:", self);
  -[NSMutableArray addObject:](self->_nodes, "addObject:", a3);
  if ((objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", CFSTR("Source")) & 1) != 0)
  {
    v11 = 16;
    goto LABEL_16;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", CFSTR("Sink")))
  {
    v11 = 24;
LABEL_16:
    objc_msgSend(*(id *)((char *)&self->super.isa + v11), "addObject:", a3);
  }
  if (self->_supportsLiveReconfiguration)
  {
    v12 = objc_msgSend(a3, "supportsLiveReconfiguration");
    if (self->_supportsLiveReconfiguration)
      v13 = v12;
    else
      v13 = 0;
    self->_supportsLiveReconfiguration = v13;
  }
  if (self->_memoryPool)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = (void *)objc_msgSend(a3, "outputs", 0);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "setMemoryPool:", self->_memoryPool);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }
  }
  return 1;
}

- (void)_nodesInSubgraphOfSinkNode:(void *)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(a1, "_reverseDepthFirstEnumeratorWithVertexOrdering:", 0, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "nodeType"), "isEqualToString:", CFSTR("Sink")))
          v8 = v11 == a2;
        if (v8)
          objc_msgSend(v4, "addObject:", v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v4;
}

- (id)_reverseDepthFirstEnumeratorWithVertexOrdering:(int)a3
{
  return -[BWReverseDepthFirstEnumerator initWithGraph:vertexOrdering:]([BWReverseDepthFirstEnumerator alloc], "initWithGraph:vertexOrdering:", self, *(_QWORD *)&a3);
}

- (int)errorStatus
{
  return self->_errorStatus;
}

- (BOOL)commitConfigurationWithID:(int64_t)a3 error:(id *)a4
{
  NSMutableArray *nodes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  if (!self->_beingConfigured)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99750];
    v16 = CFSTR("Graph is not being configured, no configuration to commit");
    goto LABEL_24;
  }
  if (self->_commitGroup)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = CFSTR("Shouldn't have a commit group");
LABEL_24:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0));
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  nodes = self->_nodes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(nodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setConfigurationID:", a3);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }
  -[BWGraph _resolveFormats:](self, "_resolveFormats:", &v21);
  if (v21)
    goto LABEL_21;
  -[BWGraph _resolveRetainedBufferCounts:]((uint64_t)self);
  if (v21)
    goto LABEL_21;
  -[BWGraph statusDelegate](self, "statusDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[BWGraphStatusDelegate graphDidResolveRetainedBufferCounts:](-[BWGraph statusDelegate](self, "statusDelegate"), "graphDidResolveRetainedBufferCounts:", self);
  self->_inflightConfigurationID = a3;
  if (self->_running)
  {
    -[BWGraph _prepareNodesWithConfigurationChanges:]((uint64_t)self);
    if (!v21)
    {
      -[BWGraph _makeParentConfigurationChangesLive]((uint64_t)self);
      self->_commitGroup = (OS_dispatch_group *)-[BWGraph _newDispatchGroupForSinksToBecomeLiveWithConfigurationID:]((uint64_t)self, a3);
      goto LABEL_17;
    }
LABEL_21:
    FigDebugAssert3();
  }
LABEL_17:
  self->_beingConfigured = 0;
  v12 = v21;
  if (a4 && v21)
    *a4 = v21;
  return v12 == 0;
}

- (BWGraphStatusDelegate)statusDelegate
{
  return self->_statusDelegate;
}

- (BOOL)_resolveRetainedBufferCounts:(uint64_t)a1
{
  uint64_t i;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = *(id *)(a1 + 32);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(obj);
          v3 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "output");
          if (objc_msgSend(v3, "mediaType") == 1986618469
            || objc_msgSend(v3, "mediaType") == 1885564004)
          {
            -[BWGraph _resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:](a1, v3, (uint64_t)CFSTR("PrimaryFormat"), *(void **)(a1 + 40));
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            v4 = (void *)objc_msgSend(v3, "specifiedAttachedMediaKeys");
            v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
            if (v5)
            {
              v6 = v5;
              v7 = *(_QWORD *)v25;
              do
              {
                for (j = 0; j != v6; ++j)
                {
                  if (*(_QWORD *)v25 != v7)
                    objc_enumerationMutation(v4);
                  v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                  v10 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
                  if (!v10)
                  {
                    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v10, v9);
                  }
                  -[BWGraph _resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:](a1, v3, v9, v10);
                }
                v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
              }
              while (v6);
            }
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v19);
    }
    gr_addRetainCountsOfOutputsWithSharedPoolsForAttachedMediaToParentNodeOutputs(*(void **)(a1 + 40), (uint64_t)CFSTR("PrimaryFormat"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = *(void **)(a1 + 56);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v13; ++k)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          gr_addRetainCountsOfOutputsWithSharedPoolsForAttachedMediaToParentNodeOutputs((void *)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k)), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v13);
    }
  }
  return a1 != 0;
}

- (uint64_t)_resolveVideoRetainedBufferCountsForOutput:(uint64_t)a3 forAttachedMediaKey:(void *)a4 outputsWithSharedPools:
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;

  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(a2, "mediaPropertiesForAttachedMediaKey:");
    if (!v8)
      -[BWGraph _resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:].cold.1();
    v9 = (void *)v8;
    v10 = objc_msgSend(a2, "_passthroughModeForAttachedMediaKey:", a3);
    if (v10)
    {
      if (v10 != 2)
        return objc_msgSend(v9, "setResolvedRetainedBufferCount:", 0);
      objc_msgSend(a4, "addObject:", a2);
    }
    v13 = 0;
    if (*(_BYTE *)(v7 + 192))
      v11 = gr_countOfBuffersRetainedOutsideEmitCallbackOfOutput(a2, a3, 0);
    else
      v11 = gr_countOfBuffersRetainedOutsideEmitCallbackOfOutputWithDelay(a2, a3, 0, 0, 0, &v13);
    v12 = v11;
    objc_msgSend(v9, "resolvedRetainedBufferCount");
    return objc_msgSend(v9, "setResolvedRetainedBufferCount:", (v13 + v12));
  }
  return result;
}

- (void)setSourceDescription:(id)a3
{

  self->_sourceDescription = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setModeDescription:(id)a3
{

  self->_modeDescription = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setClientPID:(int)a3
{
  self->_clientPID = a3;
}

- (BOOL)isRunningForContinuityCapture
{
  return self->_runningForContinuityCapture;
}

- (BOOL)connectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5
{
  return -[BWGraph connectOutput:toInput:pipelineStage:deferredAttach:](self, "connectOutput:toInput:pipelineStage:deferredAttach:", a3, a4, a5, 0);
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (BWMemoryAnalyticsPayload)memoryAnalyticsPayload
{
  return self->_memoryAnalyticsPayload;
}

- (NSObject)_newDispatchGroupForSinksToTransitionToState:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = dispatch_group_create();
  v5 = objc_msgSend(*(id *)(a1 + 24), "count");
  if (v5)
  {
    v6 = v5;
    do
    {
      dispatch_group_enter(v4);
      --v6;
    }
    while (v6);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *(void **)(a1 + 24);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if (a2)
        {
          if (a2 == 1)
          {
            v16[0] = v11;
            v16[1] = 3221225472;
            v16[2] = __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke;
            v16[3] = &unk_1E491E720;
            v16[4] = v4;
            objc_msgSend(v13, "notifyWhenActive:", v16);
          }
        }
        else
        {
          v15[0] = v11;
          v15[1] = 3221225472;
          v15[2] = __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke_2;
          v15[3] = &unk_1E491E720;
          v15[4] = v4;
          objc_msgSend(v13, "notifyWhenIdle:", v15);
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  return v4;
}

void __43__BWGraph_startDeferredSourceNodesIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *context;
  id v9[29];

  v9[27] = *(id *)MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A858DD40]();
  v9[0] = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if (dword_1ECFE98F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 136), 0xFFFFFFFFFFFFFFFFLL);
  }
  if (dword_1ECFE98F0)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 40), "start:", v9, v6, v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 128));
  if (v9[0])
  {
    objc_msgSend(*(id *)(a1 + 32), "setErrorStatus:", objc_msgSend(v9[0], "code"));
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
LABEL_11:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_12;
  }
  if (dword_1ECFE98F0)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    goto LABEL_11;
  }
LABEL_12:
  objc_autoreleasePoolPop(context);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 152));
}

void __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)start:(id *)a3
{
  uint64_t v3;
  BWGraph *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSMutableDictionary *outputsWithSharedPoolsForAttachedMedia;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  int clientPID;
  uint64_t v33;
  NSString *clientApplicationID;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *sourceNodes;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  uint64_t v43;
  NSObject *startGroup;
  NSObject *sourceStartQueue;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  BOOL v51;
  NSObject *v52;
  NSObject *v53;
  void *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSMutableArray *obj;
  BWGraph *v64;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[6];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD block[5];
  void *v84;
  void *v85;
  id v86;
  id v87;
  os_log_type_t type;
  unsigned int v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _QWORD v92[6];
  _BYTE v93[20];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v5 = self;
  v97 = *MEMORY[0x1E0C80C00];
  v6 = -[NSMutableArray count](self->_sourceNodes, "count");
  if (!v5->_running && v6)
  {
    if (v5->_beingConfigured)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't start running while in the middle of a begin/commit block"), 0));
    v7 = v6;
    if (FigCaptureOSVariantHasInternalUI())
    {
      if (dword_1ECFE98F0)
        goto LABEL_8;
    }
    else if (dword_1ECFE98F0)
    {
LABEL_8:
      v89 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v86 = 0;
    v87 = 0;
    v84 = 0;
    v85 = 0;
    -[BWGraph _getNodesToPrepareSeriallyBeforeGraphStart:concurrentlyBeforeGraphStart:duringGraphStart:afterGraphStart:]((uint64_t)v5, (uint64_t *)&v87, (uint64_t *)&v86, (uint64_t *)&v85, &v84);

    v5->_nodesToPrepareAfterGraphStart = (NSArray *)v84;
    -[BWGraph _suspendInputConnectionsForNodes:messageCachingAllowed:bypassedNodes:]((uint64_t)v5, v84, v5->_resumesConnectionsAsNodesArePrepared, v5->_nodesToBypassUntilPrepared);
    -[BWGraph _suspendInputConnectionsForNodes:messageCachingAllowed:bypassedNodes:]((uint64_t)v5, v85, 0, 0);
    -[BWGraph _bypassInputConnectionsForNodes:]((uint64_t)v5, v5->_nodesToBypassUntilPrepared);
    v9 = objc_msgSend(v86, "count");
    v10 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      v11 = dispatch_group_create();
      v12 = FigDispatchQueueCreateWithPriority();
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __17__BWGraph_start___block_invoke;
      block[3] = &unk_1E491E720;
      block[4] = v86;
      dispatch_group_async(v11, v12, block);

    }
    else
    {
      v11 = 0;
    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v13 = v87;
    v14 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v79, v95, 16, v56, v58);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v80 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "prepareForCurrentConfigurationToBecomeLive");
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      }
      while (v15);
    }
    if (v11)
    {
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

    }
    outputsWithSharedPoolsForAttachedMedia = v5->_outputsWithSharedPoolsForAttachedMedia;
    gr_propagatePreparedPoolsToSharedPoolOutputsForAttachedMedia(v5->_outputsWithSharedPools, (uint64_t)CFSTR("PrimaryFormat"));
    *(_OWORD *)v93 = 0u;
    memset(v92, 0, sizeof(v92));
    v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](outputsWithSharedPoolsForAttachedMedia, "countByEnumeratingWithState:objects:count:", v92, v96, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v92[2];
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v92[2] != v21)
            objc_enumerationMutation(outputsWithSharedPoolsForAttachedMedia);
          gr_propagatePreparedPoolsToSharedPoolOutputsForAttachedMedia((void *)-[NSMutableDictionary objectForKeyedSubscript:](outputsWithSharedPoolsForAttachedMedia, "objectForKeyedSubscript:", *(_QWORD *)(v92[1] + 8 * j)), *(_QWORD *)(v92[1] + 8 * j));
        }
        v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](outputsWithSharedPoolsForAttachedMedia, "countByEnumeratingWithState:objects:count:", v92, v96, 16);
      }
      while (v20);
    }
    v61 = objc_msgSend(v85, "count");
    if (!v61)
      -[BWGraphStatusDelegate graphDidPrepareNodes:](-[BWGraph statusDelegate](v5, "statusDelegate"), "graphDidPrepareNodes:", v5);
    v5->_startGroup = (OS_dispatch_group *)-[BWGraph _newDispatchGroupForSinksToTransitionToState:]((uint64_t)v5, 1);
    -[BWGraph setErrorStatus:](v5, "setErrorStatus:", 0);
    v23 = &unk_1ECFE9000;
    if (objc_msgSend(v84, "count"))
      dispatch_group_enter((dispatch_group_t)v5->_startGroup);
    v5->_sourceNodesStartGroup = (OS_dispatch_group *)dispatch_group_create();
    v5->_nonDeferredSourceNodesStartGroup = (OS_dispatch_group *)dispatch_group_create();
    if (-[NSMutableArray count](v5->_deferredStartSourceNodes, "count"))
    {
      if (v7 <= -[NSMutableArray count](v5->_deferredStartSourceNodes, "count"))
      {
        v59 = v3;
        LODWORD(v57) = 0;
        FigDebugAssert3();
      }
      v60 = v7 - -[NSMutableArray count](v5->_deferredStartSourceNodes, "count", v57, v59);
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      obj = v5->_deferredStartSourceNodes;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v76;
        v64 = v5;
        v62 = *(_QWORD *)v76;
        do
        {
          for (k = 0; k != v25; ++k)
          {
            if (*(_QWORD *)v76 != v26)
              objc_enumerationMutation(obj);
            if (v23[572])
            {
              v28 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
              v89 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v30 = v89;
              if (os_log_type_enabled(v29, type))
                v31 = v30;
              else
                v31 = v30 & 0xFFFFFFFE;
              if (v31)
              {
                clientPID = v64->_clientPID;
                v33 = v25;
                clientApplicationID = v64->_clientApplicationID;
                v35 = objc_msgSend(v28, "nodeSubType");
                v36 = objc_msgSend(v28, "name");
                LODWORD(v92[0]) = 136316674;
                *(_QWORD *)((char *)v92 + 4) = "-[BWGraph start:]";
                WORD2(v92[1]) = 2048;
                *(_QWORD *)((char *)&v92[1] + 6) = v64;
                HIWORD(v92[2]) = 1026;
                LODWORD(v92[3]) = clientPID;
                v26 = v62;
                WORD2(v92[3]) = 2114;
                *(_QWORD *)((char *)&v92[3] + 6) = clientApplicationID;
                v25 = v33;
                v23 = (_DWORD *)&unk_1ECFE9000;
                HIWORD(v92[4]) = 2048;
                v92[5] = v28;
                *(_WORD *)v93 = 2112;
                *(_QWORD *)&v93[2] = v35;
                *(_WORD *)&v93[10] = 2114;
                *(_QWORD *)&v93[12] = v36;
                LODWORD(v59) = 68;
                v57 = v92;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v10 = MEMORY[0x1E0C809B0];
              v5 = v64;
            }
            dispatch_group_enter((dispatch_group_t)v5->_startGroup);
            dispatch_group_enter((dispatch_group_t)v5->_sourceNodesStartGroup);
          }
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
        }
        while (v25);
      }
      v7 = v60;
    }
    for (; v7; --v7)
    {
      dispatch_group_enter((dispatch_group_t)v5->_sourceNodesStartGroup);
      dispatch_group_enter((dispatch_group_t)v5->_nonDeferredSourceNodesStartGroup);
    }
    if (!v61)
      -[BWGraph _setMemoryPoolFlushAssertion]((uint64_t)v5);
    v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5->_deferredStartSourceNodes, v57, v59);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    sourceNodes = v5->_sourceNodes;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sourceNodes, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v72;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v72 != v41)
            objc_enumerationMutation(sourceNodes);
          v43 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m);
          if ((objc_msgSend(v37, "containsObject:", v43) & 1) == 0)
          {
            sourceStartQueue = v5->_sourceStartQueue;
            startGroup = v5->_startGroup;
            v70[0] = v10;
            v70[1] = 3221225472;
            v70[2] = __17__BWGraph_start___block_invoke_57;
            v70[3] = &unk_1E491E748;
            v70[4] = v5;
            v70[5] = v43;
            dispatch_group_async(startGroup, sourceStartQueue, v70);
          }
        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sourceNodes, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
      }
      while (v40);
    }
    if (v61)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v46 = v85;
      v47 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v67;
        do
        {
          for (n = 0; n != v48; ++n)
          {
            if (*(_QWORD *)v67 != v49)
              objc_enumerationMutation(v46);
            if (v5)
              objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * n), "prepareForCurrentConfigurationToBecomeLive");
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
        }
        while (v48);
      }
      -[BWGraphStatusDelegate graphDidPrepareNodes:](-[BWGraph statusDelegate](v5, "statusDelegate"), "graphDidPrepareNodes:", v5);
      -[BWGraph _resumeInputConnectionsForNodes:eventsOnly:]((uint64_t)v5, (uint64_t)v85, 0);
      -[BWGraph _setMemoryPoolFlushAssertion]((uint64_t)v5);
    }
    v51 = 1;
    v5->_running = 1;
    v53 = v5->_sourceStartQueue;
    v52 = v5->_startGroup;
    v65[0] = v10;
    v65[1] = 3221225472;
    v65[2] = __17__BWGraph_start___block_invoke_63;
    v65[3] = &unk_1E491E720;
    v65[4] = v5;
    dispatch_group_notify(v52, v53, v65);
    return v51;
  }
  FigDebugAssert3();
  v55 = (void *)BWSignalErrorAt();
  v51 = v55 == 0;
  if (a3 && v55)
  {
    v51 = 0;
    *a3 = v55;
  }
  return v51;
}

- (uint64_t)_getNodesToPrepareSeriallyBeforeGraphStart:(uint64_t *)a3 concurrentlyBeforeGraphStart:(uint64_t *)a4 duringGraphStart:(_QWORD *)a5 afterGraphStart:
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  void *v45;
  char v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v9 = result;
  if (objc_msgSend(*(id *)(result + 80), "count"))
  {
    v52 = a2;
    v53 = a5;
    v54 = a4;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(v9 + 16));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v13 = *(void **)(v9 + 80);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v77 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "unionSet:", -[BWGraph _nodesInSubgraphOfSinkNode:]((void *)v9, *(void **)(*((_QWORD *)&v76 + 1) + 8 * i)));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      }
      while (v15);
    }
    v51 = a3;
    objc_msgSend(v12, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(v9 + 48)));
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v18 = *(void **)(v9 + 32);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v73 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
          if (!objc_msgSend(v23, "pipelineStage"))
            objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(v23, "input"), "node"));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      }
      while (v20);
    }
    v59 = v12;
    v56 = v10;
    objc_msgSend(v12, "unionSet:", v10);
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(v9 + 56));
    v50 = v9;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", (id)objc_msgSend(*(id *)(v9 + 40), "copy"), CFSTR("PrimaryFormat"));
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    if (v25)
    {
      v26 = v25;
      v57 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v69 != v57)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v29 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", v28);
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v65;
            do
            {
              for (m = 0; m != v31; ++m)
              {
                if (*(_QWORD *)v65 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * m);
                objc_msgSend(v11, "addObject:", objc_msgSend(v34, "node"));
                objc_msgSend(v11, "addObject:", objc_msgSend(gr_findParentOutputOfOutputWithSharedPool(v34, v28, 0), "node"));
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
            }
            while (v31);
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      }
      while (v26);
    }
    objc_msgSend(v59, "unionSet:", v11);
    v58 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (*(_QWORD *)(v50 + 64))
      v37 = *(_QWORD *)(v50 + 64);
    else
      v37 = MEMORY[0x1E0C9AA60];
    v38 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v37);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v39 = *(void **)(v50 + 8);
    result = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
    if (result)
    {
      v40 = result;
      v41 = *(_QWORD *)v61;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v61 != v41)
            objc_enumerationMutation(v39);
          v43 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v42);
          v44 = objc_msgSend(v59, "containsObject:", v43);
          v45 = v36;
          if (v44)
          {
            v46 = objc_msgSend(v38, "containsObject:", v43);
            v45 = (void *)v35;
            if ((v46 & 1) == 0)
            {
              if ((objc_msgSend(v56, "containsObject:", v43) & 1) != 0
                || (v47 = objc_msgSend(v11, "containsObject:", v43), v45 = (void *)v55, v47))
              {
                v45 = (void *)v58;
              }
            }
          }
          objc_msgSend(v45, "addObject:", v43);
          ++v42;
        }
        while (v40 != v42);
        result = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
        v40 = result;
      }
      while (result);
    }
    if (*(_BYTE *)(v50 + 89))
      result = objc_msgSend(v36, "sortUsingComparator:", &__block_literal_global_101);
    if (v52)
      *v52 = v58;
    if (v51)
      *v51 = v35;
    if (v53)
      *v53 = v36;
    a4 = v54;
    if (!v54)
      return result;
LABEL_70:
    *a4 = v55;
    return result;
  }
  v48 = *(void **)(v9 + 8);
  result = objc_msgSend(*(id *)(v9 + 64), "count");
  if (result)
  {
    v48 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(v9 + 8));
    result = objc_msgSend(v48, "removeObjectsInArray:", *(_QWORD *)(v9 + 64));
    if (!a3)
      goto LABEL_64;
    v49 = *(_QWORD *)(v9 + 64);
  }
  else
  {
    if (!a3)
      goto LABEL_64;
    v49 = MEMORY[0x1E0C9AA60];
  }
  *a3 = v49;
LABEL_64:
  if (a2)
    *a2 = (uint64_t)v48;
  if (a5)
    *a5 = MEMORY[0x1E0C9AA60];
  if (a4)
  {
    v55 = MEMORY[0x1E0C9AA60];
    goto LABEL_70;
  }
  return result;
}

- (void)setErrorStatus:(int)a3
{
  self->_errorStatus = a3;
}

- (uint64_t)_resumeInputConnectionsForNodes:(uint64_t)a3 eventsOnly:
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = (void *)result;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (void *)objc_msgSend(v4, "_reverseDepthFirstEnumeratorWithVertexOrdering:", 0);
    result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
          if (objc_msgSend(v5, "containsObject:", v10))
          {
            v18 = 0u;
            v19 = 0u;
            v16 = 0u;
            v17 = 0u;
            v11 = (void *)objc_msgSend(v10, "inputs", 0);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v17;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v17 != v14)
                    objc_enumerationMutation(v11);
                  objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "connection"), "resumeForEventsOnly:", a3);
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              }
              while (v13);
            }
          }
          ++v9;
        }
        while (v9 != v7);
        result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        v7 = result;
      }
      while (result);
    }
  }
  return result;
}

void __65__BWGraph_startDeferredNodePrepareIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t m;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A858DD40]();
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v4)
  {
    v5 = v4;
    v29 = v2;
    v6 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 88))
        {
          v15 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          v16 = (void *)objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v15, (int)(objc_msgSend(*(id *)(a1 + 32), "count") - v15));
          if (*(_BYTE *)(a1 + 56))
          {
            v17 = v16;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v39;
              do
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v39 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                  v34 = 0u;
                  v35 = 0u;
                  v36 = 0u;
                  v37 = 0u;
                  v23 = (void *)objc_msgSend(v22, "inputs");
                  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
                  if (v24)
                  {
                    v25 = v24;
                    v26 = *(_QWORD *)v35;
                    do
                    {
                      for (k = 0; k != v25; ++k)
                      {
                        if (*(_QWORD *)v35 != v26)
                          objc_enumerationMutation(v23);
                        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "connection"), "resumeForEventsOnly:", 1);
                      }
                      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
                    }
                    while (v25);
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
              }
              while (v19);
            }
          }
          v14 = 1;
          goto LABEL_41;
        }
        if (*MEMORY[0x1E0CA1FA8] == 1)
        {
          gr_sprintNode((const char *)&v47, *(void **)(*((_QWORD *)&v42 + 1) + 8 * i));
          if (*MEMORY[0x1E0CA1FC0] == 1)
            kdebug_trace();
        }
        objc_msgSend(v8, "prepareForCurrentConfigurationToBecomeLive");
        if (*(_BYTE *)(a1 + 56))
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v9 = (void *)objc_msgSend(v8, "inputs");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v31;
            do
            {
              for (m = 0; m != v11; ++m)
              {
                if (*(_QWORD *)v31 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * m), "connection"), "resumeForEventsOnly:", 0);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
            }
            while (v11);
          }
        }
        if (*MEMORY[0x1E0CA1FC0] == 1)
          kdebug_trace();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v5)
        continue;
      break;
    }
    v14 = 0;
LABEL_41:
    v2 = v29;
  }
  else
  {
    v14 = 0;
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!*(_BYTE *)(a1 + 56))
    -[BWGraph _resumeInputConnectionsForNodes:eventsOnly:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v14);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248) = 0;
  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
    (*(void (**)(void))(v28 + 16))();
  objc_autoreleasePoolPop(v2);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 152));
}

- (void)enableConcurrentPrepareForNode:(id)a3
{
  NSMutableArray *nodesToPrepareConcurrently;

  if ((-[NSMutableArray containsObject:](self->_nodesToPrepareConcurrently, "containsObject:") & 1) == 0)
  {
    nodesToPrepareConcurrently = self->_nodesToPrepareConcurrently;
    if (!nodesToPrepareConcurrently)
    {
      nodesToPrepareConcurrently = (NSMutableArray *)objc_opt_new();
      self->_nodesToPrepareConcurrently = nodesToPrepareConcurrently;
    }
    -[NSMutableArray addObject:](nodesToPrepareConcurrently, "addObject:", a3);
  }
}

- (void)enableDeferredPrepareForNodesNotInPathOfSinkNode:(id)a3
{
  NSMutableArray *deferredPreparePrioritySinks;

  deferredPreparePrioritySinks = self->_deferredPreparePrioritySinks;
  if (!deferredPreparePrioritySinks)
  {
    deferredPreparePrioritySinks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_deferredPreparePrioritySinks = deferredPreparePrioritySinks;
  }
  if ((-[NSMutableArray containsObject:](deferredPreparePrioritySinks, "containsObject:", a3) & 1) == 0)
    -[NSMutableArray addObject:](self->_deferredPreparePrioritySinks, "addObject:", a3);
}

- (void)setMemoryAnalyticsReportingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  BWMemoryAnalyticsPayload *v5;

  v3 = a3;
  if (self->_memoryAnalyticsReportingEnabled != a3)
  {

    if (v3)
      v5 = objc_alloc_init(BWMemoryAnalyticsPayload);
    else
      v5 = 0;
    self->_memoryAnalyticsPayload = v5;
  }
  self->_memoryAnalyticsReportingEnabled = v3;
}

- (uint64_t)_setMemoryPoolFlushAssertion
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = (void *)result;
    *(_QWORD *)(result + 248) = objc_msgSend(*(id *)(result + 200), "newFlushAssertion:", CFSTR("GraphStart"));
    result = objc_msgSend(v1, "deferredNodePrepareEnabled");
    if ((result & 1) == 0)
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __39__BWGraph__setMemoryPoolFlushAssertion__block_invoke;
      v2[3] = &unk_1E491E720;
      v2[4] = v1;
      return objc_msgSend(v1, "notifyWhenNonDeferredSourceNodesHaveStarted:", v2);
    }
  }
  return result;
}

- (BOOL)deferredNodePrepareEnabled
{
  return -[NSMutableArray count](self->_deferredPreparePrioritySinks, "count") != 0;
}

- (void)startDeferredSourceNodesIfNeeded
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  NSMutableArray *obj;
  _QWORD block[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  os_log_type_t type;
  int v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98F0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!self->_haveStartedOrCancelledDeferredSourceNodes)
  {
    if (-[NSMutableArray count](self->_deferredStartSourceNodes, "count"))
    {
      self->_haveStartedOrCancelledDeferredSourceNodes = 1;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      obj = self->_deferredStartSourceNodes;
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v14;
        v7 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v14 != v6)
              objc_enumerationMutation(obj);
            v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
            v10 = FigDispatchQueueCreateWithPriority();
            block[0] = v7;
            block[1] = 3221225472;
            block[2] = __43__BWGraph_startDeferredSourceNodesIfNeeded__block_invoke;
            block[3] = &unk_1E491E748;
            block[4] = self;
            block[5] = v9;
            dispatch_async(v10, block);

          }
          v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        }
        while (v5);
      }
    }
  }
}

- (void)notifyWhenNonDeferredSourceNodesHaveStarted:(id)a3
{
  if (a3)
  {
    if (self->_nonDeferredSourceNodesStartGroup)
      dispatch_group_notify((dispatch_group_t)self->_nonDeferredSourceNodesStartGroup, (dispatch_queue_t)self->_sourceStartQueue, a3);
    else
      (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)startDeferredNodePrepareIfNeededWithCompletionHandler:(id)a3
{
  NSArray *nodesToPrepareAfterGraphStart;
  BOOL resumesConnectionsAsNodesArePrepared;
  NSObject *v7;
  _QWORD v8[7];
  BOOL v9;

  if (-[NSMutableArray count](self->_deferredPreparePrioritySinks, "count"))
  {
    if (-[NSArray count](self->_nodesToPrepareAfterGraphStart, "count"))
    {
      nodesToPrepareAfterGraphStart = self->_nodesToPrepareAfterGraphStart;
      self->_nodesToPrepareAfterGraphStart = 0;
      resumesConnectionsAsNodesArePrepared = self->_resumesConnectionsAsNodesArePrepared;
      v7 = FigDispatchQueueCreateWithPriority();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65__BWGraph_startDeferredNodePrepareIfNeededWithCompletionHandler___block_invoke;
      v8[3] = &unk_1E4925C60;
      v8[4] = nodesToPrepareAfterGraphStart;
      v8[5] = self;
      v9 = resumesConnectionsAsNodesArePrepared;
      v8[6] = a3;
      dispatch_async(v7, v8);

    }
  }
}

- (void)setStatusDelegate:(id)a3
{
  self->_statusDelegate = (BWGraphStatusDelegate *)a3;
}

- (void)setMemoryPool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientation = a3;
}

- (BWMemoryPool)memoryPool
{
  return self->_memoryPool;
}

- (BWGraph)init
{
  return -[BWGraph initWithConfigurationQueuePriority:](self, "initWithConfigurationQueuePriority:", 13);
}

- (BWGraph)initWithConfigurationQueuePriority:(unsigned int)a3
{
  BWGraph *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)BWGraph;
  v4 = -[BWGraph init](&v7, sel_init);
  if (v4)
  {
    if (dword_1ECFE98F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4->_nodes = (NSMutableArray *)objc_opt_new();
    v4->_sourceNodes = (NSMutableArray *)objc_opt_new();
    v4->_sinkNodes = (NSMutableArray *)objc_opt_new();
    v4->_connections = (NSMutableArray *)objc_opt_new();
    v4->_outputsWithSharedPools = (NSMutableArray *)objc_opt_new();
    v4->_outputsWithSharedPoolsForAttachedMedia = (NSMutableDictionary *)objc_opt_new();
    v4->_supportsLiveReconfiguration = 1;
    v4->_classicRetainedBufferCount = 0;
    v4->_graphStateTransitionTimeoutSeconds = 10;
    v4->_configurationQueuePriority = a3;
    v4->_sourceStartQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v4;
}

- (void)beginConfiguration
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  if (self->_beingConfigured)
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99750];
    v4 = CFSTR("Can't begin a new configuration when the existing configuration hasn't been committed");
    goto LABEL_8;
  }
  self->_beingConfigured = 1;
  if (self->_running)
  {
    if (self->_supportsLiveReconfiguration)
    {
      -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);
      return;
    }
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99750];
    v4 = CFSTR("Graph doesn't support live reconfiguration, but beginConfiguration was called while running");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0));
  }
}

- (void)setResumesConnectionsAsNodesArePrepared:(BOOL)a3
{
  self->_resumesConnectionsAsNodesArePrepared = a3;
}

void __39__BWGraph__setMemoryPoolFlushAssertion__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  qword_1EE6BE4C8 = (uint64_t)"Crashing on graph deallocation before audio source stop has been completed";
  __break(1u);
}

- (BOOL)removeNode:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't remove a nil node"), 0));
  objc_msgSend(a3, "setGraph:", self);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (void *)objc_msgSend(a3, "inputs");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "connection"), "detach");
        if (-[NSMutableArray containsObject:](self->_connections, "containsObject:", objc_msgSend(v10, "connection")))-[NSMutableArray removeObject:](self->_connections, "removeObject:", objc_msgSend(v10, "connection"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)objc_msgSend(a3, "outputs", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        objc_msgSend((id)objc_msgSend(v16, "connection"), "detach");
        if (-[NSMutableArray containsObject:](self->_connections, "containsObject:", objc_msgSend(v16, "connection")))-[NSMutableArray removeObject:](self->_connections, "removeObject:", objc_msgSend(v16, "connection"));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", CFSTR("Source")) & 1) != 0)
  {
    v17 = 16;
LABEL_24:
    objc_msgSend(*(id *)((char *)&self->super.isa + v17), "removeObject:", a3);
    goto LABEL_25;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "nodeType"), "isEqualToString:", CFSTR("Sink")))
  {
    v17 = 24;
    goto LABEL_24;
  }
LABEL_25:
  -[NSMutableArray removeObject:](self->_nodes, "removeObject:", a3);
  return 1;
}

- (int)safelyConnectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5
{
  return -[BWGraph safelyConnectOutput:toInput:pipelineStage:deferredAttach:](self, "safelyConnectOutput:toInput:pipelineStage:deferredAttach:", a3, a4, a5, 0);
}

- (int)safelyConnectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5 deferredAttach:(BOOL)a6
{
  if (a3 && a4)
  {
    if (!self->_running
      && self->_beingConfigured
      && -[BWGraph connectOutput:toInput:pipelineStage:deferredAttach:](self, "connectOutput:toInput:pipelineStage:deferredAttach:"))
    {
      return 0;
    }
    else
    {
      FigDebugAssert3();
      return -12782;
    }
  }
  else
  {
    FigDebugAssert3();
    return -12780;
  }
}

- (BOOL)connectOutput:(id)a3 toInput:(id)a4 pipelineStage:(id)a5 deferredAttach:(BOOL)a6
{
  _BOOL4 v7;
  BWNodeConnection *v8;
  void *v10;
  uint64_t v11;
  const __CFString *v12;

  if (self->_running)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99750];
    v12 = CFSTR("Can't currently add connections while running");
    goto LABEL_12;
  }
  if (!self->_beingConfigured)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99750];
    v12 = CFSTR("Can't connect nodes outside of a begin/commit block");
    goto LABEL_12;
  }
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("Output can't be nil");
    goto LABEL_12;
  }
  if (!a4)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("Input can't be nil");
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0, a6));
  }
  v7 = a6;
  v8 = -[BWNodeConnection initWithOutput:input:pipelineStage:]([BWNodeConnection alloc], "initWithOutput:input:pipelineStage:", a3, a4, a5);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v8);

  if (v7)
    return -[BWNodeConnection deferredAttach](v8, "deferredAttach");
  else
    return -[BWNodeConnection attach](v8, "attach");
}

- (void)enableBypassUntilPreparedForNode:(id)a3 deferredPreparePriority:(int)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  NSMutableArray *nodesToBypassUntilPrepared;
  uint64_t v12;

  v4 = *(_QWORD *)&a4;
  v7 = objc_msgSend((id)objc_msgSend(a3, "inputs"), "count");
  v8 = objc_msgSend((id)objc_msgSend(a3, "outputs"), "count");
  if (v7 != 1 || v8 != 1)
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Bypass only works for single input with single output nodes."), a3);
    goto LABEL_11;
  }
  v9 = objc_msgSend((id)objc_msgSend(a3, "input"), "passthroughMode");
  v10 = objc_msgSend((id)objc_msgSend(a3, "output"), "passthroughMode");
  if (v9 != 1 || v10 != 1)
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Bypass only works for pass through nodes. "), a3);
LABEL_11:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  nodesToBypassUntilPrepared = self->_nodesToBypassUntilPrepared;
  if (!nodesToBypassUntilPrepared)
  {
    nodesToBypassUntilPrepared = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_nodesToBypassUntilPrepared = nodesToBypassUntilPrepared;
  }
  if ((-[NSMutableArray containsObject:](nodesToBypassUntilPrepared, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_nodesToBypassUntilPrepared, "addObject:", a3);
    objc_msgSend(a3, "setDeferredPreparePriority:", v4);
  }
}

- (void)cancelDeferredNodePrepare
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSUInteger v4;
  uint64_t v5;
  void *v6;
  NSArray *nodesToPrepareAfterGraphStart;

  if (dword_1ECFE98F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_running && -[NSMutableArray count](self->_deferredPreparePrioritySinks, "count"))
  {
    self->_deferredNodePrepareCancelled = 1;
    v4 = -[NSArray count](self->_nodesToPrepareAfterGraphStart, "count");
    if (v4)
    {
      v6 = (void *)MEMORY[0x1A858DD40](v4, v5);
      nodesToPrepareAfterGraphStart = self->_nodesToPrepareAfterGraphStart;
      self->_nodesToPrepareAfterGraphStart = 0;
      -[BWGraph _resumeInputConnectionsForNodes:eventsOnly:]((uint64_t)self, (uint64_t)nodesToPrepareAfterGraphStart, 1);

      dispatch_group_leave((dispatch_group_t)self->_startGroup);
      objc_autoreleasePoolPop(v6);
    }
  }
}

- (void)enableDeferredStartForSourceNode:(id)a3 mustStartAfterNonDeferred:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSMutableArray *deferredStartSourceNodesThatMustStartAfterNonDeferred;
  NSMutableArray *deferredStartSourceNodes;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_running)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't enable deferred start while running"), 0));
  if (v4)
  {
    deferredStartSourceNodesThatMustStartAfterNonDeferred = self->_deferredStartSourceNodesThatMustStartAfterNonDeferred;
    if (!deferredStartSourceNodesThatMustStartAfterNonDeferred)
    {
      deferredStartSourceNodesThatMustStartAfterNonDeferred = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_deferredStartSourceNodesThatMustStartAfterNonDeferred = deferredStartSourceNodesThatMustStartAfterNonDeferred;
    }
    if ((-[NSMutableArray containsObject:](deferredStartSourceNodesThatMustStartAfterNonDeferred, "containsObject:", a3, v11, v12) & 1) == 0)-[NSMutableArray addObject:](self->_deferredStartSourceNodesThatMustStartAfterNonDeferred, "addObject:", a3);
  }
  deferredStartSourceNodes = self->_deferredStartSourceNodes;
  if (!deferredStartSourceNodes)
  {
    deferredStartSourceNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_deferredStartSourceNodes = deferredStartSourceNodes;
  }
  if ((-[NSMutableArray containsObject:](deferredStartSourceNodes, "containsObject:", a3, v11, v12) & 1) == 0)
  {
    v10 = self->_deferredStartSourceNodes;
    if (v4)
      -[NSMutableArray addObject:](v10, "addObject:", a3);
    else
      -[NSMutableArray insertObject:atIndex:](v10, "insertObject:atIndex:", a3, 0);
  }
}

- (void)cancelDeferredSourceNodeStart
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSMutableArray *deferredStartSourceNodes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  os_log_type_t type;
  int v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98F0)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_running)
  {
    if (-[NSMutableArray count](self->_deferredStartSourceNodes, "count"))
    {
      if (!self->_haveStartedOrCancelledDeferredSourceNodes)
      {
        self->_haveStartedOrCancelledDeferredSourceNodes = 1;
        v8 = 0u;
        v9 = 0u;
        v10 = 0u;
        v11 = 0u;
        deferredStartSourceNodes = self->_deferredStartSourceNodes;
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredStartSourceNodes, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v9;
          while (1)
          {
            if (*(_QWORD *)v9 != v7)
              objc_enumerationMutation(deferredStartSourceNodes);
            dispatch_group_leave((dispatch_group_t)self->_startGroup);
            dispatch_group_leave((dispatch_group_t)self->_sourceNodesStartGroup);
            if (!--v6)
            {
              v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredStartSourceNodes, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
              if (!v6)
                break;
            }
          }
        }
      }
    }
  }
}

- (uint64_t)_suspendInputConnectionsForNodes:(uint64_t)a3 messageCachingAllowed:(void *)a4 bypassedNodes:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id obj;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  obj = a2;
  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (result)
    {
      v6 = result;
      v15 = *(_QWORD *)v21;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v9 = (void *)objc_msgSend(v8, "inputs", obj);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v17;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v17 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "connection"), "suspendWithMessageCachingAllowed:bypassed:", a3, objc_msgSend(a4, "containsObject:", v8));
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v11);
          }
          ++v7;
        }
        while (v7 != v6);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_bypassInputConnectionsForNodes:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(a2);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "input"), "connection"), "connectBypassInput");
        }
        while (v3 != v5);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v3 = result;
      }
      while (result);
    }
  }
  return result;
}

void __17__BWGraph_start___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A858DD40]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "prepareForCurrentConfigurationToBecomeLive");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __17__BWGraph_start___block_invoke_57(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _DWORD *v3;
  NSObject *v4;
  uint64_t result;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[18];

  v10[16] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (dword_1ECFE98F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FA8] == 1)
  {
    gr_sprintNode((const char *)v10, *(void **)(a1 + 40));
    if (*v3 == 1)
      kdebug_trace();
  }
  objc_msgSend(*(id *)(a1 + 40), "start:", &v9, v7, v8);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 128));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 136));
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setErrorStatus:", objc_msgSend(v9, "code"));
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (*v3 == 1)
    {
      objc_msgSend(v9, "code");
      return kdebug_trace();
    }
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureStream"), "suspended");
    if (dword_1ECFE98F0)
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (*v3 == 1)
      return kdebug_trace();
  }
  return result;
}

uint64_t __17__BWGraph_start___block_invoke_63(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statusDelegate"), "graph:didFinishStartingWithError:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "errorStatus"));
}

- (BOOL)stop:(id *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *sinkNodesIdleGroupForParallelGraphRebuild;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;
  void *v9;

  if (dword_1ECFE98F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_beingConfigured)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't stop running while in the middle of a begin/commit block"), 0));
  -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);

  self->_sourceNodesStartGroup = 0;
  self->_nonDeferredSourceNodesStartGroup = 0;
  sinkNodesIdleGroupForParallelGraphRebuild = self->_sinkNodesIdleGroupForParallelGraphRebuild;
  if (!sinkNodesIdleGroupForParallelGraphRebuild)
    sinkNodesIdleGroupForParallelGraphRebuild = -[BWGraph _newDispatchGroupForSinksToTransitionToState:]((uint64_t)self, 0);
  -[BWGraph _stopSourcesUsingDispatchGroup:]((uint64_t)self, sinkNodesIdleGroupForParallelGraphRebuild);
  v6 = -[BWGraph _graphStateTransitionTimeout]((dispatch_time_t)self);
  v7 = dispatch_group_wait(sinkNodesIdleGroupForParallelGraphRebuild, v6);

  self->_sinkNodesIdleGroupForParallelGraphRebuild = 0;
  if (v7)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWGraph _logActiveNodesAfterGraphStopTimeout](self);
    -[BWGraph _logActiveSinkNodesAfterGraphStopTimeout]((uint64_t)self);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timed out waiting for the capture graph to stop. Please file a radar against %s."), FigCaptureGetFrameworkRadarComponentName());
    -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:]((uint64_t)self, v9);
  }
  if (self->_memoryAnalyticsReportingEnabled)
  {
    -[BWMemoryAnalyticsPayload setPeakFootprintDifference:](self->_memoryAnalyticsPayload, "setPeakFootprintDifference:", -[FigCaptureMemoryReporter peakFootprintSinceReset](+[FigCaptureMemoryReporter sharedInstance](FigCaptureMemoryReporter, "sharedInstance"), "peakFootprintSinceReset"));
    -[FigCaptureMemoryReporter resetPeakFootprint](+[FigCaptureMemoryReporter sharedInstance](FigCaptureMemoryReporter, "sharedInstance"), "resetPeakFootprint");
    -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", self->_memoryAnalyticsPayload);

    self->_memoryAnalyticsPayload = 0;
  }
  *(_WORD *)&self->_haveStartedOrCancelledDeferredSourceNodes = 0;
  self->_deferredNodePrepareCancelled = 0;
  return 1;
}

- (void)_waitForStartOrCommitToComplete
{
  dispatch_time_t v1;
  id *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id *v31;
  id *v32;
  id *v33;
  uint64_t v34;
  id obj;
  id obja;
  uint64_t v37;
  uint64_t v38;
  dispatch_time_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  os_log_type_t type;
  unsigned int v51;
  _BYTE v52[128];
  int v53;
  const char *v54;
  __int16 v55;
  dispatch_time_t v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (id *)(a1 + 152);
    v3 = *(_QWORD *)(a1 + 160);
    if (*(_QWORD *)(a1 + 152))
    {
      v4 = *(NSObject **)(a1 + 152);
      if (v3)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Shouldn't have both a start group and commit group"), 0));
    }
    else
    {
      v4 = *(NSObject **)(a1 + 160);
      if (!v3)
        return;
    }
    v33 = (id *)(a1 + 160);
    v34 = *(_QWORD *)(a1 + 152);
    if (dword_1ECFE98F0)
    {
      v51 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v6 = -[BWGraph _graphStateTransitionTimeout](v1);
    if (dispatch_group_wait(v4, v6))
    {
      v39 = v1;
      v32 = v2;
      if (v34)
      {
        v51 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = *(id *)(v1 + 24);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
        if (v40)
        {
          v37 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v47 != v37)
                objc_enumerationMutation(obj);
              v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              v51 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v12 = v51;
              if (os_log_type_enabled(v11, type))
                v13 = v12;
              else
                v13 = v12 & 0xFFFFFFFE;
              if (v13)
              {
                v14 = *(_DWORD *)(v39 + 216);
                v15 = *(_QWORD *)(v39 + 208);
                v16 = objc_msgSend(v10, "nodeSubType");
                v17 = objc_msgSend(v10, "name");
                v18 = objc_msgSend(v10, "currentStateDebugString");
                v53 = 136316930;
                v54 = "-[BWGraph _waitForStartOrCommitToComplete]";
                v55 = 2048;
                v56 = v39;
                v57 = 1026;
                v58 = v14;
                v59 = 2114;
                v60 = v15;
                v61 = 2048;
                v62 = v10;
                v63 = 2112;
                v64 = v16;
                v65 = 2114;
                v66 = v17;
                v67 = 2114;
                v68 = v18;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
          }
          while (v40);
          v1 = v39;
        }
        v19 = CFSTR("Timed out waiting for capture graph start to complete. Please file a radar against %s.");
      }
      else
      {
        v51 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        obja = *(id *)(v1 + 24);
        v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v41)
        {
          v38 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v43 != v38)
                objc_enumerationMutation(obja);
              v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              v51 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v23 = v51;
              if (os_log_type_enabled(v22, type))
                v24 = v23;
              else
                v24 = v23 & 0xFFFFFFFE;
              if (v24)
              {
                v25 = *(_DWORD *)(v39 + 216);
                v26 = *(_QWORD *)(v39 + 208);
                v27 = objc_msgSend(v21, "nodeSubType");
                v28 = objc_msgSend(v21, "name");
                v29 = objc_msgSend(v21, "currentStateDebugString");
                v53 = 136316930;
                v54 = "-[BWGraph _waitForStartOrCommitToComplete]";
                v55 = 2048;
                v56 = v39;
                v57 = 1026;
                v58 = v25;
                v59 = 2114;
                v60 = v26;
                v61 = 2048;
                v62 = v21;
                v63 = 2112;
                v64 = v27;
                v65 = 2114;
                v66 = v28;
                v67 = 2114;
                v68 = v29;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          }
          while (v41);
          v1 = v39;
        }
        v19 = CFSTR("Timed out waiting for capture graph commit to complete. Please file a radar against %s.");
      }
      v30 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, FigCaptureGetFrameworkRadarComponentName());
      -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:](v1, v30);
      v2 = v32;
    }
    if (v34)
      v31 = v2;
    else
      v31 = v33;

    *v31 = 0;
  }
}

- (void)_stopSourcesUsingDispatchGroup:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = FigDispatchQueueCreateWithPriority();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *(void **)(a1 + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          v12[0] = v9;
          v12[1] = 3221225472;
          v12[2] = __42__BWGraph__stopSourcesUsingDispatchGroup___block_invoke;
          v12[3] = &unk_1E491E748;
          v12[4] = a1;
          v12[5] = v11;
          dispatch_group_async(a2, v4, v12);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (dispatch_time_t)_graphStateTransitionTimeout
{
  dispatch_time_t v1;

  if (result)
  {
    v1 = result;
    if ((FigCaptureIsDebuggerOrSlowAllocationPathEnabled() & 1) != 0)
      return -1;
    else
      return dispatch_time(0, 1000000000 * *(int *)(v1 + 240));
  }
  return result;
}

- (_DWORD)_logActiveNodesAfterGraphStopTimeout
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  NSObject *v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  int *v46;
  uint64_t v47;
  id obj;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const __CFString *v63;
  _DWORD *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  os_log_type_t type;
  unsigned int v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  int v85;
  const char *v86;
  __int16 v87;
  _DWORD *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v64 = result;
  if (result)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    obj = (id)objc_msgSend(result, "_depthFirstEnumeratorWithVertexOrdering:", 0);
    result = (_DWORD *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v109, 16);
    v50 = result;
    if (result)
    {
      v49 = *(_QWORD *)v82;
      do
      {
        v1 = 0;
        do
        {
          if (*(_QWORD *)v82 != v49)
            objc_enumerationMutation(obj);
          v51 = v1;
          v2 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v1);
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v70 = v2;
          v3 = (void *)objc_msgSend(v2, "inputs", v45);
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v77, v108, 16);
          if (v4)
          {
            v5 = v4;
            v6 = *(_QWORD *)v78;
            v55 = *(_QWORD *)v78;
            v58 = v3;
            do
            {
              v7 = 0;
              v61 = v5;
              do
              {
                if (*(_QWORD *)v78 != v6)
                  objc_enumerationMutation(v3);
                v8 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v7);
                if (objc_msgSend(v8, "liveFormat", v46, v47))
                {
                  v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "connection"), "output");
                  v10 = objc_msgSend(v9, "liveFormat");
                  if (v9 && v10 == 0)
                  {
                    v76 = 0;
                    type = OS_LOG_TYPE_DEFAULT;
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    v13 = v76;
                    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                      v14 = v13;
                    else
                      v14 = v13 & 0xFFFFFFFE;
                    if (v14)
                    {
                      v66 = v64[54];
                      v68 = *((_QWORD *)v64 + 26);
                      v65 = objc_msgSend(v70, "nodeType");
                      v15 = objc_msgSend(v70, "nodeSubType");
                      v16 = objc_msgSend(v70, "name");
                      v17 = gr_logStringForInput(v8);
                      v18 = gr_logStringForOutput(v9, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "node"), "outputs"), "indexOfObject:", v9));
                      v85 = 136317442;
                      v86 = "-[BWGraph _logActiveNodesAfterGraphStopTimeout]";
                      v87 = 2048;
                      v88 = v64;
                      v89 = 1026;
                      v90 = v66;
                      v91 = 2114;
                      v92 = v68;
                      v93 = 2048;
                      v94 = v70;
                      v95 = 2112;
                      v96 = v65;
                      v97 = 2112;
                      v98 = v15;
                      v6 = v55;
                      v3 = v58;
                      v99 = 2114;
                      v100 = v16;
                      v101 = 2114;
                      v102 = v17;
                      v103 = 2114;
                      v104 = v18;
                      LODWORD(v47) = 98;
                      v46 = &v85;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    v5 = v61;
                  }
                }
                ++v7;
              }
              while (v5 != v7);
              v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v77, v108, 16);
            }
            while (v5);
          }
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v54 = (id)objc_msgSend(v70, "outputs", v46);
          v69 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
          if (v69)
          {
            v19 = 0;
            v67 = *(_QWORD *)v72;
            do
            {
              v20 = 0;
              v53 = v19;
              do
              {
                if (*(_QWORD *)v72 != v67)
                  objc_enumerationMutation(v54);
                v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v20);
                v22 = objc_msgSend(v21, "liveFormat", v45);
                v23 = objc_msgSend(v21, "indexOfInputWhichDrivesThisOutput");
                v24 = (void *)objc_msgSend((id)objc_msgSend(v21, "node"), "inputs");
                if ((v23 & 0x80000000) != 0 || (v25 = v24, objc_msgSend(v24, "count") <= (unint64_t)v23))
                {
                  if (!v22)
                    goto LABEL_53;
                  objc_opt_class();
                  v36 = &stru_1E4928818;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v37 = (void *)MEMORY[0x1E0CB3940];
                    v45 = (int *)objc_opt_class();
                    v36 = (const __CFString *)objc_msgSend(v37, "stringWithFormat:", CFSTR(" Possible bug in -[%@ stop:]."));
                  }
                  v76 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v39 = v76;
                  if (os_log_type_enabled(v38, type))
                    v40 = v39;
                  else
                    v40 = v39 & 0xFFFFFFFE;
                  if (v40)
                  {
                    v57 = v64[54];
                    v60 = *((_QWORD *)v64 + 26);
                    v63 = v36;
                    v41 = objc_msgSend(v70, "nodeType");
                    v42 = objc_msgSend(v70, "nodeSubType");
                    v43 = objc_msgSend(v70, "name");
                    v44 = gr_logStringForOutput(v21, v19 + v20);
                    v85 = 136317442;
                    v86 = "-[BWGraph _logActiveNodesAfterGraphStopTimeout]";
                    v87 = 2048;
                    v88 = v64;
                    v89 = 1026;
                    v90 = v57;
                    v91 = 2114;
                    v92 = v60;
                    v93 = 2048;
                    v94 = v70;
                    v19 = v53;
                    v95 = 2112;
                    v96 = v41;
                    v97 = 2112;
                    v98 = v42;
                    v99 = 2114;
                    v100 = v43;
                    v101 = 2114;
                    v102 = v44;
                    v103 = 2112;
                    v104 = (uint64_t)v63;
                    LODWORD(v47) = 98;
                    v45 = &v85;
LABEL_51:
                    _os_log_send_and_compose_impl();
                  }
LABEL_52:
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  goto LABEL_53;
                }
                v26 = (void *)objc_msgSend(v25, "objectAtIndexedSubscript:", v23);
                v27 = objc_msgSend(v26, "liveFormat");
                if (v22)
                  v28 = v27 == 0;
                else
                  v28 = 0;
                if (v28)
                {
                  v76 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v30 = v76;
                  if (os_log_type_enabled(v29, type))
                    v31 = v30;
                  else
                    v31 = v30 & 0xFFFFFFFE;
                  if (v31)
                  {
                    v59 = v64[54];
                    v62 = *((_QWORD *)v64 + 26);
                    v56 = objc_msgSend(v70, "nodeType");
                    v52 = objc_msgSend(v70, "nodeSubType");
                    v32 = objc_msgSend(v70, "name");
                    v33 = gr_logStringForInput(v26);
                    v34 = gr_logStringForOutput(v21, v19 + v20);
                    v35 = objc_opt_class();
                    v85 = 136317698;
                    v86 = "-[BWGraph _logActiveNodesAfterGraphStopTimeout]";
                    v87 = 2048;
                    v88 = v64;
                    v89 = 1026;
                    v90 = v59;
                    v91 = 2114;
                    v92 = v62;
                    v93 = 2048;
                    v94 = v70;
                    v95 = 2112;
                    v96 = v56;
                    v97 = 2112;
                    v98 = v52;
                    v99 = 2114;
                    v100 = v32;
                    v101 = 2114;
                    v102 = v33;
                    v103 = 2114;
                    v104 = v34;
                    v19 = v53;
                    v105 = 2112;
                    v106 = v35;
                    LODWORD(v47) = 108;
                    v45 = &v85;
                    goto LABEL_51;
                  }
                  goto LABEL_52;
                }
LABEL_53:
                ++v20;
              }
              while (v69 != v20);
              v19 = (v19 + v20);
              v69 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
            }
            while (v69);
          }
          v1 = v51 + 1;
        }
        while ((void *)(v51 + 1) != v50);
        result = (_DWORD *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v109, 16);
        v50 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_logActiveSinkNodesAfterGraphStopTimeout
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  int *v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  os_log_type_t type;
  unsigned int v37;
  int v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  const char *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v21 = result;
  if (result)
  {
    v37 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = *(id *)(v21 + 24);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v59, 16);
    v19 = result;
    if (result)
    {
      v18 = *(_QWORD *)v33;
      do
      {
        v2 = 0;
        do
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(obj);
          v20 = v2;
          v3 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v2);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v22 = (id)objc_msgSend(v3, "inputs", v15, v16);
          v4 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v58, 16);
          if (v4)
          {
            v5 = v4;
            v27 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v5; ++i)
              {
                if (*(_QWORD *)v29 != v27)
                  objc_enumerationMutation(v22);
                v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                if (objc_msgSend(v3, "isActive", v15, v16))
                {
                  v37 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v9 = v37;
                  if (os_log_type_enabled(v8, type))
                    v10 = v9;
                  else
                    v10 = v9 & 0xFFFFFFFE;
                  if (v10)
                  {
                    v25 = *(_DWORD *)(v21 + 216);
                    v26 = *(_QWORD *)(v21 + 208);
                    v24 = objc_msgSend(v3, "nodeSubType");
                    v23 = objc_msgSend(v3, "name");
                    v11 = objc_msgSend(v3, "currentStateDebugString");
                    v12 = gr_logStringForInput(v7);
                    v13 = objc_msgSend(v7, "liveFormat");
                    v38 = 136317442;
                    v14 = "live";
                    if (!v13)
                      v14 = "EOD";
                    v39 = "-[BWGraph _logActiveSinkNodesAfterGraphStopTimeout]";
                    v40 = 2048;
                    v41 = v21;
                    v42 = 1026;
                    v43 = v25;
                    v44 = 2114;
                    v45 = v26;
                    v46 = 2048;
                    v47 = v3;
                    v48 = 2112;
                    v49 = v24;
                    v50 = 2114;
                    v51 = v23;
                    v52 = 2114;
                    v53 = v11;
                    v54 = 2114;
                    v55 = v12;
                    v56 = 2080;
                    v57 = v14;
                    LODWORD(v16) = 98;
                    v15 = &v38;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
              }
              v5 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v58, 16);
            }
            while (v5);
          }
          v2 = v20 + 1;
        }
        while (v20 + 1 != v19);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v59, 16);
        v19 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_timedOutWaitingForOperationToCompleteWithDescription:(uint64_t)result
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    WriteStackshotReport();
    result = objc_msgSend(a2, "UTF8String");
    qword_1EE6BE4C8 = result;
    __break(1u);
  }
  return result;
}

- (BOOL)stopSources:(id *)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;

  if (self->_beingConfigured)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't stop running while in the middle of a begin/commit block"), 0));
  -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);

  self->_sourceNodesStartGroup = 0;
  self->_nonDeferredSourceNodesStartGroup = 0;
  self->_sinkNodesIdleGroupForParallelGraphRebuild = (OS_dispatch_group *)-[BWGraph _newDispatchGroupForSinksToTransitionToState:]((uint64_t)self, 0);
  v4 = dispatch_group_create();
  -[BWGraph _stopSourcesUsingDispatchGroup:]((uint64_t)self, v4);
  v5 = -[BWGraph _graphStateTransitionTimeout]((dispatch_time_t)self);
  v6 = dispatch_group_wait(v4, v5);

  if (v6)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWGraph _logActiveNodesAfterGraphStopTimeout](self);
    -[BWGraph _logActiveSinkNodesAfterGraphStopTimeout]((uint64_t)self);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timed out waiting for the capture graph to stop. Please file a radar against %s."), FigCaptureGetFrameworkRadarComponentName());
    -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:]((uint64_t)self, v8);
  }

  self->_sourceNodes = 0;
  self->_haveStartedOrCancelledDeferredSourceNodes = 0;
  self->_deferredNodePrepareCancelled = 0;
  return 1;
}

- (void)waitForNonDeferredSourceNodesToStart
{
  NSObject *nonDeferredSourceNodesStartGroup;

  nonDeferredSourceNodesStartGroup = self->_nonDeferredSourceNodesStartGroup;
  if (nonDeferredSourceNodesStartGroup)
    dispatch_group_wait(nonDeferredSourceNodesStartGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)_prepareNodesWithConfigurationChanges:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(void **)(a1 + 8);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v7, "hasNonLiveConfigurationChanges"))
            objc_msgSend(v7, "prepareForCurrentConfigurationToBecomeLive");
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }
  }
  return a1 != 0;
}

- (uint64_t)_makeParentConfigurationChangesLive
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = *(void **)(result + 8);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v7;
      while (2)
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v7 != v3)
            objc_enumerationMutation(v1);
          v5 = *(void **)(*((_QWORD *)&v6 + 1) + 8 * v4);
          if (objc_msgSend(v5, "hasNonLiveConfigurationChanges"))
            return objc_msgSend(v5, "makeCurrentConfigurationLive");
          ++v4;
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v2 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (NSObject)_newDispatchGroupForSinksToBecomeLiveWithConfigurationID:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = dispatch_group_create();
  v5 = objc_msgSend(*(id *)(a1 + 24), "count");
  if (v5)
  {
    v6 = v5;
    do
    {
      dispatch_group_enter(v4);
      --v6;
    }
    while (v6);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(void **)(a1 + 24);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __68__BWGraph__newDispatchGroupForSinksToBecomeLiveWithConfigurationID___block_invoke;
        v15[3] = &unk_1E4925CA8;
        v15[4] = v4;
        v15[5] = a2;
        objc_msgSend(v13, "notifyWhenConfigurationID:becomesLive:", a2, v15);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  return v4;
}

- (void)waitForStartOrCommitToComplete
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSMutableArray *sourceNodes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  os_log_type_t type;
  int v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_running)
  {
    if (dword_1ECFE98F0)
    {
      v16 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWGraph startDeferredNodePrepareIfNeededWithCompletionHandler:](self, "startDeferredNodePrepareIfNeededWithCompletionHandler:", 0, v9, v10);
    -[BWGraph startDeferredSourceNodesIfNeeded](self, "startDeferredSourceNodesIfNeeded");
    -[BWGraph _waitForSourceNodesToStart]((dispatch_time_t)self);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    sourceNodes = self->_sourceNodes;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sourceNodes, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(sourceNodes);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "makeOutputsLiveIfNeeded");
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sourceNodes, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      }
      while (v6);
    }
    -[BWGraph _waitForStartOrCommitToComplete]((dispatch_time_t)self);
  }
}

- (void)_waitForSourceNodesToStart
{
  NSObject *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  dispatch_time_t v4;
  void *v5;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 128);
    if (v2)
    {
      if (dword_1ECFE98F0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v2 = *(NSObject **)(a1 + 128);
      }
      v4 = -[BWGraph _graphStateTransitionTimeout](a1);
      if (dispatch_group_wait(v2, v4))
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timed out waiting for capture graph source nodes start to complete. Please file a radar against %s."), FigCaptureGetFrameworkRadarComponentName());
        -[BWGraph _timedOutWaitingForOperationToCompleteWithDescription:](a1, v5);
      }

      *(_QWORD *)(a1 + 128) = 0;
    }
  }
}

- (BOOL)supportsLiveReconfiguration
{
  return self->_supportsLiveReconfiguration;
}

- (id)dotString
{
  return 0;
}

- (id)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  NSString *v5;
  BOOL v6;

  v5 = (NSString *)objc_msgSend(a3, "copy");
  self->_clientApplicationID = v5;
  v6 = -[NSString isEqualToString:](v5, "isEqualToString:", 0x1E493D838)
    || -[NSString isEqualToString:](self->_clientApplicationID, "isEqualToString:", 0x1E493D538);
  self->_runningForContinuityCapture = v6;
}

- (int)clientPID
{
  return self->_clientPID;
}

- (id)modeDescription
{
  return self->_modeDescription;
}

- (id)sourceDescription
{
  return self->_sourceDescription;
}

- (id)_sourceNodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_sourceNodes);
}

- (id)_depthFirstEnumeratorWithVertexOrdering:(int)a3
{
  return -[BWDepthFirstEnumerator initWithGraph:vertexOrdering:]([BWDepthFirstEnumerator alloc], "initWithGraph:vertexOrdering:", self, *(_QWORD *)&a3);
}

- (id)_breadthFirstEnumerator
{
  return -[BWBreadthFirstEnumerator initWithGraph:]([BWBreadthFirstEnumerator alloc], "initWithGraph:", self);
}

- (id)_reverseBreadthFirstEnumerator
{
  return -[BWReverseBreadthFirstEnumerator initWithGraph:]([BWReverseBreadthFirstEnumerator alloc], "initWithGraph:", self);
}

void __56__BWGraph__newDispatchGroupForSinksToTransitionToState___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__BWGraph__newDispatchGroupForSinksToBecomeLiveWithConfigurationID___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __42__BWGraph__stopSourcesUsingDispatchGroup___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[29];

  v7[27] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  if (dword_1ECFE98F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = objc_msgSend(*(id *)(a1 + 40), "stop:", v7, v5, v6);
  if (v7[0] || dword_1ECFE98F0)
  {
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (BOOL)memoryAnalyticsReportingEnabled
{
  return self->_memoryAnalyticsReportingEnabled;
}

- (int)graphStateTransitionTimeoutSeconds
{
  return self->_graphStateTransitionTimeoutSeconds;
}

- (void)setGraphStateTransitionTimeoutSeconds:(int)a3
{
  self->_graphStateTransitionTimeoutSeconds = a3;
}

- (BOOL)resumesConnectionsAsNodesArePrepared
{
  return self->_resumesConnectionsAsNodesArePrepared;
}

- (void)_resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:.cold.1()
{
  __assert_rtn("-[BWGraph _resolveVideoRetainedBufferCountsForOutput:forAttachedMediaKey:outputsWithSharedPools:]", "BWGraph.m", 2126, "outputMediaProperites");
}

@end
