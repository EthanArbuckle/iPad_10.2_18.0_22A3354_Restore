@implementation NSSQLGenerator

- (id)initializeContextForRequest:(int)a3 ignoreInheritance:(uint64_t)a4 nestingLevel:
{
  void *v8;
  id v9;
  uint64_t v10;
  NSSQLAliasGenerator *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSSQLPredicateAnalyser *v47;
  id v48;
  id v49;
  uint64_t v51;
  uint64_t v52;

  v8 = (void *)MEMORY[0x18D76B4E4]();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKey:", a2, CFSTR("storeRequest"));
  objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 8), CFSTR("persistentStore"));
  v10 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(a2, "entity"));
  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("entity"));
  objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4), CFSTR("nestingLevel"));
  objc_msgSend(v9, "setObject:forKey:", supportedFunctions, CFSTR("supportedKVCAggregates"));
  v11 = -[NSSQLAliasGenerator initWithNestingLevel:]([NSSQLAliasGenerator alloc], "initWithNestingLevel:", a4);
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("aliasGenerator"));

  if (a3)
  {
    v12 = objc_msgSend(a2, "predicate");
  }
  else
  {
    v13 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("storeRequest"));
    v14 = (void *)objc_msgSend(v13, "predicate");
    v15 = objc_msgSend(v9, "objectForKey:", CFSTR("entity"));
    v16 = v15;
    v18 = v15 && (v17 = *(void **)(v15 + 152)) != 0 && objc_msgSend(v17, "count") != 0;
    if ((objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("ignoreInheritance")), "BOOLValue") & 1) != 0)
      v19 = 0;
    else
      v19 = objc_msgSend(v13, "includesSubentities");
    if (!v16 || *(_QWORD *)(v16 + 160) || ((v19 | !v18) & 1) == 0)
    {
      v20 = v18 & v19;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F0]), "initWithObject:", CFSTR("_ent"));
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36E8]), "initWithKeyPath:", v21);

      v23 = objc_alloc(MEMORY[0x1E0CB37E8]);
      if (v20 == 1)
      {
        if (v16)
          v24 = *(unsigned int *)(v16 + 184);
        else
          v24 = 0;
        v25 = (void *)objc_msgSend(v23, "initWithUnsignedInt:", v24);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3540]), "initWithObject:", v25);

        v27 = objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v22, v26, 0, 3, 0);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F0]), "initWithObject:", CFSTR("_ent"));
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36E8]), "initWithKeyPath:", v28);

        v30 = objc_alloc(MEMORY[0x1E0CB37E8]);
        if (v16)
          v31 = *(unsigned int *)(v16 + 188);
        else
          v31 = 0;
        v32 = (void *)objc_msgSend(v30, "initWithUnsignedInt:", v31);
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3540]), "initWithObject:", v32);

        v34 = objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v29, v33, 0, 1, 0);
        v35 = objc_alloc(MEMORY[0x1E0C99D20]);
        if (v14)
          v36 = objc_msgSend(v35, "initWithObjects:", v14, v27, v34, 0);
        else
          v36 = objc_msgSend(v35, "initWithObjects:", v27, v34, 0, v52);
        v43 = (void *)v36;
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v36);

        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v27, v34, 0);
        v40 = objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v44);
      }
      else
      {
        if (v16)
          v37 = *(unsigned int *)(v16 + 184);
        else
          v37 = 0;
        v38 = (void *)objc_msgSend(v23, "initWithUnsignedInt:", v37);
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3540]), "initWithObject:", v38);

        v40 = objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v22, v39, 0, 4, 0);
        v41 = objc_alloc(MEMORY[0x1E0C99D20]);
        if (v14)
          v42 = objc_msgSend(v41, "initWithObjects:", v14, v40, 0);
        else
          v42 = objc_msgSend(v41, "initWithObjects:", v40, 0, v51);
        v44 = (void *)v42;
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v42);
      }

      objc_msgSend(v9, "setObject:forKey:", v40, CFSTR("restrictingEntityPredicate"));
    }
    v12 = objc_msgSend(v14, "minimalFormInContext:", v9);
  }
  v45 = (void *)v12;
  if (!objc_msgSend(v9, "objectForKey:", CFSTR("NSUnderlyingException"))
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance"), "isEqual:", v45) & 1) == 0
    && v45)
  {
    v46 = (void *)MEMORY[0x18D76B4E4]();
    v47 = objc_alloc_init(NSSQLPredicateAnalyser);
    objc_msgSend(v9, "setObject:forKey:", v47, CFSTR("informationGatherer"));
    objc_msgSend(v45, "acceptVisitor:flags:", v47, 1);
    objc_msgSend(v9, "setObject:forKey:", v45, CFSTR("predicate"));

    objc_autoreleasePoolPop(v46);
  }
  if (!objc_msgSend(v9, "objectForKey:", CFSTR("NSUnderlyingException")))
  {
    v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "setObject:forKey:", v48, CFSTR("bindVars"));

    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "setObject:forKey:", v49, CFSTR("selectBindVars"));

  }
  objc_autoreleasePoolPop(v8);
  return v9;
}

