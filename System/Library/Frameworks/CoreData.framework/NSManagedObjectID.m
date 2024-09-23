@implementation NSManagedObjectID

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p <%@>"), self, -[NSManagedObjectID URIRepresentation](self, "URIRepresentation"));
  objc_autoreleasePoolPop(v3);
  return (NSString *)v4;
}

+ (uint64_t)unarchivedScalarObjectIDsFromData:(_QWORD *)a3 withCoordinator:
{
  uint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  id StringFromBytes;
  unsigned __int16 v20;
  _QWORD *v21;
  id v22;
  void *v23;
  _QWORD *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  unint64_t v36;
  _BYTE *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int v41;
  unint64_t v42;
  unsigned int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  void *v48;
  _BYTE v49[4];
  int v50;
  unint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  int v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a2, "length");
  if (!v5)
    return objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v6 = v5;
  v58[0] = 0;
  v54 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = MEMORY[0x18D76B4E4]();
  v7 = (unsigned int *)objc_msgSend(a2, "bytes");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "managedObjectModel"), "entitiesByName");
  v10 = objc_msgSend(v9, "count");
  MEMORY[0x1E0C80A78](v10);
  if (v10 > 0x200)
  {
    v55 = (_BYTE *)NSAllocateScannedUncollectable();
  }
  else
  {
    v55 = &v49[-v12];
    bzero(&v49[-v12], 8 * v11);
  }
  if (v6 >= 4)
  {
    v57 = bswap32(*v7);
    v14 = 4;
    v58[0] = 4;
  }
  else
  {
    v14 = 0;
    v57 = 0;
  }
  if ((v14 | 2uLL) <= v6)
  {
    v15 = bswap32(*(unsigned __int16 *)((char *)v7 + v14)) >> 16;
    v58[0] = v14 | 2;
    v16 = v14 + 4;
    v14 |= 2uLL;
  }
  else
  {
    LOWORD(v15) = 0;
    v16 = v14 | 2;
  }
  v53 = v49;
  if (v16 <= v6)
  {
    LODWORD(v17) = bswap32(*(unsigned __int16 *)((char *)v7 + v14)) >> 16;
    v58[0] = v16;
  }
  else
  {
    LODWORD(v17) = 0;
  }
  LODWORD(v52) = (__int16)v15;
  if ((__int16)v15 >= 1)
  {
    LOWORD(v18) = 0;
    do
    {
      StringFromBytes = _newReadStringFromBytes((uint64_t)v7, v58, v6);
      if (objc_msgSend(StringFromBytes, "length"))
        objc_msgSend(v8, "addObject:", StringFromBytes);

      v18 = (__int16)(v18 + 1);
    }
    while (v18 < (__int16)v15);
  }
  v51 = v10;
  v50 = v17;
  v20 = 0;
  if ((__int16)v17 >= 1)
  {
    v17 = v17;
    v21 = v55;
    do
    {
      v22 = _newReadStringFromBytes((uint64_t)v7, v58, v6);
      if (objc_msgSend(v22, "length"))
      {
        v23 = (void *)objc_msgSend(v9, "objectForKey:", v22);
        if (v23
          || (!a3 ? (v24 = 0) : (v24 = (_QWORD *)a3[12]),
              (v23 = -[_PFModelMap ancillaryEntityWithName:](v24, (uint64_t)v22)) != 0))
        {
          *v21 = v23;
          ++v20;
        }
      }

      ++v21;
      --v17;
    }
    while (v17);
  }
  v25 = objc_msgSend(v8, "count");
  v26 = 0;
  if ((_DWORD)v52 == v25)
  {
    v27 = v50;
    v28 = (void *)v56;
    if (v50 == v20)
    {
      v29 = v51;
      if (v54)
      {
        v30 = objc_msgSend(v8, "count");
        v31 = MEMORY[0x1E0C80A78](v30);
        v34 = &v49[-v33];
        v52 = v35;
        if (v31 > 0x200)
          v34 = (_BYTE *)NSAllocateScannedUncollectable();
        else
          bzero(&v49[-v33], 8 * v32);
        if (objc_msgSend(v8, "count"))
        {
          v36 = 0;
          do
          {
            *(_QWORD *)&v34[8 * v36] = objc_msgSend(a3, "persistentStoreForIdentifier:", objc_msgSend(v8, "objectAtIndex:", v36));
            ++v36;
          }
          while (v36 < objc_msgSend(v8, "count"));
        }
        if (v57 < 1)
        {
          v26 = (void *)v54;
        }
        else
        {
          v38 = (void *)v54;
          v37 = v55;
          while (v58[0] < v6)
          {
            v39 = (v58[0] + 1) & 0xFFFFFFFFFFFFFFFELL;
            v40 = v39 + 2;
            if (v39 + 2 <= v6)
            {
              v41 = bswap32(*(unsigned __int16 *)((char *)v7 + v39)) >> 16;
              v58[0] = v39 + 2;
              v39 = (v39 + 3) & 0xFFFFFFFFFFFFFFFELL;
              v42 = v39 + 2;
            }
            else
            {
              v41 = 0;
              v42 = v39 + 2;
              v40 = v58[0];
            }
            if (v42 <= v6)
            {
              v43 = bswap32(*(unsigned __int16 *)((char *)v7 + v39)) >> 16;
              v58[0] = v42;
              v40 = v42;
            }
            else
            {
              v43 = 0;
            }
            v44 = (v40 + 7) & 0xFFFFFFFFFFFFFFF8;
            v45 = v44 + 8;
            if (v44 + 8 > v6)
              break;
            v26 = 0;
            v46 = *(_QWORD *)((char *)v7 + v44);
            v58[0] = v45;
            if (!v41 || !v43 || !v46)
              goto LABEL_64;
            v47 = (__int16)(v41 - 1);
            v48 = v47 >= (__int16)v15 ? 0 : *(void **)&v34[8 * v47];
            if ((__int16)(v43 - 1) >= v27)
              break;
            v26 = 0;
            if (!v48)
              goto LABEL_64;
            if (!*(_QWORD *)&v37[8 * (__int16)(v43 - 1)])
              goto LABEL_64;
            v26 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v48, "objectIDFactoryForEntity:"), "alloc"), "initWithPK64:", bswap64(v46));
            if (!v26)
              goto LABEL_64;
            objc_msgSend(v38, "addObject:", v26);

            if (!--v57)
            {
              v26 = v38;
              goto LABEL_64;
            }
          }
          v26 = 0;
        }
