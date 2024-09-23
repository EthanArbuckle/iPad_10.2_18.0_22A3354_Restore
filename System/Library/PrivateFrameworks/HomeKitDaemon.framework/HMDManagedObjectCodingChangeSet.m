@implementation HMDManagedObjectCodingChangeSet

- (HMDManagedObjectCodingChangeSet)initWithCodingModel:(id)a3 context:(id)a4 changes:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD *);
  HMDManagedObjectCodingChangeSet *v11;
  id v12;
  NSMutableDictionary *v13;
  HMDManagedObjectCodingChangeSet *v14;
  NSMutableDictionary *changedObjects;
  NSMutableDictionary *v16;
  _QWORD v18[4];
  id v19;
  NSMutableDictionary *v20;
  HMDManagedObjectCodingChangeSet *v21;
  id v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD *))a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDManagedObjectCodingChangeSet;
  v11 = -[HMDManagedObjectCodingChangeSet init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_changes___block_invoke;
    v18[3] = &unk_24E78F7C8;
    v19 = v8;
    v13 = (NSMutableDictionary *)v12;
    v20 = v13;
    v14 = v11;
    v21 = v14;
    v22 = v9;
    v10[2](v10, v18);
    changedObjects = v14->_changedObjects;
    v14->_changedObjects = v13;
    v16 = v13;

  }
  return v11;
}

- (HMDManagedObjectCodingChangeSet)initWithCodingModel:(id)a3 context:(id)a4 transactions:(id)a5
{
  id v8;
  id v9;
  HMDManagedObjectCodingChangeSet *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke;
  v12[3] = &unk_24E78F840;
  v13 = v8;
  v9 = v8;
  v10 = -[HMDManagedObjectCodingChangeSet initWithCodingModel:context:changes:](self, "initWithCodingModel:context:changes:", a3, a4, v12);

  return v10;
}

- (BOOL)isEmpty
{
  return -[NSMutableDictionary count](self->_changedObjects, "count") == 0;
}

- (int64_t)changeScopeForObjectWithID:(id)a3 attributeKeys:(id *)a4 relationshipKeys:(id *)a5
{
  __CFString *v7;
  __CFString *v8;
  int64_t v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_changedObjects, "objectForKeyedSubscript:", a3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == CFSTR("<*>"))
  {
    v9 = 3;
  }
  else if (v7)
  {
    if (a4)
    {
      -[HMDManagedObjectCodingChangeDetails changedAttributeKeys]((uint64_t)v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      -[HMDManagedObjectCodingChangeDetails changedRelationshipKeys]((uint64_t)v8);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (HMDManagedObjectCodingChangeSetSummary)summary
{
  HMDManagedObjectCodingChangeSetSummary *summary;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *changedObjects;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMDManagedObjectCodingChangeSetSummary *v14;
  HMDManagedObjectCodingChangeSetSummary *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  HMDManagedObjectCodingChangeSet *v21;
  id v22;
  id v23;
  id v24;

  summary = self->_summary;
  if (!summary)
  {
    v4 = (void *)MEMORY[0x227676638]();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_changedObjects, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    changedObjects = self->_changedObjects;
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __42__HMDManagedObjectCodingChangeSet_summary__block_invoke;
    v20 = &unk_24E78F890;
    v21 = self;
    v22 = v7;
    v23 = v5;
    v24 = v6;
    v9 = v6;
    v10 = v5;
    v11 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](changedObjects, "enumerateKeysAndObjectsUsingBlock:", &v17);
    objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_, v17, v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", &stru_24E79DB48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[HMDManagedObjectCodingChangeSetSummary initWithShortDescriptionForChangeSet:insertedObjectNames:modifiedObjectPropertyNames:]([HMDManagedObjectCodingChangeSetSummary alloc], "initWithShortDescriptionForChangeSet:insertedObjectNames:modifiedObjectPropertyNames:", v13, v10, v9);
    v15 = self->_summary;
    self->_summary = v14;

    objc_autoreleasePoolPop(v4);
    summary = self->_summary;
  }
  return summary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_changedObjects, 0);
}

void __42__HMDManagedObjectCodingChangeSet_summary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "hmd_debugIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v6 == CFSTR("<*>"))
    {
      v33 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n<%@>: %@"), v7, CFSTR("<*>"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v34);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
    }
    else if (v6)
    {
      v36 = v5;
      v10 = (void *)MEMORY[0x24BDBCEB8];
      -[HMDManagedObjectCodingChangeDetails changedAttributeKeys]((uint64_t)v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      -[HMDManagedObjectCodingChangeDetails changedRelationshipKeys]((uint64_t)v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v13, "count") + v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDManagedObjectCodingChangeDetails changedAttributeKeys]((uint64_t)v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v16);

      -[HMDManagedObjectCodingChangeDetails changedRelationshipKeys]((uint64_t)v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v18);

      v19 = *(void **)(a1 + 40);
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v7;
      objc_msgSend(v20, "stringWithFormat:", CFSTR("\n<%@>: %@"), v7, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v22);

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = v14;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v38;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v38 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v9, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v27));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v28);

            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v25);
      }

      v7 = v35;
      v5 = v36;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v32;
      v44 = 2112;
      v45 = v7;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse object name from debug identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
  }

}