- (NSSQLiteStatement)newSQLStatementForRequest:(int)a3 ignoreInheritance:(int)a4 countOnly:(uint64_t)a5 nestingLevel:(int)a6 nestIsWhereScoped:(uint64_t)a7 requestContext:
{
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSSQLPredicateAnalyser *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  id v24;
  void *v25;
  NSSQLiteStatement *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSSQLUpdateIntermediate *v39;
  void *v40;
  void *v41;
  CFHashCode (__cdecl *v42)(const void *);
  CFIndex v43;
  CFStringRef (__cdecl *v44)(const void *);
  const __CFAllocator *v45;
  __CFDictionary *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  unint64_t v51;
  void *v52;
  void *Value;
  void *v54;
  const void *v55;
  uint64_t j;
  uint64_t v57;
  void *v58;
  const void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  __CFDictionary *v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  void *v68;
  NSSQLUpdateColumnsIntermediate *v69;
  NSSQLFetchDictionaryCountIntermediate *v70;
  __objc2_class **v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  NSString *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t m;
  NSCachedFetchRequestInfo *v87;
  void *v88;
  unint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  NSString *sqlString;
  void *v102;
  SEL v103;
  const char *v104;
  id v106;
  void *v107;
  id v108;
  id v109;
  uint64_t v110;
  NSSQLFetchDictionaryCountIntermediate *v111;
  NSSQLiteStatement *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  __CFDictionary *theDict;
  void *context;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = objc_msgSend(a2, "requestType");
  v15 = (void *)MEMORY[0x18D76B4E4]();
  if (v14 != 1)
  {
    v17 = -[NSSQLGenerator initializeContextForRequest:ignoreInheritance:nestingLevel:](a1, a2, 0, 0);
    goto LABEL_19;
  }
  v16 = -[NSSQLGenerator initializeContextForRequest:ignoreInheritance:nestingLevel:](a1, a2, a3, a5);
  v17 = v16;
  if (a6)
    objc_msgSend(v16, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("nestedWhereSelect"));
  v18 = (void *)objc_msgSend((id)objc_msgSend(a2, "havingPredicate"), "minimalFormInContext:", v17);
  if (!objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException"))
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance"), "isEqual:", v18) & 1) == 0
    && v18)
  {
    v19 = objc_alloc_init(NSSQLPredicateAnalyser);
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("havingPredicateAnalyser"));

    objc_msgSend(v18, "acceptVisitor:flags:", v19, 1);
    objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("havingPredicate"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a7 && (v20 = *(_QWORD *)(a7 + 216)) != 0)
    {
      objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("substitutionVariables"));
      v21 = MEMORY[0x1E0C9AAB0];
      v22 = CFSTR("duringPrefetching");
    }
    else
    {
      if (!objc_msgSend(a2, "substitutionVariables"))
        goto LABEL_17;
      v21 = objc_msgSend(a2, "substitutionVariables");
      v22 = CFSTR("substitutionVariables");
    }
    objc_msgSend(v17, "setObject:forKey:", v21, v22);
LABEL_17:
    if (objc_msgSend(v17, "objectForKey:", CFSTR("substitutionVariables")))
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("subOrder"));

      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("columnSubOrder"));

    }
  }
