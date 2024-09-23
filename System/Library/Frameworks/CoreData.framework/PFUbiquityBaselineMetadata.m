@implementation PFUbiquityBaselineMetadata

- (PFUbiquityBaselineMetadata)init
{
  PFUbiquityBaselineMetadata *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineMetadata;
  result = -[PFUbiquityBaselineMetadata init](&v3, sel_init);
  if (result)
  {
    result->_storeName = 0;
    result->_authorPeerID = 0;
    result->_modelVersionHash = 0;
    result->_kv = 0;
    result->_peerRanges = 0;
    result->_pKV = 0;
  }
  return result;
}

- (PFUbiquityBaselineMetadata)initWithLocalPeerID:(id)a3 storeName:(id)a4 modelVersionHash:(id)a5 andUbiquityRootLocation:(id)a6
{
  PFUbiquityBaselineMetadata *v9;

  v9 = -[PFUbiquityBaselineMetadata init](self, "init", a3, a4, a5, a6);
  if (v9)
  {
    v9->_storeName = (NSString *)a4;
    v9->_authorPeerID = (NSString *)a3;
    v9->_modelVersionHash = (NSString *)a5;
    v9->_kv = 0;
    v9->_peerRanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->_storeName = 0;
  self->_authorPeerID = 0;

  self->_modelVersionHash = 0;
  self->_pKV = 0;

  self->_kv = 0;
  self->_peerRanges = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineMetadata;
  -[PFUbiquityBaselineMetadata dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSString *storeName;
  NSString *authorPeerID;
  NSString *modelVersionHash;
  PFUbiquityKnowledgeVector *kv;
  NSMutableDictionary *peerRanges;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PFUbiquityBaselineMetadata;
  v4 = -[PFUbiquityBaselineMetadata description](&v11, sel_description);
  if (self)
  {
    storeName = self->_storeName;
    authorPeerID = self->_authorPeerID;
    modelVersionHash = self->_modelVersionHash;
    kv = self->_kv;
    peerRanges = self->_peerRanges;
  }
  else
  {
    kv = 0;
    authorPeerID = 0;
    storeName = 0;
    modelVersionHash = 0;
    peerRanges = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tstoreName: %@\n\tauthorPeerID: %@\n\tmodelVersionHash: %@\n\tknowledgeVector: %@\n\tpeerRanges: %@\n"), v4, storeName, authorPeerID, modelVersionHash, kv, peerRanges);
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  int v6;
  NSString *storeName;
  void *v8;
  NSString *authorPeerID;
  void *v10;
  NSString *modelVersionHash;
  uint64_t v12;
  PFUbiquityKnowledgeVector *kv;
  void *v14;
  NSMutableDictionary *peerRanges;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_35;
  if (a3)
    v5 = (void *)*((_QWORD *)a3 + 1);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "isNSString");
  if (v6)
  {
    if (self)
    {
      storeName = self->_storeName;
      if (a3)
      {
LABEL_7:
        v6 = -[NSString isEqualToString:](storeName, "isEqualToString:", *((_QWORD *)a3 + 1));
        if (!v6)
          return v6;
        v8 = (void *)*((_QWORD *)a3 + 2);
        goto LABEL_9;
      }
    }
    else
    {
      storeName = 0;
      if (a3)
        goto LABEL_7;
    }
    v17 = -[NSString isEqualToString:](storeName, "isEqualToString:", 0);
    v8 = 0;
    if (!v17)
      goto LABEL_35;
LABEL_9:
    v6 = objc_msgSend(v8, "isNSString");
    if (!v6)
      return v6;
    if (self)
    {
      authorPeerID = self->_authorPeerID;
      if (a3)
      {
LABEL_12:
        v6 = -[NSString isEqualToString:](authorPeerID, "isEqualToString:", *((_QWORD *)a3 + 2));
        if (!v6)
          return v6;
        v10 = (void *)*((_QWORD *)a3 + 3);
        goto LABEL_14;
      }
    }
    else
    {
      authorPeerID = 0;
      if (a3)
        goto LABEL_12;
    }
    v18 = -[NSString isEqualToString:](authorPeerID, "isEqualToString:", 0);
    v10 = 0;
    if (!v18)
      goto LABEL_35;
LABEL_14:
    v6 = objc_msgSend(v10, "isNSString");
    if (!v6)
      return v6;
    if (self)
    {
      modelVersionHash = self->_modelVersionHash;
      if (a3)
      {
LABEL_17:
        v12 = *((_QWORD *)a3 + 3);
LABEL_18:
        v6 = -[NSString isEqualToString:](modelVersionHash, "isEqualToString:", v12);
        if (!v6)
          return v6;
        if (self)
        {
          kv = self->_kv;
          if (a3)
          {
LABEL_21:
            v6 = -[PFUbiquityKnowledgeVector isEqual:](kv, "isEqual:", *((_QWORD *)a3 + 6));
            if (!v6)
              return v6;
            v14 = (void *)*((_QWORD *)a3 + 7);
LABEL_23:
            v6 = objc_msgSend(v14, "isNSDictionary");
            if (!v6)
              return v6;
            if (self)
            {
              peerRanges = self->_peerRanges;
              if (a3)
              {
LABEL_26:
                v16 = *((_QWORD *)a3 + 7);
LABEL_27:
                v6 = -[NSMutableDictionary isEqualToDictionary:](peerRanges, "isEqualToDictionary:", v16);
                if (v6)
                {
                  LOBYTE(v6) = 1;
                  if (a3)
                  {
                    if (self->_pKV && *((_QWORD *)a3 + 5))
                      LOBYTE(v6) = -[PFUbiquityKnowledgeVector isEqual:](self->_pKV, "isEqual:");
                  }
                }
                return v6;
              }
            }
            else
            {
              peerRanges = 0;
              if (a3)
                goto LABEL_26;
            }
            v16 = 0;
            goto LABEL_27;
          }
        }
        else
        {
          kv = 0;
          if (a3)
            goto LABEL_21;
        }
        v19 = -[PFUbiquityKnowledgeVector isEqual:](kv, "isEqual:", 0);
        v14 = 0;
        if (v19)
          goto LABEL_23;
LABEL_35:
        LOBYTE(v6) = 0;
        return v6;
      }
    }
    else
    {
      modelVersionHash = 0;
      if (a3)
        goto LABEL_17;
    }
    v12 = 0;
    goto LABEL_18;
  }
  return v6;
}

- (uint64_t)gatherMetadataWithStore:(uint64_t)a3 andError:
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v43;
  id v44;
  void *v45;
  id obj;
  _QWORD v47[7];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[9];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  uint64_t v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v43 = a3;
  v3 = a1;
  v77 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v3;
  v4 = a2;
  v5 = (id)objc_msgSend(a2, "persistentStoreCoordinator");
  v69 = 0;
  v70 = &v69;
  v71 = 0x3052000000;
  v72 = __Block_byref_object_copy__48;
  v73 = __Block_byref_object_dispose__48;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3052000000;
  v66 = __Block_byref_object_copy__48;
  v67 = __Block_byref_object_dispose__48;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3052000000;
  v60 = __Block_byref_object_copy__48;
  v61 = __Block_byref_object_dispose__48;
  v62 = 0;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke;
  v56[3] = &unk_1E1EDFAD8;
  v56[4] = v4;
  v56[5] = v3;
  v56[6] = &v63;
  v56[7] = &v57;
  v56[8] = &v69;
  v44 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v56);
  v6 = objc_alloc(MEMORY[0x1E0C99E20]);
  v7 = (void *)objc_msgSend(v6, "initWithArray:", objc_msgSend((id)v58[5], "allKeys"));
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend((id)v70[5], "count"))
    goto LABEL_54;
  objc_msgSend((id)v70[5], "sortUsingComparator:", &__block_literal_global_32);
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  v52 = 0u;
  obj = (id)v70[5];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
  if (!v9)
    goto LABEL_54;
  v45 = v4;
  v10 = 0;
  v11 = *(_QWORD *)v53;
  do
  {
    v12 = 0;
    v13 = v10;
    do
    {
      if (*(_QWORD *)v53 != v11)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v12);
      if (v10)
        v14 = *(_QWORD *)(v10 + 16);
      else
        v14 = 0;
      objc_msgSend(v7, "removeObject:", v14);
      if (v13)
      {
        if (v10)
          v15 = *(void **)(v10 + 16);
        else
          v15 = 0;
        if ((objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(v13 + 16)) & 1) != 0)
        {
          if (v10)
            v16 = *(void **)(v10 + 24);
          else
            v16 = 0;
          v17 = objc_msgSend(v16, "integerValue");
          v18 = objc_msgSend(*(id *)(v13 + 32), "integerValue");
          if (v17 > v18)
          {
            if (v17 - v18 == 1)
              goto LABEL_34;
            v19 = objc_msgSend(*(id *)(v13 + 32), "integerValue");
            if (v10)
              v20 = *(void **)(v10 + 24);
            else
              v20 = 0;
            v21 = objc_msgSend(v20, "integerValue");
            if (v10)
              v22 = *(_QWORD *)(v10 + 16);
            else
              v22 = 0;
            v23 = (void *)objc_msgSend((id)v3, "createNewLocalRangeWithRangeStart:andRangeEnd:forEntityNamed:", v19 + 1, v21 - 1, v22);
            objc_msgSend(v8, "addObject:", v23);
            goto LABEL_33;
          }
          if (v10)
            v31 = *(void **)(v10 + 24);
          else
            v31 = 0;
          if (objc_msgSend(v31, "integerValue") >= 1
            && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got a bad gap for range: %@\nPrevious range: %@\nStore: %@"), "-[PFUbiquityBaselineMetadata gatherMetadataWithStore:andError:]", 219, v10, v13, v45, v43);
          }
          goto LABEL_34;
        }
        v24 = (void *)objc_msgSend((id)v58[5], "objectForKey:", *(_QWORD *)(v13 + 16));
        v25 = objc_msgSend(v24, "integerValue");
        if (v25 > objc_msgSend(*(id *)(v13 + 32), "integerValue"))
        {
          v26 = (void *)objc_msgSend((id)v3, "createNewLocalRangeWithRangeStart:andRangeEnd:forEntityNamed:", objc_msgSend(*(id *)(v13 + 32), "integerValue") + 1, objc_msgSend(v24, "integerValue"), *(_QWORD *)(v13 + 16));
          objc_msgSend(v8, "addObject:", v26);

        }
      }
      if (v10)
        v27 = *(void **)(v10 + 24);
      else
        v27 = 0;
      if (objc_msgSend(v27, "integerValue") >= 2)
      {
        if (v10)
          v28 = *(void **)(v10 + 24);
        else
          v28 = 0;
        v29 = objc_msgSend(v28, "integerValue");
        if (v10)
          v30 = *(_QWORD *)(v10 + 16);
        else
          v30 = 0;
        v23 = (void *)objc_msgSend((id)v3, "createNewLocalRangeWithRangeStart:andRangeEnd:forEntityNamed:", 1, v29 - 1, v30);
        objc_msgSend(v8, "addObject:", v23);
LABEL_33:

      }
