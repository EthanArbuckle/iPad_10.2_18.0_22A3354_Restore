@implementation NSArray(NSArrayDiffing)

- (NSOrderedCollectionDifference)differenceFromArray:()NSArrayDiffing withOptions:usingEquivalenceTest:
{
  NSPointerArray *v7;
  NSPointerArray *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;
  unint64_t v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  NSOrderedCollectionChange *v30;
  uint64_t v31;
  NSOrderedCollectionChange *v32;
  uint64_t v33;
  NSValue *v34;
  uint64_t v35;
  NSValue *v36;
  uint64_t v37;
  NSOrderedCollectionChange *v38;
  uint64_t v39;
  unint64_t v40;
  NSOrderedCollectionChange *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSOrderedCollectionChange *v56;
  uint64_t v57;
  NSOrderedCollectionChange *v58;
  NSOrderedCollectionChange *v59;
  uint64_t v60;
  NSOrderedCollectionChange *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  uint64_t v67;
  NSOrderedCollectionChange *v68;
  uint64_t v69;
  NSOrderedCollectionChange *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  void *v75;
  uint64_t v76;
  NSOrderedCollectionChange *v77;
  uint64_t v78;
  NSOrderedCollectionChange *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v84;
  uint64_t v85;
  const __CFString *v86;
  void *v87;
  NSPointerArray *v88;
  id obja;
  uint64_t v91;
  char v92;
  uint64_t v93;
  void *context;
  void *contexta;
  uint64_t v96;
  uint64_t v97;
  void *v99;
  _BYTE v100[128];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v84 = (void *)MEMORY[0x1E0C99DA0];
    v85 = *MEMORY[0x1E0C99778];
    v86 = CFSTR("Cannot diff nil parameter");
    goto LABEL_104;
  }
  if ((a4 & 4) != 0 && a5 != &__block_literal_global_28)
  {
    v84 = (void *)MEMORY[0x1E0C99DA0];
    v85 = *MEMORY[0x1E0C99778];
    v86 = CFSTR("Inferring moves is not supported when using a custom equivalence test");
LABEL_104:
    objc_exception_throw((id)objc_msgSend(v84, "exceptionWithName:reason:userInfo:", v85, v86, 0));
  }
  v7 = _myersDescent(a1, a3, (uint64_t)a5);
  v8 = v7;
  v92 = a4;
  if ((a4 & 4) != 0)
  {
    v97 = objc_opt_new();
    v93 = objc_opt_new();
    v96 = objc_opt_new();
    v91 = objc_opt_new();
    v9 = -1;
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSPointerArray count](v7, "count") - 1);
    v96 = -1;
    v97 = -1;
    v93 = -1;
    v91 = -1;
  }
  context = (void *)MEMORY[0x186DA8F78]();
  v10 = objc_msgSend(a3, "count");
  v11 = objc_msgSend(a1, "count");
  v12 = -[NSPointerArray count](v8, "count");
  v88 = v8;
  if (v12 >= 2)
  {
    v13 = v12;
    v14 = &off_1E0F10000;
    do
    {
      v15 = -[NSPointerArray pointerAtIndex:](v8, "pointerAtIndex:", v13 - 1);
      v16 = v10 - v11;
      v17 = 1;
      if (v10 - v11 != 1 - v13)
      {
        if (v16 == v13 - 1)
          goto LABEL_14;
        v18 = 1 - v16;
        if (v16 >= 2)
          v18 = v16 - 2;
        v19 = *(_QWORD *)(v15 + 8 * v18);
        v17 = 1;
        if (v19 >= *(_QWORD *)(v15 + 8 * (v16 ^ (v16 >> 63))))
LABEL_14:
          v17 = -1;
      }
      v20 = v17 + v16;
      v21 = v20 - 1;
      if (v20 < 1)
        v21 = -v20;
      v22 = *(_QWORD *)(v15 + 8 * v21);
      v23 = v22 - v20;
      v24 = v11 > v23;
      v25 = v10 > v22;
      v26 = v11;
      v27 = v10 > v22 && v11 > v23;
      if (v27)
      {
        do
        {
          --v10;
          v24 = --v26 > v23;
          v25 = v10 > v22;
        }
        while (v10 > v22 && v26 > v23);
      }
      v28 = v10 == v22 && v24;
      v29 = v26 == v23 && v25;
      if (!v28 && !v29)
        __assert_rtn("_generateElements", "NSArray+NSArrayDiffing.m", 145, "(x == prev_x && y > prev_y) || (y == prev_y && x > prev_x)");
      v10 = v22;
      v11 = v23;
      if (v26 == v23)
      {
        if ((v92 & 4) != 0)
        {
          v33 = objc_msgSend(a3, "objectAtIndexedSubscript:", v22);
          v34 = +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v33);
          if (objc_msgSend((id)v91, "objectForKeyedSubscript:", v34))
            v35 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          else
            v35 = objc_msgSend(v14[445], "numberWithUnsignedInteger:", v10);
          objc_msgSend((id)v91, "setObject:forKeyedSubscript:", v35, v34);
          v42 = objc_msgSend(v14[445], "numberWithUnsignedInteger:", v10);
          v43 = (void *)v93;
LABEL_52:
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v33, v42);
          v8 = v88;
          goto LABEL_53;
        }
        v30 = [NSOrderedCollectionChange alloc];
        if ((v92 & 2) != 0)
          v31 = 0;
        else
          v31 = objc_msgSend(a3, "objectAtIndexedSubscript:", v10);
        v38 = v30;
        v39 = 1;
        v40 = v10;
      }
      else
      {
        if ((v92 & 4) != 0)
        {
          v33 = objc_msgSend(a1, "objectAtIndexedSubscript:", v23);
          v36 = +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v33);
          if (objc_msgSend((id)v96, "objectForKeyedSubscript:", v36))
            v37 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          else
            v37 = objc_msgSend(v14[445], "numberWithUnsignedInteger:", v11);
          objc_msgSend((id)v96, "setObject:forKeyedSubscript:", v37, v36);
          v42 = objc_msgSend(v14[445], "numberWithUnsignedInteger:", v11);
          v43 = (void *)v97;
          goto LABEL_52;
        }
        v32 = [NSOrderedCollectionChange alloc];
        if ((v92 & 1) != 0)
          v31 = 0;
        else
          v31 = objc_msgSend(a1, "objectAtIndexedSubscript:", v11);
        v38 = v32;
        v39 = 0;
        v40 = v11;
      }
      v41 = -[NSOrderedCollectionChange initWithObject:type:index:](v38, "initWithObject:type:index:", v31, v39, v40);
      objc_msgSend((id)v9, "addObject:", v41);

      v14 = &off_1E0F10000;
