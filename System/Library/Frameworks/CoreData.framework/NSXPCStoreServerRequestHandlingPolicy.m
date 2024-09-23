@implementation NSXPCStoreServerRequestHandlingPolicy

id __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "resultType") == 4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    v2 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "resultType");
    if (v3)
      v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v2, 0, 0);
    else
      v4 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v4;
    v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = -[NSSQLCore _newRowDataForXPCFetch:variables:context:error:](*(NSError **)(a1 + 40), *(void **)(a1 + 32), 0, *(_QWORD *)(a1 + 48), (NSError **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 40));
    v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
}

- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  NSFetchRequest *v80;
  NSManagedObjectContext *v81;
  uint64_t v82;
  uint64_t i;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSArray *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  uint64_t v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  id obj;
  id obja;
  void *v127;
  id v128;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  _BYTE v140[128];
  id v141[18];

  v141[16] = *(id *)MEMORY[0x1E0C80C00];
  switch(objc_msgSend(a3, "requestType"))
  {
    case 1:
      if (!self)
        return 0;
      v8 = objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel");
      v9 = objc_msgSend(a3, "entityName");
      if (v8)
        v10 = objc_msgSend(*(id *)(v8 + 32), "objectForKey:", v9);
      else
        v10 = 0;
      v11 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", v10, a4);
      if (!v11)
      {
        if (a5)
          *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134092, 0);
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Process fetch request aborting (predicate is nil)"), v68, v69, v70, v71, v72, v73, v117);
        return 0;
      }
      v12 = v11;
      if (objc_msgSend((id)qword_1ECD8D8B8, "isEqual:", v11))
      {
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Process fetch request returning no results (predicate is false)"), v13, v14, v15, v16, v17, v18, v117);
        return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
      }
      else
      {
        if ((objc_msgSend((id)_MergedGlobals_66, "isEqual:", v12) & 1) == 0)
        {
          v95 = objc_msgSend(a3, "predicate");
          if (v95)
          {
            v96 = objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v95, v12, 0));
            v97 = a3;
          }
          else
          {
            v97 = a3;
            v96 = (uint64_t)v12;
          }
          objc_msgSend(v97, "setPredicate:", v96);
        }
        return -[NSXPCStoreServerRequestHandlingPolicy _coreProcessFetchRequest:fromClientWithContext:error:](self, a3, a4, a5);
      }
    case 2:
      if (!self)
        return 0;
      v139 = 0;
      v119 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v130 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v118 = (void *)objc_msgSend(a4, "managedObjectContext");
      v128 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "allObjects"));
      objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "updatedObjects"), "allObjects"));
      objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "lockedObjects"), "allObjects"));
      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      obj = v32;
      v33 = 0;
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
      if (!v34)
        goto LABEL_87;
      v35 = *(_QWORD *)v136;
      v121 = *MEMORY[0x1E0CB28A8];
      do
      {
        v123 = v33;
        v36 = 0;
        do
        {
          if (*(_QWORD *)v136 != v35)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v36);
          v38 = (void *)MEMORY[0x18D76B4E4]();
          v39 = (void *)objc_msgSend(v37, "objectID");
          v40 = objc_msgSend(v39, "entity");
          if (v40)
          {
            if ((*(_BYTE *)(v40 + 120) & 4) != 0)
            {
              v41 = *(void **)(v40 + 72);
            }
            else
            {
              do
              {
                v41 = (void *)v40;
                v40 = objc_msgSend((id)v40, "superentity");
              }
              while (v40);
            }
          }
          else
          {
            v41 = 0;
          }
          v42 = objc_msgSend(v41, "name");
          v43 = -[NSXPCStoreServerRequestHandlingPolicy restrictingWritePredicateForEntity:fromClientWithContext:](self, "restrictingWritePredicateForEntity:fromClientWithContext:", v41, a4);
          v44 = v43;
          if (v43)
          {
            if ((objc_msgSend(v43, "evaluateWithObject:", v37) & 1) == 0)
            {
              if (!objc_msgSend(v128, "count"))
                objc_msgSend(v128, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), CFSTR("NSAffectedObjectsErrorKey"));
              objc_msgSend((id)objc_msgSend(v128, "objectForKey:", CFSTR("NSAffectedObjectsErrorKey")), "addObject:", v37);
            }
            v45 = (id)objc_msgSend(v130, "objectForKey:", v42);
            if (!v45)
            {
              v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v130, "setObject:forKey:", v45, v42);

            }
            objc_msgSend(v45, "addObject:", v39);
          }
          else
          {
            if (a5)
              v139 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v121, 134092, 0);
            v127 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
            v123 = v127;
          }
          objc_autoreleasePoolPop(v38);
          if (!v44)
          {
            v57 = v123;
            v56 = obj;
            goto LABEL_156;
          }
          ++v36;
        }
        while (v36 != v34);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
        v34 = v46;
        v33 = v123;
      }
      while (v46);
LABEL_87:

      v124 = v33;
      v80 = objc_alloc_init(NSFetchRequest);
      v81 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
      -[NSManagedObjectContext setUndoManager:](v81, "setUndoManager:", 0);
      -[NSManagedObjectContext setPersistentStoreCoordinator:](v81, "setPersistentStoreCoordinator:", objc_msgSend(v118, "persistentStoreCoordinator"));
      obja = (id)objc_msgSend((id)objc_msgSend(v118, "persistentStoreCoordinator"), "managedObjectModel");
      v133 = 0u;
      v134 = 0u;
      v131 = 0u;
      v132 = 0u;
      v82 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
      if (!v82)
        goto LABEL_116;
      v122 = *(_QWORD *)v132;
      v120 = *MEMORY[0x1E0CB28A8];
      while (1)
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v132 != v122)
            objc_enumerationMutation(v130);
          v84 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i);
          v85 = (void *)MEMORY[0x18D76B4E4]();
          v86 = objc_msgSend((id)objc_msgSend(obja, "entitiesByName"), "objectForKey:", v84);
          -[NSFetchRequest setEntity:](v80, "setEntity:", v86);
          v87 = (void *)objc_msgSend(v130, "objectForKey:", v84);
          v88 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", v86, a4);
          if (v88)
          {
            if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0), "isEqual:", v88))
            {
              if (!objc_msgSend(v128, "count"))
                objc_msgSend(v128, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), CFSTR("NSAffectedObjectsErrorKey"));
              objc_msgSend((id)objc_msgSend(v128, "objectForKey:", CFSTR("NSAffectedObjectsErrorKey")), "addObjectsFromArray:", v87);
            }
            else if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1), "isEqual:", v88) & 1) != 0)
            {
              goto LABEL_109;
            }
            if (objc_msgSend(v87, "count"))
              v90 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v87);
            else
              v90 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
            v91 = v90;
            v92 = objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v88);
            v117 = v91;
            -[NSFetchRequest setPredicate:](v80, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v92)));
            v93 = -[NSManagedObjectContext executeFetchRequest:error:](v81, "executeFetchRequest:error:", v80, &v139);
            if (v93)
            {
              if (-[NSArray count](v93, "count"))
              {
                if (!objc_msgSend(v128, "count"))
                  objc_msgSend(v128, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), CFSTR("NSAffectedObjectsErrorKey"));
                objc_msgSend((id)objc_msgSend(v128, "objectForKey:", CFSTR("NSAffectedObjectsErrorKey")), "addObjectsFromArray:", v87);
              }