LABEL_34:
      objc_msgSend((id)v3, "addDictionaryForPeerRange:", v10);
      ++v12;
      v13 = v10;
    }
    while (v9 != v12);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
    v9 = v32;
  }
  while (v32);
  v4 = v45;
  if (v10)
  {
    v33 = (void *)objc_msgSend((id)v58[5], "objectForKey:", *(_QWORD *)(v10 + 16));
    v34 = objc_msgSend(v33, "integerValue");
    if (v34 > objc_msgSend(*(id *)(v10 + 32), "integerValue"))
    {
      v35 = (void *)objc_msgSend((id)v3, "createNewLocalRangeWithRangeStart:andRangeEnd:forEntityNamed:", objc_msgSend(*(id *)(v10 + 32), "integerValue") + 1, objc_msgSend(v33, "integerValue"), *(_QWORD *)(v10 + 16));
      objc_msgSend(v8, "addObject:", v35);

    }
  }
LABEL_54:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v75, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(v7);
        v39 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        v40 = objc_msgSend((id)objc_msgSend((id)v58[5], "objectForKey:", v39), "unsignedIntegerValue");
        if (v40)
        {
          v41 = (void *)objc_msgSend((id)v3, "createNewLocalRangeWithRangeStart:andRangeEnd:forEntityNamed:", 1, v40, v39);
          objc_msgSend(v8, "addObject:", v41);

        }
      }
      v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v75, 16);
    }
    while (v36);
  }
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke_3;
  v47[3] = &unk_1E1EDD790;
  v47[4] = v8;
  v47[5] = v4;
  v47[6] = v3;
  objc_msgSend(v44, "performBlockAndWait:", v47);
  v3 = 1;

  v58[5] = 0;
  v70[5] = 0;

  v64[5] = 0;
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  return v3;
}

