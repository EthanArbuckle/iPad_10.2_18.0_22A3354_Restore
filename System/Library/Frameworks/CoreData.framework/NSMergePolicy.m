@implementation NSMergePolicy

uint64_t __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  NSFetchRequest *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(_QWORD **)(a1 + 32);
  v4 = objc_alloc_init(NSFetchRequest);
  -[NSFetchRequest setEntity:](v4, "setEntity:", v3);
  -[NSFetchRequest setIncludesSubentities:](v4, "setIncludesSubentities:", 1);
  -[NSFetchRequest setIncludesPendingChanges:](v4, "setIncludesPendingChanges:", 0);
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v4, "setRelationshipKeyPathsForPrefetching:", -[NSEntityDescription _keypathsForDeletions](v3));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 40)));
  v7 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v4, &v7);
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v5);

  return objc_msgSend(v2, "drain");
}

+ (void)initialize
{
  if ((_MergedGlobals_78 & 1) == 0)
  {
    _MergedGlobals_78 = 1;
    objc_opt_self();
    dword_1ECD8DA5C = _CFExecutableLinkedOnOrAfter() == 0;
    NSErrorMergePolicy = -[NSMergePolicy initWithMergeType:]([NSMergePolicy alloc], "initWithMergeType:", 0);
    NSMergeByPropertyStoreTrumpMergePolicy = -[NSMergePolicy initWithMergeType:]([NSMergePolicy alloc], "initWithMergeType:", 1);
    NSMergeByPropertyObjectTrumpMergePolicy = -[NSMergePolicy initWithMergeType:]([NSMergePolicy alloc], "initWithMergeType:", 2);
    NSOverwriteMergePolicy = -[NSMergePolicy initWithMergeType:]([NSMergePolicy alloc], "initWithMergeType:", 3);
    NSRollbackMergePolicy = -[NSMergePolicy initWithMergeType:]([NSMergePolicy alloc], "initWithMergeType:", 4);
  }
}

- (id)initWithMergeType:(NSMergePolicyType)ty
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSMergePolicy;
  result = -[NSMergePolicy init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = ty;
  return result;
}

- (void)dealloc
{
  NSMergePolicy *v6;
  objc_super v7;

  if (NSMergeByPropertyStoreTrumpMergePolicy == self
    || NSMergeByPropertyObjectTrumpMergePolicy == self
    || NSOverwriteMergePolicy == self
    || NSRollbackMergePolicy == self
    || NSErrorMergePolicy == self)
  {
    v6 = self;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSMergePolicy;
    -[NSMergePolicy dealloc](&v7, sel_dealloc);
  }
}

uint64_t __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  if (objc_msgSend(*(id *)(a1 + 32), "concurrencyType", MEMORY[0x1E0C809B0], 3221225472, __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2, &unk_1E1EDE730, a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)))
  {
    return objc_msgSend(*(id *)(a1 + 32), "performBlockAndWait:", &v5);
  }
  else
  {
    return __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2((uint64_t)&v5);
  }
}

- (uint64_t)_byPropertyObjectTrumpResolveConstraintConflict:(void *)a1
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;

  v2 = (_QWORD *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  v3 = (void *)objc_msgSend(a1, "databaseObject");
  v48 = objc_msgSend(v2, "isInserted");
  v44 = (void *)objc_msgSend(v2, "managedObjectContext");
  v4 = objc_msgSend(v2, "entity");
  v5 = (_QWORD *)v4;
  v45 = v4;
  if (v4)
  {
    v6 = objc_msgSend(*(id *)(v4 + 104), "keys");
    v5 = (_QWORD *)v5[14];
  }
  else
  {
    v6 = objc_msgSend(0, "keys");
  }
  v7 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v2 && (v8 = v2[6]) != 0)
    v9 = *(void **)(v8 + 8);
  else
    v9 = 0;
  v10 = v5[6];
  v11 = v5[7];
  if (v10 < v11 + v10)
  {
    v12 = (_QWORD *)(v6 + 8 * v10);
    do
    {
      v13 = objc_msgSend(v9, "valueForKey:", *v12);
      v14 = objc_msgSend(v2, "valueForKey:", *v12);
      if (v7 == v14)
        v15 = 0;
      else
        v15 = v14;
      if ((v48 & 1) != 0
        || (v7 != v13 ? (v16 = (void *)v13) : (v16 = 0), (objc_msgSend(v16, "isEqual:", v15) & 1) == 0))
      {
        objc_msgSend(v3, "setValue:forKey:", v15, *v12);
      }
      ++v12;
      --v11;
    }
    while (v11);
  }
  v17 = v5[12];
  v18 = v5[13];
  if (v17 < v18 + v17)
  {
    v19 = 8 * v17;
    v46 = v2;
    v47 = v9;
    v42 = v3;
    while (1)
    {
      v20 = objc_msgSend(v9, "valueForKey:", *(_QWORD *)(v6 + v19));
      if (v7 == v20)
        v21 = 0;
      else
        v21 = (void *)v20;
      v22 = (void *)objc_msgSend(v2, "valueForKey:", *(_QWORD *)(v6 + v19));
      v23 = v22;
      if ((void *)v7 == v22)
        v24 = 0;
      else
        v24 = objc_msgSend(v22, "objectID");
      if ((v48 & 1) == 0 && (objc_msgSend(v21, "isEqual:", v24) & 1) != 0)
        goto LABEL_52;
      v25 = v3;
      v26 = (void *)objc_msgSend(v3, "valueForKey:", *(_QWORD *)(v6 + v19));
      v27 = *(void **)(*(_QWORD *)(v45 + 96) + 24 + v19);
      v28 = (void *)objc_msgSend(v27, "inverseRelationship");
      v29 = objc_msgSend(v28, "name");
      v30 = objc_msgSend(v28, "isToMany");
      if (!v26)
      {
        if (v28)
        {
          if (v30)
          {
            v37 = objc_msgSend(v28, "isOrdered");
            v38 = objc_msgSend(v28, "name");
            if (v37)
              v39 = (void *)objc_msgSend(v23, "mutableOrderedSetValueForKey:", v38);
            else
              v39 = (void *)objc_msgSend(v23, "mutableSetValueForKey:", v38);
            v40 = v39;
            objc_msgSend(v39, "addObject:", v25);
            objc_msgSend(v40, "removeObject:", v46);
          }
          else
          {
            objc_msgSend(v23, "setValue:forKey:", v25, v29);
          }
        }
        goto LABEL_51;
      }
      if (v28)
        break;
LABEL_47:
      if (objc_msgSend(v27, "deleteRule") == 2)
        objc_msgSend(v44, "deleteObject:", v26);
LABEL_51:
      objc_msgSend(v46, "setValue:forKey:", 0, *(_QWORD *)(v6 + v19));
      v3 = v25;
      v2 = v46;
      objc_msgSend(v3, "setValue:forKey:", v23, *(_QWORD *)(v6 + v19));
LABEL_52:
      v19 += 8;
      --v18;
      v9 = v47;
      if (!v18)
        goto LABEL_53;
    }
    if (!v30)
    {
      objc_msgSend(v23, "setValue:forKey:", v25, v29);
      objc_msgSend(v26, "setValue:forKey:", 0, v29);
      goto LABEL_47;
    }
    v31 = objc_msgSend(v28, "isOrdered");
    v32 = objc_msgSend(v28, "name");
    if (v31)
    {
      v43 = objc_msgSend(v26, "mutableOrderedSetValueForKey:", v32);
      v33 = (void *)objc_msgSend(v23, "mutableOrderedSetValueForKey:", objc_msgSend(v28, "name"));
      if ((objc_msgSend(v33, "containsObject:", v25) & 1) == 0)
      {
        v34 = objc_msgSend(v33, "indexOfObject:", v46);
        if (v34 < objc_msgSend(v33, "count"))
          objc_msgSend(v33, "replaceObjectAtIndex:withObject:", v34, v25);
        v35 = (void *)v43;
        v36 = v25;
        goto LABEL_46;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v26, "mutableSetValueForKey:", v32), "removeObject:", v25);
      v33 = (void *)objc_msgSend(v23, "mutableSetValueForKey:", objc_msgSend(v28, "name"));
      objc_msgSend(v33, "addObject:", v42);
    }
    v35 = v33;
    v36 = v46;
LABEL_46:
    objc_msgSend(v35, "removeObject:", v36);
    goto LABEL_47;
  }
LABEL_53:
  -[NSMergePolicy _mergeToManyRelationshipsForObject:ontoObject:](v2, v3);
  return objc_msgSend(v44, "deleteObject:", v2);
}

- (NSMergePolicyType)mergeType
{
  return self->_type;
}

+ (NSMergePolicy)mergeByPropertyObjectTrumpMergePolicy
{
  return (NSMergePolicy *)NSMergeByPropertyObjectTrumpMergePolicy;
}