LABEL_109:
              v89 = 1;
              goto LABEL_113;
            }
            if (a5)
              v139 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v120, 134030, 0);
            v89 = 0;
            v127 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
            v124 = v127;
          }
          else
          {
            if (a5)
              v139 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v120, 134092, 0);
            v89 = 0;
            v127 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          }
LABEL_113:
          objc_autoreleasePoolPop(v85);
          if (!v89)
          {
            v56 = 0;
            v57 = v124;
            goto LABEL_156;
          }
        }
        v82 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
        if (!v82)
        {
LABEL_116:
          v57 = v124;
          if (objc_msgSend(v128, "count"))
          {
            if (a5)
              v139 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v128);
            v94 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
LABEL_155:
            v56 = 0;
            v57 = (void *)v94;
            v127 = (void *)v94;
          }
          else
          {
            if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
            {
              _NSCoreDataLog(8, (uint64_t)CFSTR("Saving."), v106, v107, v108, v109, v110, v111, v117);
              NSLog((NSString *)CFSTR("\tInserted = %@"), objc_msgSend(v118, "insertedObjects"));
              NSLog((NSString *)CFSTR("\tUpdated = %@"), objc_msgSend(v118, "updatedObjects"));
              NSLog((NSString *)CFSTR("\tDeleted = %@"), objc_msgSend(v118, "deletedObjects"));
            }
            if (objc_msgSend(v118, "save:", &v139))
            {
              v94 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              goto LABEL_155;
            }
            v56 = 0;
            v127 = v124;
          }
LABEL_156:

          v112 = v57;
          v113 = v139;
          objc_msgSend(v119, "drain");
          v114 = v57;
          v115 = v139;
          if (a5 && v139)
            *a5 = v139;
          v116 = v115;
          return v127;
        }
      }
    case 5:
      if (!self)
        return 0;
      v141[0] = 0;
      v20 = (void *)MEMORY[0x18D76B4E4]();
      v21 = (void *)objc_msgSend(a4, "managedObjectContext");
      objc_msgSend(a3, "_resolveEntityWithContext:", v21);
      v22 = objc_msgSend(a3, "entity");
      if (v22)
      {
        if ((*(_BYTE *)(v22 + 120) & 4) != 0)
        {
          v23 = *(_QWORD *)(v22 + 72);
        }
        else
        {
          do
          {
            v23 = v22;
            v22 = objc_msgSend((id)v22, "superentity");
          }
          while (v22);
        }
      }
      else
      {
        v23 = 0;
      }
      v58 = -[NSXPCStoreServerRequestHandlingPolicy restrictingWritePredicateForEntity:fromClientWithContext:](self, "restrictingWritePredicateForEntity:fromClientWithContext:", v23, a4);
      if (v58)
      {
        if ((id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0) != v58)
        {
          v59 = (void *)objc_msgSend(v21, "executeRequest:error:", a3, v141);
          v60 = v141[0];
          goto LABEL_134;
        }
        if (a5)
        {
          v65 = (void *)MEMORY[0x1E0CB35C8];
          v66 = *MEMORY[0x1E0CB28A8];
          v67 = 134030;
          goto LABEL_126;
        }
      }
      else if (a5)
      {
        v65 = (void *)MEMORY[0x1E0CB35C8];
        v66 = *MEMORY[0x1E0CB28A8];
        v67 = 134092;
LABEL_126:
        v60 = (id)objc_msgSend(v65, "errorWithDomain:code:userInfo:", v66, v67, 0);
        v59 = 0;
        v141[0] = v60;
        goto LABEL_134;
      }
      v60 = 0;
      v59 = 0;
LABEL_134:
      v98 = v60;
      v99 = v59;
      objc_autoreleasePoolPop(v20);
      v100 = v141[0];
      if (a5 && v141[0])
        *a5 = v141[0];
      goto LABEL_147;
    case 6:
      if (!self)
        return 0;
      v141[0] = 0;
      v47 = (void *)MEMORY[0x18D76B4E4]();
      v48 = (void *)objc_msgSend(a4, "managedObjectContext");
      objc_msgSend(a3, "_resolveEntityWithContext:", v48);
      v49 = objc_msgSend(a3, "entity");
      if (v49)
      {
        if ((*(_BYTE *)(v49 + 120) & 4) != 0)
        {
          v50 = *(_QWORD *)(v49 + 72);
        }
        else
        {
          do
          {
            v50 = v49;
            v49 = objc_msgSend((id)v49, "superentity");
          }
          while (v49);
        }
      }
      else
      {
        v50 = 0;
      }
      v61 = -[NSXPCStoreServerRequestHandlingPolicy restrictingWritePredicateForEntity:fromClientWithContext:](self, "restrictingWritePredicateForEntity:fromClientWithContext:", v50, a4);
      if (v61)
      {
        if ((id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0) != v61)
        {
          v59 = (void *)objc_msgSend(v48, "executeRequest:error:", a3, v141);
          v62 = v141[0];
          goto LABEL_139;
        }
        if (a5)
        {
          v74 = (void *)MEMORY[0x1E0CB35C8];
          v75 = *MEMORY[0x1E0CB28A8];
          v76 = 134030;
          goto LABEL_129;
        }
      }
      else if (a5)
      {
        v74 = (void *)MEMORY[0x1E0CB35C8];
        v75 = *MEMORY[0x1E0CB28A8];
        v76 = 134092;
LABEL_129:
        v62 = (id)objc_msgSend(v74, "errorWithDomain:code:userInfo:", v75, v76, 0);
        v59 = 0;
        v141[0] = v62;
        goto LABEL_139;
      }
      v62 = 0;
      v59 = 0;
LABEL_139:
      v101 = v62;
      v102 = v59;
      objc_autoreleasePoolPop(v47);
      v100 = v141[0];
      if (a5 && v141[0])
        *a5 = v141[0];
      goto LABEL_147;
    case 7:
      if (!self)
        return 0;
      v141[0] = 0;
      v51 = (void *)MEMORY[0x18D76B4E4]();
      v52 = (void *)objc_msgSend(a3, "fetchRequest");
      v53 = (void *)objc_msgSend(a4, "managedObjectContext");
      objc_msgSend(v52, "_resolveEntityWithContext:", v53);
      v54 = objc_msgSend(v52, "entity");
      if (v54)
      {
        if ((*(_BYTE *)(v54 + 120) & 4) != 0)
        {
          v55 = *(_QWORD *)(v54 + 72);
        }
        else
        {
          do
          {
            v55 = v54;
            v54 = objc_msgSend((id)v54, "superentity");
          }
          while (v54);
        }
      }
      else
      {
        v55 = 0;
      }
      v63 = -[NSXPCStoreServerRequestHandlingPolicy restrictingWritePredicateForEntity:fromClientWithContext:](self, "restrictingWritePredicateForEntity:fromClientWithContext:", v55, a4);
      if (v63)
      {
        if ((id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0) != v63)
        {
          v59 = (void *)objc_msgSend(v53, "executeRequest:error:", a3, v141);
          v64 = v141[0];
          goto LABEL_144;
        }
        if (a5)
        {
          v77 = (void *)MEMORY[0x1E0CB35C8];
          v78 = *MEMORY[0x1E0CB28A8];
          v79 = 134030;
          goto LABEL_132;
        }
      }
      else if (a5)
      {
        v77 = (void *)MEMORY[0x1E0CB35C8];
        v78 = *MEMORY[0x1E0CB28A8];
        v79 = 134092;
LABEL_132:
        v64 = (id)objc_msgSend(v77, "errorWithDomain:code:userInfo:", v78, v79, 0);
        v59 = 0;
        v141[0] = v64;
        goto LABEL_144;
      }
      v64 = 0;
      v59 = 0;