LABEL_19:
  v25 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException"));
  if (objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException")))
  {
    v106 = v25;

    objc_exception_throw(v25);
  }
  v26 = -[NSSQLiteAdapter newStatementWithEntity:]((NSSQLiteStatement *)objc_msgSend(*(id *)(a1 + 8), "adapter"), objc_msgSend(v17, "objectForKey:", CFSTR("entity")));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance"), "isEqual:", objc_msgSend(v17, "objectForKey:", CFSTR("predicate"))))goto LABEL_128;
  if (v14 == 8 || v14 == 1)
  {
    v27 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("storeRequest"));
    v28 = objc_msgSend(v17, "objectForKey:", CFSTR("informationGatherer"));
    v29 = objc_msgSend(v17, "objectForKey:", CFSTR("havingPredicateAnalyser"));
    if (v28)
      v30 = *(void **)(v28 + 24);
    else
      v30 = 0;
    if (objc_msgSend(v30, "count") || (!v29 ? (v31 = 0) : (v31 = *(void **)(v29 + 24)), objc_msgSend(v31, "count")))
    {
      if (v28)
        v32 = *(void **)(v28 + 24);
      else
        v32 = 0;
      v33 = objc_msgSend(v32, "count");
      v34 = (void *)MEMORY[0x1E0C99DA0];
      v35 = *MEMORY[0x1E0C99778];
      v36 = (void *)MEMORY[0x1E0CB3940];
      if (v33)
        v37 = objc_msgSend((id)objc_msgSend(v17, "objectForKey:", CFSTR("storeRequest")), "predicate");
      else
        v37 = objc_msgSend(v17, "objectForKey:", CFSTR("havingPredicate"));
      objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, objc_msgSend(v36, "stringWithFormat:", CFSTR("Unsupported predicate %@"), v37), 0), CFSTR("NSUnderlyingException"));
      goto LABEL_109;
    }
    if (a4 && !objc_msgSend((id)objc_msgSend(v27, "propertiesToFetch"), "count"))
      v71 = off_1E1EDAD00;
    else
      v71 = off_1E1EDAD08;
    v70 = (NSSQLFetchDictionaryCountIntermediate *)objc_msgSend(objc_alloc(*v71), "initWithEntity:alias:inScope:", objc_msgSend(v17, "objectForKey:", CFSTR("entity")), objc_msgSend((id)objc_msgSend(v17, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias"), 0);
    objc_msgSend(v17, "setObject:forKey:", v70, CFSTR("outerFetch"));

    -[NSSQLGenerator generateWhereIntermediatesInContext:](v17);
    if (objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException")))
      goto LABEL_108;
    v72 = objc_msgSend(v27, "propertiesToGroupBy");
    v73 = objc_msgSend(v17, "objectForKey:", CFSTR("havingPredicate"));
    v74 = v73;
    if (!v72 && v73)
    {
      v75 = (void *)MEMORY[0x1E0C99DA0];
      v76 = *MEMORY[0x1E0C99778];
      v77 = CFSTR("Invalid fetch request: HAVING with no GROUP BY");
LABEL_107:
      objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v75, "exceptionWithName:reason:userInfo:", v76, v77, 0), CFSTR("NSUnderlyingException"));
      goto LABEL_108;
    }
    if (v72)
    {
      if (objc_msgSend(v27, "resultType") != 2)
      {
        v75 = (void *)MEMORY[0x1E0C99DA0];
        v76 = *MEMORY[0x1E0C99778];
        v77 = CFSTR("Invalid fetch request: GROUP BY requires NSDictionaryResultType");
        goto LABEL_107;
      }
      -[NSSQLGenerator generateGroupByIntermediatesForProperties:inContext:](v72, v17);
      if (!v70)
        goto LABEL_108;
      if (!v70[1].super.super.super.isa)
        goto LABEL_108;
      if (v74)
      {
        -[NSSQLGenerator generateHavingIntermediateForPredicate:inContext:](v74, v17);
        if (!v70[1].super.super._scope || objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException")))
          goto LABEL_108;
      }
    }
    -[NSSQLGenerator generateSelectIntermediateInContext:](v17);
    if (-[NSSQLFetchDictionaryCountIntermediate selectIntermediate](v70, "selectIntermediate"))
    {
      -[NSSQLGenerator generateOrderIntermediateInContext:](v17);
      v78 = (void *)objc_msgSend(v17, "valueForKey:", CFSTR("substitutionVariables"));
      if (objc_msgSend(v27, "fetchLimit")
        || objc_msgSend(v78, "valueForKey:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION")))
      {
        -[NSSQLGenerator generateIntermediateForLimit:inContext:](objc_msgSend(v27, "fetchLimit"), v17);
      }
      if (objc_msgSend(v27, "fetchOffset")
        || objc_msgSend(v78, "valueForKey:", CFSTR("FETCH_REQUEST_OFFSET_SUBSTITUTION")))
      {
        if (!v70 || !v70->super._limitClause)
          -[NSSQLGenerator generateIntermediateForLimit:inContext:](0, v17);
        -[NSSQLGenerator generateIntermediateForOffset:inContext:](objc_msgSend(v27, "fetchOffset"), v17);
      }
      if (a4 && objc_msgSend((id)objc_msgSend(v27, "propertiesToFetch"), "count"))
      {
        if (v70)
          LOBYTE(v70[1].super._correlationToken) = 1;
        v70 = -[NSSQLFetchDictionaryCountIntermediate initWithFetchIntermediate:inScope:]([NSSQLFetchDictionaryCountIntermediate alloc], "initWithFetchIntermediate:inScope:", v70, 0);
      }
      goto LABEL_110;
    }
LABEL_108:
    objc_msgSend(v17, "removeObjectForKey:", CFSTR("outerFetch"));
    goto LABEL_109;
  }
  v38 = objc_msgSend(v17, "objectForKey:", CFSTR("entity"));
  if (objc_msgSend(v17, "objectForKey:", CFSTR("outerFetch")))
  {
    objc_msgSend(v17, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported nested update inside of %@"), objc_msgSend(v17, "objectForKey:", CFSTR("outerFetch"))), 0), CFSTR("NSUnderlyingException"));
LABEL_109:
    v70 = 0;
    goto LABEL_110;
  }
  v39 = -[NSSQLUpdateIntermediate initWithEntity:alias:inScope:]([NSSQLUpdateIntermediate alloc], "initWithEntity:alias:inScope:", v38, objc_msgSend((id)objc_msgSend(v17, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias"), 0);
  objc_msgSend(v17, "setObject:forKey:", v39, CFSTR("outerFetch"));

  -[NSSQLGenerator generateWhereIntermediatesInContext:](v17);
  if (objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException")))
    goto LABEL_108;
  v111 = (NSSQLFetchDictionaryCountIntermediate *)v39;
  v40 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("storeRequest"));
  v110 = objc_msgSend(v17, "objectForKey:", CFSTR("outerFetch"));
  v41 = (void *)objc_msgSend(v40, "propertiesToUpdate");
  keyCallBacks.version = *MEMORY[0x1E0C9B390];
  keyCallBacks.retain = 0;
  *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
  v42 = *(CFHashCode (__cdecl **)(const void *))(MEMORY[0x1E0C9B390] + 40);
  keyCallBacks.release = 0;
  keyCallBacks.hash = v42;
  v43 = *MEMORY[0x1E0C9B3A0];
  *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 8);
  v44 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3A0] + 24);
  valueCallBacks.version = v43;
  valueCallBacks.copyDescription = v44;
  valueCallBacks.equal = 0;
  v45 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, &valueCallBacks);
  v46 = CFDictionaryCreateMutable(v45, 0, &keyCallBacks, &valueCallBacks);
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v47 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v134;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v134 != v49)
          objc_enumerationMutation(v41);
        CFDictionarySetValue(v46, *(const void **)(*((_QWORD *)&v133 + 1) + 8 * i), (const void *)objc_msgSend(v41, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i)));
      }
      v48 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
    }
    while (v48);
  }
  v112 = v26;
  v113 = v15;
  v115 = v17;
  if (CFDictionaryGetCount(v46) >= 1)
  {
    v51 = 0x1E0CB3000uLL;
    do
    {
      context = (void *)MEMORY[0x18D76B4E4]();
      v52 = (void *)+[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, v46);
      Value = (void *)CFDictionaryGetValue(v46, v52);
      if (objc_msgSend(v52, "attributeType") == 2100)
      {
        v54 = (void *)objc_msgSend(Value, "constantValue");
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v122 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
        if (v122)
        {
          v55 = 0;
          v120 = v52;
          v121 = *(_QWORD *)v130;
          v119 = v54;
          do
          {
            for (j = 0; j != v122; ++j)
            {
              v124 = v55;
              if (*(_QWORD *)v130 != v121)
                objc_enumerationMutation(v54);
              v57 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j);
              v58 = (void *)MEMORY[0x18D76B4E4]();
              v59 = (const void *)objc_msgSend(v54, "objectForKey:", v57);
              v125 = 0u;
              v126 = 0u;
              v127 = 0u;
              v128 = 0u;
              v60 = (void *)objc_msgSend(v52, "elements");
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
              if (v61)
              {
                v62 = v61;
                v123 = v58;
                v63 = v51;
                v64 = v46;
                v65 = *(_QWORD *)v126;
                while (2)
                {
                  for (k = 0; k != v62; ++k)
                  {
                    if (*(_QWORD *)v126 != v65)
                      objc_enumerationMutation(v60);
                    v67 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * k);
                    if ((objc_msgSend((id)objc_msgSend(v67, "name"), "isEqualToString:", v57) & 1) != 0)
                    {
                      v55 = v67;
                      v46 = v64;
                      v51 = v63;
                      v54 = v119;
                      v52 = v120;
                      goto LABEL_63;
                    }
                  }
                  v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
                  if (v62)
                    continue;
                  break;
                }
                v46 = v64;
                v51 = v63;
                v54 = v119;
                v52 = v120;
                v55 = v124;
LABEL_63:
                v58 = v123;
              }
              else
              {
                v55 = v124;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                CFDictionarySetValue(v46, v55, v59);
              }
              else
              {
                v68 = (void *)objc_msgSend(objc_alloc(*(Class *)(v51 + 1344)), "initWithObject:", v59);
                CFDictionarySetValue(v46, v55, v68);

              }
              objc_autoreleasePoolPop(v58);
            }
            v122 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
          }
          while (v122);
        }
      }
      else
      {
        CFDictionarySetValue(theDict, v52, Value);
      }
      CFDictionaryRemoveValue(v46, v52);
      objc_autoreleasePoolPop(context);
    }
    while (CFDictionaryGetCount(v46) > 0);
  }
  CFRelease(v46);
  v69 = -[NSSQLUpdateColumnsIntermediate initWithPropertiesToUpdate:inScope:]([NSSQLUpdateColumnsIntermediate alloc], "initWithPropertiesToUpdate:inScope:", theDict, v110);
  -[NSSQLUpdateIntermediate setUpdateColumnsIntermediate:](v110, v69);

  CFRelease(theDict);
  v15 = v113;
  v17 = v115;
  v70 = v111;
  v26 = v112;
  if (!v111 || !v111->_realFetch)
    goto LABEL_108;