LABEL_64:
        if (v30 >= 0x201)
          NSZoneFree(0, v34);
        v28 = (void *)v56;
      }
      goto LABEL_69;
    }
  }
  else
  {
    v28 = (void *)v56;
  }
  v29 = v51;
LABEL_69:
  if (v29 >= 0x201)
    NSZoneFree(0, v55);
  objc_autoreleasePoolPop(v28);
  return (uint64_t)v26;
}

+ (void)initialize
{
  objc_opt_self();
  objc_opt_self();
  objc_opt_class();
}

+ (id)_newArchiveForScalarObjectIDs:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned __int16 v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int16 v53;
  _QWORD *v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  uint64_t k;
  void *v59;
  _QWORD *v60;
  void **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  _QWORD v77[2];
  void *v78;
  uint64_t v79;
  unint64_t v80;
  id v81;
  _QWORD *v82;
  id v83;
  id v84;
  id v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
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
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _QWORD v115[258];

  v115[256] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!objc_msgSend(a2, "count"))
    return objc_alloc_init(MEMORY[0x1E0C99D50]);
  v81 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v3 = (void *)MEMORY[0x18D76B4E4]();
  v88 = objc_opt_class();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v107;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v107 != v6)
          objc_enumerationMutation(a2);
        v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "entity"), "managedObjectModel");
        if (v8)
        {
          v9 = (void *)v8;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:
  v10 = objc_msgSend((id)objc_msgSend(v9, "entitiesByName"), "count");
  v11 = v10;
  if (v10 <= 1)
    v12 = 1;
  else
    v12 = v10;
  if (v10 >= 0x201)
    v13 = 1;
  else
    v13 = v12;
  v14 = 8 * v12;
  if (v10 > 0x200)
  {
    v86 = (char *)NSAllocateScannedUncollectable();
    v89 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v86 = (char *)v77 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v86, 8 * v12);
    v89 = (char *)v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v89, v14);
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v103;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v103 != v18)
          objc_enumerationMutation(v9);
        v20 = *(_QWORD **)(*((_QWORD *)&v102 + 1) + 8 * v19);
        v21 = objc_msgSend(v20, "name");
        if (v20)
          v22 = v20[20];
        else
          v22 = 0;
        *(_QWORD *)&v89[8 * v22] = v21;
        ++v19;
      }
      while (v17 != v19);
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
      v17 = v23;
    }
    while (v23);
  }
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v24 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v99;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v99 != v26)
          objc_enumerationMutation(a2);
        v28 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * j), "persistentStore"), "_persistentStoreCoordinator");
        if (v28)
        {
          v83 = v28;
          v85 = (id)objc_msgSend(v28, "persistentStores");
          v30 = objc_msgSend(v85, "count");
          if (v30 <= 1)
            v31 = 1;
          else
            v31 = v30;
          if (v30 >= 0x201)
            v32 = 1;
          else
            v32 = v31;
          v33 = (char *)v77 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0);
          v79 = v30;
          v80 = v11;
          v78 = v3;
          v84 = v9;
          if (v30 > 0x200)
          {
            v82 = (_QWORD *)NSAllocateScannedUncollectable();
          }
          else
          {
            v82 = v33;
            bzero(v33, 8 * v31);
          }
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v34 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
          if (v34)
          {
            v35 = v34;
            v77[1] = v77;
            v36 = 0;
            v87 = 0;
            v37 = *(_QWORD *)v95;
            v38 = a2;
            do
            {
              v39 = 0;
              do
              {
                if (*(_QWORD *)v95 != v37)
                  objc_enumerationMutation(a2);
                v40 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v39);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v41 = objc_msgSend(v40, "entity");
                  if (v41
                    || (v41 = objc_msgSend((id)objc_msgSend(v84, "entitiesByName"), "objectForKey:", objc_msgSend(v40, "entityName"))) != 0)
                  {
                    v42 = *(_QWORD *)(v41 + 160);
                  }
                  else
                  {
                    v42 = 0;
                  }
                  v43 = objc_msgSend(v40, "persistentStore");
                  if (!v43)
                  {
                    v44 = objc_msgSend(v40, "_storeIdentifier");
                    v43 = objc_msgSend(v83, "persistentStoreForIdentifier:", v44);
                  }
                  if (v41)
                  {
                    if (v43)
                    {
                      ++v36;
                      *(_QWORD *)&v86[8 * v42] = 1;
                      if (v43 != v87)
                      {
                        v45 = objc_msgSend(v85, "indexOfObjectIdenticalTo:", v43);
                        v82[v45] = 1;
                        v87 = v43;
                      }
                    }
                  }
                  a2 = v38;
                }
                ++v39;
              }
              while (v35 != v39);
              v46 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
              v35 = v46;
            }
            while (v46);
            if (v36 >= 1)
            {
              v47 = v36;
              v48 = v79;
              if (v79 < 1)
              {
                v49 = 0;
                v52 = v80;
              }
              else
              {
                v49 = 0;
                v50 = v82;
                v51 = v79;
                v52 = v80;
                do
                {
                  if (*v50)
                    *v50 = (__int16)v49++ + 1;
                  ++v50;
                  --v51;
                }
                while (v51);
              }
              if (v52 < 1)
              {
                v53 = 0;
              }
              else
              {
                v53 = 0;
                v54 = v86;
                v55 = v52;
                do
                {
                  if (*v54)
                    *v54 = (__int16)v53++ + 1;
                  ++v54;
                  --v55;
                }
                while (v55);
              }
              v56 = v81;
              _writeInt32IntoData(v81, v47);
              _writeInt16IntoData(v56, v49);
              _writeInt16IntoData(v56, v53);
              v57 = v82;
              if (v48 >= 1)
              {
                for (k = 0; k != v48; ++k)
                {
                  if (v57[k])
                  {
                    v59 = (void *)objc_msgSend((id)objc_msgSend(v85, "objectAtIndex:", k), "identifier");
                    _writeStringIntoData(v59, v81, v115);
                  }
                }
              }
              if (v52 >= 1)
              {
                v60 = v86;
                v61 = (void **)v89;
                v62 = v52;
                do
                {
                  if (*v60)
                    _writeStringIntoData(*v61, v81, v115);
                  ++v61;
                  ++v60;
                  --v62;
                }
                while (v62);
              }
              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              v63 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
              if (v63)
              {
                v64 = v63;
                v65 = *(_QWORD *)v91;
                do
                {
                  for (m = 0; m != v64; ++m)
                  {
                    if (*(_QWORD *)v91 != v65)
                      objc_enumerationMutation(a2);
                    v67 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * m);
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v68 = objc_msgSend(v67, "entity");
                      if (!v68)
                        v68 = objc_msgSend((id)objc_msgSend(v84, "entitiesByName"), "objectForKey:", objc_msgSend(v67, "entityName"));
                      v69 = objc_msgSend(v67, "persistentStore");
                      if (!v69)
                      {
                        v70 = objc_msgSend(v67, "_storeIdentifier");
                        v69 = objc_msgSend(v83, "persistentStoreForIdentifier:", v70);
                      }
                      if (v68)
                        v71 = v69 == 0;
                      else
                        v71 = 1;
                      if (!v71)
                      {
                        v72 = *(_QWORD *)&v86[8 * *(_QWORD *)(v68 + 160)];
                        v73 = objc_msgSend(v67, "_referenceData64");
                        v74 = objc_msgSend(v85, "indexOfObjectIdenticalTo:", v69);
                        v75 = v81;
                        _writeInt16IntoData(v81, (unsigned __int16)v82[v74]);
                        _writeInt16IntoData(v75, (unsigned __int16)v72);
                        _writeInt64IntoData(v75, v73);
                      }
                    }
                  }
                  v64 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                }
                while (v64);
              }
            }
          }
          if ((unint64_t)v79 >= 0x201)
            NSZoneFree(0, v82);
          v29 = v80 >= 0x201;
          v3 = v78;
          goto LABEL_116;
        }
      }
      v25 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
      if (v25)
        continue;
      break;
    }
  }
  v29 = v11 >= 0x201;