LABEL_144:
      v103 = v64;
      v104 = v59;
      objc_autoreleasePoolPop(v51);
      v100 = v141[0];
      if (a5 && v141[0])
        *a5 = v141[0];
LABEL_147:
      v105 = v100;
      return v59;
    case 8:
      if (!self)
        return 0;
      v141[0] = 0;
      v24 = (void *)MEMORY[0x18D76B4E4]();
      v25 = (void *)objc_msgSend((id)objc_msgSend(a4, "managedObjectContext"), "executeRequest:error:", a3, v141);
      v26 = v25;
      v27 = v141[0];
      objc_autoreleasePoolPop(v24);
      v28 = v141[0];
      if (a5 && v141[0])
        *a5 = v141[0];
      v29 = v28;
      return v25;
    default:
      if (!a5)
        return 0;
      v30 = objc_msgSend(a3, "description");
      if (v30)
        v31 = (const __CFString *)v30;
      else
        v31 = CFSTR("Request description was nil.");
      v127 = 0;
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v31, CFSTR("Request")));
      return v127;
  }
}

- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)_MergedGlobals_66;
}

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  return a3 != 0;
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  return (id)NSSet_EmptySet;
}

- (id)_coreProcessFetchRequest:(_QWORD *)a3 fromClientWithContext:(_QWORD *)a4 error:
{
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  uint64_t v50;
  id v51;
  _QWORD v53[6];
  _QWORD v54[9];
  BOOL v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  uint64_t v67;
  _QWORD v68[11];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  uint64_t v84;

  if (!a1)
    return 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3052000000;
  v82 = __Block_byref_object_copy__1;
  v83 = __Block_byref_object_dispose__1;
  v84 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3052000000;
  v76 = __Block_byref_object_copy__1;
  v77 = __Block_byref_object_dispose__1;
  v78 = 0;
  v51 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(a3, "managedObjectContext");
  objc_msgSend(a2, "_resolveEntityWithContext:", v7);
  if (objc_msgSend(a2, "resultType"))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend((id)objc_msgSend(a2, "propertiesToFetch"), "count") != 0;
    v19 = (void *)objc_msgSend(a2, "relationshipKeyPathsForPrefetching");
    if (v19)
    {
      v20 = +[_PFRoutines _coalescedPrefetchKeypaths:]((uint64_t)_PFRoutines, v19);
      if (objc_msgSend(v20, "count"))
        v9 = v20;
      else
        v9 = 0;
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Coalesced prefetch keypaths to : %@"), v21, v22, v23, v24, v25, v26, (uint64_t)v9);
      goto LABEL_5;
    }
  }
  v9 = 0;
LABEL_5:
  objc_msgSend(a2, "setRelationshipKeyPathsForPrefetching:", 0);
  v10 = objc_msgSend(a2, "includesPropertyValues");
  if (v9)
    v11 = v10;
  else
    v11 = 1;
  if ((v11 & 1) == 0 && objc_msgSend(v9, "count"))
    objc_msgSend(a2, "setIncludesPropertyValues:", 1);
  v12 = (void *)objc_msgSend(v7, "persistentStoreCoordinator");
  v13 = v12;
  if (a3)
    v14 = a3[4];
  else
    v14 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke;
  v68[3] = &unk_1E1EDD458;
  v68[4] = a2;
  v68[5] = v14;
  v68[8] = &v79;
  v68[9] = &v73;
  v68[10] = &v69;
  v68[6] = v7;
  v68[7] = a1;
  objc_msgSend(v12, "performBlockAndWait:", v68);
  v15 = (id)v80[5];
  v16 = (id)v74[5];
  if (v80[5])
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3052000000;
    v65 = __Block_byref_object_copy__1;
    v66 = __Block_byref_object_dispose__1;
    v67 = 0;
    if (v9)
    {
      if (!v8)
        objc_msgSend(a2, "setResultType:", 1);
      v17 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v56 = 0;
      v57 = &v56;
      v58 = 0x3052000000;
      v59 = __Block_byref_object_copy__1;
      v60 = __Block_byref_object_dispose__1;
      v61 = 0;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_2;
      v54[3] = &unk_1E1EDD480;
      v55 = v8;
      v54[6] = &v56;
      v54[7] = &v79;
      v54[4] = a2;
      v54[5] = v14;
      v54[8] = &v62;
      objc_msgSend(v13, "performBlockAndWait:", v54);
      v18 = -[NSXPCStoreServerRequestHandlingPolicy prefetchRelationships:forFetch:sourceOIDs:fromClientWithContext:](a1, v9, a2, (void *)v57[5], a3);

      objc_msgSend(v17, "drain");
      _Block_object_dispose(&v56, 8);
    }
    else
    {
      v18 = 0;
    }
    if (!*((_BYTE *)v70 + 24))
    {
      v34 = (void *)v80[5];
      objc_msgSend(a2, "resultType");
      v35 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v34, v18, 0);
      v80[5] = v35;

    }
    if (v63[5])
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_3;
      v53[3] = &unk_1E1EDD0E0;
      v53[4] = v14;
      v53[5] = &v62;
      objc_msgSend(v13, "performBlockAndWait:", v53);

    }
    if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    {
      v36 = objc_msgSend((id)v80[5], "count");
      _NSCoreDataLog(8, (uint64_t)CFSTR("Process fetch request got %d results."), v37, v38, v39, v40, v41, v42, v36);
    }
    _Block_object_dispose(&v62, 8);
    v33 = 0;
  }
  else
  {
    if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      _NSCoreDataLog(8, (uint64_t)CFSTR("Process fetch request got nil result (check system log for details)."), v27, v28, v29, v30, v31, v32, v50);
    v33 = 1;
  }
  _Block_object_dispose(&v69, 8);
  v43 = (id)v80[5];
  v44 = (id)v74[5];
  if (a4)
  {
    v45 = v74[5];
    if (v45)
      *a4 = v45;
  }
  objc_msgSend(v51, "drain");
  v46 = 0;
  v47 = (id)v74[5];
  if (v33)
    v48 = 0;
  else
    v48 = (id)v80[5];
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
  return v48;
}

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_66 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    qword_1ECD8D8B8 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  }
}

- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3
{
  return 1;
}

- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)_MergedGlobals_66;
}

- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id result;

  result = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", a3, a4);
  if (result)
  {
    if ((id)qword_1ECD8D8B8 != result && _MergedGlobals_66 != (_QWORD)result)
      return (id)_MergedGlobals_66;
  }
  return result;
}

void __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_2(uint64_t a1)
{
  id v2;
  _PFArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(NSFetchRequest **)(a1 + 32), 0, *(NSPersistentStore **)(a1 + 40), 0, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 0);
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = -[_PFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "valueAtIndex:", 0));
        }
        v5 = -[_PFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v2;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40), *(NSFetchRequest **)(a1 + 32), 0, *(NSPersistentStore **)(a1 + 40), 0, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 40), 0);
    -[NSSQLCore _cacheRows:](*(_QWORD **)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
}