void __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32));

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithStoreKnowledgeVectorDictionary:", v2);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_msgSend(*(id *)(a1 + 32), "model");
  if (v4)
    v5 = *(_QWORD *)(v4 + 40);
  else
    v5 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(v3, "initWithArray:", v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "createMapOfEntityNameToPKMaxForEntities:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", -[NSSQLCore allPeerRanges](*(void **)(a1 + 32)), 0);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
}

uint64_t __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;

  if (a2)
  {
    v5 = *(void **)(a2 + 16);
    if (a3)
    {
LABEL_3:
      v6 = *(_QWORD *)(a3 + 16);
      goto LABEL_4;
    }
  }
  else
  {
    v5 = 0;
    if (a3)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_4:
  result = objc_msgSend(v5, "compare:", v6);
  if (result)
    return result;
  if (!a2)
  {
    v8 = 0;
    if (a3)
      goto LABEL_7;
LABEL_12:
    v9 = 0;
    return objc_msgSend(v8, "compare:", v9);
  }
  v8 = *(void **)(a2 + 24);
  if (!a3)
    goto LABEL_12;
LABEL_7:
  v9 = *(_QWORD *)(a3 + 24);
  return objc_msgSend(v8, "compare:", v9);
}

uint64_t __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t result;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        -[NSSQLCore addPeerRange:](*(_QWORD *)(a1 + 40), v7);
        objc_msgSend(*(id *)(a1 + 48), "addDictionaryForPeerRange:", v7);
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (PFUbiquityBaselineMetadata)initWithCoder:(id)a3
{
  PFUbiquityBaselineMetadata *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PFUbiquityKnowledgeVector *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = -[PFUbiquityBaselineMetadata init](self, "init");
  if (v4)
  {
    v4->_storeName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeName"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_authorPeerID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("authorPeerID"));
    v4->_modelVersionHash = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelVersionHash"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), CFSTR("peerStates"));
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v11, "isNSDictionary"))
      {
        v13 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorDictionary:", v12);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Not sure what to do with baseline metadata knowledge vector object: %@"), "-[PFUbiquityBaselineMetadata initWithCoder:]", 324, v12);
          goto LABEL_8;
        }
        v13 = v12;
      }
      v4->_kv = v13;
    }