uint64_t __40__NSMergePolicy_resolveConflicts_error___block_invoke_2()
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __40__NSMergePolicy_resolveConflicts_error___block_invoke()
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)resolveConflicts:(NSArray *)list error:(NSError *)error
{
  NSArray *v7;
  NSArray *v8;
  _BOOL4 v9;

  v7 = -[NSArray filteredArrayUsingPredicate:](list, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_10));
  v8 = -[NSArray filteredArrayUsingPredicate:](list, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_197));
  if ((!-[NSArray count](v7, "count")
     || (v9 = -[NSMergePolicy resolveOptimisticLockingVersionConflicts:error:](self, "resolveOptimisticLockingVersionConflicts:error:", v7, error)))&& (!-[NSArray count](v8, "count")|| (v9 = -[NSMergePolicy resolveConstraintConflicts:error:](self, "resolveConstraintConflicts:error:", v8, error))))
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (uint64_t)_overwriteResolveConstraintConflict:(void *)a1
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "databaseObject");
  -[NSMergePolicy _mergeToManyUnionRelationshipsForObject:andObject:]((void *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject"), (void *)objc_msgSend(a1, "databaseObject"));
  return objc_msgSend((id)objc_msgSend(v2, "managedObjectContext"), "deleteObject:", v2);
}

- (BOOL)resolveConstraintConflicts:(NSArray *)list error:(NSError *)error
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __CFDictionary *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  void *v44;
  NSManagedObject *v45;
  _QWORD *p_isa;
  unint64_t v47;
  void *v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  NSArray *v65;
  NSArray *v66;
  NSDictionary *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t jj;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t kk;
  void *v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t mm;
  void *v92;
  uint64_t v93;
  void *v94;
  unint64_t type;
  NSArray *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  _QWORD *v106;
  unint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  int v131;
  int v132;
  uint64_t v133;
  void *v134;
  NSArray *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t nn;
  _QWORD *v139;
  id v140;
  id v141;
  BOOL result;
  id v143;
  id v144;
  void *v145;
  uint64_t v146;
  NSError *v147;
  NSError **v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  NSMergePolicy *v153;
  char v154;
  NSConstraintConflict *v155;
  NSArray *v156;
  uint64_t v157;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  _QWORD *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _QWORD v172[6];
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  id v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  const __CFString *v194;
  NSArray *v195;
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[5];
  uint8_t v199[128];
  uint8_t buf[4];
  uint64_t v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _QWORD v206[5];
  uint64_t v207;
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v181 = 0;
  if (!-[NSArray count](list, "count"))
    return 1;
  v153 = self;
  if (!self->_type)
    goto LABEL_251;
  v148 = error;
  v149 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (objc_msgSend(-[NSArray firstObject](list, "firstObject"), "_isDBConflict"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](list, "countByEnumeratingWithState:objects:count:", &v177, v198, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v178;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v178 != v9)
            objc_enumerationMutation(list);
          v11 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * i);
          v173 = 0u;
          v174 = 0u;
          v175 = 0u;
          v176 = 0u;
          v12 = (void *)objc_msgSend(v11, "conflictingObjects");
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v173, v197, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v174;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v174 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * j);
                objc_msgSend(v6, "addObject:", objc_msgSend(v16, "objectID"));
                if (!v8)
                  v8 = objc_msgSend(v16, "managedObjectContext");
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v173, v197, 16);
            }
            while (v13);
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](list, "countByEnumeratingWithState:objects:count:", &v177, v198, 16);
      }
      while (v7);
      if (v8)
      {
        v17 = +[_PFRoutines createDictionaryPartitioningObjectsIDByRootEntity:]((uint64_t)_PFRoutines, (uint64_t)v6);
        v206[0] = 0;
        v206[1] = v206;
        v206[2] = 0x3052000000;
        v206[3] = __Block_byref_object_copy__15;
        v206[4] = __Block_byref_object_dispose__15;
        v207 = 0;
        v207 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v172[0] = MEMORY[0x1E0C809B0];
        v172[1] = 3221225472;
        v172[2] = __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke;
        v172[3] = &unk_1E1EDDA00;
        v172[4] = v8;
        v172[5] = v206;
        -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v172);

        _Block_object_dispose(v206, 8);
      }
    }
  }
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](list, "countByEnumeratingWithState:objects:count:", &v168, v196, 16);
  if (!v18)
    goto LABEL_245;
  v150 = *MEMORY[0x1E0CB28A8];
  v151 = *(_QWORD *)v169;
LABEL_24:
  v161 = 0;
  v152 = v18;
  while (1)
  {
    if (*(_QWORD *)v169 != v151)
      objc_enumerationMutation(list);
    if (!v153)
      break;
    v19 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v161);
    if (objc_msgSend(v19, "_isDBConflict"))
    {
      v20 = (_QWORD *)objc_msgSend(v19, "databaseObject");
      v21 = (void *)objc_msgSend((id)objc_msgSend(v19, "conflictingObjects"), "lastObject");
      if ((objc_msgSend(v21, "isDeleted") & 1) != 0 || (objc_msgSend(v20, "isDeleted") & 1) != 0)
        goto LABEL_76;
      v166 = (id)objc_msgSend(v19, "constraint");
      v22 = (void *)objc_msgSend(v19, "databaseSnapshot");
      if (v20 && (v23 = v20[6]) != 0)
        v164 = *(void **)(v23 + 8);
      else
        v164 = 0;
      v192 = 0u;
      v193 = 0u;
      v190 = 0u;
      v191 = 0u;
      v50 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v191;
        do
        {
          for (k = 0; k != v50; ++k)
          {
            if (*(_QWORD *)v191 != v51)
              objc_enumerationMutation(v166);
            v53 = *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * k);
            v54 = (void *)objc_msgSend(v21, "valueForKey:", v53);
            v55 = (void *)objc_msgSend(v22, "valueForKey:", v53);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if ((objc_msgSend((id)objc_msgSend(v54, "objectID"), "isEqual:", v55) & 1) == 0)
                  goto LABEL_76;
              }
              else
              {
                v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Got non-object value back for property '%@' which returned an objectID from the snapshot.");
                _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, v53);
                v63 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v201 = v53;
                  _os_log_fault_impl(&dword_18A253000, v63, OS_LOG_TYPE_FAULT, "CoreData: Got non-object value back for property '%@' which returned an objectID from the snapshot.", buf, 0xCu);
                }
              }
            }
            else if ((objc_msgSend(v54, "isEqual:", v55) & 1) == 0
                   && (!objc_msgSend(v54, "isNSString")
                    || !+[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)_PFRoutines, v54, v55)))
            {
              goto LABEL_76;
            }
            if (objc_msgSend(v20, "hasChanges"))
            {
              v64 = (void *)objc_msgSend(v20, "valueForKey:", v53);
              if ((objc_msgSend(v64, "isEqual:", objc_msgSend(v164, "valueForKey:", v53)) & 1) == 0
                && (objc_msgSend(v64, "isEqual:", v54) & 1) == 0
                && (!objc_msgSend(v64, "isNSString")
                 || !+[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)_PFRoutines, v54, v64)))
              {
                goto LABEL_76;
              }
            }
          }
          v50 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
        }
        while (v50);
      }
      v155 = v19;
    }
    else
    {
      v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_msgSend(v19, "constraintValues");
      v192 = 0u;
      v193 = 0u;
      v190 = 0u;
      v191 = 0u;
      v26 = (void *)objc_msgSend(v19, "conflictingObjects");
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v191;
        do
        {
          for (m = 0; m != v27; ++m)
          {
            if (*(_QWORD *)v191 != v28)
              objc_enumerationMutation(v26);
            v30 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * m);
            if ((objc_msgSend(v30, "isDeleted") & 1) == 0
              && -[NSMergePolicy _valuesOnObject:matchAgainstValues:]((uint64_t)v30, v25))
            {
              objc_msgSend(v24, "addObject:", v30);
            }
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
        }
        while (v27);
      }
      if ((unint64_t)objc_msgSend(v24, "count") < 2)
        goto LABEL_76;
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v188 = 0u;
      v189 = 0u;
      v186 = 0u;
      v187 = 0u;
      v32 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v186, &v202, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v187;
        do
        {
          for (n = 0; n != v32; ++n)
          {
            if (*(_QWORD *)v187 != v33)
              objc_enumerationMutation(v24);
            v35 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * n);
            if (!v35 || (v36 = *(_QWORD *)(v35 + 48)) == 0 || (v37 = *(_QWORD *)(v36 + 8)) == 0)
              v37 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
            objc_msgSend(v31, "addObject:", v37);
          }
          v32 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v186, &v202, 16);
        }
        while (v32);
      }
      v155 = -[NSConstraintConflict initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:]([NSConstraintConflict alloc], "initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:", objc_msgSend(v19, "constraint"), 0, 0, v24, v31);

    }
    if (!v155)
      goto LABEL_76;
    v38 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    v39 = -[NSConstraintConflict conflictingObjects](v155, "conflictingObjects");
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v182, v199, 16);
    if (!v40)
      goto LABEL_73;
    v41 = 0;
    v42 = *(_QWORD *)v183;
    do
    {
      for (ii = 0; ii != v40; ++ii)
      {
        if (*(_QWORD *)v183 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * ii);
        if (!v41)
          v41 = objc_msgSend(*(id *)(*((_QWORD *)&v182 + 1) + 8 * ii), "managedObjectContext");
        objc_msgSend(v38, "addObject:", objc_msgSend(v44, "entity"));
      }
      v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v182, v199, 16);
    }
    while (v40);
    if (!v41)
    {
LABEL_73:
      v48 = &unk_1E1F4AB88;
      goto LABEL_74;
    }
    v45 = -[NSConstraintConflict databaseObject](v155, "databaseObject");
    p_isa = &v45->super.isa;
    if (v45)
      objc_msgSend(v38, "addObject:", -[NSManagedObject entity](v45, "entity"));
    v47 = objc_msgSend(v38, "count");
    v48 = &unk_1E1F4ABB0;
    if (v47 > 1)
      goto LABEL_74;
    if ((-[NSEntityDescription _isPathologicalForConstraintMerging:](objc_msgSend(v38, "anyObject"), &v181) & 1) == 0)
    {
      if (-[NSConstraintConflict _isDBConflict](v155, "_isDBConflict"))
      {
        switch(v153->_type)
        {
          case 1uLL:
            -[NSMergePolicy _byPropertyStoreTrumpResolveConstraintConflict:](v155);
            goto LABEL_145;
          case 2uLL:
            -[NSMergePolicy _byPropertyObjectTrumpResolveConstraintConflict:](v155);
            goto LABEL_145;
          case 3uLL:
            -[NSMergePolicy _overwriteResolveConstraintConflict:](v155);
            goto LABEL_145;
          case 4uLL:
            -[NSMergePolicy _rollbackResolveConstraintConflict:](v155);
LABEL_145:
            v87 = 1;
            break;
          default:
            v87 = 0;
            break;
        }
        goto LABEL_239;
      }
      v65 = -[NSConstraintConflict conflictingObjects](v155, "conflictingObjects");
      v66 = -[NSConstraintConflict conflictingSnapshots](v155, "conflictingSnapshots");
      v67 = -[NSConstraintConflict constraintValues](v155, "constraintValues");
      v68 = -[NSArray count](-[NSConstraintConflict conflictingSnapshots](v155, "conflictingSnapshots"), "count");
      if (!v68)
        goto LABEL_115;
      v69 = 0;
      p_isa = 0;
      while (2)
      {
        v70 = -[NSArray objectAtIndex:](v66, "objectAtIndex:", v69);
        if (objc_msgSend(MEMORY[0x1E0C99E38], "null") == v70
          && (objc_msgSend(-[NSArray objectAtIndex:](v65, "objectAtIndex:", v69), "hasChanges") & 1) == 0)
        {
          p_isa = -[NSArray objectAtIndex:](v65, "objectAtIndex:", v69);
LABEL_110:
          if (v68 == ++v69)
            goto LABEL_114;
          continue;
        }
        break;
      }
      if (!-[NSMergePolicy _valuesOnObject:matchAgainstValues:](v70, v67))
        goto LABEL_110;
      p_isa = -[NSArray objectAtIndex:](v65, "objectAtIndex:", v69);
LABEL_114:
      if (p_isa)
        goto LABEL_165;
LABEL_115:
      v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v188 = 0u;
      v189 = 0u;
      v186 = 0u;
      v187 = 0u;
      v73 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v186, &v202, 16);
      if (v73)
      {
        v74 = *(_QWORD *)v187;
        do
        {
          for (jj = 0; jj != v73; ++jj)
          {
            if (*(_QWORD *)v187 != v74)
              objc_enumerationMutation(v65);
            v76 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * jj);
            if (objc_msgSend(v76, "isInserted"))
              v77 = v72;
            else
              v77 = v71;
            objc_msgSend(v77, "addObject:", v76);
          }
          v73 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v186, &v202, 16);
        }
        while (v73);
      }
      v78 = objc_msgSend(v71, "count");
      if (!v78)
      {
        v79 = objc_msgSend(v72, "firstObject");
LABEL_163:
        p_isa = (_QWORD *)v79;
        goto LABEL_164;
      }
      if (v78 == 1)
      {
        v79 = objc_msgSend(v71, "lastObject");
        goto LABEL_163;
      }
      v80 = (void *)objc_msgSend((id)objc_msgSend(v71, "firstObject"), "objectID");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v192 = 0u;
        v193 = 0u;
        v190 = 0u;
        v191 = 0u;
        v81 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
        if (v81)
        {
          p_isa = 0;
          v82 = *(_QWORD *)v191;
          v83 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (kk = 0; kk != v81; ++kk)
            {
              if (*(_QWORD *)v191 != v82)
                objc_enumerationMutation(v71);
              v85 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * kk);
              v86 = objc_msgSend((id)objc_msgSend(v85, "objectID"), "_referenceData64");
              if (v83 > v86)
                p_isa = v85;
              if (v83 >= v86)
                v83 = v86;
            }
            v81 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
          }
          while (v81);
          goto LABEL_164;
        }
