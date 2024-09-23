@implementation NSPersistentHistoryResult

- (void)dealloc
{
  objc_super v3;

  self->_aggregatedResult = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentHistoryResult;
  -[NSPersistentHistoryResult dealloc](&v3, sel_dealloc);
}

+ (id)_processResult:(id)a3 forRequest:(id)a4 withProvider:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _PFBatchHistoryFaultingArray *v26;
  NSPersistentHistoryResult *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t i;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _NSPersistentHistoryTransaction *v39;
  uint64_t v40;
  void *v41;
  _NSPersistentHistoryChange *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
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
  _BYTE v73[128];
  _BYTE v74[128];
  _QWORD v75[3];
  _QWORD v76[3];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x18D76B4E4](a1, a2);
  if (objc_msgSend(a4, "resultType") == 2 || objc_msgSend(a4, "resultType") == 6 || !objc_msgSend(a4, "resultType"))
  {
    v26 = (_PFBatchHistoryFaultingArray *)objc_msgSend(a3, "firstObject");
LABEL_22:
    a3 = v26;
    goto LABEL_23;
  }
  if (objc_msgSend(a4, "resultType") != 1)
  {
    if (!objc_msgSend(a3, "isNSArray"))
    {
      a3 = 0;
      goto LABEL_23;
    }
    if (objc_msgSend(a4, "fetchBatchSize"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(a3, "description");
        goto LABEL_23;
      }
      v26 = -[_PFBatchHistoryFaultingArray initWithPFBatchFaultingArray:]([_PFBatchHistoryFaultingArray alloc], "initWithPFBatchFaultingArray:", a3);
      goto LABEL_22;
    }
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(a4, "resultType") == 5 && objc_msgSend(a3, "count") == 2)
    {
      v30 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
      v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v57 = v30;
      v60 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v60)
      {
        v55 = v29;
        v50 = a4;
        v52 = v8;
        v33 = 0;
        obj = *(id *)v66;
        do
        {
          for (i = 0; i != v60; ++i)
          {
            v35 = v33;
            if (*(id *)v66 != obj)
              objc_enumerationMutation(v57);
            v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            v37 = (void *)MEMORY[0x18D76B4E4]();
            v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v39 = +[NSPersistentHistoryResult _transactionFromResult:withChanges:]((uint64_t)NSPersistentHistoryResult, v36, v38);
            v40 = -[_NSPersistentHistoryTransaction transactionNumber](v39, "transactionNumber");
            if (objc_msgSend(v31, "count") > (unint64_t)v33)
            {
              v33 = v33;
              while (1)
              {
                v41 = (void *)objc_msgSend(v31, "objectAtIndexedSubscript:", v33);
                if (objc_msgSend((id)objc_msgSend(v41, "objectForKey:", CFSTR("TRANSACTIONID")), "_referenceData64") != v40)
                  break;
                v42 = +[NSPersistentHistoryResult _changeFromResult:withTransaction:]((uint64_t)NSPersistentHistoryResult, v41, (uint64_t)v39);
                objc_msgSend(v38, "addObject:", v42);

                v33 = (v35 + 1);
                v35 = v33;
                if (objc_msgSend(v31, "count") <= v33)
                  goto LABEL_42;
              }
            }
            v33 = v35;
LABEL_42:
            objc_msgSend(v32, "addObject:", v39);

            objc_autoreleasePoolPop(v37);
          }
          v60 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        }
        while (v60);
        a4 = v50;
        v8 = v52;
        v29 = v55;
      }
LABEL_58:

      a3 = v32;
      goto LABEL_23;
    }
    v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v43 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    if (!v43)
      goto LABEL_58;
    v44 = v43;
    v45 = *(_QWORD *)v62;
LABEL_48:
    v46 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v45)
        objc_enumerationMutation(a3);
      v47 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v46);
      if (objc_msgSend(a4, "resultType") == 3)
        break;
      if (objc_msgSend(a4, "resultType") == 4)
      {
        v48 = +[NSPersistentHistoryResult _changeFromResult:withTransaction:]((uint64_t)NSPersistentHistoryResult, v47, 0);
        goto LABEL_55;
      }
LABEL_56:
      if (v44 == ++v46)
      {
        v44 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (!v44)
          goto LABEL_58;
        goto LABEL_48;
      }
    }
    v48 = +[NSPersistentHistoryResult _transactionFromResult:withChanges:]((uint64_t)NSPersistentHistoryResult, v47, 0);
