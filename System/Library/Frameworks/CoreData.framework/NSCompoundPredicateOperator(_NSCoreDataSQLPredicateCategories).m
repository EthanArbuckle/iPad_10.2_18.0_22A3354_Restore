@implementation NSCompoundPredicateOperator(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicates:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_msgSend(a1, "operatorType");
  if (v8 != 2)
  {
    if (v8 != 1)
    {
      if (v8)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Bad compound predicate predicateOperator type"), 0));
      v9 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "minimalFormInContext:", a3);
      v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance"), "isEqual:", v9);
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance");
      v12 = (uint64_t)v11;
      if ((v10 & 1) != 0)
        return (id)v12;
      if (objc_msgSend(v11, "isEqual:", v9))
        return (id)objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance");
      objc_msgSend(v7, "addObject:", v9);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(a1, "operatorType"), v7);
    }
    v33 = a1;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      while (2)
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(a4);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v26);
          v19 = (void *)MEMORY[0x18D76B4E4]();
          v28 = objc_msgSend(v27, "minimalFormInContext:", a3);
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance"), "isEqual:", v28) & 1) != 0)
          {
            v31 = (void *)MEMORY[0x1E0CB35F0];
            goto LABEL_36;
          }
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance"), "isEqual:", v28) & 1) == 0)
            objc_msgSend(v7, "addObject:", v28);
          objc_autoreleasePoolPop(v19);
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v24)
          continue;
        break;
      }
    }
    v29 = objc_msgSend(v7, "count");
    if (v29 != 1)
    {
      a1 = v33;
      if (!v29)
      {
        v22 = (void *)MEMORY[0x1E0CB3980];
        return (id)objc_msgSend(v22, "defaultInstance");
      }
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(a1, "operatorType"), v7);
    }
    return (id)objc_msgSend(v7, "objectAtIndex:", 0);
  }
  v32 = a1;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(a4);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x18D76B4E4]();
        v20 = objc_msgSend(v18, "minimalFormInContext:", a3);
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance"), "isEqual:", v20) & 1) != 0)
        {
          v31 = (void *)MEMORY[0x1E0CB3980];
LABEL_36:
          v12 = objc_msgSend(v31, "defaultInstance");
          objc_autoreleasePoolPop(v19);
          return (id)v12;
        }
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance"), "isEqual:", v20) & 1) == 0)
          objc_msgSend(v7, "addObject:", v20);
        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v15)
        continue;
      break;
    }
  }
  v21 = objc_msgSend(v7, "count");
  if (v21 == 1)
    return (id)objc_msgSend(v7, "objectAtIndex:", 0);
  a1 = v32;
  if (v21)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(a1, "operatorType"), v7);
  v22 = (void *)MEMORY[0x1E0CB35F0];
  return (id)objc_msgSend(v22, "defaultInstance");
}

@end
