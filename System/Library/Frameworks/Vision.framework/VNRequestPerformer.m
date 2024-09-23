@implementation VNRequestPerformer

- (void)_groupOrderedRequests:(id)a3 ordinality:(id)a4 ordinalityAndPriorityGroups:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(void *, id, id, id, void *, void *, uint64_t);
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD aBlock[5];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a4;
  v23 = a5;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "dependencyProcessingOrdinality");

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = objc_msgSend(v8, "count");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v25);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v25);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__VNRequestPerformer__groupOrderedRequests_ordinality_ordinalityAndPriorityGroups___block_invoke;
  aBlock[3] = &unk_1E4547A20;
  aBlock[4] = self;
  v21 = (void (**)(void *, id, id, id, void *, void *, uint64_t))_Block_copy(aBlock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v17, "dependencyProcessingOrdinality") == v10)
        {
          objc_msgSend(v11, "addObject:", v17);
        }
        else
        {
          v21[2](v21, v11, v22, v23, v12, v13, v10);
          v10 = objc_msgSend(v17, "dependencyProcessingOrdinality");
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v17, 0);

          v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v25);
          v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v25);

          v11 = (id)v18;
          v12 = (void *)v19;
          v13 = (void *)v20;
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v14);
  }

  v21[2](v21, v11, v22, v23, v12, v13, v10);
}

uint64_t __49__VNRequestPerformer_orderedRequestsForRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "dependencyProcessingOrdinality");
  v7 = objc_msgSend(v5, "dependencyProcessingOrdinality");
  if (v6 < v7)
    v8 = -1;
  else
    v8 = v6 != v7;

  return v8;
}

void __83__VNRequestPerformer__groupOrderedRequests_ordinality_ordinalityAndPriorityGroups___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_msgSend(*(id *)(a1 + 32), "_groupsRequestsWithTheSameOrdinality:priorityGroup1:priorityGroup2:", v13, v16, v17);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v13, v18);

  v21[0] = CFSTR("VNRequestPerformer_SameOrdinalityRequestsPriorityGroup1Key");
  v21[1] = CFSTR("VNRequestPerformer_SameOrdinalityRequestsPriorityGroup2Key");
  v22[0] = v16;
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v19, v20);

}

- (void)_groupsRequestsWithTheSameOrdinality:(id)a3 priorityGroup1:(id)a4 priorityGroup2:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (!v17)
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v17, "addObject:", v14);
        objc_msgSend(v9, "setObject:forKey:", v17, v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_3;
  v21[3] = &unk_1E4547AB0;
  v24 = &__block_literal_global_26912;
  v18 = v20;
  v22 = v18;
  v19 = v8;
  v23 = v19;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v21);

}