LABEL_53:
      v27 = v13-- <= 2;
    }
    while (!v27);
  }
  objc_autoreleasePoolPop(context);
  v44 = (void *)v9;
  if ((v92 & 4) != 0)
  {
    if (a5 != &__block_literal_global_28)
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSArray<NSOrderedCollectionChange *> *_generateElements(NSArray *, NSArray *, NSPointerArray *, NSOrderedCollectionDifferenceCalculationOptions, BOOL (^)(id, id))"), CFSTR("NSArray+NSArrayDiffing.m"), 186, CFSTR("Implementation does not support inferring moves using a custom equality test"));
    v44 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSPointerArray count](v8, "count") - 1);
    v45 = (void *)objc_opt_new();
    v99 = (void *)objc_opt_new();
    v87 = (void *)MEMORY[0x186DA8F78]();
    v46 = (void *)objc_msgSend((id)v91, "keysOfEntriesPassingTest:", &__block_literal_global_36);
    objc_msgSend((id)v96, "removeObjectsForKeys:", objc_msgSend((id)objc_msgSend((id)v96, "keysOfEntriesPassingTest:", &__block_literal_global_37_0), "allObjects"));
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    obja = v46;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v111, v110, 16);
    if (v47)
    {
      v48 = v47;
      contexta = *(void **)v112;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(void **)v112 != contexta)
            objc_enumerationMutation(obja);
          v50 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
          v51 = objc_msgSend(v50, "nonretainedObjectValue");
          v52 = objc_msgSend((id)v96, "objectForKeyedSubscript:", v50);
          if (v52)
          {
            v53 = (void *)v52;
            v54 = objc_msgSend((id)objc_msgSend((id)v91, "objectForKeyedSubscript:", v50), "unsignedIntegerValue");
            v55 = objc_msgSend(v53, "unsignedIntegerValue");
            v56 = [NSOrderedCollectionChange alloc];
            if ((v92 & 2) != 0)
              v57 = 0;
            else
              v57 = v51;
            v58 = -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:](v56, "initWithObject:type:index:associatedIndex:", v57, 1, v54, v55);
            v59 = [NSOrderedCollectionChange alloc];
            v60 = 0;
            if ((v92 & 1) == 0)
              v60 = objc_msgSend((id)v97, "objectForKeyedSubscript:", v53);
            v61 = -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:](v59, "initWithObject:type:index:associatedIndex:", v60, 0, v55, v54);
            objc_msgSend(v44, "addObject:", v58);
            objc_msgSend(v44, "addObject:", v61);
            objc_msgSend(v99, "addIndex:", v54);
            objc_msgSend(v45, "addIndex:", v55);

          }
        }
        v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v111, v110, 16);
      }
      while (v48);
    }
    objc_autoreleasePoolPop(v87);
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v62 = objc_msgSend((id)v93, "countByEnumeratingWithState:objects:count:", &v106, v105, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v107;
      do
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v107 != v64)
            objc_enumerationMutation((id)v93);
          v66 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
          v67 = objc_msgSend(v66, "unsignedIntegerValue");
          if ((objc_msgSend(v99, "containsIndex:", v67) & 1) == 0)
          {
            v68 = [NSOrderedCollectionChange alloc];
            if ((v92 & 2) != 0)
              v69 = 0;
            else
              v69 = objc_msgSend((id)v93, "objectForKeyedSubscript:", v66);
            v70 = -[NSOrderedCollectionChange initWithObject:type:index:](v68, "initWithObject:type:index:", v69, 1, v67);
            objc_msgSend(v44, "addObject:", v70);

          }
        }
        v63 = objc_msgSend((id)v93, "countByEnumeratingWithState:objects:count:", &v106, v105, 16);
      }
      while (v63);
    }
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v71 = objc_msgSend((id)v97, "countByEnumeratingWithState:objects:count:", &v101, v100, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v72; ++k)
        {
          if (*(_QWORD *)v102 != v73)
            objc_enumerationMutation((id)v97);
          v75 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
          v76 = objc_msgSend(v75, "unsignedIntegerValue");
          if ((objc_msgSend(v45, "containsIndex:", v76) & 1) == 0)
          {
            v77 = [NSOrderedCollectionChange alloc];
            if ((v92 & 1) != 0)
              v78 = 0;
            else
              v78 = objc_msgSend((id)v97, "objectForKeyedSubscript:", v75);
            v79 = -[NSOrderedCollectionChange initWithObject:type:index:](v77, "initWithObject:type:index:", v78, 0, v76);
            objc_msgSend(v44, "addObject:", v79);

          }
        }
        v72 = objc_msgSend((id)v97, "countByEnumeratingWithState:objects:count:", &v101, v100, 16);
      }
      while (v72);
    }

    v8 = v88;
  }
  v80 = -[NSPointerArray count](v8, "count");
  if (v80)
  {
    v81 = v80 - 1;
    do
    {
      v82 = -[NSPointerArray pointerAtIndex:](v8, "pointerAtIndex:", v81);
      -[NSPointerArray removePointerAtIndex:](v8, "removePointerAtIndex:", v81);
      free(v82);
      --v81;
    }
    while (v81 != -1);
  }

  return -[NSOrderedCollectionDifference initWithChanges:]([NSOrderedCollectionDifference alloc], "initWithChanges:", v44);
}

- (uint64_t)differenceFromArray:()NSArrayDiffing
{
  return objc_msgSend(a1, "differenceFromArray:withOptions:", a3, 0);
}

- (uint64_t)differenceFromArray:()NSArrayDiffing withOptions:
{
  return objc_msgSend(a1, "differenceFromArray:withOptions:usingEquivalenceTest:", a3, a4, &__block_literal_global_28);
}

- (id)arrayByApplyingDifference:()NSArrayDiffing
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id result;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id)objc_msgSend(a1, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "changeType");
        v11 = objc_msgSend(v9, "index");
        v12 = objc_msgSend(v4, "count");
        if (v10 == 1)
        {
          if (v11 >= v12)
            return 0;
          objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v9, "index"));
        }
        else
        {
          if (v11 > v12)
            return 0;
          result = (id)objc_msgSend(v9, "object");
          if (!result)
            return result;
          objc_msgSend(v4, "insertObject:atIndex:", objc_msgSend(v9, "object"), objc_msgSend(v9, "index"));
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
  return (id)objc_msgSend(v4, "copy");
}

@end