LABEL_8:
    v4->_pKV = (PFUbiquityKnowledgeVector *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousKnowledgeVector"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v4->_peerRanges = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0), CFSTR("peerRanges"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *peerRanges;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_storeName, CFSTR("storeName"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_authorPeerID, CFSTR("authorPeerID"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_modelVersionHash, CFSTR("modelVersionHash"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_kv, CFSTR("peerStates"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_pKV, CFSTR("previousKnowledgeVector"));
    peerRanges = self->_peerRanges;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("storeName"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("authorPeerID"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("modelVersionHash"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("peerStates"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("previousKnowledgeVector"));
    peerRanges = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", peerRanges, CFSTR("peerRanges"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)setPreviousKnowledgeVectorFromCurrentMetadata:(id *)result
{
  id *v3;
  void *v4;

  if (result)
  {
    v3 = result;

    if (a2)
      v4 = *(void **)(a2 + 48);
    else
      v4 = 0;
    result = v4;
    v3[5] = result;
  }
  return result;
}

- (id)_migrateToModelVersionHash:(id *)result
{
  id *v3;

  if (result)
  {
    v3 = result;

    result = a2;
    v3[3] = result;
  }
  return result;
}

- (id)createPeerRangeDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "setValue:forKey:", *((_QWORD *)a3 + 5), CFSTR("peerStart"));
    objc_msgSend(v5, "setValue:forKey:", *((_QWORD *)a3 + 6), CFSTR("peerEnd"));
    objc_msgSend(v5, "setValue:forKey:", *((_QWORD *)a3 + 3), CFSTR("rangeEnd"));
    objc_msgSend(v5, "setValue:forKey:", *((_QWORD *)a3 + 4), CFSTR("rangeStart"));
    v6 = *((_QWORD *)a3 + 2);
  }
  else
  {
    objc_msgSend(v4, "setValue:forKey:", 0, CFSTR("peerStart"));
    objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("peerEnd"));
    objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("rangeEnd"));
    objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("rangeStart"));
    v6 = 0;
  }
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("entityName"));
  return v5;
}

- (void)addDictionaryForPeerRange:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = -[PFUbiquityBaselineMetadata createPeerRangeDictionary:](self, "createPeerRangeDictionary:");
  if (a3)
    v5 = *((_QWORD *)a3 + 1);
  else
    v5 = 0;
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_peerRanges, "objectForKey:", v5);
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3)
      v7 = *((_QWORD *)a3 + 1);
    else
      v7 = 0;
    -[NSMutableDictionary setObject:forKey:](self->_peerRanges, "setObject:forKey:", v6, v7);

  }
  objc_msgSend(v6, "addObject:", v8);

}

- (id)createNewLocalRangeWithRangeStart:(unint64_t)a3 andRangeEnd:(unint64_t)a4 forEntityNamed:(id)a5
{
  void *v8;
  void *v9;
  PFUbiquitySQLCorePeerRange *v10;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  v10 = -[PFUbiquitySQLCorePeerRange initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:]([PFUbiquitySQLCorePeerRange alloc], "initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:", self->_authorPeerID, a5, v8, v9, v8, v9);

  return v10;
}

@end