LABEL_241:
        p_isa = 0;
        goto LABEL_164;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v80, "_referenceData"), (objc_opt_respondsToSelector() & 1) == 0))
      {
        v79 = objc_msgSend(v71, "firstObject");
        goto LABEL_163;
      }
      v192 = 0u;
      v193 = 0u;
      v190 = 0u;
      v191 = 0u;
      v88 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
      if (!v88)
        goto LABEL_241;
      p_isa = 0;
      v89 = 0;
      v90 = *(_QWORD *)v191;
      do
      {
        for (mm = 0; mm != v88; ++mm)
        {
          if (*(_QWORD *)v191 != v90)
            objc_enumerationMutation(v71);
          v92 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * mm);
          v93 = objc_msgSend((id)objc_msgSend(v92, "objectID"), "_referenceData");
          if (v89)
          {
            v94 = (void *)v93;
            if (objc_msgSend(v89, "compare:", v93) != -1)
            {
              p_isa = v92;
              v89 = v94;
            }
          }
          else
          {
            v89 = (void *)objc_msgSend((id)objc_msgSend(v92, "objectID"), "_referenceData");
          }
        }
        v88 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
      }
      while (v88);
LABEL_164:

LABEL_165:
      type = v153->_type;
      if (type - 3 < 2)
      {
        v202 = 0u;
        v203 = 0u;
        v204 = 0u;
        v205 = 0u;
        v135 = -[NSConstraintConflict conflictingObjects](v155, "conflictingObjects");
        v136 = -[NSArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v202, v206, 16);
        if (v136)
        {
          v137 = *(_QWORD *)v203;
          do
          {
            for (nn = 0; nn != v136; ++nn)
            {
              if (*(_QWORD *)v203 != v137)
                objc_enumerationMutation(v135);
              v139 = *(_QWORD **)(*((_QWORD *)&v202 + 1) + 8 * nn);
              if (v139 != p_isa)
                objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v202 + 1) + 8 * nn), "managedObjectContext"), "deleteObject:", v139);
            }
            v136 = -[NSArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v202, v206, 16);
          }
          while (v136);
        }
LABEL_237:
        v87 = 1;
        goto LABEL_239;
      }
      if (type - 1 <= 1)
      {
        v96 = -[NSConstraintConflict conflictingObjects](v155, "conflictingObjects");
        v205 = 0u;
        v204 = 0u;
        v203 = 0u;
        v202 = 0u;
        v97 = -[NSArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v202, v206, 16);
        if (!v97)
          goto LABEL_237;
        v159 = *(_QWORD *)v203;
        v156 = v96;
        while (1)
        {
          v98 = 0;
          v157 = v97;
          do
          {
            if (*(_QWORD *)v203 != v159)
              objc_enumerationMutation(v156);
            v99 = *(_QWORD **)(*((_QWORD *)&v202 + 1) + 8 * v98);
            if (v99 != p_isa)
            {
              if (p_isa && (v100 = p_isa[6]) != 0)
              {
                v101 = *(void **)(v100 + 8);
                if (!v99)
                {
LABEL_180:
                  v163 = 0;
                  goto LABEL_181;
                }
              }
              else
              {
                v101 = 0;
                if (!v99)
                  goto LABEL_180;
              }
              v102 = v99[6];
              if (!v102)
                goto LABEL_180;
              v163 = *(void **)(v102 + 8);
LABEL_181:
              v103 = objc_msgSend(p_isa, "entity");
              v104 = (_QWORD *)v103;
              if (v103)
              {
                v105 = objc_msgSend(*(id *)(v103 + 104), "keys");
                v106 = (_QWORD *)v104[14];
              }
              else
              {
                v105 = objc_msgSend(0, "keys");
                v106 = 0;
              }
              v167 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v162 = v104;
              v165 = v99;
              v107 = v106[6];
              v108 = v106[7];
              if (v107 < v108 + v107)
              {
                v109 = (_QWORD *)(v105 + 8 * v107);
                do
                {
                  if (!v101
                    || ((v110 = objc_msgSend(v101, "valueForKey:", *v109), v167 != (id)v110)
                      ? (v111 = v110)
                      : (v111 = 0),
                        (v112 = objc_msgSend(p_isa, "valueForKey:", *v109), v111 | v112)
                     && objc_msgSend((id)v111, "isEqual:", v112)))
                  {
                    v113 = objc_msgSend(v163, "valueForKey:", *v109);
                    v114 = v167 == (id)v113 ? 0 : v113;
                    v115 = objc_msgSend(v165, "valueForKey:", *v109);
                    v116 = v115;
                    if (v115 | v114)
                    {
                      if ((objc_msgSend((id)v115, "isEqual:", v114) & 1) == 0)
                        objc_msgSend(p_isa, "setValue:forKey:", v116, *v109);
                    }
                  }
                  ++v109;
                  --v108;
                }
                while (v108);
              }
              v160 = v98;
              v117 = v106[12];
              v118 = v106[13];
              if (v117 < v118 + v117)
              {
                v119 = 8 * v117;
                do
                {
                  v120 = p_isa;
                  v121 = objc_msgSend(p_isa, "valueForKey:", *(_QWORD *)(v105 + v119));
                  if (!v101
                    || ((v122 = objc_msgSend(v101, "valueForKey:", *(_QWORD *)(v105 + v119)), v167 != (id)v122)
                      ? (v123 = v122)
                      : (v123 = 0),
                        v123 | v121
                     && objc_msgSend((id)v123, "isEqual:", objc_msgSend((id)v121, "objectID"))))
                  {
                    v124 = objc_msgSend(v163, "valueForKey:", *(_QWORD *)(v105 + v119));
                    v125 = v167 == (id)v124 ? 0 : v124;
                    v126 = objc_msgSend(v165, "valueForKey:", *(_QWORD *)(v105 + v119));
                    v127 = (void *)v126;
                    if (v126 | v125)
                    {
                      if ((objc_msgSend((id)v126, "isEqual:", v125) & 1) == 0)
                      {
                        v128 = *(void **)(v162[12] + 24 + v119);
                        v129 = (void *)objc_msgSend(v128, "inverseRelationship");
                        v130 = objc_msgSend(v129, "name");
                        v131 = objc_msgSend(v129, "isToMany");
                        if (v121)
                        {
                          if (!v129)
                            -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v162, v128);
                          if (v131)
                          {
                            v132 = objc_msgSend(v129, "isOrdered");
                            v133 = objc_msgSend(v129, "name");
                            if (v132)
                            {
                              objc_msgSend((id)objc_msgSend((id)v121, "mutableOrderedSetValueForKey:", v133), "removeObject:", v120);
                              v134 = (void *)objc_msgSend(v127, "mutableOrderedSetValueForKey:", objc_msgSend(v129, "name"));
                            }
                            else
                            {
                              objc_msgSend((id)objc_msgSend((id)v121, "mutableSetValueForKey:", v133), "removeObject:", v120);
                              v134 = (void *)objc_msgSend(v127, "mutableSetValueForKey:", objc_msgSend(v129, "name"));
                            }
                            objc_msgSend(v134, "addObject:", v120);
                            objc_msgSend(v134, "removeObject:", v165);
                          }
                          else
                          {
                            objc_msgSend(v127, "setValue:forKey:", v120, v130);
                            objc_msgSend((id)v121, "setValue:forKey:", 0, v130);
                          }
                          if (objc_msgSend(v128, "deleteRule") == 2)
                            objc_msgSend((id)objc_msgSend(v120, "managedObjectContext"), "deleteObject:", v121);
                        }
                        objc_msgSend(v165, "setValue:forKey:", 0, *(_QWORD *)(v105 + v119));
                        objc_msgSend(v120, "setValue:forKey:", v127, *(_QWORD *)(v105 + v119));
                      }
                    }
                  }
                  v119 += 8;
                  --v118;
                  p_isa = v120;
                }
                while (v118);
              }
              -[NSMergePolicy _mergeToManyUnionRelationshipsForObject:andObject:](p_isa, v165);
              v97 = v157;
              v98 = v160;
              objc_msgSend((id)objc_msgSend(v165, "managedObjectContext"), "deleteObject:", v165);
            }
            ++v98;
          }
          while (v98 != v97);
          v97 = -[NSArray countByEnumeratingWithState:objects:count:](v156, "countByEnumeratingWithState:objects:count:", &v202, v206, 16);
          if (!v97)
            goto LABEL_237;
        }
      }
      v87 = 0;