- (BOOL)_validateAndPrepareRequests:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
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
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "setResults:", 0, (_QWORD)v12);
        if ((objc_msgSend(v9, "validateConfigurationAndReturnError:", a4) & 1) == 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

uint64_t __62__VNRequestPerformer__performOrderedRequests_inContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "integerValue");
  if (v6 >= objc_msgSend(v5, "integerValue"))
  {
    v8 = objc_msgSend(v5, "integerValue");
    v7 = v8 < objc_msgSend(v4, "integerValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)dependencyAnalyzedRequestsForRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;

  v7 = a3;
  v8 = a4;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __88__VNRequestPerformer_dependencyAnalyzedRequestsForRequests_withPerformingContext_error___block_invoke;
  v29[3] = &unk_1E4547B40;
  v9 = v8;
  v30 = v9;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v7, "objectsAtIndexes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = (void *)objc_opt_class();
    v14 = v12;
    objc_msgSend(v13, "compoundRequestsForOriginalRequests:withPerformingContext:error:", v11, v9, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    if (!v15)
      goto LABEL_9;
    objc_msgSend(v14, "addObjectsFromArray:", v15);

    v17 = (void *)objc_opt_class();
    v16 = v14;
    objc_msgSend(v17, "compoundRequestsForOriginalRequests:withPerformingContext:error:", v11, v9, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_9;
    objc_msgSend(v16, "addObjectsFromArray:", v18);

    v19 = (void *)objc_opt_class();
    v16 = v16;
    objc_msgSend(v19, "compoundRequestsForOriginalRequests:withPerformingContext:error:", v11, v9, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_9;
    objc_msgSend(v16, "addObjectsFromArray:", v20);

    v21 = (void *)objc_opt_class();
    v16 = v16;
    objc_msgSend(v21, "compoundRequestsForOriginalRequests:withPerformingContext:error:", v11, v9, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_9;
    objc_msgSend(v16, "addObjectsFromArray:", v22);

    v23 = (void *)objc_opt_class();
    v16 = v16;
    objc_msgSend(v23, "compoundRequestsForOriginalRequests:withPerformingContext:error:", v11, v9, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_9;
    objc_msgSend(v16, "addObjectsFromArray:", v24);

    v25 = (void *)objc_opt_class();
    v16 = v16;
    objc_msgSend(v25, "compoundRequestsForOriginalRequests:withPerformingContext:error:", v11, v9, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v16, "addObjectsFromArray:", v26);

      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v16);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:

      v27 = 0;
    }

  }
  else
  {
    v27 = v7;
  }

  return v27;
}

BOOL __88__VNRequestPerformer_dependencyAnalyzedRequestsForRequests_withPerformingContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "cachedObservationsAcceptedByRequest:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)_performOrderedRequests:(id)a3 inContext:(id)a4 error:(id *)a5
{
  void *v5;
  os_unfair_lock_s *p_requestLock;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_group_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_group_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  int v41;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void (**v52)(void *, void *, id);
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  VNRequestPerformer *v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD aBlock[4];
  id v71;
  VNRequestPerformer *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v44 = a4;
  objc_msgSend(v44, "qosClass");
  p_requestLock = &self->_requestLock;
  os_unfair_lock_lock(&self->_requestLock);
  -[NSMutableArray addObjectsFromArray:](self->_requestsPending, "addObjectsFromArray:", v43);
  v60 = self;
  os_unfair_lock_unlock(&self->_requestLock);
  objc_msgSend(v44, "requestForensics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "count") == 1)
  {
    objc_msgSend(v43, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_requestLock);
    -[NSMutableArray removeObjectIdenticalTo:](self->_requestsPending, "removeObjectIdenticalTo:", v10);
    -[NSMutableArray addObject:](self->_requestsInFlight, "addObject:", v10);
    os_unfair_lock_unlock(&self->_requestLock);
    if (v9)
      objc_msgSend(v9, "performingRequest:", v10);
    LOBYTE(v11) = objc_msgSend(v10, "performInContext:error:", v44, a5);
    if ((v11 & 1) != 0)
    {
      os_unfair_lock_lock(p_requestLock);
      -[NSMutableArray removeObjectIdenticalTo:](v60->_requestsInFlight, "removeObjectIdenticalTo:", v10);
      os_unfair_lock_unlock(p_requestLock);
      if (v9)
        objc_msgSend(v9, "performedRequest:withError:", v10, *a5);
    }

    goto LABEL_44;
  }
  v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VNRequestPerformer _groupOrderedRequests:ordinality:ordinalityAndPriorityGroups:](self, "_groupOrderedRequests:ordinality:ordinalityAndPriorityGroups:", v43, v49);
  objc_msgSend(v49, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_38_26891);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VNRequestPerformer__performOrderedRequests_inContext_error___block_invoke_2;
  aBlock[3] = &unk_1E4547B18;
  v51 = v44;
  v71 = v51;
  v72 = v60;
  v52 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (!v14)
  {
    LOBYTE(v11) = 1;
    goto LABEL_43;
  }
  v11 = 1;
  v47 = *(_QWORD *)v67;
  while (2)
  {
    v15 = 0;
    v46 = v14;
    do
    {
      if (*(_QWORD *)v67 != v47)
        objc_enumerationMutation(obj);
      v53 = v15;
      v16 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v15);
      objc_msgSend(v49, "objectForKey:", v16);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKey:", v16);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("VNRequestPerformer_SameOrdinalityRequestsPriorityGroup1Key"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError VNAssert:log:](VNError, "VNAssert:log:", v58 != 0, CFSTR("Unexpected internal error"));
      v17 = dispatch_group_create();
      objc_msgSend((id)objc_opt_class(), "_requestPerformingQueuePriorityGroup1");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2](v52, v58, v51);
      LOBYTE(v16) = objc_msgSend(v57, "dispatchGroupWait:error:", v17, a5);

      if ((v16 & 1) == 0)
      {
        VNValidatedLog(4, (uint64_t)CFSTR("[VNRequestPerformer _performOrderedRequests:] timed out processing group 1 requests: %@"), v18, v19, v20, v21, v22, v23, (uint64_t)v58);
LABEL_36:
        v41 = 0;
        goto LABEL_37;
      }
      VNValidatedLog(1, (uint64_t)CFSTR("[VNRequestPerformer _performOrderedRequests:] finished processing group 1 requests: %@"), v18, v19, v20, v21, v22, v23, (uint64_t)v58);
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("VNRequestPerformer_SameOrdinalityRequestsPriorityGroup2Key"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError VNAssert:log:](VNError, "VNAssert:log:", v54 != 0, CFSTR("Unexpected internal error"));
      v24 = dispatch_group_create();
      objc_msgSend((id)objc_opt_class(), "_requestPerformingQueuePriorityGroup2");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2](v52, v54, v51);
      v25 = objc_msgSend(v50, "dispatchGroupWait:error:", v24, a5);

      if ((v25 & 1) == 0)
      {
        VNValidatedLog(4, (uint64_t)CFSTR("[VNRequestPerformer _performOrderedRequests:] timed out processing group 2 requests: %@"), v26, v27, v28, v29, v30, v31, (uint64_t)v54);

        goto LABEL_36;
      }
      VNValidatedLog(1, (uint64_t)CFSTR("[VNRequestPerformer _performOrderedRequests:] finished processing group 2 requests: %@"), v26, v27, v28, v29, v30, v31, (uint64_t)v54);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v59 = v55;
      v32 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v63 != v33)
              objc_enumerationMutation(v59);
            v35 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            if (v9)
              objc_msgSend(v9, "performingRequest:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
            os_unfair_lock_lock(p_requestLock);
            -[NSMutableArray removeObjectIdenticalTo:](v60->_requestsInFlight, "removeObjectIdenticalTo:", v35);
            os_unfair_lock_unlock(p_requestLock);
            objc_msgSend(v35, "asyncStatus");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v9)
            {
              v38 = objc_msgSend(v36, "completed");
              if ((v38 & 1) != 0)
              {
                v39 = 0;
              }
              else
              {
                objc_msgSend(v37, "error");
                v5 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v5;
              }
              objc_msgSend(v9, "performedRequest:withError:", v35, v39);
              if ((v38 & 1) == 0)

            }
            v40 = objc_msgSend(v37, "completed") | v11 ^ 1;
            v11 &= v40;
            if ((v40 & 1) == 0 && a5)
            {
              objc_msgSend(v37, "error");
              v11 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v35, "resetAsyncStatus");

          }
          v32 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        }
        while (v32);
      }

      v41 = 1;