LABEL_110:
  v79 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException"));
  if (v79)
    goto LABEL_142;
  v80 = -[NSSQLFetchDictionaryCountIntermediate generateSQLStringInContext:](v70, "generateSQLStringInContext:", v17);
  if (!v80)
  {
    v79 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("NSUnderlyingException"));
    if (!v79)
    {
LABEL_128:
      if (v26)
        v26->_isImpossibleCondition = 1;
      v99 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT 0 FROM %@ WHERE 0 = 1"), objc_msgSend((id)objc_msgSend(v17, "objectForKey:", CFSTR("entity")), "tableName"));
      if (v26)
      {
        v100 = (void *)v99;
        sqlString = v26->_sqlString;
        if (sqlString != (NSString *)v99)
        {

          v26->_sqlString = (NSString *)objc_msgSend(v100, "copy");
        }
      }
      goto LABEL_138;
    }
LABEL_142:
    v107 = v79;
    v108 = v79;

    v109 = v107;
    objc_exception_throw(v107);
  }
  v81 = (void *)v80;
  if (v26)
  {
    v82 = v26->_sqlString;
    if (v82 != (NSString *)v80)
    {

      v26->_sqlString = (NSString *)objc_msgSend(v81, "copy");
    }
  }
  -[NSSQLiteStatement setBindIntarrays:]((uint64_t)v26, (void *)objc_msgSend(v17, "objectForKey:", CFSTR("bindIntarrays")));
  v83 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("selectBindVars"));
  objc_msgSend(v83, "addObjectsFromArray:", objc_msgSend(v17, "objectForKey:", CFSTR("bindVars")));
  v84 = objc_msgSend(v83, "count");
  if (v84)
  {
    v85 = v84;
    for (m = 0; m != v85; ++m)
      objc_msgSend((id)objc_msgSend(v83, "objectAtIndex:", m), "setIndex:", m);
  }
  -[NSSQLiteAdapter _useModel:]((uint64_t)v26, v83);
  if (objc_msgSend(v17, "objectForKey:", CFSTR("fabricatedSQLEntityForReadOnlyFetch")))
    -[NSSQLiteStatement cacheFakeEntityForFetch:]((uint64_t)v26, (void *)objc_msgSend(v17, "objectForKey:", CFSTR("fabricatedSQLEntityForReadOnlyFetch")));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_138;
  v87 = objc_alloc_init(NSCachedFetchRequestInfo);
  v88 = (void *)objc_msgSend(v17, "valueForKey:", CFSTR("columnSubOrder"));
  v89 = objc_msgSend(v88, "count");
  v90 = (void *)objc_msgSend(v17, "valueForKey:", CFSTR("subOrder"));
  v92 = v90;
  if (v88 && v89 >= 2)
  {
    v114 = v15;
    v116 = v17;
    v93 = objc_msgSend(v90, "count");
    if (v93)
    {
      v94 = v93;
      v95 = 0;
      v96 = v89 >> 1;
      do
      {
        v97 = (void *)MEMORY[0x18D76B4E4]();
        v98 = (void *)objc_msgSend(v92, "objectAtIndex:", v95 + 1);
        objc_msgSend(v92, "replaceObjectAtIndex:withObject:", v95 + 1, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v98, "integerValue") + v96));
        objc_autoreleasePoolPop(v97);
        v95 += 2;
      }
      while (v95 < v94);
    }
    objc_msgSend(v88, "addObjectsFromArray:", v92);
    v15 = v114;
    v17 = v116;
  }
  else
  {
    v88 = v90;
  }
  if (!v87)
  {
    objc_msgSend(v17, "valueForKey:", CFSTR("bindIntarraysSubstitutionOrder"));
    if (!v26)
      goto LABEL_137;
    goto LABEL_136;
  }
  objc_setProperty_nonatomic(v87, v91, v88, 8);
  v102 = (void *)objc_msgSend(v17, "valueForKey:", CFSTR("bindIntarraysSubstitutionOrder"));
  objc_setProperty_nonatomic(v87, v103, v102, 16);
  if (v26)