LABEL_239:
      objc_msgSend((id)objc_msgSend(p_isa, "managedObjectContext"), "processPendingChanges");
      v48 = &unk_1E1F4ABD8;
      if ((v87 & 1) != 0)
      {
        v49 = 1;
        goto LABEL_75;
      }
LABEL_74:
      v49 = 0;
      v181 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v150, 133020, v48);
      goto LABEL_75;
    }
    v49 = 0;
LABEL_75:

    if ((v49 & 1) == 0)
      break;
LABEL_76:
    if (++v161 == v152)
    {
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](list, "countByEnumeratingWithState:objects:count:", &v168, v196, 16);
      v154 = 1;
      if (!v18)
        goto LABEL_247;
      goto LABEL_24;
    }
  }
  v140 = v181;
LABEL_245:
  v154 = 0;
LABEL_247:
  objc_msgSend(v149, "drain");
  v141 = 0;
  if ((v154 & 1) != 0)
    return 1;
  v143 = v181;
  error = v148;
  if (v181)
  {
    *v148 = (NSError *)v181;
    v144 = v143;
    return 0;
  }
LABEL_251:
  v145 = (void *)MEMORY[0x1E0CB35C8];
  v194 = CFSTR("conflictList");
  v195 = list;
  v146 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1);
  v147 = (NSError *)objc_msgSend(v145, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 133021, v146);
  result = 0;
  *error = v147;
  return result;
}

- (uint64_t)_mergeToManyUnionRelationshipsForObject:(void *)a1 andObject:(void *)a2
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  int v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "entity");
  if (v3)
  {
    v4 = (_QWORD *)v3;
    result = objc_msgSend(*(id *)(v3 + 104), "keys");
    v6 = v4[14];
    v7 = *(_QWORD *)(v6 + 144);
    v39 = *(_QWORD *)(v6 + 152) + v7;
    if (v7 < v39)
    {
      v8 = result;
      v36 = result;
      v37 = v4;
      while (1)
      {
        v9 = *(void **)(v4[12] + 24 + 8 * v7);
        v10 = (void *)objc_msgSend(v9, "inverseRelationship", v36);
        v11 = objc_msgSend(v10, "name");
        v12 = objc_msgSend(v10, "isToMany");
        v42 = objc_msgSend(v10, "isOrdered");
        v38 = v9;
        v13 = objc_msgSend(v9, "isOrdered");
        v14 = *(_QWORD *)(v8 + 8 * v7);
        v41 = v7;
        if (v13)
          break;
        v18 = (void *)objc_msgSend(a1, "mutableSetValueForKey:", v14);
        v19 = (void *)objc_msgSend(a2, "mutableSetValueForKey:", *(_QWORD *)(v8 + 8 * v7));
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v40 = v19;
        v20 = (void *)objc_msgSend(v19, "allObjects");
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v45 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_msgSend(v18, "addObject:", v25);
              if (!v10)
LABEL_40:
                -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v37, v38);
              if (v12)
              {
                if (v42)
                  v26 = (void *)objc_msgSend(v25, "mutableOrderedSetValueForKey:", v11);
                else
                  v26 = (void *)objc_msgSend(v25, "mutableSetValueForKey:", v11);
                v27 = v26;
                objc_msgSend(v26, "removeObject:", a2);
                objc_msgSend(v27, "addObject:", a1);
              }
              else
              {
                objc_msgSend(v25, "setValue:forKey:", a1, v11);
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v22);
LABEL_37:
          v8 = v36;
          v4 = v37;
        }
LABEL_38:
        result = objc_msgSend(v40, "removeAllObjects");
        v7 = v41 + 1;
        if (v41 + 1 == v39)
          return result;
      }
      v15 = (void *)objc_msgSend(a1, "mutableOrderedSetValueForKey:", v14);
      v16 = (void *)objc_msgSend(a2, "mutableOrderedSetValueForKey:", *(_QWORD *)(v8 + 8 * v7));
      v40 = v16;
      if (objc_msgSend(v16, "count"))
        v17 = (void *)objc_msgSend(v16, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v16, "count")));
      else
        v17 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v28 = v17;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v29 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (!v29)
        goto LABEL_38;
      v30 = v29;
      v31 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v15, "addObject:", v33);
          if (!v10)
            goto LABEL_40;
          if (v12)
          {
            if (v42)
              v34 = (void *)objc_msgSend(v33, "mutableOrderedSetValueForKey:", v11);
            else
              v34 = (void *)objc_msgSend(v33, "mutableSetValueForKey:", v11);
            v35 = v34;
            objc_msgSend(v34, "removeObject:", a2);
            objc_msgSend(v35, "addObject:", a1);
          }
          else
          {
            objc_msgSend(v33, "setValue:forKey:", a1, v11);
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v30);
      goto LABEL_37;
    }
  }
  else
  {
    result = objc_msgSend(0, "keys");
    __break(1u);
  }
  return result;
}

- (void)_mergeToManyRelationshipsForObject:(_QWORD *)a1 ontoObject:(void *)a2
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t ii;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  id obj;
  id obja;
  _QWORD *v73;
  int v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v2 = a1;
  v106 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1, "entity");
  v4 = (_QWORD *)v3;
  if (v3)
  {
    v5 = objc_msgSend(*(id *)(v3 + 104), "keys");
    v6 = v4[14];
    if (!v2)
      goto LABEL_7;
  }
  else
  {
    v5 = objc_msgSend(0, "keys");
    v6 = 0;
    if (!v2)
    {
LABEL_7:
      v68 = 0;
      goto LABEL_8;
    }
  }
  v7 = v2[6];
  if (!v7)
    goto LABEL_7;
  v68 = *(void **)(v7 + 8);