LABEL_37:

      if (!v41)
      {
        LOBYTE(v11) = 0;
        goto LABEL_43;
      }
      v15 = v53 + 1;
    }
    while (v53 + 1 != v46);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v14)
      continue;
    break;
  }
LABEL_43:

LABEL_44:
  return v11 & 1;
}

void __62__VNRequestPerformer__performOrderedRequests_inContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(*(id *)(a1 + 32), "qosClass");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v11;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v23);
        if ((a6 & 1) == 0)
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "cancel");
        VNValidatedLog(1, (uint64_t)CFSTR("[VNRequestPerformer -performRequestsAsync]: scheduling processing of request: %@"), v15, v16, v17, v18, v19, v20, (uint64_t)v24);
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectIdenticalTo:", v24);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v24);
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
        objc_msgSend(v24, "performInContextAsync:asyncDispatchQueue:asyncDispatchGroup:", v12, v13, v14);
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v21);
  }

}

+ (id)_requestPerformingQueuePriorityGroup1
{
  void *v2;
  void *v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VNRequestPerformer__requestPerformingQueuePriorityGroup1__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::onceToken != -1)
    dispatch_once(&+[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::onceToken, block);
  +[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache](VNRequestPerformingPriorityGroup1AsyncTasksQueueCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueWithUniqueAppendix:", +[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::className);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_requestPerformingQueuePriorityGroup2
{
  void *v2;
  void *v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VNRequestPerformer__requestPerformingQueuePriorityGroup2__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::onceToken != -1)
    dispatch_once(&+[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::onceToken, block);
  +[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache](VNRequestPerformingPriorityGroup2AsyncTasksQueueCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueWithUniqueAppendix:", +[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::className);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)performRequests:(id)a3 inContext:(id)a4 error:(id *)a5
{
  return -[VNRequestPerformer _performRequests:onBehalfOfRequest:inContext:error:](self, "_performRequests:onBehalfOfRequest:inContext:error:", a3, 0, a4, a5);
}

- (BOOL)_performRequests:(id)a3 onBehalfOfRequest:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "qosClass");
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v12, "serialNumber");
    if (v11)
      objc_msgSend((id)objc_opt_class(), "VNClassCode");
    kdebug_trace();
    -[VNRequestPerformer dependencyAnalyzedRequestsForRequests:withPerformingContext:error:](self, "dependencyAnalyzedRequestsForRequests:withPerformingContext:error:", v10, v12, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      && -[VNRequestPerformer _validateAndPrepareRequests:error:](self, "_validateAndPrepareRequests:error:", v14, a6))
    {
      -[VNRequestPerformer orderedRequestsForRequests:](self, "orderedRequestsForRequests:", v14);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "requestForensics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = (void *)v19;
      if (v15)
      {
        v17 = (void *)v19;
        if (v11)
          objc_msgSend(v15, "performingOrderedDependentRequests:onBehalfOfRequest:", v19, v11);
        else
          objc_msgSend(v15, "setOrderedRequests:", v19);
      }
      v13 = -[VNRequestPerformer _performOrderedRequests:inContext:error:](self, "_performOrderedRequests:inContext:error:", v17, v12, a6);

    }
    else
    {
      v13 = 0;
    }

    kdebug_trace();
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)orderedRequestsForRequests:(id)a3
{
  objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_61);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VNRequestPerformer)init
{
  VNRequestPerformer *v2;
  VNRequestPerformer *v3;
  NSMutableArray *v4;
  NSMutableArray *requestsPending;
  NSMutableArray *v6;
  NSMutableArray *requestsInFlight;
  NSMutableSet *v8;
  NSMutableSet *trackersInFlight;
  NSMutableDictionary *v10;
  NSMutableDictionary *sequencedRequestObservations;
  VNRequestPerformer *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VNRequestPerformer;
  v2 = -[VNRequestPerformer init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_requestLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestsPending = v3->_requestsPending;
    v3->_requestsPending = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestsInFlight = v3->_requestsInFlight;
    v3->_requestsInFlight = v6;

    v3->_trackersInFlightLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    trackersInFlight = v3->_trackersInFlight;
    v3->_trackersInFlight = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sequencedRequestObservations = v3->_sequencedRequestObservations;
    v3->_sequencedRequestObservations = v10;

    v12 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequencedRequestObservations, 0);
  objc_storeStrong((id *)&self->_trackersInFlight, 0);
  objc_storeStrong((id *)&self->_requestsPending, 0);
  objc_storeStrong((id *)&self->_requestsInFlight, 0);
}