LABEL_55:
    v49 = v48;
    objc_msgSend(v32, "addObject:", v48);

    goto LABEL_56;
  }
  v51 = v8;
  v56 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v54 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v53 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (!v9)
    goto LABEL_20;
  v10 = v9;
  v59 = *(_QWORD *)v70;
  do
  {
    for (j = 0; j != v10; ++j)
    {
      if (*(_QWORD *)v70 != v59)
        objc_enumerationMutation(a3);
      v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
      v13 = (void *)MEMORY[0x18D76B4E4]();
      v14 = (void *)objc_msgSend(a5, "newObjectIDForEntity:pk:", objc_msgSend((id)objc_msgSend(a5, "model"), "entityForID:", (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("ENTITY")), "intValue")), (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("ENTITYPK")), "intValue"));
      v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("CHANGETYPE")), "unsignedIntegerValue");
      switch(v15)
      {
        case 2:
          v22 = v53;
          goto LABEL_16;
        case 1:
          v22 = v54;
          goto LABEL_16;
        case 0:
          v22 = v56;
LABEL_16:
          objc_msgSend(v22, "addObject:", v14);
          goto LABEL_18;
      }
      _NSCoreDataLog(1, (uint64_t)CFSTR("error: unexpected type of change : %lu"), v16, v17, v18, v19, v20, v21, v15);
LABEL_18:

      objc_autoreleasePoolPop(v13);
    }
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  }
  while (v10);
LABEL_20:
  objc_msgSend(v56, "minusSet:", v53);
  objc_msgSend(v54, "minusSet:", v53);
  objc_msgSend(v54, "minusSet:", v56);
  v23 = (void *)objc_msgSend(v56, "copy");
  v24 = (void *)objc_msgSend(v54, "copy");
  v25 = (void *)objc_msgSend(v53, "copy");
  v75[0] = CFSTR("inserted_objectIDs");
  v75[1] = CFSTR("updated_objectIDs");
  v76[0] = v23;
  v76[1] = v24;
  v75[2] = CFSTR("deleted_objectIDs");
  v76[2] = v25;
  a3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);

  v8 = v51;
LABEL_23:
  v27 = -[NSPersistentHistoryResult initWithResultType:andResult:]([NSPersistentHistoryResult alloc], "initWithResultType:andResult:", objc_msgSend(a4, "resultType"), a3);
  objc_autoreleasePoolPop(v8);
  return v27;
}

- (NSPersistentHistoryResult)initWithResultType:(int64_t)a3 andResult:(id)a4
{
  NSPersistentHistoryResult *v6;
  NSPersistentHistoryResult *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSPersistentHistoryResult;
  v6 = -[NSPersistentHistoryResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_resultType = a3;
    v6->_aggregatedResult = a4;
  }
  return v7;
}

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

+ (_NSPersistentHistoryChange)_changeFromResult:(uint64_t)a3 withTransaction:
{
  _NSPersistentHistoryChange *v5;

  objc_opt_self();
  v5 = -[_NSPersistentHistoryChange initWithDictionary:andChangeObjectID:]([_NSPersistentHistoryChange alloc], "initWithDictionary:andChangeObjectID:", a2, objc_msgSend(a2, "objectForKey:", CFSTR("self")));
  -[_NSPersistentHistoryChange _setTransaction:](v5, "_setTransaction:", a3);
  return v5;
}

+ (_NSPersistentHistoryTransaction)_transactionFromResult:(void *)a3 withChanges:
{
  _NSPersistentHistoryTransaction *v5;

  objc_opt_self();
  v5 = -[_NSPersistentHistoryTransaction initWithDictionary:andObjectID:]([_NSPersistentHistoryTransaction alloc], "initWithDictionary:andObjectID:", a2, objc_msgSend(a2, "objectForKey:", CFSTR("self")));
  -[_NSPersistentHistoryTransaction _setChanges:](v5, a3);
  return v5;
}

- (NSPersistentHistoryResult)initWithSubresults:(id)a3
{
  NSPersistentHistoryResult *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t resultType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  void *v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  int64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  id v57;
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
  objc_super v76;
  void *v77;
  const __CFString *v78;
  id v79;
  _BYTE v80[128];
  const __CFString *v81;
  id v82;
  _QWORD v83[3];
  _QWORD v84[3];
  const __CFString *v85;
  id v86;
  _BYTE v87[128];
  const __CFString *v88;
  id v89;
  _BYTE v90[128];
  const __CFString *v91;
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v76.receiver = self;
  v76.super_class = (Class)NSPersistentHistoryResult;
  v4 = -[NSPersistentHistoryResult init](&v76, sel_init);
  if (!v4)
    return v4;
  if (objc_msgSend(a3, "count"))
  {
    resultType = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "resultType");
    v4->_resultType = resultType;
  }
  else
  {
    resultType = v4->_resultType;
  }
  switch(resultType)
  {
    case 0:
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v27 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      if (!v27)
      {
        v30 = 1;
        goto LABEL_50;
      }
      v28 = v27;
      v29 = *(_QWORD *)v73;
      LOBYTE(v30) = 1;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v73 != v29)
            objc_enumerationMutation(a3);
          v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          v33 = v4->_resultType;
          if (v33 != objc_msgSend(v32, "resultType"))
          {
            v52 = (void *)MEMORY[0x1E0C99DA0];
            v53 = *MEMORY[0x1E0C99768];
            v91 = CFSTR("Results");
            v92 = a3;
            v54 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
            v55 = CFSTR("Mismatched result types during aggregation of history status results");
            goto LABEL_57;
          }
          if ((v30 & 1) != 0)
            v30 = objc_msgSend((id)objc_msgSend(v32, "result"), "BOOLValue");
          else
            v30 = 0;
        }
        v28 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      }
      while (v28);