LABEL_116:
  v76 = v86;
  if (v29)
  {
    NSZoneFree(0, v89);
    NSZoneFree(0, v76);
  }
  objc_autoreleasePoolPop(v3);
  return v81;
}

+ (int64_t)version
{
  return 134481920;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSEntityDescription)entity
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSPersistentStore)persistentStore
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)isTemporaryID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSURL)URIRepresentation
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (int)_temporaryIDCounter
{
  return 0;
}

- (uint64_t)_compareArbitraryValue:(void *)a3 toValue:
{
  size_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if ((objc_msgSend(a2, "isNSNumber") & 1) != 0
      || (objc_msgSend(a2, "isNSString") & 1) != 0
      || objc_msgSend(a2, "isNSDate"))
    {
      return objc_msgSend(a2, "compare:", a3);
    }
    if (objc_msgSend(a2, "isNSData"))
    {
      v5 = objc_msgSend(a2, "length");
      v6 = objc_msgSend(a3, "length");
      if (v5 >= v6)
        v5 = v6;
      v7 = 8 * v5 + 8;
      if (v7 <= 1)
        v8 = 1;
      else
        v8 = 8 * v5 + 8;
      if (v7 >= 0x201)
        v9 = 1;
      else
        v9 = v8;
      v10 = (char *)&v21 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      v11 = 8 * v8;
      if (v7 > 0x200)
      {
        v10 = (char *)NSAllocateScannedUncollectable();
        v12 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v21 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v8);
        v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v12, v11);
      }
      objc_msgSend(a2, "getBytes:length:", v10, v5);
      objc_msgSend(a3, "getBytes:length:", v12, v5);
      v16 = memcmp(v10, v12, v5);
      if (v7 >= 0x201)
      {
        NSZoneFree(0, v10);
        NSZoneFree(0, v12);
      }
      v17 = 1;
      if (v16 >= 0)
        v17 = -1;
      if (v16)
        return v17;
      else
        return 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return objc_msgSend(a2, "compare:", a3);
      v24 = 0;
      v25 = 0;
      v22 = 0;
      v23 = 0;
      objc_msgSend(a2, "getUUIDBytes:", &v24);
      objc_msgSend(a3, "getUUIDBytes:", &v22);
      v13 = bswap64(v24);
      v14 = bswap64(v22);
      if (v13 == v14 && (v13 = bswap64(v25), v14 = bswap64(v23), v13 == v14))
      {
        v15 = 0;
      }
      else if (v13 < v14)
      {
        v15 = -1;
      }
      else
      {
        v15 = 1;
      }
      v18 = v15 == 0;
      v19 = v15 < 0;
      v20 = 1;
      if (!v19)
        v20 = -1;
      if (v18)
        return 0;
      else
        return v20;
    }
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  int v5;
  int v6;
  int64_t result;
  id v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  NSEntityDescription *v14;
  NSEntityDescription *rootentity;
  uint64_t v16;
  uint64_t v17;
  NSEntityDescription *v18;
  NSString *v19;
  NSString *v20;
  uint64_t v21;
  _BOOL4 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = -[NSManagedObjectID isTemporaryID](self, "isTemporaryID");
  v6 = objc_msgSend(a3, "isTemporaryID");
  if (v5 != v6)
  {
    if (v5)
      return -1;
    else
      return 1;
  }
  if ((v5 & v6) == 1)
  {
    v8 = -[NSManagedObjectID _referenceData](self, "_referenceData");
    v9 = objc_msgSend(a3, "_referenceData");
    if (v8 != (id)v9)
    {
      result = objc_msgSend(v8, "compare:", v9);
      if (result)
        return result;
    }
    v10 = -[NSManagedObjectID _temporaryIDCounter](self, "_temporaryIDCounter");
    v11 = v10 <= (int)objc_msgSend(a3, "_temporaryIDCounter");
    goto LABEL_34;
  }
  v12 = -[NSManagedObjectID _storeIdentifier](self, "_storeIdentifier");
  v13 = objc_msgSend(a3, "_storeIdentifier");
  if (v12 != (id)v13)
  {
    result = objc_msgSend(v12, "compare:", v13);
    if (result)
      return result;
  }
  v14 = -[NSManagedObjectID entity](self, "entity");
  if (v14)
  {
    if ((*(_BYTE *)&v14->_entityDescriptionFlags & 4) != 0)
    {
      rootentity = v14->_rootentity;
    }
    else
    {
      do
      {
        rootentity = v14;
        v14 = -[NSEntityDescription superentity](v14, "superentity");
      }
      while (v14);
    }
  }
  else
  {
    rootentity = 0;
  }
  v16 = objc_msgSend(a3, "entity");
  if (v16)
  {
    if ((*(_BYTE *)(v16 + 120) & 4) != 0)
    {
      v18 = *(NSEntityDescription **)(v16 + 72);
    }
    else
    {
      do
      {
        v18 = (NSEntityDescription *)v16;
        v16 = objc_msgSend((id)v16, "superentity");
      }
      while (v16);
    }
    if (!rootentity)
      goto LABEL_23;
  }
  else
  {
    v18 = 0;
    if (!rootentity)
      goto LABEL_23;
  }
  if (rootentity == v18)
  {
LABEL_31:
    v22 = -[NSManagedObjectID _preferReferenceData64](self, "_preferReferenceData64", v17);
    v23 = objc_msgSend(a3, "_preferReferenceData64");
    if (!v22 || !v23)
      return -[NSManagedObjectID _compareArbitraryValue:toValue:]((uint64_t)self, -[NSManagedObjectID _referenceData](self, "_referenceData"), (void *)objc_msgSend(a3, "_referenceData"));
    v24 = -[NSManagedObjectID _referenceData64](self, "_referenceData64");
    v11 = v24 <= objc_msgSend(a3, "_referenceData64");
LABEL_34:
    v25 = !v11;
    v26 = v11;
    return v25 - v26;
  }
