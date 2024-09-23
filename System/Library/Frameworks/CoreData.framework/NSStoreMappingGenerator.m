@implementation NSStoreMappingGenerator

+ (NSStoreMappingGenerator)defaultMappingGenerator
{
  NSStoreMappingGenerator *result;

  objc_opt_self();
  result = (NSStoreMappingGenerator *)_NSDefaultMappingGenerator;
  if (!_NSDefaultMappingGenerator)
  {
    result = objc_alloc_init(NSStoreMappingGenerator);
    _NSDefaultMappingGenerator = (uint64_t)result;
  }
  return result;
}

- (void)mappingsDictForConfigurationWithName:(void *)a3 inModel:
{
  __objc2_class **p_superclass;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSRelationshipStoreMapping *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t k;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSEntityStoreMapping *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v33 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v37 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_msgSend(a3, "entitiesForConfiguration:", a2);
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v46;
    p_superclass = &OBJC_METACLASS____PFCachedNumber.superclass;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obj);
        v39 = v6;
        v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
        v38 = -[NSEntityStoreMapping initWithEntity:]([NSEntityStoreMapping alloc], "initWithEntity:", v7);
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v40 = v7;
        v9 = (void *)objc_msgSend((id)objc_msgSend(v7, "attributesByName"), "allValues");
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v54 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              v15 = (id)objc_msgSend(objc_alloc((Class)(p_superclass + 109)), "initWithProperty:", v14);
              objc_msgSend(v15, "setExternalType:", objc_msgSend(v14, "attributeType"));
              objc_msgSend(v8, "setObject:forKey:", v15, objc_msgSend(v14, "name"));
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
          }
          while (v11);
        }
        v16 = (void *)objc_msgSend((id)objc_msgSend(v40, "relationshipsByName"), "allValues");
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v50 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
              v22 = -[NSPropertyStoreMapping initWithProperty:]([NSRelationshipStoreMapping alloc], "initWithProperty:", v21);
              -[NSRelationshipStoreMapping setDestinationEntityExternalName:]((uint64_t)v22, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v21, "destinationEntity"), "name"), "uppercaseString"));
              if (objc_msgSend(v21, "isToMany"))
                v23 = (void *)objc_msgSend(v21, "entity");
              else
                v23 = (void *)objc_msgSend(v21, "destinationEntity");
              v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "name"), "stringByAppendingString:", CFSTR("_id")), "lowercaseString");
              v25 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", +[NSJoin joinWithSourceAttributeName:destinationAttributeName:]((uint64_t)NSJoin, v24, v24));
              -[NSRelationshipStoreMapping setJoins:]((uint64_t)v22, v25);
              v26 = (void *)objc_msgSend((id)objc_msgSend(v25, "valueForKey:", CFSTR("sourceAttributeName")), "mutableCopy");
              objc_msgSend(v26, "removeObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v21, "entity"), "name"), "stringByAppendingString:", CFSTR("_id")), "lowercaseString"));
              -[NSRelationshipStoreMapping setForeignKeys:]((uint64_t)v22, v26);

              if (v22)
                v22->_joinSemantic = 2;
              objc_msgSend(v8, "setObject:forKey:", v22, objc_msgSend(v21, "name"));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          }
          while (v18);
        }
        -[NSEntityStoreMapping setPropertyMappings:]((uint64_t)v38, v8);
        -[NSEntityStoreMapping setPrimaryKeys:]((uint64_t)v38, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "name"), "stringByAppendingString:", CFSTR("_id")), "lowercaseString")));
        objc_msgSend(v37, "addObject:", v38);
        v6 = v39 + 1;
        p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
      }
      while (v39 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v36);
  }
  v27 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (!v27)
    return v33;
  v28 = v27;
  v29 = *(_QWORD *)v42;
  v30 = v33;
  do
  {
    for (k = 0; k != v28; ++k)
    {
      if (*(_QWORD *)v42 != v29)
        objc_enumerationMutation(v37);
      objc_msgSend(v33, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "entity"), "name"));
    }
    v28 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  }
  while (v28);
  return v30;
}

@end