LABEL_8:
  v8 = *(_QWORD *)(v6 + 144);
  v67 = *(_QWORD *)(v6 + 152) + v8;
  if (v8 >= v67)
    return;
  v73 = v2;
  v69 = v5;
  v66 = v4;
  do
  {
    v9 = *(void **)(v4[12] + 24 + 8 * v8);
    v10 = (void *)objc_msgSend(v9, "inverseRelationship");
    v11 = objc_msgSend(v10, "name");
    v12 = objc_msgSend(v10, "isToMany");
    v74 = objc_msgSend(v10, "isOrdered");
    v65 = v9;
    v13 = objc_msgSend(v9, "isOrdered");
    v14 = *(_QWORD *)(v5 + 8 * v8);
    v70 = v8;
    if (!v13)
    {
      v25 = (void *)objc_msgSend(v2, "mutableSetValueForKey:", v14);
      v26 = (void *)objc_msgSend(v68, "objectForKey:", *(_QWORD *)(v5 + 8 * v8));
      v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v85;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v85 != v30)
              objc_enumerationMutation(v26);
            v32 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
            if ((objc_msgSend(v25, "containsObject:", v32) & 1) == 0)
              objc_msgSend(v27, "addObject:", v32);
          }
          v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
        }
        while (v29);
      }
      v64 = v27;
      v33 = (void *)objc_msgSend(a2, "mutableSetValueForKey:", *(_QWORD *)(v69 + 8 * v70));
      v34 = (void *)objc_msgSend(v25, "allObjects");
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      obja = v34;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v81 != v37)
              objc_enumerationMutation(obja);
            v39 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
            objc_msgSend(v33, "addObject:", v39);
            if (!v10)
            {
              v63 = v64;
              goto LABEL_94;
            }
            if (v12)
            {
              if (v74)
                v40 = (void *)objc_msgSend(v39, "mutableOrderedSetValueForKey:", v11);
              else
                v40 = (void *)objc_msgSend(v39, "mutableSetValueForKey:", v11);
              v41 = v40;
              objc_msgSend(v40, "removeObject:", v73);
              objc_msgSend(v41, "addObject:", a2);
            }
            else
            {
              objc_msgSend(v39, "setValue:forKey:", a2, v11);
            }
            objc_msgSend(v25, "removeObject:", v39);
          }
          v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
        }
        while (v36);
      }
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v42 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v77;
        do
        {
          for (k = 0; k != v43; ++k)
          {
            if (*(_QWORD *)v77 != v44)
              objc_enumerationMutation(v64);
            v46 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
            if (objc_msgSend(v33, "containsObject:", v46))
            {
              objc_msgSend(v33, "removeObject:", v46);
              if (!v10)
              {

                goto LABEL_95;
              }
              if (v12)
              {
                if (v74)
                  v47 = (void *)objc_msgSend(v46, "mutableOrderedSetValueForKey:", v11);
                else
                  v47 = (void *)objc_msgSend(v46, "mutableSetValueForKey:", v11);
                objc_msgSend(v47, "removeObject:", a2);
              }
              else
              {
                objc_msgSend(v46, "setValue:forKey:", 0, v11);
              }
            }
          }
          v43 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
        }
        while (v43);
      }

      goto LABEL_90;
    }
    v15 = (void *)objc_msgSend(v2, "mutableOrderedSetValueForKey:", v14);
    v16 = (void *)objc_msgSend(v68, "objectForKey:", *(_QWORD *)(v5 + 8 * v8));
    v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v97;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v97 != v20)
            objc_enumerationMutation(v16);
          v22 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * m);
          if ((objc_msgSend(v15, "containsObject:", v22) & 1) == 0)
            objc_msgSend(v17, "addObject:", v22);
        }
        v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
      }
      while (v19);
    }
    v23 = (void *)objc_msgSend(a2, "mutableOrderedSetValueForKey:", *(_QWORD *)(v69 + 8 * v70));
    obj = v17;
    if (objc_msgSend(v15, "count"))
      v24 = (void *)objc_msgSend(v15, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v15, "count")));
    else
      v24 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v48 = v24;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v49 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v93;
      do
      {
        for (n = 0; n != v50; ++n)
        {
          v53 = v15;
          if (*(_QWORD *)v93 != v51)
            objc_enumerationMutation(v48);
          v54 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * n);
          objc_msgSend(v23, "addObject:", v54);
          if (!v10)
          {
            v63 = obj;
LABEL_94:

LABEL_95:
            -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v66, v65);
          }
          if (v12)
          {
            if (v74)
              v55 = (void *)objc_msgSend(v54, "mutableOrderedSetValueForKey:", v11);
            else
              v55 = (void *)objc_msgSend(v54, "mutableSetValueForKey:", v11);
            v56 = v55;
            objc_msgSend(v55, "removeObject:", v73);
            objc_msgSend(v56, "addObject:", a2);
          }
          else
          {
            objc_msgSend(v54, "setValue:forKey:", a2, v11);
          }
          v15 = v53;
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
      }
      while (v50);
    }
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    if (!v57)
      goto LABEL_89;
    v58 = v57;
    v59 = *(_QWORD *)v89;
    do
    {
      for (ii = 0; ii != v58; ++ii)
      {
        if (*(_QWORD *)v89 != v59)
          objc_enumerationMutation(obj);
        v61 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * ii);
        if (objc_msgSend(v23, "containsObject:", v61))
        {
          objc_msgSend(v23, "removeObject:", v61);
          if (!v10)
          {

            goto LABEL_95;
          }
          if (v74)
            v62 = (void *)objc_msgSend(v61, "mutableOrderedSetValueForKey:", v11);
          else
            v62 = (void *)objc_msgSend(v61, "mutableSetValueForKey:", v11);
          objc_msgSend(v62, "removeObject:", a2);
        }
      }
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    }
    while (v58);
LABEL_89:

    objc_msgSend(v15, "removeAllObjects");
LABEL_90:
    v5 = v69;
    v8 = v70 + 1;
    v4 = v66;
    v2 = v73;
  }
  while (v70 + 1 != v67);
}

+ (NSMergePolicy)mergeByPropertyStoreTrumpMergePolicy
{
  return (NSMergePolicy *)NSMergeByPropertyStoreTrumpMergePolicy;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSMergePolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSMergePolicy;
  return -[NSMergePolicy init](&v3, sel_init);
}

- (NSMergePolicy)initWithCoder:(id)a3
{
  unsigned int v4;
  id *v5;
  id v7;

  v4 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSTypeCode")) - 1;
  if (v4 > 3)
    v5 = &NSErrorMergePolicy;
  else
    v5 = (id *)off_1E1EDE758[v4];
  v7 = *v5;

  return (NSMergePolicy *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt:forKey:", LODWORD(self->_type), CFSTR("NSTypeCode"));
}

+ (BOOL)supportsSecureCoding
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (uint64_t)_valuesOnObject:(uint64_t)a1 matchAgainstValues:(void *)a2
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__NSMergePolicy__valuesOnObject_matchAgainstValues___block_invoke;
  v4[3] = &unk_1E1EDDA00;
  v4[4] = a1;
  v4[5] = &v5;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);
  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __52__NSMergePolicy__valuesOnObject_matchAgainstValues___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  unint64_t v5;
  uint64_t result;
  void *v9;

  v5 = (unint64_t)a3;
  if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == a3)
    v5 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  if (v5 | result)
  {
    v9 = (void *)result;
    result = objc_msgSend((id)v5, "isEqual:", result);
    if ((result & 1) == 0)
    {
      result = objc_msgSend(v9, "isNSString");
      if (!(_DWORD)result
        || (result = +[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)_PFRoutines, v9, (void *)v5),
            (result & 1) == 0))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
  return result;
}

- (uint64_t)_rollbackResolveConstraintConflict:(void *)a1
{
  void *v1;
  int v2;
  void *v3;

  v1 = (void *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  v2 = objc_msgSend(v1, "isInserted");
  v3 = (void *)objc_msgSend(v1, "managedObjectContext");
  if (v2)
    return objc_msgSend(v3, "deleteObject:", v1);
  else
    return objc_msgSend(v3, "refreshObject:mergeChanges:", v1, 0);
}

- (void)_cannotResolveConflictOnEntity:(void *)a1 relationshipWithNoInverse:(void *)a2
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to resolve conflict: relationship \"%@\" (on entity \"%@\") does not have an inverse"), objc_msgSend(a2, "name"), objc_msgSend(a1, "name")), 0));
}

- (uint64_t)_byPropertyStoreTrumpResolveConstraintConflict:(void *)a1
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  v3 = (void *)objc_msgSend(a1, "conflictingObjects");
  if (objc_msgSend(a1, "_isDBConflict"))
    v4 = (_QWORD *)objc_msgSend(a1, "databaseObject");
  else
    v4 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if (v4 != v9)
          -[NSMergePolicy _mergeToManyRelationshipsForObject:ontoObject:](v9, v4);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend((id)objc_msgSend(v2, "managedObjectContext"), "deleteObject:", v2);
}

void __33__NSMergePolicy_resolveConflict___block_invoke(uint64_t a1)
{
  _WORD *v2;

  v2 = -[_NSQueryGenerationToken _generationalComponentForStore:](objc_msgSend(*(id *)(a1 + 32), "_queryGenerationToken"), *(id *)(a1 + 40));
  -[NSXPCStore _clearCachedRowForObjectWithID:generation:](*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), v2);
}