void __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[4];

  v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_2;
  v6[3] = &unk_24E78F818;
  v8 = v9;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

void __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "transactionNumber");
  objc_msgSend(v3, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_3;
  v5[3] = &unk_24E78F7F0;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);

}

uint64_t __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_changes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  __CFString *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  __CFString **v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v3 = a2;
  objc_msgSend(v3, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionForEntity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_16;
  v8 = objc_msgSend(v3, "changeType");
  switch(v8)
  {
    case 2:
      v9 = *(void **)(a1 + 40);
      v10 = 0;
      goto LABEL_7;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v17 != CFSTR("<*>"))
      {
        v11 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v3, "updatedProperties");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v7;
        if (v11)
        {
          v22 = 0;
          v23 = &v22;
          v24 = 0x2020000000;
          v25 = 0;
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __97__HMDManagedObjectCodingChangeSet_populateChangeDetails_withUpdatedProperties_codingDescription___block_invoke;
          v18[3] = &unk_24E78F868;
          v14 = v13;
          v20 = &v22;
          v21 = &v17;
          v19 = v14;
          objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
          v15 = *((unsigned __int8 *)v23 + 24);

          _Block_object_dispose(&v22, 8);
          if (!v15)
            goto LABEL_15;
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, v4);
          objc_msgSend(*(id *)(a1 + 32), "rootDescription");
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v16)
            goto LABEL_15;
          objc_msgSend(*(id *)(a1 + 56), "existingObjectWithID:error:", v4, 0);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (v12)
            -[HMDManagedObjectCodingChangeSet synthesizeParentChildChanges:forObject:withDescription:model:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40), v12, v14, *(void **)(a1 + 32));
        }
        else
        {

        }
      }
LABEL_15:

      break;
    case 0:
      v9 = *(void **)(a1 + 40);
      v10 = CFSTR("<*>");
LABEL_7:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v4);
      break;
  }
LABEL_16:

}

- (void)synthesizeParentChildChanges:(void *)a3 forObject:(void *)a4 withDescription:(void *)a5 model:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  HMDManagedObjectCodingChangeDetails *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v27 = a1;
  if (a1)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(a4, "parentRelationships");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v31)
    {
      v29 = v10;
      v30 = *(_QWORD *)v33;
      v28 = v12;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v33 != v30)
            objc_enumerationMutation(v12);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "valueForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = v11;
            objc_msgSend(v11, "descriptionForManagedObject:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "inverseRelationship");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "descriptionForRelationship:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "codingKey");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "objectID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v22);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v23 == CFSTR("<*>"))
            {
              v24 = (HMDManagedObjectCodingChangeDetails *)CFSTR("<*>");
            }
            else
            {
              v24 = (HMDManagedObjectCodingChangeDetails *)v23;
              if (v23)
              {
                -[HMDManagedObjectCodingChangeDetails addChangedRelationshipCodingKey:]((uint64_t)v23, v21);
              }
              else
              {
                v24 = objc_alloc_init(HMDManagedObjectCodingChangeDetails);
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, v22);
                -[HMDManagedObjectCodingChangeDetails addChangedRelationshipCodingKey:]((uint64_t)v24, v21);
                objc_msgSend(v17, "rootDescription");
                v25 = v9;
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18 != v26)
                  -[HMDManagedObjectCodingChangeSet synthesizeParentChildChanges:forObject:withDescription:model:](v27, v25, v16, v18, v17);
                v9 = v25;
                v12 = v28;
                v10 = v29;
              }
            }

            v11 = v17;
          }

        }
        v31 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v31);
    }

  }
}

void __97__HMDManagedObjectCodingChangeSet_populateChangeDetails_withUpdatedProperties_codingDescription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  HMDManagedObjectCodingChangeDetails *v5;
  void **v6;
  void *v7;
  uint64_t *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  HMDManagedObjectCodingChangeDetails *v14;
  void **v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "descriptionForAttribute:", v20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = **(_QWORD **)(a1 + 48);
      if (!v4)
      {
        v5 = objc_alloc_init(HMDManagedObjectCodingChangeDetails);
        v6 = *(void ***)(a1 + 48);
        v7 = *v6;
        *v6 = v5;

        v8 = *(uint64_t **)(a1 + 48);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        v4 = *v8;
      }
      objc_msgSend(v3, "codingKey");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v10 = *(void **)(v4 + 8);
        if (v10)
        {
          objc_msgSend(v10, "addObject:", v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v9);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(v4 + 8);
          *(_QWORD *)(v4 + 8) = v18;

        }
      }

LABEL_15:
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = v20;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "descriptionForRelationship:", v20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v13 = **(_QWORD **)(a1 + 48);
      if (!v13)
      {
        v14 = objc_alloc_init(HMDManagedObjectCodingChangeDetails);
        v15 = *(void ***)(a1 + 48);
        v16 = *v15;
        *v15 = v14;

        v17 = *(uint64_t **)(a1 + 48);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        v13 = *v17;
      }
      objc_msgSend(v3, "codingKey");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDManagedObjectCodingChangeDetails addChangedRelationshipCodingKey:](v13, v9);
      goto LABEL_15;
    }
LABEL_16:

    v12 = v20;
  }

}

@end