LABEL_136:
    objc_setProperty_nonatomic(v26, v104, v87, 56);
LABEL_137:

LABEL_138:
  objc_autoreleasePoolPop(v15);
  return v26;
}

- (void)generateWhereIntermediatesInContext:(void *)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSSQLSimpleWhereIntermediate *v5;
  uint64_t v6;
  NSSQLCompoundWhereIntermediate *v7;
  NSSQLSimpleWhereIntermediate *v8;

  v2 = objc_msgSend(a1, "objectForKey:", CFSTR("outerFetch"));
  v3 = objc_msgSend(a1, "objectForKey:", CFSTR("predicate"));
  if (v3)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", v4, v2);
      v8 = v5;
      v6 = v2;
LABEL_7:
      -[NSSQLStatementIntermediate setWhereIntermediate:](v6, v5);

      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]([NSSQLCompoundWhereIntermediate alloc], "initWithPredicate:inScope:inContext:", v4, v2, a1);
      if (v7)
      {
        v5 = (NSSQLSimpleWhereIntermediate *)v7;
        v6 = v2;
        v8 = v5;
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(a1, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown predicate type for predicate: %@"), v4), 0), CFSTR("NSUnderlyingException"));
    }
  }
}

- (void)generateOrderIntermediateInContext:(void *)a1
{
  void *v2;
  uint64_t v3;
  NSSQLOrderIntermediate *v4;

  v2 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("storeRequest"));
  if (objc_msgSend(v2, "sortDescriptors"))
  {
    v3 = objc_msgSend(a1, "objectForKey:", CFSTR("outerFetch"));
    v4 = -[NSSQLOrderIntermediate initWithSortDescriptors:inScope:]([NSSQLOrderIntermediate alloc], "initWithSortDescriptors:inScope:", objc_msgSend(v2, "sortDescriptors"), v3);
    -[NSSQLStatementIntermediate setOrderIntermediate:](v3, v4);

  }
}