- (void)_mergeChangesStoreUpdatesTrumpForObject:(id)a3 withRecord:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v35;
  _QWORD **v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;

  v36 = (_QWORD **)objc_msgSend(a3, "managedObjectContext");
  if (objc_msgSend(a3, "isInserted"))
    -[NSManagedObjectContext _forceMoveInsertToUpdatedList:]((uint64_t)v36, a3);
  v6 = (void *)objc_msgSend(a4, "ancestorSnapshot");
  v7 = objc_msgSend(a4, "objectForKey:", CFSTR("snapshot"));
  v8 = objc_msgSend(a4, "objectForKey:", CFSTR("cachedRow"));
  v9 = (void *)v8;
  if (v7)
  {
    v10 = (void *)v8;
    v9 = (void *)v7;
  }
  else
  {
    v10 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("databaseRow"));
  }
  if (v7)
    v11 = dword_1ECD8DA5C == 0;
  else
    v11 = 1;
  v12 = !v11;
  v40 = v12;
  v13 = objc_msgSend(a3, "entity");
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(*(id *)(v13 + 104), "keys");
    v16 = *(_QWORD *)(v14 + 112);
  }
  else
  {
    v15 = objc_msgSend(0, "keys");
    v16 = 0;
  }
  v17 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v37 = a3;
  v38 = v6;
  v39 = (void *)objc_msgSend((id)-[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)v36, a3), "copy");
  v18 = *(_QWORD *)(v16 + 48);
  v19 = *(_QWORD *)(v16 + 56);
  v35 = v16;
  if (v18 < v19 + v18)
  {
    do
    {
      v20 = objc_msgSend(v9, "objectForKey:", *(_QWORD *)(v15 + 8 * v18));
      if (v20 == v17)
        v21 = 0;
      else
        v21 = (void *)v20;
      v22 = objc_msgSend(v10, "objectForKey:", *(_QWORD *)(v15 + 8 * v18));
      if (v22 == v17)
        v23 = 0;
      else
        v23 = (void *)v22;
      if (v21 != v23
        && (objc_msgSend(*(id *)(*(_QWORD *)(v14 + 96) + 24 + 8 * v18), "_epsilonEquals:rhs:withFlags:", v23, v21, 1) & 1) == 0)
      {
        if (!v6
          || (v24 = (void *)objc_msgSend(v6, "objectForKey:", *(_QWORD *)(v15 + 8 * v18)), v24 == v21)
          || (v25 = v24, (objc_msgSend(v24, "isEqual:", v21) & 1) != 0))
        {
          v21 = v23;
        }
        else if (v25 != v23 && !objc_msgSend(v25, "isEqual:", v23))
        {
          v21 = v23;
        }
        objc_msgSend(v37, "setValue:forKey:", v21, *(_QWORD *)(v15 + 8 * v18));
        objc_msgSend(v39, "setValue:atIndex:", v21, v18);
        v6 = v38;
      }
      ++v18;
      --v19;
    }
    while (v19);
  }
  v26 = *(_QWORD *)(v35 + 96);
  v27 = *(_QWORD *)(v35 + 104);
  if (v26 < v27 + v26)
  {
    do
    {
      v28 = objc_msgSend(v9, "objectForKey:", *(_QWORD *)(v15 + 8 * v26));
      if (v28 == v17)
        v29 = 0;
      else
        v29 = (id)v28;
      if (v40)
        v29 = (id)objc_msgSend(v29, "objectID");
      v30 = objc_msgSend(v10, "objectForKey:", *(_QWORD *)(v15 + 8 * v26));
      if (v30 == v17)
        v31 = 0;
      else
        v31 = (id)v30;
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
        v31 = (id)objc_msgSend(v31, "objectID");
      if (v29 != v31 && (objc_msgSend(v31, "isEqual:", v29) & 1) == 0)
      {
        if (v6)
        {
          v32 = (id)objc_msgSend(v6, "objectForKey:", *(_QWORD *)(v15 + 8 * v26));
          if (v32 != v29)
          {
            v33 = v32;
            if ((objc_msgSend(v32, "isEqual:", v29) & 1) == 0)
            {
              if (v33 == v31)
              {
                v31 = v29;
              }
              else if (objc_msgSend(v33, "isEqual:", v31))
              {
                v31 = v29;
              }
            }
          }
          v6 = v38;
        }
        if (v31)
          v31 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v36, v31, 0);
        objc_msgSend(v37, "setValue:forKey:", v31, *(_QWORD *)(v15 + 8 * v26));
        objc_msgSend(v39, "setValue:atIndex:", v31, v26);

      }
      ++v26;
      --v27;
    }
    while (v27);
  }

  if (v6)
    -[NSMergePolicy mergeToManyRelationshipForSourceObject:withOldSnapshot:newSnapshot:andAncestor:andLegacyPath:](self, "mergeToManyRelationshipForSourceObject:withOldSnapshot:newSnapshot:andAncestor:andLegacyPath:", v37, v9, v10, v6, v40);
  if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
  {
    if (objc_msgSend(v37, "isDeleted"))
      -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:]((void *)objc_msgSend(v37, "managedObjectContext"), (uint64_t)v37, (void *)objc_msgSend(v37, "objectID"));
  }
}

void __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  _BYTE *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  unint64_t *v27;
  char isKindOfClass;
  CFSetCallBacks *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const __CFAllocator *v44;
  __CFSet *Mutable;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  CFSetCallBacks *callBacks;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  unint64_t *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[3];
  __int128 v88;
  uint64_t v89;
  _QWORD v90[6];
  _BYTE v91[128];
  _BYTE v92[128];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "entity");
  v3 = (unint64_t *)v2;
  if (v2)
  {
    v76 = objc_msgSend(*(id *)(v2 + 104), "keys");
    v4 = v3[14];
  }
  else
  {
    v76 = objc_msgSend(0, "keys");
    v4 = 0;
  }
  v70 = v3;
  v66 = _kvcPropertysPrimitiveGetters(v3);
  v5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v73 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectID");
  v6 = *(_QWORD *)(v4 + 96);
  v7 = *(_QWORD *)(v4 + 104);
  v68 = v4;
  if (v6 < v7 + v6)
  {
    v8 = 8 * v6;
    while (1)
    {
      v9 = *(_QWORD *)(v76 + v8);
      v10 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
      if (v10 == v5)
        v11 = 0;
      else
        v11 = (id)v10;
      if (*(_BYTE *)(a1 + 72))
        v11 = (id)objc_msgSend(v11, "objectID");
      v12 = objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v9);
      if (v12 == v5)
        v13 = 0;
      else
        v13 = (id)v12;
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
        v13 = (id)objc_msgSend(v13, "objectID");
      if (v11 == v13)
        goto LABEL_57;
      if ((objc_msgSend(*(id *)(v70[12] + 24 + v8), "_epsilonEquals:rhs:withFlags:", v13, v11, 1) & 1) != 0)
        goto LABEL_57;
      v14 = *(void **)(v70[12] + 24 + v8);
      v15 = objc_msgSend(v14, "deleteRule");
      if ((unint64_t)(v15 - 1) > 1)
        goto LABEL_57;
      v16 = (void *)objc_msgSend(v14, "inverseRelationship");
      if (!v16)
        goto LABEL_57;
      if (v13)
        v13 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](*(_QWORD ***)(a1 + 56), v13, 0);
      v74 = objc_msgSend(v16, "name");
      v71 = (void *)objc_msgSend(v13, "primitiveValueForKey:");
      if (!objc_msgSend(v16, "isToMany"))
      {
        if (v11
          && (v11 = (id)objc_msgSend(*(id *)(a1 + 64), "newValuesForObjectWithID:withContext:error:", v11, *(_QWORD *)(a1 + 56), 0)) != 0&& (v17 = objc_opt_class(), v17 != objc_opt_class()))
        {
          v18 = (id)objc_msgSend(v11, "valueForPropertyDescription:", v16);
          *(_QWORD *)&v93 = 0;
          if (!v18)
          {
            v18 = (id)objc_msgSend(*(id *)(a1 + 64), "newValueForRelationship:forObjectWithID:withContext:error:", v16, v73, *(_QWORD *)(a1 + 56), &v93);
            if (!v18)
            {
              NSLog((NSString *)CFSTR("That was unexpected. Error trying to get %@ from %@ (%@)"), v14, v73, (_QWORD)v93);
              v18 = 0;
            }
          }
          if ((id)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v18)
            v19 = 0;
          else
            v19 = v18;
        }
        else
        {
          v19 = (id)objc_msgSend(v11, "valueForKey:", v74);
        }
        if (((objc_msgSend(v73, "isEqual:", v19) & 1) != 0 || v71 == *(void **)(a1 + 32)) && v13)
        {
          objc_msgSend(*(id *)(a1 + 56), "refreshObject:mergeChanges:", v13, 1);
          if (v15 == 2)
            objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v13);
          else
            objc_msgSend(v13, "setValue:forKey:", 0, v74);
        }

        goto LABEL_56;
      }
      if (v11)
        v11 = (id)objc_msgSend(*(id *)(a1 + 64), "newValueForRelationship:forObjectWithID:withContext:error:", v16, v11, *(_QWORD *)(a1 + 56), 0);
      if ((objc_msgSend(v11, "containsObject:", v73) & 1) == 0)
        break;
      if (v13)
        goto LABEL_47;
LABEL_55:

LABEL_56:
LABEL_57:
      v8 += 8;
      if (!--v7)
        goto LABEL_58;
    }
    v20 = objc_msgSend(v71, "containsObject:", *(_QWORD *)(a1 + 32));
    if (v13)
      v21 = v20;
    else
      v21 = 0;
    if ((v21 & 1) == 0)
      goto LABEL_55;
LABEL_47:
    objc_msgSend(*(id *)(a1 + 56), "refreshObject:mergeChanges:", v13, 1);
    if (v15 == 2)
    {
      objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v13);
    }
    else
    {
      if (objc_msgSend(v16, "isOrdered"))
        v22 = (void *)objc_msgSend(v13, "mutableOrderedSetValueForKey:", v74);
      else
        v22 = (void *)objc_msgSend(v13, "mutableSetValueForKey:", v74);
      objc_msgSend(v22, "removeObject:", *(_QWORD *)(a1 + 32));
    }
    goto LABEL_55;
  }
