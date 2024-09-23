@implementation NSConstraintCache

- (uint64_t)extendConstraint:(void *)a3 onParentEntity:(uint64_t)a4 parentCache:
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v30 = result;
  if (result)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)objc_msgSend(a3, "subentities");
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    v27 = result;
    if (result)
    {
      v26 = *(_QWORD *)v43;
      v36 = a4;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v43 != v26)
          {
            v6 = v5;
            objc_enumerationMutation(obj);
            v5 = v6;
          }
          v28 = v5;
          v32 = *(_QWORD **)(*((_QWORD *)&v42 + 1) + 8 * v5);
          v7 = -[NSEntityDescription _extensionsOfParentConstraint:](v32, a2);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v31 = v7;
          v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          if (v34)
          {
            v33 = *(_QWORD *)v39;
            do
            {
              v8 = 0;
              do
              {
                if (*(_QWORD *)v39 != v33)
                  objc_enumerationMutation(v31);
                v37 = v8;
                v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
                v9 = objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
                if (a4)
                {
                  v10 = (void *)v9;
                  v48 = 0u;
                  v49 = 0u;
                  v46 = 0u;
                  v47 = 0u;
                  v11 = *(void **)(a4 + 40);
                  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
                  if (v12)
                  {
                    v13 = v12;
                    v14 = *(_QWORD *)v47;
                    do
                    {
                      v15 = 0;
                      do
                      {
                        if (*(_QWORD *)v47 != v14)
                          objc_enumerationMutation(v11);
                        v16 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v15);
                        if (v16)
                          v17 = *(void **)(v16 + 8);
                        else
                          v17 = 0;
                        v18 = objc_msgSend(v10, "count");
                        v19 = objc_msgSend(v17, "count");
                        if (v18 > v19)
                        {
                          v20 = v19;
                          if (v19)
                          {
                            v21 = 0;
                            v22 = 0;
                            do
                            {
                              v22 += objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v21), "isEqual:", objc_msgSend(v17, "objectAtIndex:", v21));
                              ++v21;
                            }
                            while (v20 != v21);
                          }
                          else
                          {
                            v22 = 0;
                          }
                          if (v22 == v20)
                          {
                            a4 = v36;
                            goto LABEL_35;
                          }
                        }
                        ++v15;
                      }
                      while (v15 != v13);
                      v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
                      v13 = v23;
                      a4 = v36;
                    }
                    while (v23);
                  }
                }
                v24 = -[NSConstraintCache initForEntity:constraint:extension:]([NSConstraintCache alloc], (uint64_t)v32, (void *)objc_msgSend(v35, "objectAtIndexedSubscript:", 0), (void *)objc_msgSend(v35, "objectAtIndexedSubscript:", 2));
                if (a4)
                  objc_msgSend(*(id *)(a4 + 40), "addObject:", v24);

                -[NSConstraintCache extendConstraint:onParentEntity:parentCache:](v30, objc_msgSend(v35, "objectAtIndexedSubscript:", 0), v32, v24);
LABEL_35:
                v8 = v37 + 1;
              }
              while (v37 + 1 != v34);
              v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
            }
            while (v34);
          }
          -[NSConstraintCache extendConstraint:onParentEntity:parentCache:](v30, a2, v32, a4);
          v5 = v28 + 1;
        }
        while (v28 + 1 != v27);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        v27 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_entity = 0;

  self->_constraint = 0;
  self->_extension = 0;

  self->_children = 0;
  self->_knownValues = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSConstraintCache;
  -[NSConstraintCache dealloc](&v3, sel_dealloc);
}

- (uint64_t)reset
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "removeAllObjects");
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v2 = *(void **)(v1 + 40);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v2);
          -[NSConstraintCache reset](*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++));
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v3 = result;
      }
      while (result);
    }
  }
  return result;
}

+ (uint64_t)createCachesForEntity:(uint64_t)a3 forValidator:
{
  uint64_t v5;
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (a2)
  {
    v5 = a2[16];
    if (!v5 || (v6 = *(void **)(v5 + 24)) == 0)
      v6 = (void *)NSArray_EmptyArray;
  }
  else
  {
    v6 = 0;
  }
  result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((-[NSEntityDescription _constraintIsExtension:](objc_msgSend(a2, "superentity", (_QWORD)v13), v11) & 1) == 0)
        {
          v12 = -[NSConstraintCache initForEntity:constraint:extension:]([NSConstraintCache alloc], (uint64_t)a2, v11, 0);
          -[NSConstraintCache extendConstraint:onParentEntity:parentCache:]((uint64_t)v12, v11, a2, (uint64_t)v12);
          -[NSConstraintValidator _addConstraintRoot:forEntity:](a3, (uint64_t)v12, a2);

        }
        ++v10;
      }
      while (v8 != v10);
      result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

- (_QWORD)initForEntity:(void *)a3 constraint:(void *)a4 extension:
{
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)NSConstraintCache;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[3] = a2;
    v7[1] = a3;
    v8[2] = a4;
    v8[5] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8[4] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v8;
}