- (id)prefetchRelationships:(void *)a3 forFetch:(void *)a4 sourceOIDs:(_QWORD *)a5 fromClientWithContext:
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSFetchRequest *v61;
  NSFetchRequest *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  unint64_t k;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  unsigned int v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t j;
  void *v132;
  void *v133;
  void *v134;
  BOOL v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  id obj;
  uint64_t i;
  uint64_t v143;
  id v144;
  unint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  char v150;
  _QWORD *v151;
  id v152;
  id v153;
  id v154;
  void *v155;
  uint64_t v156;
  void *context;
  void *contexta;
  uint64_t v159;
  void *v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[18];
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  char v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  void (*v187)(uint64_t, uint64_t);
  void (*v188)(uint64_t);
  uint64_t v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  void (*v193)(uint64_t, uint64_t);
  void (*v194)(uint64_t);
  uint64_t v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  void (*v199)(uint64_t, uint64_t);
  void (*v200)(uint64_t);
  uint64_t v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  void (*v205)(uint64_t, uint64_t);
  void (*v206)(uint64_t);
  uint64_t v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  void (*v211)(uint64_t, uint64_t);
  void (*v212)(uint64_t);
  id v213;
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  void (*v217)(uint64_t, uint64_t);
  void (*v218)(uint64_t);
  uint64_t v219;
  uint64_t v220;
  uint64_t *v221;
  uint64_t v222;
  void (*v223)(uint64_t, uint64_t);
  void (*v224)(uint64_t);
  uint64_t v225;
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  uint8_t v229[128];
  uint8_t buf[8];
  uint64_t v231;
  _QWORD *(*v232)(uint64_t);
  void *v233;
  void *v234;
  uint64_t *v235;
  const __CFString *v236;
  _QWORD v237[8];
  _QWORD v238[4];

  v238[1] = *MEMORY[0x1E0C80C00];
  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetching keypaths %@, for fetch %@, sources %@"), v8, v9, v10, v11, v12, v13, (uint64_t)a2);
  obj = a2;
  result = (id)objc_msgSend(a4, "count");
  if (result)
  {
    result = (id)objc_msgSend(a2, "count");
    if (result)
    {
      v144 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v136 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v149 = (void *)objc_msgSend(a3, "entity");
      v175 = 0u;
      v176 = 0u;
      v177 = 0u;
      v178 = 0u;
      v138 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v175, v229, 16);
      if (!v138)
        goto LABEL_137;
      v137 = *(_QWORD *)v176;
      while (1)
      {
        for (i = 0; i != v138; ++i)
        {
          if (*(_QWORD *)v176 != v137)
            objc_enumerationMutation(obj);
          v159 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * i);
          v139 = (void *)MEMORY[0x18D76B4E4]();
          v15 = (void *)objc_msgSend(obj, "objectForKey:", v159);
          if (objc_msgSend(v15, "count"))
            v16 = (uint64_t)v15;
          else
            v16 = 0;
          v143 = v16;
          if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
            _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetching %@, subkeypaths = %@"), v17, v18, v19, v20, v21, v22, v159);
          v154 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          if (v149 && objc_msgSend((id)objc_msgSend(v149, "propertiesByName"), "objectForKey:", v159))
          {
            objc_msgSend(v154, "setObject:forKey:", a4, objc_msgSend(v149, "name"));
          }
          else
          {
            if (!objc_msgSend((id)objc_msgSend(v149, "subentitiesByName"), "count"))
              goto LABEL_135;
            v122 = (void *)objc_msgSend((id)objc_msgSend(v149, "subentities"), "mutableCopy");
            v153 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            while (objc_msgSend(v122, "count"))
            {
              v123 = (void *)objc_msgSend(v122, "objectAtIndex:", 0);
              objc_msgSend(v122, "removeObjectAtIndex:", 0);
              if (objc_msgSend((id)objc_msgSend(v123, "relationshipsByName"), "objectForKey:", v159))
              {
                objc_msgSend(v153, "addObject:", v123);
              }
              else if (objc_msgSend((id)objc_msgSend(v123, "subentitiesByName"), "count"))
              {
                objc_msgSend(v122, "addObjectsFromArray:", objc_msgSend(v123, "subentities"));
              }
            }

            if (objc_msgSend(v153, "count"))
            {
              v173 = 0u;
              v174 = 0u;
              v171 = 0u;
              v172 = 0u;
              contexta = (void *)objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v171, v228, 16);
              if (contexta)
              {
                v124 = 0;
                v156 = *(_QWORD *)v172;
                do
                {
                  v125 = 0;
                  do
                  {
                    if (*(_QWORD *)v172 != v156)
                    {
                      v126 = v125;
                      objc_enumerationMutation(v153);
                      v125 = v126;
                    }
                    v162 = v125;
                    v127 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v125);
                    v128 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v169 = 0u;
                    v170 = 0u;
                    v167 = 0u;
                    v168 = 0u;
                    v129 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v167, v227, 16);
                    if (v129)
                    {
                      v130 = *(_QWORD *)v168;
                      do
                      {
                        for (j = 0; j != v129; ++j)
                        {
                          if (*(_QWORD *)v168 != v130)
                            objc_enumerationMutation(a4);
                          v132 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * j);
                          v133 = (void *)objc_msgSend(v132, "entity");
                          v134 = v133;
                          v135 = v133 == v127 || v133 == v124;
                          if (v135 || objc_msgSend(v133, "isKindOfEntity:", v127))
                          {
                            objc_msgSend(v128, "addObject:", v132);
                            if (v134 != v127)
                              v124 = v134;
                          }
                        }
                        v129 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v167, v227, 16);
                      }
                      while (v129);
                    }
                    if (objc_msgSend(v128, "count"))
                      objc_msgSend(v154, "setObject:forKey:", v128, objc_msgSend(v127, "name"));

                    v125 = v162 + 1;
                  }
                  while ((void *)(v162 + 1) != contexta);
                  contexta = (void *)objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v171, v228, 16);
                }
                while (contexta);
              }
            }
          }
          if (objc_msgSend(v154, "count"))
          {
            v165 = 0u;
            v166 = 0u;
            v163 = 0u;
            v164 = 0u;
            v152 = (id)objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v163, v226, 16);
            if (v152)
            {
              v148 = *(_QWORD *)v164;
              do
              {
                v23 = 0;
                do
                {
                  if (*(_QWORD *)v164 != v148)
                    objc_enumerationMutation(v154);
                  v24 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)v23);
                  context = (void *)MEMORY[0x18D76B4E4]();
                  v25 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v149, "managedObjectModel"), "entitiesByName"), "objectForKey:", v24);
                  if (v25)
                  {
                    v26 = (void *)objc_msgSend(v154, "objectForKey:", v24);
                    v161 = (void *)objc_msgSend(a5, "managedObjectContext");
                    v147 = (void *)objc_msgSend(v161, "persistentStoreCoordinator");
                    if (a5)
                    {
                      v155 = (void *)a5[4];
                      v145 = -[NSPersistentStore faultHandler]((unint64_t)v155);
                      if (!v155)
                        goto LABEL_27;
                      v29 = _sqlCoreLookupSQLEntityForEntityDescription(v155, v25);
                      v27 = v29;
                      if (v29)
                      {
                        v28 = objc_msgSend(*(id *)(v29 + 40), "objectForKey:", v159);
                        v150 = 0;
                        goto LABEL_31;
                      }
                    }
                    else
                    {
                      v145 = -[NSPersistentStore faultHandler](0);
LABEL_27:
                      v27 = 0;
                      v155 = 0;
                    }
                    v28 = 0;
                    v150 = 1;
LABEL_31:
                    v30 = -[NSEntityDescription _relationshipNamed:](v25, v159);
                    if (!v28 || !v30 || !objc_msgSend(v26, "count"))
                    {
                      v52 = (void *)MEMORY[0x1E0C99D20];
                      v53 = objc_msgSend(v25, "name");
                      v54 = objc_msgSend(v52, "arrayWithObjects:", v159, v53, NSArray_EmptyArray, 0);
                      goto LABEL_97;
                    }
                    v151 = v25;
                    v31 = *(_BYTE **)(v28 + 56);
                    v220 = 0;
                    v221 = &v220;
                    v222 = 0x3052000000;
                    v223 = __Block_byref_object_copy__1;
                    v224 = __Block_byref_object_dispose__1;
                    v225 = 0;
                    v214 = 0;
                    v215 = &v214;
                    v216 = 0x3052000000;
                    v217 = __Block_byref_object_copy__1;
                    v218 = __Block_byref_object_dispose__1;
                    v219 = 0;
                    v208 = 0;
                    v209 = &v208;
                    v210 = 0x3052000000;
                    v211 = __Block_byref_object_copy__1;
                    v212 = __Block_byref_object_dispose__1;
                    v213 = 0;
                    v213 = (id)NSArray_EmptyArray;
                    v202 = 0;
                    v203 = &v202;
                    v204 = 0x3052000000;
                    v205 = __Block_byref_object_copy__1;
                    v206 = __Block_byref_object_dispose__1;
                    v207 = 0;
                    if (v31 && v31[24] == 7)
                    {
                      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                      {
                        v32 = objc_msgSend(v31, "name");
                        _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetching inverse to-one relationship \"%@\"."), v33, v34, v35, v36, v37, v38, v32);
                      }
                      v39 = objc_msgSend(a5, "inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:", v159, v25);
                      v221[5] = v39;
                      v238[0] = CFSTR("destinations");
                      v237[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v26);
                      v40 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v237, v238, 1);
