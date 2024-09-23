@implementation NSOrderedSet(NSOrderedSetDiffing)

- (NSOrderedCollectionDifference)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot diff nil parameter"), 0));
  v5 = a3;
  v6 = a1;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend(a1, "count");
  v9 = objc_msgSend(v5, "count");
  v10 = v8 - v9;
  if (v8 - v9 < 0)
    v10 = v9 - v8;
  if (v10 >= 0x10)
  {
    v12 = objc_msgSend(v6, "count");
    v13 = objc_msgSend(v5, "count");
    if (v12 - v13 >= 0)
      v11 = v12 - v13;
    else
      v11 = v13 - v12;
  }
  else
  {
    v11 = 16;
  }
  v14 = (void *)objc_msgSend(v7, "arrayWithCapacity:", v11);
  if (!objc_msgSend(v5, "count"))
  {
    v19 = 0;
    v18 = 0;
    goto LABEL_74;
  }
  v59 = 0;
  v60 = a4;
  v15 = 0;
  v52 = 0;
  v53 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v61 = v14;
  v62 = v5;
  v63 = v6;
  while (2)
  {
    v22 = -v20;
    v23 = -v21;
    v24 = v18;
    v25 = v19;
    v26 = v17;
    v54 = v23;
    v55 = v22;
    while (2)
    {
      v57 = v15;
      v27 = 0;
      v28 = v22 + v24;
      v29 = v23 + v25;
      while (1)
      {
        v17 = v26;
        v18 = v24 + v27;
        v19 = v25 + v27;
        if (v24 + v27 >= objc_msgSend(v63, "count", v52))
          goto LABEL_73;
        v30 = v29 + v27;
        if (v29 + v27)
          v17 = (void *)objc_msgSend(v62, "objectAtIndexedSubscript:", v25 + v27);
        v31 = v28 + v27;
        if (v28 + v27)
          v16 = (void *)objc_msgSend(v63, "objectAtIndexedSubscript:", v24 + v27);
        v26 = v17;
        if (v17 != v16)
          break;
        ++v27;
        v19 = v25 + v27;
        v16 = v17;
        if (v25 + v27 >= objc_msgSend(v62, "count"))
        {
          v18 = v24 + v27;
LABEL_73:
          v14 = v61;
          v5 = v62;
          v6 = v63;
          a4 = v60;
          goto LABEL_74;
        }
      }
      v15 = v57;
      if (v30)
        v15 = objc_msgSend(v17, "hash");
      v32 = v59;
      if (v31)
        v32 = objc_msgSend(v16, "hash");
      if (v15 == v32)
      {
        if (objc_msgSend(v17, "isEqual:", v16))
        {
          v25 += v27 + 1;
          v24 += v27 + 1;
          v33 = objc_msgSend(v62, "count");
          v59 = v15;
          v23 = v54;
          v22 = v55;
          if (v25 < v33)
            continue;
          v19 = v25;
          v18 = v24;
          goto LABEL_73;
        }
        v32 = v15;
      }
      break;
    }
    v59 = v32;
    if (v30)
      v52 = objc_msgSend(v63, "indexOfObject:", v17);
    v34 = v53;
    if (v31)
      v34 = objc_msgSend(v62, "indexOfObject:", v16);
    v53 = v34;
    v56 = v25 + v27;
    v58 = v24 + v27;
    if (v52 == 0x7FFFFFFFFFFFFFFFLL || v52 < v24 + v27)
    {
      if ((v60 & 2) != 0)
        v38 = 0;
      else
        v38 = v17;
      if ((v60 & 4) != 0)
        v39 = v52;
      else
        v39 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v61, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v38, 1, v25 + v27, v39, v52));
      v34 = v53;
      v19 = v25 + v27 + 1;
      if (v53 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v35 = v24;
        v5 = v62;
      }
      else
      {
        v18 = v24 + v27;
        v35 = v24;
        v5 = v62;
        if (v53 > v25 + v27)
          goto LABEL_70;
      }
    }
    else
    {
      v35 = v24;
      v19 = v25 + v27;
      v5 = v62;
      if (v34 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = v25 + v27;
        if (v34 >= v56)
        {
          if (v52 - v35 - v27 >= v34 - v25 - v27)
          {
            if ((v60 & 2) != 0)
              v40 = 0;
            else
              v40 = v17;
            if ((v60 & 4) != 0)
              v41 = v52;
            else
              v41 = 0x7FFFFFFFFFFFFFFFLL;
            objc_msgSend(v61, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v40, 1, v56, v41, v52));
            v19 = v25 + v27 + 1;
            v18 = v58;
          }
          else
          {
            if ((v60 & 1) != 0)
              v36 = 0;
            else
              v36 = v16;
            if ((v60 & 4) != 0)
              v37 = v34;
            else
              v37 = 0x7FFFFFFFFFFFFFFFLL;
            objc_msgSend(v61, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v36, 0, v58, v37, v52));
            v18 = v35 + v27 + 1;
            v19 = v25 + v27;
          }
          goto LABEL_70;
        }
      }
    }
    if ((v60 & 1) != 0)
      v42 = 0;
    else
      v42 = v16;
    if ((v60 & 4) != 0)
      v43 = v34;
    else
      v43 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v61, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v42, 0, v58, v43, v52));
    v18 = v35 + v27 + 1;
LABEL_70:
    v44 = objc_msgSend(v5, "count");
    a4 = v60;
    v14 = v61;
    v6 = v63;
    v21 = v56;
    v20 = v58;
    if (v19 < v44)
      continue;
    break;
  }
LABEL_74:
  while (v19 < objc_msgSend(v5, "count"))
  {
    v45 = objc_msgSend(v5, "objectAtIndexedSubscript:", v19);
    if ((a4 & 4) != 0)
      v46 = objc_msgSend(v6, "indexOfObject:", v45);
    else
      v46 = 0x7FFFFFFFFFFFFFFFLL;
    if ((a4 & 2) != 0)
      v47 = 0;
    else
      v47 = v45;
    objc_msgSend(v14, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v47, 1, v19++, v46));
  }
  for (; v18 < objc_msgSend(v6, "count"); ++v18)
  {
    v48 = objc_msgSend(v6, "objectAtIndexedSubscript:", v18);
    if ((a4 & 4) != 0)
      v49 = objc_msgSend(v5, "indexOfObject:", v48);
    else
      v49 = 0x7FFFFFFFFFFFFFFFLL;
    if ((a4 & 1) != 0)
      v50 = 0;
    else
      v50 = v48;
    objc_msgSend(v14, "addObject:", +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:](NSOrderedCollectionChange, "changeWithObject:type:index:associatedIndex:", v50, 0, v18, v49));
  }
  return -[NSOrderedCollectionDifference initWithChanges:]([NSOrderedCollectionDifference alloc], "initWithChanges:", v14);
}

- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing
{
  return objc_msgSend(a1, "differenceFromOrderedSet:withOptions:", a3, 0);
}

- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:usingEquivalenceTest:
{
  if (a5)
    return objc_msgSend((id)objc_msgSend(a1, "array"), "differenceFromArray:withOptions:usingEquivalenceTest:", objc_msgSend(a3, "array"), a4, a5);
  else
    return objc_msgSend(a1, "differenceFromOrderedSet:withOptions:", a3, a4);
}

- (id)orderedSetByApplyingDifference:()NSOrderedSetDiffing
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