LABEL_50:
      v50 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
LABEL_51:
      v4->_aggregatedResult = (id)v50;
      return v4;
    case 1:
      v59 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v34 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v36 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
      if (!v36)
        goto LABEL_46;
      v37 = v36;
      v38 = *(_QWORD *)v65;
      while (1)
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v65 != v38)
            objc_enumerationMutation(a3);
          v40 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          v41 = v4->_resultType;
          if (v41 != objc_msgSend(v40, "resultType"))
          {
            v52 = (void *)MEMORY[0x1E0C99DA0];
            v53 = *MEMORY[0x1E0C99768];
            v85 = CFSTR("Results");
            v86 = a3;
            v54 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
            v55 = CFSTR("Mismatched result types during aggregation of history object IDs results");
LABEL_57:
            objc_exception_throw((id)objc_msgSend(v52, "exceptionWithName:reason:userInfo:", v53, v55, v54));
          }
          v42 = (void *)objc_msgSend(v40, "result");
          if (v42)
          {
            v43 = v42;
            objc_msgSend(v59, "unionSet:", objc_msgSend(v42, "objectForKey:", CFSTR("inserted_objectIDs")));
            objc_msgSend(v34, "unionSet:", objc_msgSend(v43, "objectForKey:", CFSTR("updated_objectIDs")));
            objc_msgSend(v35, "unionSet:", objc_msgSend(v43, "objectForKey:", CFSTR("deleted_objectIDs")));
          }
        }
        v37 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
        if (!v37)
        {
LABEL_46:
          objc_msgSend(v59, "minusSet:", v35);
          objc_msgSend(v34, "minusSet:", v35);
          objc_msgSend(v34, "minusSet:", v59);
          v44 = (void *)objc_msgSend(v59, "copy");
          v45 = (void *)objc_msgSend(v34, "copy");
          v46 = (void *)objc_msgSend(v35, "copy");
          v47 = objc_alloc(MEMORY[0x1E0C99D80]);
          v84[0] = v44;
          v84[1] = v45;
          v84[2] = v46;
          v48 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
          v83[0] = CFSTR("inserted_objectIDs");
          v83[1] = CFSTR("updated_objectIDs");
          v83[2] = CFSTR("deleted_objectIDs");
          v49 = objc_msgSend(v47, "initWithObjects:forKeys:", v48, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3));

          v4->_aggregatedResult = (id)v49;
          return v4;
        }
      }
    case 2:
    case 6:
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v69;
        do
        {
          for (k = 0; k != v13; ++k)
          {
            if (*(_QWORD *)v69 != v15)
              objc_enumerationMutation(a3);
            v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
            v18 = v4->_resultType;
            if (v18 != objc_msgSend(v17, "resultType"))
            {
              v52 = (void *)MEMORY[0x1E0C99DA0];
              v53 = *MEMORY[0x1E0C99768];
              v88 = CFSTR("Results");
              v89 = a3;
              v54 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
              v55 = CFSTR("Mismatched result types during aggregation of history count results");
              goto LABEL_57;
            }
            v14 += objc_msgSend((id)objc_msgSend(v17, "result"), "integerValue");
          }
          v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
        }
        while (v13);
      }
      else
      {
        v14 = 0;
      }
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v14);
      goto LABEL_51;
    case 3:
    case 5:
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
      if (!v20)
        goto LABEL_23;
      v21 = v20;
      v22 = *(_QWORD *)v61;
      while (1)
      {
        for (m = 0; m != v21; ++m)
        {
          if (*(_QWORD *)v61 != v22)
            objc_enumerationMutation(a3);
          v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * m);
          v25 = v4->_resultType;
          if (v25 != objc_msgSend(v24, "resultType"))
          {
            v52 = (void *)MEMORY[0x1E0C99DA0];
            v53 = *MEMORY[0x1E0C99768];
            v78 = CFSTR("Results");
            v79 = a3;
            v54 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
            v55 = CFSTR("Mismatched result types during aggregation of history results");
            goto LABEL_57;
          }
          objc_msgSend(v19, "addObjectsFromArray:", objc_msgSend(v24, "result"));
        }
        v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
        if (!v21)
        {
LABEL_23:
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 1);
          v77 = v26;
          v4->_aggregatedResult = (id)objc_msgSend(v19, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1));

          return v4;
        }
      }
    case 4:
      _NSCoreDataLog(1, (uint64_t)CFSTR("History Change Request failed NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores"), v5, v6, v7, v8, v9, v10, v58);
      v56 = *MEMORY[0x1E0C99768];
      v81 = CFSTR("Results");
      v82 = a3;
      v57 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v56, 134091, (uint64_t)CFSTR("NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores"), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1));
      objc_exception_throw(v57);
    default:
      return v4;
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%s <%p> with @property result: %@"), class_getName(v4), self, self->_aggregatedResult);
}

- (NSPersistentHistoryResultType)resultType
{
  return self->_resultType;
}

@end