LABEL_39:
                      v215[5] = v40;

                      v203[5] = 0;
                      v196 = 0;
                      v197 = &v196;
                      v198 = 0x3052000000;
                      v199 = __Block_byref_object_copy__1;
                      v200 = __Block_byref_object_dispose__1;
                      v201 = 0;
                      v190 = 0;
                      v191 = &v190;
                      v192 = 0x3052000000;
                      v193 = __Block_byref_object_copy__1;
                      v194 = __Block_byref_object_dispose__1;
                      v195 = 0;
                      v184 = 0;
                      v185 = &v184;
                      v186 = 0x3052000000;
                      v187 = __Block_byref_object_copy__1;
                      v188 = __Block_byref_object_dispose__1;
                      v189 = 0;
                      v180 = 0;
                      v181 = &v180;
                      v182 = 0x2020000000;
                      v183 = 0;
                      v41 = (void *)v221[5];
                      if (!v41)
                        goto LABEL_42;
                      v42 = objc_msgSend(a1, "restrictingReadPredicateForEntity:fromClientWithContext:", objc_msgSend(v41, "entity"), a5);
                      if (_MergedGlobals_66 != v42)
                      {
                        v221[5] = 0;
                        goto LABEL_42;
                      }
                      if (v221[5])
                      {
                        v179[0] = MEMORY[0x1E0C809B0];
                        v179[1] = 3221225472;
                        v179[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_2;
                        v179[3] = &unk_1E1EDD4F8;
                        v179[10] = &v220;
                        v179[11] = &v196;
                        v179[4] = v155;
                        v179[5] = v161;
                        v179[12] = &v214;
                        v179[13] = &v202;
                        v179[14] = &v190;
                        v179[15] = &v184;
                        v179[6] = v143;
                        v179[7] = v159;
                        v179[16] = &v208;
                        v179[17] = &v180;
                        v179[8] = v145;
                        v179[9] = v25;
                        objc_msgSend(v147, "performBlockAndWait:", v179);
                        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                        {
                          v103 = objc_msgSend(v25, "name");
                          objc_msgSend((id)v197[5], "length");
                          _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetched for source entity %@, key '%@'.  Got data with length %lu."), v104, v105, v106, v107, v108, v109, v103);
                        }
                        v43 = v197;
                        if (*((_BYTE *)v181 + 24))
                        {

                          v197[5] = 0;
                          v81 = (void *)MEMORY[0x1E0C99D20];
                          v82 = objc_msgSend(v25, "name");
                          goto LABEL_87;
                        }
                      }
                      else
                      {
LABEL_42:
                        v43 = v197;
                      }
                      if (v43[5])
                      {
                        if (v143)
                        {
                          if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                            _NSCoreDataLog(8, (uint64_t)CFSTR("Recursively prefetching subkeys %@ of fetch %@ using OIDs %@ for objects %@"), v44, v45, v46, v47, v48, v49, v143);
                          v50 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, (void *)v203[5]);
                          v51 = -[NSXPCStoreServerRequestHandlingPolicy prefetchRelationships:forFetch:sourceOIDs:fromClientWithContext:](a1, v143, v221[5], v50, a5);

                        }
                        else
                        {
                          v51 = 0;
                        }

                        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                        {
                          v110 = objc_msgSend(v25, "name");
                          _NSCoreDataLog(8, (uint64_t)CFSTR("Done prefetching for %@, %@"), v111, v112, v113, v114, v115, v116, v110);
                        }
                        v117 = (void *)MEMORY[0x1E0C99D20];
                        v118 = objc_msgSend(v25, "name");
                        v54 = objc_msgSend(v117, "arrayWithObjects:", v159, v118, v209[5], v197[5], v51, 0);

                        if (v185[5])
                        {
                          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                          v231 = 3221225472;
                          v232 = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_79;
                          v233 = &unk_1E1EDD0E0;
                          v234 = v155;
                          v235 = &v184;
                          objc_msgSend(v147, "performBlockAndWait:", buf);

                        }
                      }
                      else
                      {

                        if (v185[5])
                        {
                          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                          v231 = 3221225472;
                          v232 = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_71;
                          v233 = &unk_1E1EDD0E0;
                          v234 = v155;
                          v235 = &v184;
                          objc_msgSend(v147, "performBlockAndWait:", buf);

                        }
                        v81 = (void *)MEMORY[0x1E0C99D20];
                        v82 = objc_msgSend(v25, "name");
LABEL_87:
                        v54 = objc_msgSend(v81, "arrayWithObjects:", v159, v82, NSArray_EmptyArray, 0);
                      }
                      _Block_object_dispose(&v180, 8);
                      _Block_object_dispose(&v184, 8);
                      _Block_object_dispose(&v190, 8);
                      _Block_object_dispose(&v196, 8);
LABEL_96:
                      _Block_object_dispose(&v202, 8);
                      _Block_object_dispose(&v208, 8);
                      _Block_object_dispose(&v214, 8);
                      _Block_object_dispose(&v220, 8);