LABEL_58:
  v23 = *(_BYTE **)(a1 + 32);
  if ((v23[17] & 0x80) != 0)
    objc_msgSend(v23, "willAccessValueForKey:", 0);
  v24 = *MEMORY[0x1E0C9B3B0];
  v90[1] = 0;
  v90[2] = 0;
  v90[0] = v24;
  v90[4] = _PFObjectIDFastEquals64;
  v90[5] = _PFObjectIDFastHash64;
  v87[0] = v24;
  v87[1] = 0;
  v25 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 24);
  v90[3] = *(_QWORD *)(MEMORY[0x1E0C9B3B0] + 24);
  v88 = v25;
  v26 = *(_QWORD *)(MEMORY[0x1E0C9B3B0] + 40);
  v87[2] = 0;
  v89 = v26;
  objc_opt_class();
  v27 = v70;
  isKindOfClass = objc_opt_isKindOfClass();
  v29 = (CFSetCallBacks *)v87;
  v123 = 0u;
  v124 = 0u;
  if ((isKindOfClass & 1) != 0)
    v29 = (CFSetCallBacks *)v90;
  callBacks = v29;
  v121 = 0uLL;
  v122 = 0uLL;
  v119 = 0uLL;
  v120 = 0uLL;
  v117 = 0uLL;
  v118 = 0uLL;
  v115 = 0uLL;
  v116 = 0uLL;
  v113 = 0uLL;
  v114 = 0uLL;
  v111 = 0uLL;
  v112 = 0uLL;
  v109 = 0uLL;
  v110 = 0uLL;
  v107 = 0uLL;
  v108 = 0uLL;
  v105 = 0uLL;
  v106 = 0uLL;
  v103 = 0uLL;
  v104 = 0uLL;
  v101 = 0uLL;
  v102 = 0uLL;
  v99 = 0uLL;
  v100 = 0uLL;
  v97 = 0uLL;
  v98 = 0uLL;
  v95 = 0uLL;
  v96 = 0uLL;
  v31 = *(_QWORD *)(v68 + 144);
  v30 = *(_QWORD *)(v68 + 152);
  v32 = v30 + v31;
  v93 = 0uLL;
  v94 = 0uLL;
  if (v31 < v30 + v31)
  {
    v33 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
    v64 = v30 + v31;
    do
    {
      v34 = *(void **)(v27[12] + v33[44] + 8 * v31);
      v35 = objc_msgSend(v34, "deleteRule");
      if ((unint64_t)(v35 - 1) <= 1)
      {
        v77 = (void *)objc_msgSend(v34, "inverseRelationship");
        if (v77)
        {
          v75 = objc_msgSend(v77, "name");
          v36 = (void *)objc_msgSend(*(id *)(a1 + 64), "newValueForRelationship:forObjectWithID:withContext:error:", v34, v73, *(_QWORD *)(a1 + 56), 0);
          v37 = v36;
          if (v36 && objc_msgSend(v36, "count"))
          {
            _PF_Handler_Primitive_GetProperty(*(id ***)(a1 + 32), v31, 0, *(_QWORD *)(v66 + 8 * v31), v38, v39, v40, v41);
            v43 = v42;
            v44 = _PFStackAllocatorCreate((unint64_t *)&v93, 1024);
            Mutable = CFSetCreateMutable(v44, 0, callBacks);
            v72 = v35;
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
            if (v46)
            {
              v47 = *(_QWORD *)v84;
              do
              {
                for (i = 0; i != v46; ++i)
                {
                  if (*(_QWORD *)v84 != v47)
                    objc_enumerationMutation(v43);
                  CFSetAddValue(Mutable, *(const void **)(*(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i) + 40));
                }
                v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
              }
              while (v46);
            }
            v67 = v31;
            v69 = v34;
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            v49 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v80;
              do
              {
                for (j = 0; j != v49; ++j)
                {
                  if (*(_QWORD *)v80 != v50)
                    objc_enumerationMutation(v37);
                  v52 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
                  if (!CFSetContainsValue(Mutable, v52))
                  {
                    v53 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](*(_QWORD ***)(a1 + 56), v52, 0);
                    v54 = v53;
                    if (v53)
                    {
                      v55 = (void *)objc_msgSend(v53, "primitiveValueForKey:", v75);
                      v56 = objc_msgSend(v77, "isToMany");
                      v57 = *(void **)(a1 + 64);
                      if (v56)
                      {
                        v58 = (void *)objc_msgSend(v57, "newValueForRelationship:forObjectWithID:withContext:error:", v77, v52, *(_QWORD *)(a1 + 56), 0);
                        if ((objc_msgSend(v58, "containsObject:", v73) & 1) != 0
                          || objc_msgSend(v55, "containsObject:", *(_QWORD *)(a1 + 32)))
                        {
                          objc_msgSend(*(id *)(a1 + 56), "refreshObject:mergeChanges:", v54, 1);
                          if (v72 == 2)
                          {
                            objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v54);
                          }
                          else
                          {
                            if (objc_msgSend(v77, "isOrdered"))
                              v63 = (void *)objc_msgSend(v54, "mutableOrderedSetValueForKey:", v75);
                            else
                              v63 = (void *)objc_msgSend(v54, "mutableSetValueForKey:", v75);
                            objc_msgSend(v63, "removeObject:", *(_QWORD *)(a1 + 32));
                          }
                        }

                      }
                      else
                      {
                        v59 = (void *)objc_msgSend(v57, "newValuesForObjectWithID:withContext:error:", v52, *(_QWORD *)(a1 + 56), 0);
                        if (!v59 || (v60 = objc_opt_class(), v60 == objc_opt_class()))
                        {
                          v61 = (id)objc_msgSend(v59, "valueForKey:", v75);
                        }
                        else
                        {
                          v61 = (id)objc_msgSend(v59, "valueForPropertyDescription:", v77);
                          v78 = 0;
                          v62 = v77;
                          if (!v61)
                          {
                            v61 = (id)objc_msgSend(*(id *)(a1 + 64), "newValueForRelationship:forObjectWithID:withContext:error:", v77, v73, *(_QWORD *)(a1 + 56), &v78);
                            if (!v61)
                            {
                              NSLog((NSString *)CFSTR("That was unexpected. Error trying to get %@ from %@ (%@)"), v69, v73, v78);
                              v61 = 0;
                            }
                          }
                          if ((id)objc_msgSend(MEMORY[0x1E0C99E38], "null", v62) == v61)
                            v61 = 0;
                        }
                        if (objc_msgSend(v73, "isEqual:", v61))
                        {
                          objc_msgSend(*(id *)(a1 + 56), "refreshObject:mergeChanges:", v54, 1);
                          if (objc_msgSend(v54, "primitiveValueForKey:", v75) == *(_QWORD *)(a1 + 32))
                          {
                            if (v72 == 2)
                              objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v54);
                            else
                              objc_msgSend(v54, "setValue:forKey:", 0, v75);
                          }
                        }

                      }
                    }
                  }
                }
                v49 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
              }
              while (v49);
            }
            if (*((_QWORD *)&v94 + 1))
            {
              v27 = v70;
              v31 = v67;
              v32 = v64;
              v33 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
              if (Mutable)
                CFRelease(Mutable);
            }
            else
            {
              *((_QWORD *)&v93 + 1) = v93;
              v27 = v70;
              v31 = v67;
              v32 = v64;
              v33 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
            }
          }

        }
      }
      ++v31;
    }
    while (v31 != v32);
  }
}