- (_QWORD)validateForSave:(_QWORD *)result
{
  id v2;
  _QWORD *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _QWORD v12[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = a2;
    v3 = result;
    if (a2)
      v4 = a2;
    else
      v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)v3[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)-[NSConstraintCache validateForSave:](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), v2), "allObjects"));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    v11 = (void *)v3[4];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__NSConstraintCache_validateForSave___block_invoke;
    v12[3] = &unk_1E1EE03C0;
    v12[4] = v3;
    v12[5] = v2;
    v12[6] = v5;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);

    return v5;
  }
  return result;
}

- (uint64_t)registerObject:(uint64_t)result
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  NSConstraintCacheKey *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  result = objc_msgSend((id)objc_msgSend(a2, "entity"), "isKindOfEntity:", *(_QWORD *)(result + 24));
  if (!(_DWORD)result)
    return result;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = v3;
  v5 = *(void **)(v3 + 8);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (!v6)
    goto LABEL_25;
  v7 = v6;
  v8 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v38 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      v11 = (void *)objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
      if ((unint64_t)objc_msgSend(v11, "count") < 2)
      {
        v13 = (void *)objc_msgSend(a2, "valueForKey:", v10);
        if (!v13)
          goto LABEL_19;
      }
      else
      {
        if (!objc_msgSend(v11, "count"))
          goto LABEL_19;
        v12 = 0;
        v13 = 0;
        do
        {
          v14 = objc_msgSend(v11, "objectAtIndex:", v12);
          if (v12)
            v15 = objc_msgSend(v13, "objectForKey:", v14);
          else
            v15 = objc_msgSend(a2, "valueForKey:", v14);
          v13 = (void *)v15;
          ++v12;
        }
        while (objc_msgSend(v11, "count") > v12);
        if (!v13)
        {
LABEL_19:
          v16 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          goto LABEL_22;
        }
      }
      if (objc_msgSend(v13, "isNSString"))
      {
        v16 = +[_PFRoutines sanitize:]((uint64_t)_PFRoutines, v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_23;
        v16 = objc_msgSend(v13, "objectID");
      }
LABEL_22:
      v13 = (void *)v16;
LABEL_23:
      objc_msgSend(v4, "addObject:", v13);
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  }
  while (v7);
LABEL_25:
  v17 = *(void **)(v32 + 16);
  if (!v17)
    v17 = *(void **)(v32 + 8);
  if (objc_msgSend(v17, "count") == 1)
  {
    v18 = (id)objc_msgSend(v4, "firstObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (id)objc_msgSend(v18, "objectID");

      v18 = v19;
    }
  }
  else
  {
    v20 = [NSConstraintCacheKey alloc];
    if (v20)
    {
      v45.receiver = v20;
      v45.super_class = (Class)NSConstraintCacheKey;
      v18 = objc_msgSendSuper2(&v45, sel_init);
      if (v18)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v42;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v42 != v24)
                objc_enumerationMutation(v4);
              v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v26 = (void *)objc_msgSend(v26, "objectID");
              objc_msgSend(v21, "addObject:", v26);
            }
            v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
          }
          while (v23);
        }
        v18[1] = objc_msgSend(v21, "copy");

      }
    }
    else
    {
      v18 = 0;
    }
  }
  v27 = (id)objc_msgSend(*(id *)(v32 + 32), "objectForKey:", v18);
  if (!v27)
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(v32 + 32), "setObject:forKey:", v27, v18);

  }
  objc_msgSend(v27, "addObject:", a2);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = *(void **)(v32 + 40);
  result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (result)
  {
    v29 = result;
    v30 = *(_QWORD *)v34;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v28);
        -[NSConstraintCache registerObject:](*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v31++), a2);
      }
      while (v29 != v31);
      result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      v29 = result;
    }
    while (result);
  }
  return result;
}

void __37__NSConstraintCache_validateForSave___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSConstraintConflict *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99E38], "null") != a2
    && (unint64_t)objc_msgSend(a3, "count") >= 2
    && *(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(a3);
          v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectID"), "persistentStore");
          if (!v10)
          {

            goto LABEL_15;
          }
          objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = objc_msgSend(v5, "count");

    if (v11 != objc_msgSend(a3, "count"))
    {
LABEL_15:
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        while (2)
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(a3);
            if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j)))
            {
              objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", a3);
              v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              v28 = 0u;
              v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v26;
                do
                {
                  for (k = 0; k != v18; ++k)
                  {
                    if (*(_QWORD *)v26 != v19)
                      objc_enumerationMutation(a3);
                    v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k);
                    if (!v21 || (v22 = *(_QWORD *)(v21 + 48)) == 0 || (v23 = *(_QWORD *)(v22 + 8)) == 0)
                      v23 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    objc_msgSend(v16, "addObject:", v23);
                  }
                  v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
                }
                while (v18);
              }
              v24 = -[NSConstraintConflict initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:]([NSConstraintConflict alloc], "initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, a3, v16);

              objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
              return;
            }
          }
          v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          if (v13)
            continue;
          break;
        }
      }
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSConstraintCache : entity = %@, constraint = %@, extension = %@>"), -[NSEntityDescription name](self->_entity, "name"), self->_constraint, self->_extension);
}

@end