LABEL_97:
                      objc_msgSend(v144, "addObject:", v54);
                      goto LABEL_98;
                    }
                    v55 = *(unsigned __int8 *)(v28 + 24);
                    if (v55 != 7)
                    {
                      if (v55 == 9)
                      {
                        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F0]), "initWithObject:", objc_msgSend(*(id *)(v28 + 56), "name"));
                        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36E8]), "initWithKeyPath:", v56);

                        v58 = objc_msgSend(v26, "objectAtIndex:", 0);
                        v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3540]), "initWithObject:", v58);
                        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v59, v57, 0, 10, 0);

                        v61 = objc_alloc_init(NSFetchRequest);
                        -[NSFetchRequest setEntity:](v61, "setEntity:", objc_msgSend((id)objc_msgSend((id)v28, "destinationEntity"), "entityDescription"));
                        -[NSFetchRequest setPredicate:](v61, "setPredicate:", v60);

                        v62 = v61;
                        v209[5] = 0;
                        v237[0] = MEMORY[0x1E0C809B0];
                        v237[1] = 3221225472;
                        v237[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke;
                        v237[3] = &unk_1E1EDD4D0;
                        v237[4] = v155;
                        v237[5] = v61;
                        v237[6] = v26;
                        v237[7] = &v208;
                        objc_msgSend(v147, "performBlockAndWait:", v237);
                        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                        {
                          v63 = objc_msgSend((id)v28, "name");
                          objc_msgSend((id)v209[5], "count");
                          _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetched for many-to-many relationship \"%@\".  Got %lu rows"), v64, v65, v66, v67, v68, v69, v63);
                          _NSCoreDataLog(8, (uint64_t)CFSTR("Which means oidSets %@"), v70, v71, v72, v73, v74, v75, v209[5]);
                        }
                        v76 = objc_msgSend((id)v209[5], "count");
                        v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v76 + 256);
                        v203[5] = (uint64_t)v77;
                        if (v76)
                        {
                          for (k = 0; k < v76; k += 2)
                          {
                            v79 = objc_msgSend((id)v209[5], "objectAtIndex:", k + 1);
                            objc_msgSend((id)v203[5], "addObjectsFromArray:", v79);
                          }
                          v77 = (void *)v203[5];
                        }
                        if (objc_msgSend(v77, "count"))
                        {
                          v80 = objc_msgSend(a5, "manyToManyPrefetchRequestsForRelationshipNamed:onEntity:", v159, v25);
                          v221[5] = v80;
                          v236 = CFSTR("mtmObjects");
                          v238[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v203[5]);
                          v40 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v238, &v236, 1);
                          goto LABEL_39;
                        }
                        goto LABEL_94;
                      }

                      v92 = (void *)MEMORY[0x1E0C99D20];
                      v93 = objc_msgSend(v25, "name");
                      v94 = objc_msgSend(v92, "arrayWithObjects:", v159, v93, NSArray_EmptyArray, 0);
LABEL_95:
                      v54 = v94;
                      goto LABEL_96;
                    }
                    v146 = objc_msgSend(v26, "count");
                    v83 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v146);
                    v203[5] = v83;
                    if (!v146)
                    {
LABEL_78:
                      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                      {
                        v95 = objc_msgSend((id)v28, "name");
                        objc_msgSend((id)v203[5], "count");
                        _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetched for one-to-many relationship \"%@\".  Got %lu rows"), v96, v97, v98, v99, v100, v101, v95);
                      }
                      if (objc_msgSend((id)v203[5], "count"))
                      {
                        v102 = objc_msgSend(a5, "manyToOnePrefetchRequestForRelationshipNamed:onEntity:", v159, v25);
                        v221[5] = v102;
                        v238[0] = CFSTR("objects");
                        v237[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v203[5]);
                        v40 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v237, v238, 1);
                        goto LABEL_39;
                      }
LABEL_94:

                      v119 = (void *)MEMORY[0x1E0C99D20];
                      v120 = objc_msgSend(v25, "name");
                      v94 = objc_msgSend(v119, "arrayWithObjects:", v159, v120, NSArray_EmptyArray, 0);
                      goto LABEL_95;
                    }
                    v84 = 0;
                    while (2)
                    {
                      v85 = (void *)MEMORY[0x18D76B4E4]();
                      v86 = objc_msgSend(v26, "objectAtIndex:", v84);
                      v179[0] = 0;
                      v87 = (void *)objc_msgSend(v161, "objectRegisteredForID:", v86);
                      if (v87)
                      {
                        v88 = objc_msgSend((id)v28, "slot");
                        if ((v150 & 1) != 0)
                          v89 = 0;
                        else
                          v89 = *(_QWORD *)(v27 + 192);
                        v90 = (_QWORD *)objc_msgSend(v87, "entity");
                        v91 = v89 + v88;
                        v25 = v151;
                        if (v90 != v151)
                        {
                          v91 = objc_msgSend(v90, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", v91, v151, 0);
                          v25 = v151;
                        }
                        if ((_PF_InternalToOneRelationshipForeignKeyCache((unsigned int *)v87, v91, v179) & 1) == 0
                          || !v179[0])
                        {
LABEL_74:
                          objc_autoreleasePoolPop(v85);
                          if (v146 == ++v84)
                            goto LABEL_78;
                          continue;
                        }
                      }
                      else
                      {
                        v179[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v161, "existingObjectWithID:error:", v86, 0), "primitiveValueForKey:", v159), "objectID");
                        if (!v179[0])
                          goto LABEL_74;
                      }
                      break;
                    }
                    objc_msgSend((id)v203[5], "addObject:");
                    goto LABEL_74;
                  }
LABEL_98:
                  objc_autoreleasePoolPop(context);
                  v23 = (char *)v23 + 1;
                }
                while (v23 != v152);
                v121 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v163, v226, 16);
                v152 = (id)v121;
              }
              while (v121);
            }
          }
LABEL_135:
          objc_autoreleasePoolPop(v139);
        }
        v138 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v229, 16);
        if (!v138)
        {
LABEL_137:
          objc_msgSend(v136, "drain");
          return v144;
        }
      }
    }
  }
  return result;
}

_QWORD *__94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_3(uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(_QWORD **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

id __95__NSXPCStoreServerRequestHandlingPolicy__coreFaultForObjectWithID_fromClientWithContext_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "newValuesForObjectWithID:withContext:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_snapshot");
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
}

- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  NSFetchRequest *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  _QWORD v49[10];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  uint64_t v67;

  v48 = 0;
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v10 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", objc_msgSend(a3, "entity"), a4);
  v11 = v10;
  if (v10)
  {
    if ((id)qword_1ECD8D8B8 == v10)
    {
      v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E1F4B348, 0);
    }
    else
    {
      if ((id)_MergedGlobals_66 != v10)
      {
        v12 = objc_alloc_init(NSFetchRequest);
        -[NSFetchRequest setEntity:](v12, "setEntity:", objc_msgSend(a3, "entity"));
        v13 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
        v14 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a3);
        v15 = objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v13, v14, 0, 4, 0);
        v16 = (void *)MEMORY[0x1E0CB3528];
        -[NSFetchRequest setPredicate:](v12, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v15, v11, 0)));
        v17 = -[NSXPCStoreServerRequestHandlingPolicy _coreProcessFetchRequest:fromClientWithContext:error:](self, v12, a4, &v48);
        v18 = 1;
        goto LABEL_30;
      }
      v20 = (void *)MEMORY[0x1E0C99D20];
      if (self)
      {
        v21 = (void *)objc_msgSend(a4, "managedObjectContext");
        v22 = (void *)objc_msgSend(v21, "persistentStoreCoordinator");
        if (a4)
          v23 = *((_QWORD *)a4 + 4);
        else
          v23 = 0;
        v62 = 0;
        v63 = &v62;
        v64 = 0x3052000000;
        v65 = __Block_byref_object_copy__1;
        v66 = __Block_byref_object_dispose__1;
        v67 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x3052000000;
        v59 = __Block_byref_object_copy__1;
        v60 = __Block_byref_object_dispose__1;
        v61 = 0;
        v50 = 0;
        v51 = &v50;
        v52 = 0x3052000000;
        v53 = __Block_byref_object_copy__1;
        v54 = __Block_byref_object_dispose__1;
        v55 = 0;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __95__NSXPCStoreServerRequestHandlingPolicy__coreFaultForObjectWithID_fromClientWithContext_error___block_invoke;
        v49[3] = &unk_1E1EDD4A8;
        v49[4] = v23;
        v49[5] = a3;
        v49[6] = v21;
        v49[7] = &v62;
        v49[8] = &v50;
        v49[9] = &v56;
        objc_msgSend(v22, "performBlockAndWait:", v49);
        v24 = (id)v51[5];
        if (v63[5])
        {
          v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v26 = objc_msgSend((id)objc_msgSend(a3, "entity"), "_propertyRangesByType");
          v33 = v26;
          v34 = *(_QWORD *)(v26 + 56);
          if (v34)
          {
            v35 = *(_QWORD *)(v26 + 48);
            do
            {
              snapshot_get_value_as_object((id *)v57[5], v35, v27, v28, v29, v30, v31, v32);
              v37 = v36;
              if (!v36)
                v37 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
              objc_msgSend(v25, "addObject:", v37);
              LODWORD(v35) = v35 + 1;
              --v34;
            }
            while (v34);
          }
          v38 = *(_QWORD *)(v33 + 104);
          if (v38)
          {
            v39 = *(_QWORD *)(v33 + 96);
            do
            {
              snapshot_get_value_as_object((id *)v57[5], v39, v27, v28, v29, v30, v31, v32);
              v41 = v40;
              if (!v40)
                v41 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
              objc_msgSend(v25, "addObject:", v41);
              LODWORD(v39) = v39 + 1;
              --v38;
            }
            while (v38);
          }
          objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(int *)(v57[5] + 12)));
        }
        else
        {
          v25 = 0;
        }
        if (v51[5])
          v48 = (id)v51[5];

        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v62, 8);
      }
      else
      {
        v25 = 0;
      }
      v19 = objc_msgSend(v20, "arrayWithObjects:", &unk_1E1F4B348, v25, 0);
    }
    v17 = (id)v19;
    v18 = 0;
    v16 = (void *)v19;
    goto LABEL_30;
  }
  v17 = 0;
  v18 = 0;
  v16 = 0;
  if (a5)
    v48 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134092, 0);
LABEL_30:
  v42 = v17;
  v43 = v48;
  if (a5 && v48)
    *a5 = v48;
  objc_msgSend(v9, "drain");
  v44 = v48;
  v45 = 0;
  v46 = v17;
  if (v18)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E1F4B360, v17, 0);
  return v16;
}

- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  NSFetchRequest *v45;
  int v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  _QWORD v73[2];
  _QWORD v74[3];

  v74[2] = *MEMORY[0x1E0C80C00];
  v72 = 0;
  v71 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (!self)
  {
    v51 = 0;
    goto LABEL_42;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v12 = objc_msgSend(a4, "entity");
  if (v12)
  {
    if ((*(_BYTE *)(v12 + 120) & 4) != 0)
    {
      v13 = *(_QWORD *)(v12 + 72);
    }
    else
    {
      do
      {
        v13 = v12;
        v12 = objc_msgSend((id)v12, "superentity");
      }
      while (v12);
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", v13, a5);
  if (!v14)
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134092, 0);
LABEL_15:
    v16 = (void *)v18;
    v15 = 0;
    goto LABEL_19;
  }
  v15 = (void *)objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "existingObjectWithID:error:", a4, 0);
  if (!v15)
  {
    if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      _NSCoreDataLog(8, (uint64_t)CFSTR("Source object %@ does not exist for relationship fault."), v19, v20, v21, v22, v23, v24, (uint64_t)a4);
    v18 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134093, 0);
    goto LABEL_15;
  }
  if ((objc_msgSend(v14, "evaluateWithObject:", v15) & 1) != 0)
  {
    v16 = 0;
    v17 = 1;
    goto LABEL_20;
  }
  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("Source object does not match restricting predicate, so returning an error"), v25, v26, v27, v28, v29, v30, v69);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134093, 0);
LABEL_19:
  v17 = 0;
LABEL_20:
  v31 = v16;
  v32 = v15;
  objc_msgSend(v11, "drain");
  if (v16)
    v72 = v16;
  v33 = v16;
  if (!v17)
    goto LABEL_41;
  v34 = v15;
  if (!v34)
    goto LABEL_41;
  v70 = (void *)objc_msgSend(a5, "managedObjectContext");
  v35 = -[NSEntityDescription _relationshipNamed:]((_QWORD *)objc_msgSend(a4, "entity"), (uint64_t)a3);
  v36 = v35;
  if (v35)
  {
    v37 = objc_msgSend(v35, "destinationEntity");
    v38 = v37;
    if (v37)
    {
      if ((*(_BYTE *)(v37 + 120) & 4) != 0)
      {
        v39 = *(_QWORD *)(v37 + 72);
      }
      else
      {
        do
        {
          v39 = v37;
          v37 = objc_msgSend((id)v37, "superentity");
        }
        while (v37);
      }
    }
    else
    {
      v39 = 0;
    }
    v43 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", v39, a5);
    if (v43)
    {
      if ((id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1) == v43)
      {
        v57 = (void *)objc_msgSend(v34, "valueForKey:", a3);
        if (v57)
        {
          v58 = objc_msgSend(v57, "valueForKey:", CFSTR("objectID"));
          goto LABEL_70;
        }
        if ((objc_msgSend(v36, "isToMany") & 1) != 0)
        {
LABEL_51:
          v58 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
          goto LABEL_70;
        }
      }
      else
      {
        if ((id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0) != v43)
        {
          v44 = (void *)objc_msgSend(v36, "inverseRelationship");
          v45 = objc_alloc_init(NSFetchRequest);
          -[NSFetchRequest setResultType:](v45, "setResultType:", 1);
          -[NSFetchRequest setIncludesPropertyValues:](v45, "setIncludesPropertyValues:", 0);
          if (v44)
          {
            v46 = objc_msgSend(v44, "isToMany");
            v47 = (void *)MEMORY[0x1E0CB3880];
            if (v46)
            {
              v48 = (void *)objc_msgSend(v44, "name");
              v49 = CFSTR("%@ IN %K");
              v50 = a4;
              a4 = v48;
            }
            else
            {
              v50 = (id)objc_msgSend(v44, "name");
              v49 = CFSTR("%K == %@");
            }
            v65 = objc_msgSend(v47, "predicateWithFormat:", v49, v50, a4);
            v66 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v65, v43, 0);
            v67 = objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v66);
            -[NSFetchRequest setEntity:](v45, "setEntity:", v38);
            -[NSFetchRequest setPredicate:](v45, "setPredicate:", v67);
          }
          else
          {
            if (a5)
              v59 = (void *)*((_QWORD *)a5 + 4);
            else
              v59 = 0;
            v60 = (void *)objc_msgSend(v59, "newValueForRelationship:forObjectWithID:withContext:error:", v36, a4, v70, &v72);
            if (!v60 || (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v60)
            {
              v64 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:](self, "restrictingReadPredicateForEntity:fromClientWithContext:", v38, a5);
            }
            else
            {
              if (objc_msgSend(v36, "isToMany"))
                v61 = CFSTR("self IN %@");
              else
                v61 = CFSTR("self == %@");
              v62 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v61, v60);
              v63 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v62, v43, 0);
              v64 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v63);
            }
            v68 = v64;
            -[NSFetchRequest setEntity:](v45, "setEntity:", v38);
            -[NSFetchRequest setPredicate:](v45, "setPredicate:", v68);

          }
          -[NSFetchRequest setResultType:](v45, "setResultType:", 1);
          v51 = (void *)objc_msgSend(v70, "executeFetchRequest:error:", v45, &v72);
          if ((objc_msgSend(v36, "isToMany") & 1) != 0)
            goto LABEL_71;
          if (objc_msgSend(v51, "count"))
            v58 = objc_msgSend(v51, "lastObject");
          else
            v58 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