void __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_2(_QWORD *a1, void *a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v12;

  v12 = a2;
  v7 = objc_msgSend(v12, "resolvedRevision");
  if (v7 == a1[7])
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
    *a4 = 1;
  }
  else
  {
    if (v7 <= 0xDECAEFFF)
      v8 = a1[5];
    else
      v8 = a1[6];
    v9 = *(_QWORD *)(v8 + 8);
    v10 = *(_QWORD *)(v9 + 24);
    if (v10 < a3 || v10 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = a3;
    *(_QWORD *)(v9 + 24) = v10;
  }

}

void __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v5 = a3;
  while (objc_msgSend(v5, "count"))
  {
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    objc_msgSend(v5, "removeObjectAtIndex:", v6);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "willAcceptCachedResultsFromRequestWithConfiguration:", v9))
            objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v8);
    objc_msgSend(v10, "removeObjectsInArray:", v8);

  }
}

uint64_t __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "defaultRevision");

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_2;
  v8[3] = &unk_1E4547A88;
  v8[4] = &v17;
  v8[5] = &v13;
  v8[6] = &v9;
  v8[7] = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v8);
  v5 = v18[3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v14[3];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v5 = v10[3];
    v18[3] = v5;
  }
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v5 != 0x7FFFFFFFFFFFFFFFLL, CFSTR("Internal error while sorting requests"));
  v6 = v18[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (BOOL)performDependentRequests:(id)a3 onBehalfOfRequest:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v20 = v10;
  v12 = -[VNRequestPerformer _performRequests:onBehalfOfRequest:inContext:error:](self, "_performRequests:onBehalfOfRequest:inContext:error:", v10, v11, a5, a6);
  if (v12)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
      v16 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "warnings");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v16;
          v21[1] = 3221225472;
          v21[2] = __81__VNRequestPerformer_performDependentRequests_onBehalfOfRequest_inContext_error___block_invoke;
          v21[3] = &unk_1E45489E0;
          v22 = v11;
          objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v21);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

  }
  return v12;
}