- (void)generateSelectIntermediateInContext:(void *)a1
{
  void *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSSQLReadOnlySelectIntermediate *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  unint64_t v26;
  NSExpressionDescription *v28;
  uint64_t v29;
  NSSQLSelectIntermediate *v30;
  int *v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD *v42;
  void *v43;
  NSSQLColumn *v44;
  NSSQLColumn *v45;
  _QWORD *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("outerFetch"));
  v3 = (_QWORD *)objc_msgSend(a1, "objectForKey:", CFSTR("entity"));
  v4 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("storeRequest"));
  v5 = objc_msgSend(v4, "resultType");
  v6 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("nestingLevel")), "unsignedIntValue");
  if (objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "count"))
    v7 = 1;
  else
    v7 = v5 == 2;
  v8 = v7;
  if (!v6)
  {
    if (v8)
    {
      v18 = (void *)objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "mutableCopy");
      if (objc_msgSend(v18, "count"))
      {
        if (!v5)
        {
          v46 = v3;
          v47 = v2;
          v19 = objc_msgSend(v18, "count");
          if (v19 - 1 >= 0)
          {
            v20 = v19;
            do
            {
              if (objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", --v20), "isTransient"))
                objc_msgSend(v18, "removeObjectAtIndex:", v20);
            }
            while (v20 > 0);
          }
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v49;
            while (2)
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v49 != v23)
                  objc_enumerationMutation(v18);
                v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                v26 = objc_msgSend(v25, "_propertyType");
                if (v26 > 7 || ((1 << v26) & 0xD4) == 0)
                {
                  objc_msgSend(a1, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad fetch request (NSManagedObjectResultType not compatible with contents of propertiesToFetch - property %@)"), objc_msgSend(v25, "name")), 0), CFSTR("NSUnderlyingException"));

                  return;
                }
              }
              v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
              if (v22)
                continue;
              break;
            }
          }
          v28 = objc_alloc_init(NSExpressionDescription);
          -[NSPropertyDescription setName:](v28, "setName:", CFSTR("ZZ_PK"));
          -[NSExpressionDescription setExpression:](v28, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"));
          -[NSExpressionDescription setExpressionResultType:](v28, "setExpressionResultType:", 2000);
          objc_msgSend(v18, "insertObject:atIndex:", v28, 0);

          v3 = v46;
          v2 = v47;
        }
LABEL_70:
        v17 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLReadOnlySelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, objc_msgSend(v2, "governingAlias"), v18, v2);

        if (!objc_msgSend(v4, "returnsDistinctResults") || v5 != 2)
          goto LABEL_88;
        goto LABEL_72;
      }

      v18 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "entity"), "attributesByName"), "allValues"), "mutableCopy");
      objc_msgSend(v18, "sortUsingFunction:context:", _comparePropertiesByName, 0);
      v39 = objc_msgSend(v18, "count");
      if (v39 - 1 < 0)
        goto LABEL_70;
      v40 = v39;
      while (1)
      {
        v41 = (void *)objc_msgSend(v18, "objectAtIndex:", --v40);
        if ((objc_msgSend(v41, "isTransient") & 1) == 0)
        {
          if (!v41 || objc_msgSend(v41, "attributeType") != 2100)
            goto LABEL_69;
          objc_msgSend(v18, "addObjectsFromArray:", objc_msgSend(v41, "_flattenElements:", objc_msgSend(v41, "elements")));
        }
        objc_msgSend(v18, "removeObjectAtIndex:", v40);
LABEL_69:
        if (v40 <= 0)
          goto LABEL_70;
      }
    }
    if ((objc_msgSend(v4, "includesPropertyValues") & 1) == 0)
    {
      v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v37 = v36;
      if (v3)
      {
        objc_msgSend(v36, "insertObject:atIndex:", v3[17], 0);
        v38 = v3[16];
      }
      else
      {
        objc_msgSend(v36, "insertObject:atIndex:", 0, 0);
        v38 = 0;
      }
      objc_msgSend(v37, "insertObject:atIndex:", v38, 1);
      if (!v3)
        goto LABEL_84;
      goto LABEL_81;
    }
    if (objc_msgSend(v4, "includesSubentities"))
    {
      if (v3)
      {
        v32 = (void *)v3[19];
        if (v32 && objc_msgSend(v32, "count"))
        {
          v33 = v3;
          while (v33)
          {
            v34 = v33;
            v33 = (_QWORD *)v33[21];
            if (v33 == v34)
              goto LABEL_80;
          }
          goto LABEL_90;
        }
LABEL_76:
        v37 = (id)v3[10];
        if (v37)
        {
LABEL_81:
          if (v3[20] || (v43 = (void *)v3[19]) != 0 && objc_msgSend(v43, "count"))
          {
LABEL_87:
            v17 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLSelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, objc_msgSend(v2, "governingAlias"), v37, v2);
            goto LABEL_88;
          }
LABEL_84:
          v37 = (id)objc_msgSend(v37, "mutableCopy");
          v44 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("0"), 1);
          v45 = v44;
          if (v44)
            *(_WORD *)&v44->super._flags &= ~1u;
          objc_msgSend(v37, "replaceObjectAtIndex:withObject:", 0, v44);

          goto LABEL_87;
        }
        v42 = v3;
        while (v42)
        {
          v34 = v42;
          v42 = (_QWORD *)v42[21];
          if (v42 == v34)
          {
LABEL_80:
            v37 = (id)v34[9];
            goto LABEL_81;
          }
        }