LABEL_70:
          v51 = (void *)v58;
LABEL_71:
          LODWORD(self) = 1;
          goto LABEL_42;
        }
        if (objc_msgSend(v36, "isToMany"))
          goto LABEL_51;
      }
      v58 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      goto LABEL_70;
    }
    if (a6)
    {
      v42 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134092, 0);
      goto LABEL_40;
    }
LABEL_41:
    v51 = 0;
    LODWORD(self) = 0;
    goto LABEL_42;
  }
  if (!a6)
    goto LABEL_41;
  v40 = (void *)MEMORY[0x1E0CB35C8];
  v73[0] = CFSTR("relationship name");
  v73[1] = CFSTR("objectID");
  v74[0] = a3;
  v74[1] = a4;
  v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
  v42 = (void *)objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134094, v41);
LABEL_40:
  v51 = 0;
  LODWORD(self) = 0;
  v72 = v42;
LABEL_42:
  v52 = v51;
  v53 = v72;
  objc_msgSend(v71, "drain");
  v54 = v72;
  if (a6 && v72)
    *a6 = v72;
  v55 = v54;
  if ((_DWORD)self)
    return v51;
  else
    return 0;
}

id __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke(uint64_t a1)
{
  id result;

  result = -[NSSQLCore newObjectIDSetsForToManyPrefetchingRequest:andSourceObjectIDs:orderColumnName:](*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

void __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("Decoding prefetched rows for fetch %@"), v2, v3, v4, v5, v6, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = -[NSSQLCore _newRowDataForXPCFetch:variables:context:error:](*(NSError **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)+ 40), *(_QWORD *)(a1 + 40), 0);
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40) = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 40), *(NSFetchRequest **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 40), 0, *(NSPersistentStore **)(a1 + 32), *(NSManagedObjectContext **)(a1 + 40), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8)+ 40), 0);
    -[NSSQLCore _cacheRows:](*(_QWORD **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
    else
      v8 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40) = v8;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count"))
    {
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "entity");
        _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetched %@/%@ and got %@"), v10, v11, v12, v13, v14, v15, v9);
      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40))
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v17)
        {
          v18 = 0;
          v19 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v29 != v19)
                objc_enumerationMutation(v16);
              _PFFaultHandlerFulfillFault(*(_QWORD *)(a1 + 64), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), *(_QWORD *)(a1 + 40), (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "objectAtIndex:", v18 + i), 0);
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            v18 += i;
          }
          while (v17);
        }
      }
    }
    else
    {
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "entity");
        _NSCoreDataLog(8, (uint64_t)CFSTR("Prefetched %@/%@ and got no results, stopping now"), v22, v23, v24, v25, v26, v27, v21);
      }

      -[NSSQLCore _uncacheRows:](*(_QWORD **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = 1;
    }
  }
}

_QWORD *__141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_71(uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(_QWORD **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

_QWORD *__141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_79(uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(_QWORD **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)processObtainRequest:(void *)a3 inContext:(_QWORD *)a4 error:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id i;
  NSManagedObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *context;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v39 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  context = (void *)MEMORY[0x18D76B4E4]();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = a2;
  v38 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v38)
  {
    v5 = 0;
    v36 = *(_QWORD *)v43;
    v35 = *MEMORY[0x1E0CB28A8];
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend(obj, "objectForKey:", v7);
        v50 = 0;
        v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        v10 = (void *)objc_msgSend(a3, "managedObjectContext");
        v11 = objc_msgSend((id)objc_msgSend(v10, "persistentStoreCoordinator"), "managedObjectModel");
        if (!v11)
        {
          v13 = 0;
LABEL_38:
          v14 = 0;
          goto LABEL_13;
        }
        v12 = objc_msgSend(*(id *)(v11 + 32), "objectForKey:", v7);
        v13 = v12;
        if (!v12)
          goto LABEL_38;
        if ((*(_BYTE *)(v12 + 120) & 4) != 0)
        {
          v14 = *(_QWORD *)(v12 + 72);
        }
        else
        {
          do
          {
            v14 = v12;
            v12 = objc_msgSend((id)v12, "superentity");
          }
          while (v12);
        }
LABEL_13:
        v15 = objc_msgSend(a1, "restrictingWritePredicateForEntity:fromClientWithContext:", v14, a3);
        if (!v15)
        {
          v24 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v35, 134092, 0);
LABEL_28:
          v23 = 0;
          v25 = 0;
          v50 = v24;
          goto LABEL_31;
        }
        if (objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0) == v15)
        {
          v24 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v35, 134030, 0);
          goto LABEL_28;
        }
        v16 = objc_msgSend(v8, "unsignedIntegerValue");
        for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); v16; --v16)
        {
          v18 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([NSManagedObject alloc], "initWithEntity:insertIntoManagedObjectContext:", v13, v10);
          objc_msgSend(i, "addObject:", v18);

        }
        if (objc_msgSend(v10, "obtainPermanentIDsForObjects:error:", i, &v50))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v20 = objc_msgSend(i, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v47 != v21)
                  objc_enumerationMutation(i);
                objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "objectID"));
              }
              v20 = objc_msgSend(i, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
            }
            while (v20);
          }
          v23 = v19;
        }
        else
        {
          v23 = 0;
        }

        v25 = 1;
LABEL_31:
        v26 = v50;
        objc_msgSend(v9, "drain");
        if (v50)
          v5 = v50;
        v27 = v50;
        if ((v25 & 1) == 0 || (v28 = v23) == 0)
        {
          v39 = 0;
          goto LABEL_43;
        }
        objc_msgSend(v39, "setValue:forKey:", v28, v7);
        ++v6;
      }
      while (v6 != v38);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      v38 = v29;
      if (!v29)
        goto LABEL_43;
    }
  }
  v5 = 0;
LABEL_43:
  v30 = v5;
  objc_autoreleasePoolPop(context);
  v31 = v5;
  if (a4 && v5)
    *a4 = v5;
  return v39;
}

@end