LABEL_23:
  if (rootentity)
    v19 = -[NSEntityDescription name](rootentity, "name");
  else
    v19 = -[NSManagedObjectID entityName](self, "entityName");
  v20 = v19;
  if (v18)
    v21 = -[NSEntityDescription name](v18, "name");
  else
    v21 = objc_msgSend(a3, "entityName");
  v17 = v21;
  if (v20 == (NSString *)v21)
    goto LABEL_31;
  result = -[NSString compare:](v20, "compare:", v21);
  if (!result)
    goto LABEL_31;
  return result;
}

- (BOOL)_preferReferenceData64
{
  return 0;
}

- (NSManagedObjectID)initWithObject:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSManagedObjectID)initWithPK64:(int64_t)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)_referenceData
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (int64_t)_referenceData64
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)_storeIdentifier
{
  return -[NSPersistentStore identifier](-[NSManagedObjectID persistentStore](self, "persistentStore"), "identifier");
}

- (id)entityName
{
  return -[NSEntityDescription name](-[NSManagedObjectID entity](self, "entity"), "name");
}

- (BOOL)_isPersistentStoreAlive
{
  return -[NSPersistentStore _isPersistentStoreAlive](-[NSManagedObjectID persistentStore](self, "persistentStore"), "_isPersistentStoreAlive");
}

- (id)_retainedURIString
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

+ (id)_generateTemporaryIDForEntity:(id)a3
{
  return _PFFastTemporaryIDCreation(a3);
}

@end