LABEL_90:
        v37 = 0;
        goto LABEL_81;
      }
    }
    else if (v3)
    {
      goto LABEL_76;
    }
    v37 = 0;
    goto LABEL_84;
  }
  if (!v8)
  {
    if (v3)
      v29 = v3[16];
    else
      v29 = 0;
    v30 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLSelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, objc_msgSend(v2, "governingAlias"), objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v29), v2);
    v17 = (NSSQLReadOnlySelectIntermediate *)v30;
    if (v5 != 4 || !v30)
      goto LABEL_88;
    v31 = &OBJC_IVAR___NSSQLSelectIntermediate__isCount;
    goto LABEL_74;
  }
  v9 = objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "count");
  if (v9 == 1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v11 = (void *)objc_msgSend(v4, "propertiesToFetch");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v53 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          if ((objc_msgSend(v16, "isTransient") & 1) == 0)
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v13);
    }
    v17 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:]([NSSQLReadOnlySelectIntermediate alloc], "initWithEntity:alias:fetchColumns:inScope:", v3, objc_msgSend(v2, "governingAlias"), v10, v2);
    if (!objc_msgSend(v4, "returnsDistinctResults"))
      goto LABEL_88;
LABEL_72:
    if (!v17)
    {
LABEL_88:
      -[NSSQLFetchIntermediate setSelectIntermediate:]((uint64_t)v2, v17);

      return;
    }
    v31 = &OBJC_IVAR___NSSQLSelectIntermediate__useDistinct;
LABEL_74:
    *((_BYTE *)&v17->super.super.super.isa + *v31) = 1;
    goto LABEL_88;
  }
  v35 = CFSTR("Too many");
  if (!v9)
    v35 = CFSTR("Too few");
  objc_msgSend(a1, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad NSFetchRequestExpression (%@ propertiesToFetch)"), v35), 0), CFSTR("NSUnderlyingException"));
}

- (NSSQLGenerator)initWithPersistentStore:(id)a3
{
  NSSQLGenerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLGenerator;
  result = -[NSSQLGenerator init](&v5, sel_init);
  if (result)
    result->_persistentStore = (NSSQLCore *)a3;
  return result;
}

- (void)generateIntermediateForLimit:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3;
  NSSQLLimitIntermediate *v4;

  v3 = objc_msgSend(a2, "objectForKey:", CFSTR("outerFetch"));
  v4 = -[NSSQLLimitIntermediate initWithLimit:inScope:]([NSSQLLimitIntermediate alloc], "initWithLimit:inScope:", a1, v3);
  -[NSSQLStatementIntermediate setLimitIntermediate:](v3, v4);

}