- (void)_mergeChangesObjectUpdatesTrumpForObject:(id)a3 withRecord:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  NSKnownKeysDictionary *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *context;
  uint64_t v51;
  _QWORD **v52;
  uint64_t v53;
  id v54;
  int v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[9];
  char v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x18D76B4E4](self, a2);
  v7 = objc_msgSend(a3, "managedObjectContext");
  v8 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:](v7, a3);
  if (objc_msgSend(a3, "isDeleted"))
  {
    v9 = v7;
    if (self)
    {
      v10 = objc_msgSend(a4, "objectForKey:", CFSTR("snapshot"));
      v11 = objc_msgSend(a4, "objectForKey:", CFSTR("cachedRow"));
      v12 = v11;
      if (v10)
      {
        v13 = v11;
        v12 = v10;
      }
      else
      {
        v13 = objc_msgSend(a4, "objectForKey:", CFSTR("databaseRow"));
      }
      if (v10)
        v14 = dword_1ECD8DA5C == 0;
      else
        v14 = 1;
      v15 = !v14;
      v16 = objc_msgSend(a3, "managedObjectContext");
      v17 = (void *)v16;
      if (v16)
        v18 = *(void **)(v16 + 32);
      else
        v18 = 0;
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke;
      v66[3] = &unk_1E1EDE6C8;
      v66[4] = a3;
      v66[5] = v12;
      v67 = v15;
      v66[6] = v13;
      v66[7] = v16;
      v66[8] = v18;
      -[NSManagedObjectContext lockObjectStore](v16);
      if (v18 == (void *)objc_msgSend(v17, "persistentStoreCoordinator"))
        objc_msgSend(v18, "performBlockAndWait:", v66);
      else
        __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke((uint64_t)v66);
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)v17);
    }
    v7 = v9;
  }
  else if (objc_msgSend(a3, "isInserted"))
  {
    -[NSManagedObjectContext _forceMoveInsertToUpdatedList:](v7, a3);
  }
  v19 = objc_msgSend(a4, "objectForKey:", CFSTR("snapshot"));
  v20 = objc_msgSend(a4, "objectForKey:", CFSTR("cachedRow"));
  if (v19)
  {
    v56 = (void *)v20;
    v57 = (void *)v19;
  }
  else
  {
    v57 = (void *)v20;
    v56 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("databaseRow"));
  }
  if (v19)
    v21 = dword_1ECD8DA5C == 0;
  else
    v21 = 1;
  v22 = !v21;
  v55 = v22;
  v23 = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)a3);
  v54 = (id)objc_msgSend(v8, "copy");
  v24 = objc_msgSend(a3, "entity");
  v52 = (_QWORD **)v7;
  v53 = v24;
  if (v24)
  {
    v25 = v24;
    v26 = objc_msgSend(*(id *)(v24 + 104), "keys");
    v27 = *(_QWORD *)(v25 + 112);
  }
  else
  {
    v26 = objc_msgSend(0, "keys");
    v27 = 0;
  }
  v28 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v29 = *(_QWORD *)(v27 + 48);
  v30 = *(_QWORD *)(v27 + 56);
  v51 = v27;
  if (v29 < v30 + v29)
  {
    do
    {
      v31 = (void *)MEMORY[0x18D76B4E4]();
      v32 = objc_msgSend(v57, "objectForKey:", *(_QWORD *)(v26 + 8 * v29));
      if (v32 == v28)
        v33 = 0;
      else
        v33 = (id)v32;
      v34 = objc_msgSend(v56, "objectForKey:", *(_QWORD *)(v26 + 8 * v29));
      if (v34 == v28)
        v35 = 0;
      else
        v35 = (id)v34;
      if (v33 != v35)
      {
        v36 = *(void **)(*(_QWORD *)(v53 + 96) + 24 + 8 * v29);
        if ((objc_msgSend(v36, "_epsilonEquals:rhs:withFlags:", v35, v33, 1) & 1) == 0)
        {
          if (objc_msgSend(v36, "usesMergeableStorage"))
          {
            objc_msgSend(v35, "merge:", v33);
            v35 = (id)objc_msgSend(v35, "copy");
          }
          objc_msgSend(a3, "setValue:forKey:", v35, *(_QWORD *)(v26 + 8 * v29));
          objc_msgSend(v54, "setValue:atIndex:", v35, v29);
        }
      }
      objc_autoreleasePoolPop(v31);
      ++v29;
      --v30;
    }
    while (v30);
  }
  v38 = *(_QWORD *)(v51 + 96);
  v37 = *(_QWORD *)(v51 + 104);
  if (v38 < v37 + v38)
  {
    do
    {
      v39 = objc_msgSend(v57, "objectForKey:", *(_QWORD *)(v26 + 8 * v38));
      if (v39 == v28)
        v40 = 0;
      else
        v40 = (void *)v39;
      if (v55)
        v40 = (void *)objc_msgSend(v40, "objectID");
      v41 = objc_msgSend(v56, "objectForKey:", *(_QWORD *)(v26 + 8 * v38));
      if (v41 == v28)
        v42 = 0;
      else
        v42 = (void *)v41;
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
        v42 = (void *)objc_msgSend(v42, "objectID");
      if (v40 != v42 && (objc_msgSend(v42, "isEqual:", v40) & 1) == 0)
      {
        if (v42)
          v43 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v52, v42, 0);
        else
          v43 = 0;
        objc_msgSend(a3, "setValue:forKey:", v43, *(_QWORD *)(v26 + 8 * v38));
        objc_msgSend(v54, "setValue:atIndex:", v43, v38);

      }
      ++v38;
      --v37;
    }
    while (v37);
  }
  -[NSManagedObject _setOriginalSnapshot__:](a3, v54);
  if (-[NSKnownKeysDictionary count](v23, "count"))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v44 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v63 != v45)
            objc_enumerationMutation(v23);
          objc_msgSend(a3, "willChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
        }
        v44 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v44);
    }
    -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v23, 0);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v47 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v59 != v48)
            objc_enumerationMutation(v23);
          objc_msgSend(a3, "didChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
        }
        v47 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v47);
    }
  }
  objc_autoreleasePoolPop(context);
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(NSArray *)list error:(NSError *)error
{
  NSArray *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  unint64_t type;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  __CFDictionary *v32;
  id v33;
  void *v35;
  NSArray *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v4 = list;
  v55 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](list, "count"))
    return 1;
  if (!self->_type)
  {
    v22 = 0;
    goto LABEL_50;
  }
  v33 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = v4;
  if (objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "objectForKey:", CFSTR("snapshot")))
    goto LABEL_4;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (!v24)
    goto LABEL_4;
  v25 = 0;
  v26 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v43 != v26)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      v29 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", CFSTR("newVersion")), "unsignedIntValue");
      v30 = (void *)objc_msgSend(v28, "objectForKey:", CFSTR("object"));
      v31 = v30;
      if (v25)
      {
        if (!v30)
          continue;
      }
      else
      {
        v25 = objc_msgSend(v30, "managedObjectContext");
        if (!v31)
          continue;
      }
      if (!v29 || objc_msgSend(v31, "isDeleted"))
        objc_msgSend(v35, "addObject:", objc_msgSend(v31, "objectID"));
    }
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  }
  while (v24);
  v4 = obj;
  if (v25)
  {
    v32 = +[_PFRoutines createDictionaryPartitioningObjectsIDByRootEntity:]((uint64_t)_PFRoutines, (uint64_t)v35);
    v46 = 0;
    v47 = (uint64_t)&v46;
    v48 = 0x3052000000;
    v49 = __Block_byref_object_copy__15;
    v50 = __Block_byref_object_dispose__15;
    v51 = 0;
    v51 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke;
    v41[3] = &unk_1E1EDDA00;
    v41[4] = v25;
    v41[5] = &v46;
    -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v32, "enumerateKeysAndObjectsUsingBlock:", v41);

    _Block_object_dispose(&v46, 8);
    v4 = obj;
  }
LABEL_4:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v38;
LABEL_6:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v7)
        objc_enumerationMutation(obj);
      if (!self)
      {
        v22 = 0;
        goto LABEL_46;
      }
      v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v8);
      v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("newVersion")), "unsignedIntValue");
      v11 = objc_msgSend(v9, "objectForKey:", CFSTR("object"));
      v12 = objc_msgSend((id)v11, "managedObjectContext");
      v13 = (void *)v12;
      if (v11)
        v14 = v12 == 0;
      else
        v14 = 0;
      if (v14)
      {
        v13 = *(void **)(v11 + 32);
        if (v13)
        {
          v15 = (void *)objc_msgSend((id)v11, "objectID");
          v16 = objc_msgSend(v13, "objectRegisteredForID:", v15);
          if (v16 == v11)
          {
            *(_DWORD *)(v11 + 16) &= ~0x80u;
          }
          else if (!v16)
          {
            -[NSManagedObjectContext _registerObject:withID:]((uint64_t)v13, v11, v15);
          }
        }
      }
      type = self->_type;
      if ((_DWORD)v10)
      {
        switch(type)
        {
          case 1uLL:
            -[NSMergePolicy _mergeChangesStoreUpdatesTrumpForObject:withRecord:](self, "_mergeChangesStoreUpdatesTrumpForObject:withRecord:", v11, v9);
            objc_msgSend((id)v11, "_setVersionReference__:", v10);
            break;
          case 2uLL:
            if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
            {
              -[NSMergePolicy _mergeChangesObjectUpdatesTrumpForObject:withRecord:](self, "_mergeChangesObjectUpdatesTrumpForObject:withRecord:", v11, v9);
              objc_msgSend((id)v11, "_setVersionReference__:", v10);
            }
            else
            {
              objc_msgSend(v13, "refreshObject:mergeChanges:", v11, 1);
            }
            break;
          case 3uLL:
            if ((objc_msgSend((id)v11, "hasChanges") & 1) == 0)
              _PFFastMOCObjectWillChange((uint64_t)v13, (_DWORD *)v11);
            objc_msgSend((id)v11, "_setVersionReference__:", v10);
            break;
          case 4uLL:
            objc_msgSend(v13, "refreshObject:mergeChanges:", v11, 0);
            v19 = (void *)objc_msgSend((id)v11, "objectID");
            v20 = (void *)objc_msgSend(v19, "persistentStore");
            if (CFSTR("NSXPCStore") == (__CFString *)objc_msgSend(v20, "type"))
            {
              v21 = (void *)objc_msgSend(v20, "_persistentStoreCoordinator");
              v46 = MEMORY[0x1E0C809B0];
              v47 = 3221225472;
              v48 = (uint64_t)__33__NSMergePolicy_resolveConflict___block_invoke;
              v49 = (void (*)(uint64_t, uint64_t))&unk_1E1EDD790;
              v50 = (void (*)(uint64_t))v13;
              v51 = (uint64_t)v20;
              v52 = v19;
              objc_msgSend(v21, "performBlockAndWait:", &v46);
            }
            break;
          default:
            break;
        }
      }
      else
      {
        if (type == 2 && z9dsptsiQ80etb9782fsrs98bfdle88 == 0)
          type = 3;
        if (type - 1 < 2)
          goto LABEL_31;
        if (type == 3)
        {
          if ((objc_msgSend((id)v11, "isDeleted") & 1) == 0 && (objc_msgSend((id)v11, "isInserted") & 1) == 0)
            objc_msgSend(v13, "_forceInsertionForObject:", v11);
          goto LABEL_43;
        }
        if (type == 4)
LABEL_31:
          objc_msgSend(v13, "deleteObject:", v11);
      }
LABEL_43:
      objc_msgSend((id)v11, "awakeFromSnapshotEvents:", 64);
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        if (v6)
          goto LABEL_6;
        break;
      }
    }
  }
  v22 = 1;
LABEL_46:
  if (v33)
    objc_msgSend(v33, "drain");
LABEL_50:
  if (error && !v22)
  {
    v22 = 0;
    *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 133020, 0);
  }
  return v22;
}

uint64_t __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  if (objc_msgSend(*(id *)(a1 + 32), "concurrencyType", MEMORY[0x1E0C809B0], 3221225472, __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2, &unk_1E1EDE730, a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)))
  {
    return objc_msgSend(*(id *)(a1 + 32), "performBlockAndWait:", &v5);
  }
  else
  {
    return __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2((uint64_t)&v5);
  }
}

uint64_t __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  NSFetchRequest *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(_QWORD **)(a1 + 32);
  v4 = objc_alloc_init(NSFetchRequest);
  -[NSFetchRequest setEntity:](v4, "setEntity:", v3);
  -[NSFetchRequest setIncludesSubentities:](v4, "setIncludesSubentities:", 1);
  -[NSFetchRequest setIncludesPendingChanges:](v4, "setIncludesPendingChanges:", 0);
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v4, "setRelationshipKeyPathsForPrefetching:", -[NSEntityDescription _keypathsForDeletions](v3));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 40)));
  v7 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v4, &v7);
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v5);

  return objc_msgSend(v2, "drain");
}

+ (NSMergePolicy)errorMergePolicy
{
  return (NSMergePolicy *)NSErrorMergePolicy;
}

+ (NSMergePolicy)overwriteMergePolicy
{
  return (NSMergePolicy *)NSOverwriteMergePolicy;
}

+ (NSMergePolicy)rollbackMergePolicy
{
  return (NSMergePolicy *)NSRollbackMergePolicy;
}

@end