- (void)recordSequencedObservationsForRequest:(id)a3
{
  void *v4;
  NSMutableDictionary *sequencedRequestObservations;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "wantsSequencedRequestObservationsRecording"))
  {
    objc_msgSend(v7, "sequencedRequestPreviousObservationsKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      sequencedRequestObservations = self->_sequencedRequestObservations;
      objc_msgSend(v7, "results");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](sequencedRequestObservations, "setObject:forKey:", v6, v4);

    }
  }

}

- (id)previousSequencedObservationsForRequest:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "sequencedRequestPreviousObservationsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sequencedRequestObservations, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recordTracker:(id)a3
{
  VNWeakTypeWrapper *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_trackersInFlightLock);
  v4 = -[VNWeakTypeWrapper initWithObject:]([VNWeakTypeWrapper alloc], "initWithObject:", v5);
  -[NSMutableSet addObject:](self->_trackersInFlight, "addObject:", v4);
  os_unfair_lock_unlock(&self->_trackersInFlightLock);

}

- (id)getCurrentTrackersAndReset
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock(&self->_trackersInFlightLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_trackersInFlight;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "objectAndReturnError:", 0, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_trackersInFlight, "removeAllObjects");
  os_unfair_lock_unlock(&self->_trackersInFlightLock);
  return v3;
}

- (void)cancelAllRequests
{
  void *v3;
  os_unfair_lock_s *p_requestLock;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1B0B060](self, a2);
  p_requestLock = &self->_requestLock;
  os_unfair_lock_lock(&self->_requestLock);
  v5 = (void *)-[NSMutableArray copy](self->_requestsInFlight, "copy");
  os_unfair_lock_unlock(p_requestLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __39__VNRequestPerformer_cancelAllRequests__block_invoke;
        v12[3] = &unk_1E4547B88;
        v12[4] = v11;
        VNExecuteBlock(v12, 0);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(v3);
}

uint64_t __39__VNRequestPerformer_cancelAllRequests__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return 1;
}

uint64_t __81__VNRequestPerformer_performDependentRequests_onBehalfOfRequest_inContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordWarning:value:", a2, a3);
}

void __59__VNRequestPerformer__requestPerformingQueuePriorityGroup2__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  NSStringFromClass(*(Class *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::className;
  +[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::className = v1;

}

void __59__VNRequestPerformer__requestPerformingQueuePriorityGroup1__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  NSStringFromClass(*(Class *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::className;
  +[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::className = v1;

}

@end