- (void)generateGroupByIntermediatesForProperties:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3;
  NSSQLGroupByIntermediate *v4;

  v3 = objc_msgSend(a2, "objectForKey:", CFSTR("outerFetch"));
  v4 = -[NSSQLGroupByIntermediate initWithProperties:inScope:]([NSSQLGroupByIntermediate alloc], "initWithProperties:inScope:", a1, v3);
  -[NSSQLFetchIntermediate setGroupByIntermediate:](v3, v4);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_self();
    supportedFunctions = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("@min"), CFSTR("@max"), CFSTR("@sum"), CFSTR("@avg"), 0);
  }
}

- (void)generateIntermediateForOffset:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3;
  NSSQLOffsetIntermediate *v4;

  v3 = objc_msgSend(a2, "objectForKey:", CFSTR("outerFetch"));
  v4 = -[NSSQLOffsetIntermediate initWithOffset:inScope:]([NSSQLOffsetIntermediate alloc], "initWithOffset:inScope:", a1, v3);
  -[NSSQLFetchIntermediate setOffsetIntermediate:](v3, v4);

}

- (void)generateHavingIntermediateForPredicate:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v4;
  NSSQLHavingIntermediate *v5;

  v4 = objc_msgSend(a2, "objectForKey:", CFSTR("outerFetch"));
  v5 = -[NSSQLHavingIntermediate initWithPredicate:inScope:inContext:]([NSSQLHavingIntermediate alloc], "initWithPredicate:inScope:inContext:", a1, v4, a2);
  -[NSSQLFetchIntermediate setHavingIntermediate:](v4, v5);

}

- (NSSQLiteStatement)newSQLStatmentForBinaryIndex:(uint64_t)a3 inStore:
{
  NSSQLiteStatement *v3;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  NSString *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSString *sqlString;
  uint64_t v54;

  v3 = a1;
  if (a1)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(a2, "sqlEntity"), CFSTR("entity"));
    objc_msgSend(v7, "setObject:forKey:", a3, CFSTR("persistentStore"));
    v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "indexDescription"), "partialIndexPredicate"), "minimalFormInContext:", v7);
    v9 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    if (v8 && v9 != v8)
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("predicate"));
    v10 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("NSUnderlyingException"));
    if (objc_msgSend(v7, "objectForKey:", CFSTR("NSUnderlyingException")))
    {
      _NSCoreDataLog(2, (uint64_t)CFSTR("Unable to generate index for %@"), v11, v12, v13, v14, v15, v16, (uint64_t)a2);
      v17 = objc_msgSend(v10, "reason");
      objc_msgSend(v10, "userInfo");
      _NSCoreDataLog(2, (uint64_t)CFSTR("Reason: %@, %@"), v18, v19, v20, v21, v22, v23, v17);
    }
    else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance"), "isEqual:", objc_msgSend(v7, "objectForKey:", CFSTR("predicate"))))
    {
      _NSCoreDataLog(2, (uint64_t)CFSTR("Unable to generate index for %@"), v24, v25, v26, v27, v28, v29, (uint64_t)a2);
      _NSCoreDataLog(2, (uint64_t)CFSTR("Reason: predicate always evaluates to false"), v30, v31, v32, v33, v34, v35, v54);
    }
    else
    {
      v3 = -[NSSQLiteAdapter newStatementWithEntity:]((NSSQLiteStatement *)-[NSSQLEntity adapter](v3->_entity, "adapter"), objc_msgSend(v7, "objectForKey:", CFSTR("entity")));
      v37 = -[NSSQLIndexIntermediate initForIndex:withScope:]([NSSQLIndexIntermediate alloc], "initForIndex:withScope:", a2, 0);
      v38 = (NSString *)objc_msgSend(v37, "generateSQLStringInContext:", v7);

      v39 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("NSUnderlyingException"));
      if (!objc_msgSend(v7, "objectForKey:", CFSTR("NSUnderlyingException")))
      {
        if (v3)
        {
          sqlString = v3->_sqlString;
          if (sqlString != v38)
          {

            v3->_sqlString = (NSString *)-[NSString copy](v38, "copy");
          }
        }

        goto LABEL_10;
      }
      _NSCoreDataLog(2, (uint64_t)CFSTR("Unable to generate index for %@"), v40, v41, v42, v43, v44, v45, (uint64_t)a2);
      v46 = objc_msgSend(v39, "reason");
      objc_msgSend(v39, "userInfo");
      _NSCoreDataLog(2, (uint64_t)CFSTR("Reason: %@, %@"), v47, v48, v49, v50, v51, v52, v46);

    }
    v3 = 0;
LABEL_10:

    objc_msgSend(v6, "drain");
  }
  return v3;
}

@end
