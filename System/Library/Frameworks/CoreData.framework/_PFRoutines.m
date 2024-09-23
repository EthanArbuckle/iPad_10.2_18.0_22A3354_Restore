@implementation _PFRoutines

+ (id)retainedDecodeValue:(void *)a3 forTransformableAttribute:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = objc_opt_self();
  v6 = (void *)MEMORY[0x18D76B4E4](v5);
  v7 = objc_msgSend(a3, "valueTransformerName");
  objc_opt_self();
  if (!v7 || (v8 = objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", v7)) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0CB2CD8]);
    goto LABEL_6;
  }
  v9 = (void *)v8;
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:
    v10 = (void *)objc_msgSend(v9, "transformedValue:", a2);
    goto LABEL_7;
  }
  v10 = (void *)objc_msgSend(v9, "reverseTransformedValue:", a2);
LABEL_7:
  v11 = v10;
  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (uint64_t)anyObjectFromCollection:(uint64_t)a1
{
  uint64_t result;
  _OWORD v4[4];
  _BYTE v5[128];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  memset(v4, 0, sizeof(v4));
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", v4, v5, 16);
  if (result)
    return **((_QWORD **)&v4[0] + 1);
  return result;
}

+ (id)newMutableSetFromCollection:(void *)a3 byRemovingItems:
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void **v20;
  const __CFAllocator *v21;
  uint64_t v22;
  const CFSetCallBacks *v23;
  const __CFSet *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  const void *v29;
  uint64_t v30;
  _QWORD v31[3];
  unint64_t v32;
  unint64_t v33;
  const void **v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[3];
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a3, "count");
  v6 = objc_msgSend(a2, "count");
  if (!v6)
    return objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = v6;
  v8 = MEMORY[0x1E0C80A78]();
  v10 = (char *)v31 - v9;
  if (v8 > 0x200)
  {
    v10 = (char *)NSAllocateScannedUncollectable();
    if (v5)
      goto LABEL_4;
  }
  else
  {
    bzero((char *)v31 - v9, 8 * v8);
    if (v5)
    {
LABEL_4:
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0uLL;
      v49 = 0uLL;
      MEMORY[0x1E0C80A78]();
      v32 = v7;
      v33 = v5;
      v31[2] = v12;
      if (v5 > 0x200)
      {
        v34 = (const void **)NSAllocateScannedUncollectable();
      }
      else
      {
        v34 = (const void **)((char *)v31 - v11);
        bzero((char *)v31 - v11, 8 * v5);
      }
      v31[1] = v31;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v43;
        do
        {
          v19 = 0;
          v20 = &v34[v17];
          do
          {
            if (*(_QWORD *)v43 != v18)
              objc_enumerationMutation(a3);
            v20[v19] = *(const void **)(*((_QWORD *)&v42 + 1) + 8 * v19);
            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          v17 += v19;
        }
        while (v16);
      }
      v21 = _PFStackAllocatorCreate((unint64_t *)&v48, 1024);
      v22 = *MEMORY[0x1E0C9B3B0];
      v39[1] = 0;
      v39[2] = 0;
      v39[0] = v22;
      v40 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 24);
      v41 = *(_QWORD *)(MEMORY[0x1E0C9B3B0] + 40);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = 0;
      else
        v23 = (const CFSetCallBacks *)v39;
      v24 = CFSetCreate(v21, v34, v33, v23);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v25 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      if (v25)
      {
        v26 = v25;
        v14 = 0;
        v27 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(a2);
            v29 = *(const void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            if (!CFSetGetValue(v24, v29))
              *(_QWORD *)&v10[8 * v14++] = v29;
          }
          v26 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        }
        while (v26);
      }
      else
      {
        v14 = 0;
      }
      if (v33 >= 0x201)
        NSZoneFree(0, v34);
      v7 = v32;
      if (*((_QWORD *)&v49 + 1))
      {
        if (v24)
          CFRelease(v24);
      }
      else
      {
        *((_QWORD *)&v48 + 1) = v48;
      }
      goto LABEL_37;
    }
  }
  objc_msgSend(a2, "getObjects:", v10);
  v14 = v7;
LABEL_37:
  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", v10, v14);
  if (v7 >= 0x201)
    NSZoneFree(0, v10);
  return (id)v30;
}

+ (uint64_t)newSetOfObjectIDsFromCollection:(uint64_t)a1
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = objc_msgSend(a2, "count");
  v4 = v3;
  if (v3 <= 1)
    v5 = 1;
  else
    v5 = v3;
  if (v3 >= 0x201)
    v6 = 1;
  else
    v6 = v5;
  v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    v7 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(a2, "getObjects:", v7);
  }
  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    objc_msgSend(a2, "getObjects:", v7);
    if (!v4)
      goto LABEL_13;
  }
  v8 = 0;
  do
  {
    *(_QWORD *)&v7[8 * v8] = objc_msgSend(*(id *)&v7[8 * v8], "objectID");
    ++v8;
  }
  while (v4 != v8);
LABEL_13:
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v7, v4);
  if (v4 >= 0x201)
    NSZoneFree(0, v7);
  return v9;
}

+ (uint64_t)_doNameAndTypeCheck:(uint64_t)a1
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;

  objc_opt_self();
  if (!a2)
    return 1;
  v3 = objc_msgSend(a2, "count");
  if (!v3)
    return 1;
  v4 = v3;
  v5 = objc_opt_class();
  v6 = 0;
  v7 = 1;
  while (1)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", v6), "name");
    if (!result)
      break;
    if (v5 == objc_opt_class())
      return 0;
    v6 = v7;
    if (v4 <= v7++)
      return 1;
  }
  return result;
}

+ (uint64_t)unarchiveCylicGraphObjectOfClasses:(uint64_t)a3 fromData:(uint64_t)a4 error:
{
  void *v7;
  void *v8;
  uint64_t v9;

  objc_opt_self();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, a4);
  if (!v7)
    return 0;
  v8 = v7;
  objc_msgSend(v7, "setRequiresSecureCoding:", 1);
  objc_msgSend(v8, "setDecodingFailurePolicy:", 1);
  objc_msgSend(v8, "_allowDecodingCyclesInSecureMode");
  v9 = objc_msgSend(v8, "decodeTopLevelObjectOfClasses:forKey:error:", a2, *MEMORY[0x1E0CB2CD0], a4);

  return v9;
}

+ (uint64_t)attributeClassesForSecureCoding
{
  objc_opt_self();
  if (qword_1ECD8D908 != -1)
    dispatch_once(&qword_1ECD8D908, &__block_literal_global_152);
  return qword_1ECD8D900;
}

+ (uint64_t)plistClassesForSecureCoding
{
  objc_opt_self();
  if (qword_1ECD8D948 != -1)
    dispatch_once(&qword_1ECD8D948, &__block_literal_global_163);
  return qword_1ECD8D940;
}

+ (id)_coalescedPrefetchKeypaths:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  id v17;

  objc_opt_self();
  v3 = objc_msgSend(a2, "count");
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (objc_msgSend(a2, "isNSSet"))
    a2 = (void *)objc_msgSend(a2, "allObjects");
  if (objc_msgSend(a2, "isNSArray"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = v5;
    if (v3)
    {
      v16 = v4;
      v17 = v5;
      for (i = 0; i != v3; ++i)
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", i, v16), "componentsSeparatedByString:", CFSTR("."));
        v9 = objc_msgSend(v8, "count");
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = v17;
          do
          {
            v13 = (void *)objc_msgSend(v8, "objectAtIndex:", v11);
            if (objc_msgSend(v13, "length"))
            {
              v14 = objc_msgSend(v12, "objectForKey:", v13);
              if (!v14)
                v14 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              objc_msgSend(v12, "setObject:forKey:", v14, v13);
              v12 = (void *)v14;
            }
            ++v11;
          }
          while (v10 != v11);
        }
      }
      v4 = v16;
      v6 = v17;
    }
  }
  else if (objc_msgSend(a2, "isNSDictionary"))
  {
    v6 = a2;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "drain");
  return v6;
}

+ (id)valueForProcessArgument:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_self();
  if (!a2)
    return 0;
  v4 = (void *)MEMORY[0x18D76B4E4](v3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "arguments");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-%@"), a2);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
LABEL_4:
    v11 = 0;
    v12 = v8 + v9;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "isEqualToString:", v6) & 1) != 0)
        break;
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v9 = v12;
        if (v8)
          goto LABEL_4;
        goto LABEL_10;
      }
    }

    if (v9 + v11 >= (unint64_t)(objc_msgSend(v5, "count") - 1))
      goto LABEL_13;
    v13 = (void *)objc_msgSend(v5, "objectAtIndex:", v9 + v11 + 1);
  }
  else
  {
LABEL_10:

LABEL_13:
    v13 = 0;
  }
  v14 = v13;
  objc_autoreleasePoolPop(v4);
  return v13;
}

+ (id)newCollection:(void *)a3 fromCollection:(void *)a4 byAddingItems:
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void **v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void **v23;
  const void *v24;
  const __CFAllocator *v25;
  uint64_t v26;
  const CFSetCallBacks *v27;
  unint64_t v28;
  const __CFSet *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  unint64_t v40;
  uint64_t *v41;
  objc_class *v42;
  const void **v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[3];
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[8];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;
  __int128 v59;
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
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = objc_msgSend(a3, "count");
  v8 = objc_msgSend(a4, "count");
  v9 = v8 + v7;
  if (!(v8 + v7))
    return objc_alloc_init(a2);
  if (a3)
    v10 = a3;
  else
    v10 = (void *)NSSet_EmptySet;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v36 - v11;
  if (v9 > 0x200)
    v12 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v36 - v11, 8 * v9);
  v14 = objc_msgSend(a4, "count");
  if (v14)
  {
    v39 = &v36;
    v90 = 0u;
    v89 = 0u;
    v88 = 0u;
    v87 = 0u;
    v86 = 0u;
    v85 = 0u;
    v84 = 0u;
    v83 = 0u;
    v82 = 0u;
    v81 = 0u;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0uLL;
    v62 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    MEMORY[0x1E0C80A78](v14);
    v17 = (const void **)((char *)&v36 - v16);
    if (v7 > 0x200)
      v17 = (const void **)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v36 - v16, 8 * v15);
    memset(v55, 0, sizeof(v55));
    if (objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", v55, &v58, 16))
      v38 = *(_QWORD *)v55[1];
    else
      v38 = 0;
    v43 = v17;
    v40 = v9;
    v41 = &v36;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    v42 = a2;
    if (v19)
    {
      v20 = v19;
      v37 = v7;
      v18 = 0;
      v21 = *(_QWORD *)v52;
      do
      {
        v22 = 0;
        v23 = &v43[v18];
        do
        {
          if (*(_QWORD *)v52 != v21)
            objc_enumerationMutation(v10);
          v24 = *(const void **)(*((_QWORD *)&v51 + 1) + 8 * v22);
          *(_QWORD *)&v12[8 * v18 + 8 * v22] = v24;
          v23[v22++] = v24;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        v18 += v22;
      }
      while (v20);
      v7 = v37;
    }
    else
    {
      v18 = 0;
    }
    v25 = _PFStackAllocatorCreate((unint64_t *)&v59, 1024);
    v26 = *MEMORY[0x1E0C9B3B0];
    v48[1] = 0;
    v48[2] = 0;
    v48[0] = v26;
    v49 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 24);
    v50 = *(_QWORD *)(MEMORY[0x1E0C9B3B0] + 40);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = 0;
    else
      v27 = (const CFSetCallBacks *)v48;
    v28 = v7;
    v29 = CFSetCreate(v25, v43, v7, v27);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v30 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v45 != v32)
            objc_enumerationMutation(a4);
          v34 = *(const void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (!CFSetGetValue(v29, v34))
            *(_QWORD *)&v12[8 * v18++] = v34;
        }
        v31 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v31);
    }
    if (v28 >= 0x201)
      NSZoneFree(0, v43);
    v9 = v40;
    a2 = v42;
    if (*((_QWORD *)&v60 + 1))
    {
      if (v29)
        CFRelease(v29);
    }
    else
    {
      *((_QWORD *)&v59 + 1) = v59;
    }
  }
  else
  {
    objc_msgSend(v10, "getObjects:", v12);
    v18 = v9;
  }
  v35 = objc_msgSend([a2 alloc], "initWithObjects:count:", v12, v18);
  if (v9 >= 0x201)
    NSZoneFree(0, v12);
  return (id)v35;
}

+ (id)newSetFromCollection:(void *)a3 byAddingItems:
{
  objc_class *v5;

  objc_opt_self();
  v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines newCollection:fromCollection:byAddingItems:]((uint64_t)_PFRoutines, v5, a2, a3);
}

+ (__CFDictionary)createDictionaryPartitioningObjectsByEntity:(uint64_t)a1
{
  objc_opt_self();
  return +[_PFRoutines _createDictionaryPartitioningObjects:intoHierarchies:](_PFRoutines, "_createDictionaryPartitioningObjects:intoHierarchies:", a2, 0);
}

+ (__CFDictionary)_createDictionaryPartitioningObjects:(id)a3 intoHierarchies:(BOOL)a4
{
  _BOOL4 v4;
  const __CFDictionary *v6;
  CFIndex v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *Value;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;
  CFSetCallBacks callBacks;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  memset(&callBacks, 0, sizeof(callBacks));
  callBacks.copyDescription = *(CFSetCopyDescriptionCallBack *)(MEMORY[0x1E0C9B3B0] + 24);
  memset(&keyCallBacks, 0, 24);
  *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
  keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E0C9B390] + 40);
  valueCallBacks.version = 0;
  *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 8);
  valueCallBacks.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E0C9B3A0] + 24);
  valueCallBacks.equal = 0;
  v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, &valueCallBacks);
  v7 = objc_msgSend(a3, "count");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "entity");
        if (v4)
        {
          if (v13)
          {
            if ((*(_BYTE *)(v13 + 120) & 4) != 0)
            {
              v14 = *(const void **)(v13 + 72);
            }
            else
            {
              do
              {
                v14 = (const void *)v13;
                v13 = objc_msgSend((id)v13, "superentity");
              }
              while (v13);
            }
          }
          else
          {
            v14 = 0;
          }
        }
        else
        {
          v14 = (const void *)v13;
        }
        Value = (void *)CFDictionaryGetValue(v6, v14);
        if (!Value)
        {
          Value = CFSetCreateMutable(0, v7, &callBacks);
          CFDictionarySetValue(v6, v14, Value);
          CFRelease(Value);
        }
        CFSetAddValue((CFMutableSetRef)Value, v12);
        ++v11;
      }
      while (v11 != v9);
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      v9 = v16;
    }
    while (v16);
  }
  return v6;
}

+ (uint64_t)_isInMemoryStoreURL:(uint64_t)a1
{
  uint64_t result;

  objc_opt_self();
  result = objc_msgSend(a2, "isFileURL");
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend(a2, "path"), "hasPrefix:", CFSTR("/dev/null"));
  return result;
}

+ (uint64_t)_remoteChangeNotificationNameForStore:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.coredata.NSPersistentStoreRemoteChangeNotification.remotenotification"), objc_msgSend(a2, "identifier"));
}

+ (uint64_t)BOOLValueForOverride:(uint64_t)a1
{
  id v3;
  BOOL v5;

  objc_opt_self();
  v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "BOOLValue");
  if (byte_1ECD8DE1F)
    v5 = 1;
  else
    v5 = byte_1ECD8DE24 == 0;
  if (!v5)
    return 0;
  v3 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKey:", a2);
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "BOOLValue");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", a2);
}

+ (void)stringValueForOverride:(uint64_t)a1
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  objc_opt_self();
  v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  v4 = v3;
  if (byte_1ECD8DE1F)
    v5 = 1;
  else
    v5 = byte_1ECD8DE24 == 0;
  if (v5 && (!v3 || !objc_msgSend(v3, "length")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKey:", a2);
    if (!v6 || (v4 = v6, !objc_msgSend(v6, "length")))
      v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "stringForKey:", a2);
  }
  if (objc_msgSend(v4, "length"))
    return v4;
  else
    return 0;
}

+ (uint64_t)integerValueForOverride:(uint64_t)a1
{
  id v3;
  BOOL v5;

  objc_opt_self();
  v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "integerValue");
  if (byte_1ECD8DE1F)
    v5 = 1;
  else
    v5 = byte_1ECD8DE24 == 0;
  if (!v5)
    return 0;
  v3 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKey:", a2);
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "integerValue");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", a2);
}

+ (uint64_t)_getPFBundleVersionNumber
{
  void *v0;

  objc_opt_self();
  if (!_PF_BundleVersion)
  {
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 1410);
    while (!__ldaxr((unint64_t *)&_PF_BundleVersion))
    {
      if (!__stlxr((unint64_t)v0, (unint64_t *)&_PF_BundleVersion))
        return _PF_BundleVersion;
    }
    __clrex();

  }
  return _PF_BundleVersion;
}

+ (id)retainedEncodeObjectValue:(void *)a3 forTransformableAttribute:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = objc_opt_self();
  v6 = (void *)MEMORY[0x18D76B4E4](v5);
  v7 = objc_msgSend(a3, "valueTransformerName");
  objc_opt_self();
  if (!v7 || (v8 = objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", v7)) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0CB2CD8]);
    goto LABEL_6;
  }
  v9 = (void *)v8;
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:
    v10 = (void *)objc_msgSend(v9, "reverseTransformedValue:", a2);
    goto LABEL_7;
  }
  v10 = (void *)objc_msgSend(v9, "transformedValue:", a2);
LABEL_7:
  v11 = v10;
  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (__CFString)_getUUID
{
  const __CFUUID *v0;
  __CFString *v1;

  objc_opt_self();
  v0 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  CFRelease(v0);
  return v1;
}

+ (uint64_t)newArrayOfObjectIDsFromCollection:(uint64_t)a1
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = objc_msgSend(a2, "count");
  v4 = v3;
  if (v3 <= 1)
    v5 = 1;
  else
    v5 = v3;
  if (v3 >= 0x201)
    v6 = 1;
  else
    v6 = v5;
  v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    v7 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(a2, "getObjects:", v7);
  }
  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    objc_msgSend(a2, "getObjects:", v7);
    if (!v4)
      goto LABEL_13;
  }
  v8 = 0;
  do
  {
    *(_QWORD *)&v7[8 * v8] = objc_msgSend(*(id *)&v7[8 * v8], "objectID");
    ++v8;
  }
  while (v4 != v8);
LABEL_13:
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, v4);
  if (v4 >= 0x201)
    NSZoneFree(0, v7);
  return v9;
}

+ (uint64_t)_rootEntityGroupsForObjects:(uint64_t)a3 passingBlock:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        if ((*(unsigned int (**)(uint64_t, void *))(a3 + 16))(a3, v10))
        {
          v11 = objc_msgSend(v10, "entity");
          if (v11)
          {
            if ((*(_BYTE *)(v11 + 120) & 4) != 0)
            {
              v12 = *(void **)(v11 + 72);
            }
            else
            {
              do
              {
                v12 = (void *)v11;
                v11 = objc_msgSend((id)v11, "superentity");
              }
              while (v11);
            }
          }
          else
          {
            v12 = 0;
          }
          v13 = objc_msgSend(v12, "name");
          v14 = (id)objc_msgSend(v5, "objectForKey:", v13);
          if (!v14)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v5, "setObject:forKey:", v14, v13);

          }
          objc_msgSend(v14, "addObject:", v10);
        }
        ++v9;
      }
      while (v9 != v7);
      v15 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v7 = v15;
    }
    while (v15);
  }
  v16 = objc_msgSend(v5, "allValues");

  return v16;
}

+ (uint64_t)sanitize:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(a2, "UTF8String"));
}

+ (void)initialize
{
  unsigned int program_sdk_version;
  int16x8_t v3;
  void (*v4)(void);

  *(_WORD *)&byte_1ECD8DE25 = 257;
  z9dsptsiQ80etb9782fsrs98bfdle88 = 0x101010101010101;
  *(uint64_t *)((char *)&z9dsptsiQ80etb9782fsrs98bfdle88 + 7) = 0x101010101010101;
  dword_1ECD8DE20 = 16843009;
  __pflogFaultLog = _PFLogGetErrorLog();
  _PF_USE_IOS_PLATFORM = 1;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    byte_1ECD8DE26 = 0;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      byte_1ECD8DE25 = 0;
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        HIBYTE(dword_1ECD8DE20) = 0;
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          BYTE1(dword_1ECD8DE20) = 0;
          if ((dyld_program_sdk_at_least() & 1) == 0)
          {
            LOBYTE(dword_1ECD8DE20) = 0;
            if ((dyld_program_sdk_at_least() & 1) == 0)
            {
              byte_1ECD8DE1E = 0;
              if ((dyld_program_sdk_at_least() & 1) == 0)
              {
                byte_1ECD8DE1D = 0;
                if ((dyld_program_sdk_at_least() & 1) == 0)
                {
                  byte_1ECD8DE1C = 0;
                  program_sdk_version = dyld_get_program_sdk_version();
                  if (_CFExecutableLinkedOnOrAfter() == 1)
                  {
                    v3 = (int16x8_t)vcgtq_u32((uint32x4_t)vdupq_n_s32(program_sdk_version), (uint32x4_t)xmmword_18A509C40);
                    *(int8x8_t *)v3.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v3), (int8x8_t)0x1000100010001);
                    dword_1ECD8DE18 = vmovn_s16(v3).u32[0];
                  }
                  else
                  {
                    *(_WORD *)((char *)&dword_1ECD8DE18 + 3) = 0;
                    *(_DWORD *)((char *)&z9dsptsiQ80etb9782fsrs98bfdle88 + 7) = 0;
                    if (_CFExecutableLinkedOnOrAfter() != 1)
                    {
                      *(_WORD *)((char *)&z9dsptsiQ80etb9782fsrs98bfdle88 + 5) = 0;
                      if (_CFExecutableLinkedOnOrAfter() != 1)
                      {
                        BYTE4(z9dsptsiQ80etb9782fsrs98bfdle88) = 0;
                        if (_CFExecutableLinkedOnOrAfter() != 1)
                          WORD1(z9dsptsiQ80etb9782fsrs98bfdle88) = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BYTE2(dword_1ECD8DE20) = BYTE1(dword_1ECD8DE20);
  _PF_Private_Malloc_Zone = 0;
  _PF_INTERNAL_DATA_SIZE_THRESHOLD = 1;
  pthread_key_init_np();
  pthread_key_init_np();
  NSArray_EmptyArray = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99D20]);
  NSSet_EmptySet = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E60]);
  NSOrderedSet_EmptyOrderedSet = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E40]);
  NSDictionary_EmptyDictionary = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99D80]);
  qword_1ECD8D8E8 = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB36B8]);
  NSKeyValueCoding_NullValue = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  _SELF_Expression = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  if (os_variant_has_internal_content())
    byte_1ECD8DE1F = 1;
  if (qword_1ECD8D950 != -1)
    dispatch_once(&qword_1ECD8D950, &__block_literal_global_320);
  if ((_MergedGlobals_69 & 1) == 0)
    byte_1ECD8DE24 = 1;
  v4 = imp_implementationWithBlock(&__block_literal_global_4);
  imp_removeBlock(v4);
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
}

+ (id)newOrderedSetFromCollection:(void *)a3 byAddingItems:
{
  objc_class *v5;

  objc_opt_self();
  v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines newCollection:fromCollection:byAddingItems:]((uint64_t)_PFRoutines, v5, a2, a3);
}

+ (__CFDictionary)createDictionaryPartitioningObjectsIDByRootEntity:(uint64_t)a1
{
  objc_opt_self();
  return +[_PFRoutines _createDictionaryPartitioningObjectIDs:intoHierarchies:](_PFRoutines, "_createDictionaryPartitioningObjectIDs:intoHierarchies:", a2, 1);
}

+ (__CFDictionary)_createDictionaryPartitioningObjectIDs:(id)a3 intoHierarchies:(BOOL)a4
{
  _BOOL4 v4;
  const __CFDictionary *v6;
  CFIndex v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *Value;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;
  CFSetCallBacks callBacks;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  memset(&callBacks, 0, sizeof(callBacks));
  callBacks.copyDescription = *(CFSetCopyDescriptionCallBack *)(MEMORY[0x1E0C9B3B0] + 24);
  memset(&keyCallBacks, 0, 24);
  *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
  keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E0C9B390] + 40);
  valueCallBacks.version = 0;
  *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 8);
  valueCallBacks.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E0C9B3A0] + 24);
  valueCallBacks.equal = 0;
  v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, &valueCallBacks);
  v7 = objc_msgSend(a3, "count");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "entity");
        if (v4)
        {
          if (v13)
          {
            if ((*(_BYTE *)(v13 + 120) & 4) != 0)
            {
              v14 = *(const void **)(v13 + 72);
            }
            else
            {
              do
              {
                v14 = (const void *)v13;
                v13 = objc_msgSend((id)v13, "superentity");
              }
              while (v13);
            }
          }
          else
          {
            v14 = 0;
          }
        }
        else
        {
          v14 = (const void *)v13;
        }
        Value = (void *)CFDictionaryGetValue(v6, v14);
        if (!Value)
        {
          Value = CFSetCreateMutable(0, v7, &callBacks);
          CFDictionarySetValue(v6, v14, Value);
          CFRelease(Value);
        }
        CFSetAddValue((CFMutableSetRef)Value, v12);
        ++v11;
      }
      while (v11 != v9);
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      v9 = v16;
    }
    while (v16);
  }
  return v6;
}

+ (uint64_t)_generateObjectIDMaptableForArray:(uint64_t *)a3 withMapping:(uint64_t *)a4 andEntries:
{
  const __CFAllocator *v7;
  const __CFDictionary *Mutable;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  char *v11;
  uint64_t v12;
  const void *v13;
  uint64_t **i;
  void *v15;
  const void *v16;
  uint64_t v17;
  const void *v19;
  const void *Value;
  int v21;
  const void *v22;
  unsigned __int16 v23;
  const void *v24;
  char *v25;
  uint64_t **v26;
  uint64_t **v27;
  uint64_t v28;
  unint64_t Count;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  const void *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  const void *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const void **v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  const void *v64;
  CFArrayRef v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const void **v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t n;
  uint64_t v80;
  unint64_t v81;
  CFArrayRef v82;
  uint64_t v83;
  uint64_t *v85;
  uint64_t *v86;
  CFAllocatorRef v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t **v93;
  CFIndex v94;
  uint64_t **v95;
  __CFArray *v96;
  __CFArray *v97;
  CFDictionaryRef v98;
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
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!objc_msgSend(a2, "count"))
    return 0;
  v85 = a4;
  v86 = a3;
  v94 = objc_opt_class();
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v9 = CFDictionaryCreateMutable(v7, 0, 0, 0);
  v10 = CFDictionaryCreateMutable(v7, 0, 0, 0);
  v97 = CFArrayCreateMutable(v7, 0, 0);
  v87 = v7;
  v96 = CFArrayCreateMutable(v7, 0, 0);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v98 = Mutable;
  v93 = (uint64_t **)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
  if (v93)
  {
    v90 = 0;
    v91 = a2;
    v95 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v88 = 0;
    v89 = 0;
    v92 = *(_QWORD *)v116;
    while (2)
    {
      for (i = 0; i != v93; i = (uint64_t **)((char *)i + 1))
      {
        if (*(_QWORD *)v116 != v92)
          objc_enumerationMutation(v91);
        v15 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v28 = 0;
          goto LABEL_106;
        }
        v16 = (const void *)objc_msgSend(v15, "persistentStore");
        v17 = objc_msgSend(v15, "entity");
        if (v16 != v13 || v17 != v12)
        {
          v19 = (const void *)v17;
          Value = CFDictionaryGetValue(v98, v16);
          if (Value)
          {
            v21 = (int)Value;
          }
          else
          {
            v21 = v89 + 1;
            CFDictionarySetValue(v98, v16, (const void *)++v89);
          }
          v22 = CFDictionaryGetValue(v9, v19);
          if (v22)
          {
            v23 = (unsigned __int16)v22;
          }
          else
          {
            v23 = v90 + 1;
            CFDictionarySetValue(v9, v19, (const void *)++v90);
          }
          v24 = (const void *)((v21 << 16) | (unint64_t)v23);
          v25 = (char *)CFDictionaryGetValue(v10, v24);
          if (v25)
          {
            v11 = v25;
            v12 = (uint64_t)v19;
            v13 = v16;
          }
          else
          {
            v11 = (char *)(v88 + 1);
            CFDictionarySetValue(v10, v24, (const void *)(v88 + 1));
            v12 = (uint64_t)v19;
            v13 = v16;
            ++v88;
          }
        }
        CFArrayAppendValue(v97, v11 - 1);
        v26 = (uint64_t **)objc_msgSend(v15, "_referenceData64");
        v27 = v95;
        if ((uint64_t)v26 > (uint64_t)v95)
          v27 = v26;
        v95 = v27;
        CFArrayAppendValue(v96, v26);
        Mutable = v98;
      }
      v93 = (uint64_t **)objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      if (v93)
        continue;
      break;
    }
  }
  else
  {
    v95 = 0;
  }
  Count = CFDictionaryGetCount(Mutable);
  v30 = Count;
  if (Count <= 1)
    v31 = 1;
  else
    v31 = Count;
  if (Count >= 0x201)
    v32 = 1;
  else
    v32 = v31;
  v33 = (char *)&v85 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = &v85;
  if (Count > 0x200)
    v33 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v85 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v31);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v34 = -[__CFDictionary countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v111, v122, 16, v85);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v112;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v112 != v36)
          objc_enumerationMutation(Mutable);
        v38 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
        v39 = CFDictionaryGetValue(Mutable, v38);
        v40 = objc_msgSend(v38, "identifier");
        v41 = &v33[8 * (_QWORD)v39];
        Mutable = v98;
        *((_QWORD *)v41 - 1) = v40;
      }
      v35 = -[__CFDictionary countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
    }
    while (v35);
  }
  v42 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, v30);
  if (v30 >= 0x201)
    NSZoneFree(0, v33);
  v43 = CFDictionaryGetCount(v9);
  v44 = v43;
  if (v43 <= 1)
    v45 = 1;
  else
    v45 = v43;
  if (v43 >= 0x201)
    v46 = 1;
  else
    v46 = v45;
  v47 = (char *)&v85 - ((8 * v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = v42;
  if (v43 > 0x200)
    v47 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v85 - ((8 * v46 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v45);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v48 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v108 != v50)
          objc_enumerationMutation(v9);
        v52 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
        v53 = CFDictionaryGetValue(v9, v52);
        *(_QWORD *)&v47[8 * (_QWORD)v53 - 8] = objc_msgSend(v52, "name");
      }
      v49 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
    }
    while (v49);
  }
  v54 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, v44);
  if (v44 >= 0x201)
    NSZoneFree(0, v47);
  v55 = CFDictionaryGetCount(v10);
  v56 = v55;
  if (v55 <= 1)
    v57 = 1;
  else
    v57 = v55;
  if (v55 >= 0x201)
    v58 = 1;
  else
    v58 = v57;
  v59 = (const void **)((char *)&v85 - ((8 * v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v55 > 0x200)
    v59 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v85 - ((8 * v58 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v57);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v60 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v104;
    do
    {
      for (m = 0; m != v61; ++m)
      {
        if (*(_QWORD *)v104 != v62)
          objc_enumerationMutation(v10);
        v64 = *(const void **)(*((_QWORD *)&v103 + 1) + 8 * m);
        v59[(_QWORD)CFDictionaryGetValue(v10, v64) - 1] = v64;
      }
      v61 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
    }
    while (v61);
  }
  v65 = CFArrayCreate(v87, v59, v56, 0);
  if (v56 >= 0x201)
    NSZoneFree(0, v59);
  v66 = (void *)MEMORY[0x1E0C99D20];
  v67 = (uint64_t)v95;
  v68 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v95);
  v69 = objc_msgSend(v66, "arrayWithObjects:", v94, v54, v65, v68, 0);
  *v86 = v69;
  CFRelease(v65);
  if ((unint64_t)-[__CFArray count](v65, "count") > 0xFE || v67 > 0xFFFFFF)
  {
    v74 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v97, v96, 0);
    *v85 = v74;
  }
  else
  {
    v70 = CFArrayGetCount(v96);
    v94 = v70;
    v95 = &v85;
    if (v70 <= 1)
      v71 = 1;
    else
      v71 = v70;
    if (v70 >= 0x201)
      v72 = 1;
    else
      v72 = v71;
    v73 = (const void **)((char *)&v85 - ((8 * v72 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v70 > 0x200)
      v73 = (const void **)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v85 - ((8 * v72 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v71);
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v75 = -[__CFArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
    if (v75)
    {
      v76 = v75;
      v77 = 0;
      v78 = *(_QWORD *)v100;
      do
      {
        for (n = 0; n != v76; ++n)
        {
          if (*(_QWORD *)v100 != v78)
            objc_enumerationMutation(v96);
          v80 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * n);
          *(&v73[v77] + n) = (const void *)((CFArrayGetValueAtIndex(v97, v77 + n) << 24) | v80 & 0xFFFFFF);
        }
        v76 = -[__CFArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
        v77 += n;
      }
      while (v76);
    }
    v81 = v94;
    v82 = CFArrayCreate(v87, v73, v94, 0);
    if (v81 >= 0x201)
      NSZoneFree(0, v73);
    v83 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v82);
    *v85 = v83;
    CFRelease(v82);
  }
  Mutable = v98;
  v28 = 1;
LABEL_106:
  CFRelease(Mutable);
  CFRelease(v9);
  CFRelease(v10);
  CFRelease(v97);
  CFRelease(v96);
  return v28;
}

+ (uint64_t)_newObjectIDsArrayWithMapping:(void *)a3 andEntries:(void *)a4 andCoordinator:
{
  void *v7;
  char *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  unint64_t v47;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  objc_class *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  unsigned int v61;
  BOOL v62;
  uint64_t ValueAtIndex;
  _PFArray *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  unint64_t v73;
  CFArrayRef v74;
  char *v75;
  unint64_t v76;
  char *v77;
  const __CFArray *v78;
  unint64_t v79;
  unint64_t v80;
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
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = (void *)objc_msgSend(a2, "objectAtIndex:", 0);
  v8 = (char *)objc_msgSend(a2, "objectAtIndex:", 1);
  v9 = (void *)objc_msgSend(a2, "objectAtIndex:", 2);
  v69 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 3), "unsignedLongLongValue");
  v78 = (const __CFArray *)objc_msgSend(a3, "objectAtIndex:", 0);
  v74 = v78;
  if ((unint64_t)objc_msgSend(a3, "count") >= 2)
    v74 = (CFArrayRef)objc_msgSend(a3, "objectAtIndex:", 1);
  v10 = objc_msgSend(v7, "count");
  v79 = objc_msgSend(v8, "count");
  v80 = objc_msgSend(v9, "count");
  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;
  if (v10 >= 0x201)
    v12 = 1;
  else
    v12 = v11;
  v13 = (char *)&v69 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = v10;
  if (v10 > 0x200)
    v13 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v69 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v11);
  if (v79 <= 1)
    v14 = 1;
  else
    v14 = v79;
  if (v79 >= 0x201)
    v15 = 1;
  else
    v15 = v14;
  if (v79 > 0x200)
  {
    v75 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v75 = (char *)&v69 - ((8 * v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v75, 8 * v14);
  }
  if (v80 <= 1)
    v16 = 1;
  else
    v16 = v80;
  if (v80 >= 0x201)
    v17 = 1;
  else
    v17 = v16;
  v18 = (char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v80 > 0x200)
    v18 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v16);
  v72 = v8;
  v77 = v18;
  v19 = -[__CFArray count](v78, "count");
  if (v19 <= 1)
    v20 = 1;
  else
    v20 = v19;
  if (v19 >= 0x201)
    v21 = 1;
  else
    v21 = v20;
  v22 = (char *)&v69 - ((8 * v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = v19;
  if (v19 > 0x200)
  {
    v71 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v71 = v22;
    bzero(v22, 8 * v20);
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v94;
    while (2)
    {
      v27 = 0;
      v28 = v13;
      v29 = &v13[8 * v25];
      do
      {
        if (*(_QWORD *)v94 != v26)
          objc_enumerationMutation(v7);
        v30 = objc_msgSend(a4, "persistentStoreForIdentifier:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v27));
        if (!v30)
        {
          v66 = 0;
          goto LABEL_93;
        }
        *(_QWORD *)&v29[8 * v27++] = v30;
      }
      while (v24 != v27);
      v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
      v25 += v27;
      v13 = v28;
      if (v24)
        continue;
      break;
    }
  }
  v31 = (void *)objc_msgSend((id)objc_msgSend(a4, "managedObjectModel"), "entitiesByName");
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v32 = v72;
  v33 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v90;
    while (2)
    {
      v37 = v13;
      v38 = 0;
      v39 = &v75[8 * v35];
      do
      {
        if (*(_QWORD *)v90 != v36)
          objc_enumerationMutation(v32);
        v40 = objc_msgSend(v31, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v38));
        if (!v40)
        {
          v66 = 0;
          v28 = v37;
          goto LABEL_93;
        }
        *(_QWORD *)&v39[8 * v38++] = v40;
      }
      while (v34 != v38);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
      v35 += v38;
      v13 = v37;
      if (v34)
        continue;
      break;
    }
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v41 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
  v42 = v77;
  if (v41)
  {
    v43 = v41;
    v44 = 0;
    v45 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v86 != v45)
          objc_enumerationMutation(v9);
        *(_QWORD *)&v42[8 * v44 + 8 * i] = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
      }
      v43 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      v44 += i;
    }
    while (v43);
  }
  v70 = v13;
  v47 = objc_msgSend(v9, "count");
  v81 = 0u;
  v82 = 0u;
  v49 = v47 < 0xFF && v69 < 0x1000000;
  v83 = 0uLL;
  v84 = 0uLL;
  v50 = -[__CFArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
  if (v50)
  {
    v51 = v50;
    v52 = 0;
    v53 = 0;
    v54 = *(_QWORD *)v82;
    v55 = 0x7FFFFFFFLL;
    while (2)
    {
      v56 = 0;
      v72 = v52;
      v57 = &v71[8 * (_QWORD)v52];
      do
      {
        if (*(_QWORD *)v82 != v54)
          objc_enumerationMutation(v78);
        v58 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v56);
        if (v49)
          v59 = v58 >> 24;
        else
          v59 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v56);
        if (v59 != v55)
        {
          if (v59 >= (uint64_t)v80
            || ((v60 = WORD1(*(_QWORD *)&v77[8 * v59]) - 1,
                 v61 = (unsigned __int16)*(_QWORD *)&v77[8 * v59] - 1,
                 v60 < v76)
              ? (v62 = v61 >= v79)
              : (v62 = 1),
                v62))
          {
            v66 = 0;
            goto LABEL_92;
          }
          v53 = (objc_class *)objc_msgSend(*(id *)&v70[8 * v60], "objectIDFactoryForEntity:", *(_QWORD *)&v75[8 * v61]);
          v55 = v59;
        }
        if (v49)
          ValueAtIndex = v58 & 0xFFFFFF;
        else
          ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(v74, (CFIndex)&v72[v56]);
        *(_QWORD *)&v57[8 * v56++] = objc_msgSend([v53 alloc], "initWithPK64:", ValueAtIndex);
      }
      while (v51 != v56);
      v51 = -[__CFArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
      v52 = &v72[v56];
      if (v51)
        continue;
      break;
    }
  }
  v64 = [_PFArray alloc];
  v65 = -[__CFArray count](v78, "count");
  v66 = -[_PFArray initWithObjects:count:andFlags:](v64, "initWithObjects:count:andFlags:", v71, v65, 18);
LABEL_92:
  v28 = v70;
LABEL_93:
  if (v73 >= 0x201)
    NSZoneFree(0, v71);
  v67 = v77;
  if (v76 >= 0x201)
    NSZoneFree(0, v28);
  if (v79 >= 0x201)
    NSZoneFree(0, v75);
  if (v80 >= 0x201)
    NSZoneFree(0, v67);
  return v66;
}

+ (id)_frameworkHash
{
  if (qword_1ECD8D8F0 != -1)
    dispatch_once(&qword_1ECD8D8F0, &__block_literal_global_51);
  return (id)qword_1ECD8D8F8;
}

+ (uint64_t)_groupObjectsByRootEntity:(uint64_t)a1
{
  objc_opt_self();
  return +[_PFRoutines _rootEntityGroupsForObjects:passingBlock:]((uint64_t)_PFRoutines, a2, (uint64_t)&__block_literal_global_63);
}

+ (uint64_t)_logDirectoryAccessDebugInformation:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
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
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
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
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  stat v133;
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  _NSCoreDataLog(1, (uint64_t)CFSTR("Logging status information for directory path: %@"), v3, v4, v5, v6, v7, v8, (uint64_t)a2);
  v9 = (void *)objc_msgSend(a2, "pathComponents");
  memset(&v133, 0, sizeof(v133));
  v10 = geteuid();
  _NSCoreDataLog(1, (uint64_t)CFSTR("Executing as effective user %u"), v11, v12, v13, v14, v15, v16, v10);
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
  if (result)
  {
    v18 = result;
    v19 = &stru_1E1EE23F0;
    v20 = *(_QWORD *)v130;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v130 != v20)
          objc_enumerationMutation(v9);
        v22 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * v21);
        LOBYTE(v133.st_dev) = 0;
        v19 = (__CFString *)-[__CFString stringByAppendingPathComponent:](v19, "stringByAppendingPathComponent:", v22);
        v23 = (const char *)-[__CFString fileSystemRepresentation](v19, "fileSystemRepresentation");
        if (stat(v23, &v133))
        {
          v30 = __error();
          strerror(*v30);
          _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to stat path '%s', errno %d / %s."), v31, v32, v33, v34, v35, v36, (uint64_t)v23);
        }
        else
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Information for %s"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  File Device ID: \t%d"), v37, v38, v39, v40, v41, v42, v133.st_rdev);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  Device ID: \t\t%d"), v43, v44, v45, v46, v47, v48, v133.st_dev);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  File Size: \t\t%lld bytes"), v49, v50, v51, v52, v53, v54, v133.st_size);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  File inode: \t\t%llu"), v55, v56, v57, v58, v59, v60, v133.st_ino);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  File user ID: \t\t%u"), v61, v62, v63, v64, v65, v66, v133.st_uid);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  File group ID: \t\t%u"), v67, v68, v69, v70, v71, v72, v133.st_gid);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  File Permissions: \t"), v73, v74, v75, v76, v77, v78, v123);
          if ((v133.st_mode & 0xF000) == 0x4000)
            v85 = CFSTR("d");
          else
            v85 = CFSTR("-");
          _NSCoreDataLog(1, (uint64_t)v85, v79, v80, v81, v82, v83, v84, v124);
          _NSCoreDataLog(1, (uint64_t)CFSTR("  %3o"), v86, v87, v88, v89, v90, v91, v133.st_mode & 0x1FF);
          v98 = "is not";
          if ((v133.st_mode & 0xF000) == 0xA000)
            v98 = "is";
          _NSCoreDataLog(1, (uint64_t)CFSTR("  component %s a symbolic link"), v92, v93, v94, v95, v96, v97, (uint64_t)v98);
          if (access(v23, 4))
          {
            v126 = *__error();
            _NSCoreDataLog(1, (uint64_t)CFSTR("  component is not readable with errno %d"), v105, v106, v107, v108, v109, v110, v126);
          }
          else
          {
            _NSCoreDataLog(1, (uint64_t)CFSTR("  component is readable"), v99, v100, v101, v102, v103, v104, v125);
          }
          if (access(v23, 2))
          {
            v128 = *__error();
            _NSCoreDataLog(1, (uint64_t)CFSTR("  component is not writeable with errno %d"), v117, v118, v119, v120, v121, v122, v128);
          }
          else
          {
            _NSCoreDataLog(1, (uint64_t)CFSTR("  component is writeable"), v111, v112, v113, v114, v115, v116, v127);
          }
        }
        ++v21;
      }
      while (v18 != v21);
      result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
      v18 = result;
    }
    while (result);
  }
  return result;
}

+ (void)_logFileAccessDebugInformation:(uint64_t)a1
{
  int *v3;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
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
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int *v103;
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
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint32_t f_flags;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  stat v197;
  statfs v198;
  uint64_t v199;

  v199 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a2)
  {
    memset(&v197, 0, sizeof(v197));
    if (stat(a2, &v197))
    {
      v3 = __error();
      strerror(*v3);
      _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to stat path '%s', errno %d / %s."), v4, v5, v6, v7, v8, v9, (uint64_t)a2);
      v190 = geteuid();
      _NSCoreDataLog(1, (uint64_t)CFSTR("Executing as effective user %u"), v10, v11, v12, v13, v14, v15, v190);
    }
    else
    {
      v16 = geteuid();
      _NSCoreDataLog(1, (uint64_t)CFSTR("Executing as effective user %u"), v17, v18, v19, v20, v21, v22, v16);
      _NSCoreDataLog(1, (uint64_t)CFSTR("Information for %s"), v23, v24, v25, v26, v27, v28, (uint64_t)a2);
      _NSCoreDataLog(1, (uint64_t)CFSTR("---------------------------"), v29, v30, v31, v32, v33, v34, v192);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  File Device ID: \t%d"), v35, v36, v37, v38, v39, v40, v197.st_rdev);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  Device ID: \t\t%d"), v41, v42, v43, v44, v45, v46, v197.st_dev);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  File Size: \t\t%lld bytes"), v47, v48, v49, v50, v51, v52, v197.st_size);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  File inode: \t\t%llu"), v53, v54, v55, v56, v57, v58, v197.st_ino);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  File user ID: \t\t%u"), v59, v60, v61, v62, v63, v64, v197.st_uid);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  File group ID: \t\t%u"), v65, v66, v67, v68, v69, v70, v197.st_gid);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  File Permissions: \t"), v71, v72, v73, v74, v75, v76, v193);
      if ((v197.st_mode & 0xF000) == 0x4000)
        v83 = CFSTR("d");
      else
        v83 = CFSTR("-");
      _NSCoreDataLog(1, (uint64_t)v83, v77, v78, v79, v80, v81, v82, v194);
      _NSCoreDataLog(1, (uint64_t)CFSTR("  %3o"), v84, v85, v86, v87, v88, v89, v197.st_mode & 0x1FF);
      if ((v197.st_mode & 0xF000) == 0xA000)
        v96 = "is";
      else
        v96 = "is not";
      _NSCoreDataLog(1, (uint64_t)CFSTR("  file %s a symbolic link"), v90, v91, v92, v93, v94, v95, (uint64_t)v96);
    }
    memset(&v198, 0, 512);
    if (statfs(a2, &v198))
    {
      v103 = __error();
      v104 = *v103;
      strerror(*v103);
      _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to statfs file; errno %d / %s."),
        v105,
        v106,
        v107,
        v108,
        v109,
        v110,
        v104);
      return;
    }
    _NSCoreDataLog(1, (uint64_t)CFSTR("Information for file system"), v97, v98, v99, v100, v101, v102, v191);
    _NSCoreDataLog(1, (uint64_t)CFSTR("---------------------------"), v111, v112, v113, v114, v115, v116, v195);
    _NSCoreDataLog(1, (uint64_t)CFSTR("  File system type: \t\t%#lx"), v117, v118, v119, v120, v121, v122, v198.f_type);
    _NSCoreDataLog(1, (uint64_t)CFSTR("  File system flags: \t\t%#lx"), v123, v124, v125, v126, v127, v128, v198.f_flags);
    f_flags = v198.f_flags;
    if ((v198.f_flags & 1) != 0)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("MNT_RDONLY"), v129, v130, v131, v132, v133, v134, v196);
      f_flags = v198.f_flags;
      if ((v198.f_flags & 0x2000) == 0)
      {
LABEL_15:
        if ((f_flags & 0x4000) == 0)
          goto LABEL_16;
        goto LABEL_24;
      }
    }
    else if ((v198.f_flags & 0x2000) == 0)
    {
      goto LABEL_15;
    }
    _NSCoreDataLog(1, (uint64_t)CFSTR("  MNT_QUOTA"), v129, v130, v131, v132, v133, v134, v196);
    f_flags = v198.f_flags;
    if ((v198.f_flags & 0x4000) == 0)
    {
LABEL_16:
      if ((f_flags & 0x200000) == 0)
        goto LABEL_17;
      goto LABEL_25;
    }
LABEL_24:
    _NSCoreDataLog(1, (uint64_t)CFSTR("  MNT_ROOTFS"), v129, v130, v131, v132, v133, v134, v196);
    f_flags = v198.f_flags;
    if ((v198.f_flags & 0x200000) == 0)
    {
LABEL_17:
      if ((f_flags & 0x800000) == 0)
        goto LABEL_18;
      goto LABEL_26;
    }
LABEL_25:
    _NSCoreDataLog(1, (uint64_t)CFSTR("  MNT_UNKNOWNPERMISSIONS"), v129, v130, v131, v132, v133, v134, v196);
    f_flags = v198.f_flags;
    if ((v198.f_flags & 0x800000) == 0)
    {
LABEL_18:
      if ((f_flags & 0x2000000) == 0)
      {
LABEL_20:
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Total data blocks: \t\t%lu"), v129, v130, v131, v132, v133, v134, v198.f_blocks);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Free data blocks: \t\t%lu"), v136, v137, v138, v139, v140, v141, v198.f_bfree);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Free blocks for nonsuperuser:\t%lu"), v142, v143, v144, v145, v146, v147, v198.f_bavail);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Total i-nodes: \t\t\t%lu"), v148, v149, v150, v151, v152, v153, v198.f_files);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  File system ID: \t\t%#x, %#x"), v154, v155, v156, v157, v158, v159, v198.f_fsid.val[0]);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Free i-nodes: \t\t\t%llu"), v160, v161, v162, v163, v164, v165, v198.f_ffree);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Owner UID: \t\t\t%u"), v166, v167, v168, v169, v170, v171, v198.f_owner);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Filesystem type name: \t\t%s"), v172, v173, v174, v175, v176, v177, (uint64_t)v198.f_fstypename);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Mount on name: \t\t\t%s"), v178, v179, v180, v181, v182, v183, (uint64_t)v198.f_mntonname);
        _NSCoreDataLog(1, (uint64_t)CFSTR("  Mount from name: \t\t%s"), v184, v185, v186, v187, v188, v189, (uint64_t)v198.f_mntfromname);
        return;
      }
LABEL_19:
      _NSCoreDataLog(1, (uint64_t)CFSTR("  MNT_DEFWRITE"), v129, v130, v131, v132, v133, v134, v196);
      goto LABEL_20;
    }
LABEL_26:
    _NSCoreDataLog(1, (uint64_t)CFSTR("  MNT_JOURNALED"), v129, v130, v131, v132, v133, v134, v196);
    if ((v198.f_flags & 0x2000000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
}

+ (uint64_t)_generateUbiquityHashForPath:(uint64_t)a1
{
  const char *v3;
  size_t v4;
  size_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  char v12;
  _BYTE v13[1024];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = v13;
  if ((objc_msgSend(a2, "getCString:maxLength:encoding:", v13, 1024, 4) & 1) == 0)
  {
    v3 = (const char *)objc_msgSend(a2, "UTF8String");
    if (!v3)
      return 1;
  }
  v4 = strlen(v3);
  if (!v4)
    return 1;
  v5 = v4;
  if (v4 < 0x400)
  {
    v7 = 0;
    v6 = &v12;
  }
  else
  {
    v6 = (char *)malloc_type_calloc(1uLL, v4 + 1, 0xC556BD40uLL);
    v7 = v6;
  }
  v9 = 0;
  v10 = v3 - 1;
  do
  {
    v6[v9] = v10[v5];
    --v10;
    ++v9;
  }
  while (v5 != v9);
  v6[v5] = 0;
  v8 = CFHashBytes();
  if (v7)
    free(v7);
  return v8;
}

+ (uint64_t)convertCString:(unint64_t *)a3 toUnsignedInt64:(int)a4 withBase:
{
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  char *__endptr;

  objc_opt_self();
  __endptr = 0;
  v7 = strtouq(a2, &__endptr, a4);
  if (__endptr)
    v8 = __endptr == a2;
  else
    v8 = 1;
  if (v8 || *__endptr)
  {
    v7 = 0;
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  *a3 = v7;
  return v9;
}

+ (uint64_t)xpcStoreArchiverObjectIDClassesForSecureCoding
{
  objc_opt_self();
  if (qword_1ECD8D918 != -1)
    dispatch_once(&qword_1ECD8D918, &__block_literal_global_158);
  return qword_1ECD8D910;
}

+ (uint64_t)historyChangesArrayClassesForSecureCoding
{
  objc_opt_self();
  if (qword_1ECD8D928 != -1)
    dispatch_once(&qword_1ECD8D928, &__block_literal_global_160);
  return qword_1ECD8D920;
}

+ (uint64_t)historyQueryGenDataClassesForSecureCoding
{
  objc_opt_self();
  if (qword_1ECD8D938 != -1)
    dispatch_once(&qword_1ECD8D938, &__block_literal_global_162);
  return qword_1ECD8D930;
}

+ (uint64_t)sensitiveIntegerValueForOverride:(uint64_t)a1
{
  BOOL v3;
  id v4;

  objc_opt_self();
  if (byte_1ECD8DE1F)
    v3 = 1;
  else
    v3 = byte_1ECD8DE24 == 0;
  if (!v3)
    return 0;
  v4 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if (objc_msgSend(v4, "length"))
    return objc_msgSend(v4, "integerValue");
  v4 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKey:", a2);
  if (objc_msgSend(v4, "length"))
    return objc_msgSend(v4, "integerValue");
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", a2);
}

+ (uint64_t)insecureBoolValueForOverride:(uint64_t)a1
{
  id v3;

  objc_opt_self();
  v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "BOOLValue");
  v3 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKey:", a2);
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "BOOLValue");
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", a2);
}

+ (uint64_t)writePFExternalReferenceDataToInterimFile:(uint64_t)a1
{
  const char *v3;
  size_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
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
  char *v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  off_t v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!objc_msgSend(a2, "hasExternalReferenceContent"))
    return 0;
  v3 = (const char *)objc_msgSend(a2, "_externalReferenceLocation");
  v4 = strlen(v3);
  v5 = (char *)malloc_type_calloc(1uLL, v4 + 9, 0xB5E9C285uLL);
  strcat(&strncat(v5, v3, v4)[v4 - 1], ".interim");
  v6 = (void *)objc_msgSend(a2, "_originalData");
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v11 = objc_msgSend(v6, "_safeguardLocation");
    if (!v11)
      goto LABEL_12;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  }
  else
  {
    v9 = objc_opt_class();
    if (v9 != objc_opt_class())
      goto LABEL_12;
    v10 = (void *)objc_msgSend(-[_PFEvanescentData url]((id *)v6), "path");
    if (!objc_msgSend(v10, "UTF8String"))
      goto LABEL_12;
  }
  v46 = 0;
  if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]((uint64_t)_PFRoutines, (uint64_t)v10, v7, objc_msgSend(a2, "preferredProtectionLevel"), &v46))
  {
    v18 = v5;
    goto LABEL_26;
  }
  v43 = v7;
  v44 = v46;
  _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to clone external data reference from %@ to %@ error: %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v10);
LABEL_12:
  v45 = v3;
  v19 = open(v5, 2561, 420, v43, v44);
  if (v19 < 0)
  {
    free(v5);
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99768];
    v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't open externalDataReference interim file : %d"), *__error());
    v49[0] = CFSTR("Problem Path");
    v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v49[1] = CFSTR("com.apple.coredata.ubiquity.eat");
    v50[0] = v42;
    v50[1] = MEMORY[0x1E0C9AAB0];
    v39 = (void *)MEMORY[0x1E0C99D80];
    v40 = v50;
    v41 = v49;
LABEL_29:
    objc_exception_throw((id)objc_msgSend(v35, "exceptionWithName:reason:userInfo:", v36, v37, objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 2)));
  }
  v20 = v19;
  v21 = objc_msgSend(a2, "_bytesLengthForExternalReference");
  v22 = malloc_type_malloc(0x40000uLL, 0x100004077774924uLL);
  v23 = 0;
  if (v21 >= 0x40000)
    v24 = 0x40000;
  else
    v24 = v21;
  do
  {
    objc_msgSend(v6, "getBytes:range:", v22, v23, v24);
    if (pwrite(v20, v22, v24, v23) != v24)
    {
      v34 = *__error();
      close(v20);
      free(v5);
      free(v22);
      v35 = (void *)MEMORY[0x1E0C99DA0];
      v36 = *MEMORY[0x1E0C99768];
      v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't create externalDataReference interim file : %d"), v34);
      v47[0] = CFSTR("Problem Path");
      v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v45);
      v47[1] = CFSTR("com.apple.coredata.ubiquity.eat");
      v48[0] = v38;
      v48[1] = MEMORY[0x1E0C9AAB0];
      v39 = (void *)MEMORY[0x1E0C99D80];
      v40 = v48;
      v41 = v47;
      goto LABEL_29;
    }
    v21 -= v24;
    v23 += v24;
    if (v21 >= 0x40000)
      v24 = 0x40000;
    else
      v24 = v21;
  }
  while (v21 > 0);
  v25 = objc_msgSend(a2, "preferredProtectionLevel");
  fcntl(v20, 64, v25);
  close(v20);
  v26 = objc_msgSend(a2, "_safeguardLocation");
  if (v26)
  {
    v46 = 0;
    if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]((uint64_t)_PFRoutines, v7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26), v25, &v46))
    {
      objc_msgSend(a2, "doCleanupOnDealloc");
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to clone external data reference from %@ to %@ error: %@"), v27, v28, v29, v30, v31, v32, v7);
    }
  }
  free(v5);
  v18 = (char *)v22;
LABEL_26:
  free(v18);
  return v7;
}

+ (BOOL)createExternalReferenceLinkFromPath:(uint64_t)a3 toPath:(uint64_t)a4 protectionLevel:(_QWORD *)a5 error:
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  int v16;
  _BOOL8 result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v30 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtPath:toPath:error:", a2, a3, &v30) & 1) == 0)
  {
    if (objc_msgSend(v30, "code") != 516
      || (v9 = (void *)objc_msgSend(v30, "domain"),
          !objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8])))
    {
      if (v30)
      {
        if (a5)
        {
          result = 0;
          *a5 = v30;
          return result;
        }
      }
      else
      {
        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/_PFRoutines.m");
        v25 = __pflogFaultLog;
        result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!result)
          return result;
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/_PFRoutines.m";
        v33 = 1024;
        v34 = 2110;
        _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      return 0;
    }
    v30 = 0;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v35[0] = a2;
  v35[1] = a3;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = open((const char *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "UTF8String"), 1, 420);
        if (v15 >= 1)
        {
          v16 = v15;
          fcntl(v15, 64, a4);
          close(v16);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v12);
  }
  return 1;
}

+ (uint64_t)moveInterimFileToPermanentLocation:(uint64_t)a1
{
  const std::__fs::filesystem::path *v3;
  size_t v4;
  std::__fs::filesystem::path *v5;
  std::error_code *v6;
  int v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (const std::__fs::filesystem::path *)objc_msgSend(a2, "_externalReferenceLocation");
  v4 = strlen((const char *)v3);
  v5 = (std::__fs::filesystem::path *)malloc_type_calloc(1uLL, v4 + 9, 0xF91C4AFuLL);
  strcat(&strncat((char *)v5, (const char *)v3, v4)[v4 - 1], ".interim");
  rename(v5, v3, v6);
  if (v7)
  {
    v9 = *__error();
    free(v5);
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't copy interim file to permanent location : %d"), v9);
    v13[0] = CFSTR("Problem object");
    v13[1] = CFSTR("com.apple.coredata.ubiquity.eat");
    v14[0] = a2;
    v14[1] = MEMORY[0x1E0C9AAB0];
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2)));
  }
  free(v5);
  return 1;
}

+ (void)readExternalReferenceDataFromFile:(uint64_t)a1
{
  const char *v3;
  const char *v4;
  int v5;
  int v6;
  int *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  const __CFString **v13;
  void *v14;
  size_t v15;
  ssize_t v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int *v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!objc_msgSend(a2, "hasExternalReferenceContent"))
    return 0;
  v3 = (const char *)objc_msgSend(a2, "_safeguardLocation");
  if (v3)
  {
    v4 = v3;
    v5 = open(v3, 0);
    if ((v5 & 0x80000000) == 0)
      goto LABEL_9;
    v4 = (const char *)objc_msgSend(a2, "_externalReferenceLocation");
    v6 = open(v4, 0);
    if (v6 < 0)
    {
      v7 = __error();
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open file with path: %s (%d)"), v4, *v7);
      v26 = CFSTR("com.apple.coredata.ubiquity.eat");
      v27 = MEMORY[0x1E0C9AAB0];
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = &v27;
      v13 = &v26;
LABEL_13:
      v20 = objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
      v21 = v8;
      v22 = v9;
LABEL_14:
      objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v10, v20));
    }
  }
  else
  {
    v4 = (const char *)objc_msgSend(a2, "_externalReferenceLocation");
    v6 = open(v4, 0);
    if (v6 < 0)
    {
      v23 = __error();
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open file with path %s (%d)"), v4, *v23);
      v28 = CFSTR("com.apple.coredata.ubiquity.eat");
      v29[0] = MEMORY[0x1E0C9AAB0];
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = v29;
      v13 = &v28;
      goto LABEL_13;
    }
  }
  v5 = v6;
LABEL_9:
  fcntl(v5, 48, 1);
  v15 = objc_msgSend(a2, "_bytesLengthForExternalReference");
  v14 = PF_CALLOC_UNSCANNED_BYTES(v15);
  v16 = read(v5, v14, v15);
  close(v5);
  if (v16 != v15)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing bytes from file at path %s, expected %lu, got %lu"), v4, v15, v16);
    v24 = CFSTR("com.apple.coredata.ubiquity.eat");
    v25 = MEMORY[0x1E0C9AAB0];
    v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v21 = v18;
    v22 = v19;
    goto LABEL_14;
  }
  return v14;
}

+ (uint64_t)readBytesForExternalReferenceData:(void *)a3 intoBuffer:(off_t)a4 range:(size_t)a5
{
  uint64_t result;
  const char *v10;
  const char *v11;
  int v12;
  int v13;
  int *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  const __CFString **v20;
  ssize_t v21;
  ssize_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int *v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  result = objc_msgSend(a2, "hasExternalReferenceContent");
  if (!(_DWORD)result)
    return result;
  v10 = (const char *)objc_msgSend(a2, "_safeguardLocation");
  if (!v10)
  {
    v11 = (const char *)objc_msgSend(a2, "_externalReferenceLocation");
    v13 = open(v11, 0);
    if (v13 < 0)
    {
      v28 = __error();
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99778];
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open file with path: %s (%d)"), v11, *v28);
      v35 = CFSTR("com.apple.coredata.ubiquity.eat");
      v36[0] = MEMORY[0x1E0C9AAB0];
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v36;
      v20 = &v35;
      goto LABEL_14;
    }
LABEL_7:
    v12 = v13;
    goto LABEL_8;
  }
  v11 = v10;
  v12 = open(v10, 0);
  if (v12 < 0)
  {
    v11 = (const char *)objc_msgSend(a2, "_externalReferenceLocation");
    v13 = open(v11, 0);
    if (v13 < 0)
    {
      v14 = __error();
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99778];
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open file with path: %s (%d)"), v11, *v14);
      v33 = CFSTR("com.apple.coredata.ubiquity.eat");
      v34 = MEMORY[0x1E0C9AAB0];
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = &v34;
      v20 = &v33;
LABEL_14:
      v25 = objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
      v26 = v15;
      v27 = v16;
LABEL_15:
      objc_exception_throw((id)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, v17, v25));
    }
    goto LABEL_7;
  }
LABEL_8:
  fcntl(v12, 48, 1);
  v21 = pread(v12, a3, a5, a4);
  if (v21 < 0)
  {
    close(v12);
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read content of file with path: %s (%d)"), v11, *__error());
    v31 = CFSTR("com.apple.coredata.ubiquity.eat");
    v32 = MEMORY[0x1E0C9AAB0];
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v32;
    v20 = &v31;
    goto LABEL_14;
  }
  v22 = v21;
  result = close(v12);
  if (v22 != a5)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read requested number of bytes from path: %s (got %lu)"), v11, v22);
    v29 = CFSTR("com.apple.coredata.ubiquity.eat");
    v30 = MEMORY[0x1E0C9AAB0];
    v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v26 = v23;
    v27 = v24;
    goto LABEL_15;
  }
  return result;
}

+ (uint64_t)deleteFileForPFExternalReferenceData:(uint64_t)a1
{
  uint64_t result;
  uint64_t v4;
  void *v5;

  objc_opt_self();
  result = objc_msgSend(a2, "hasExternalReferenceContent");
  if ((_DWORD)result)
  {
    v4 = objc_msgSend(a2, "externalReferenceLocationString");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    result = objc_msgSend(v5, "fileExistsAtPath:", v4);
    if ((_DWORD)result)
      return objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);
  }
  return result;
}

+ (BOOL)_isInMemoryStore:(uint64_t)a1
{
  objc_opt_self();
  if ((__CFString *)objc_msgSend(a2, "type") != CFSTR("SQLite"))
    return objc_msgSend(a2, "type") == (_QWORD)CFSTR("InMemory");
  if (a2)
    return (a2[193] >> 6) & 1;
  return 0;
}

+ (uint64_t)_createNicksBase64EncodedStringFromData:(uint64_t)a1
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  int v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  char v18;
  int v19;
  unsigned int v20;

  objc_opt_self();
  v3 = objc_msgSend(a2, "bytes");
  v4 = objc_msgSend(a2, "length");
  v5 = (2 * ((v4 * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64)) & 0xFFFFFFFFFFFFFFFCLL;
  v6 = malloc_type_calloc(v5 + (v5 + 4) / 0x4CuLL + 5, 1uLL, 0x100004077774924uLL);
  if (!v4)
  {
    v8 = 0;
    return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v8, 1, 1);
  }
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = v7 % 3;
    if (v7 % 3 == 2)
    {
      v11 = v8 + 1;
      v6[v8] = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[((unint64_t)(*(unsigned __int8 *)(v3 + v7) | (*(unsigned __int8 *)(v3 + v7 - 1) << 8)) >> 6) & 0x3F];
      v10 = *(_BYTE *)(v3 + v7) & 0x3F;
      v12 = 2;
LABEL_10:
      v8 += v12;
      v6[v11] = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[v10];
      goto LABEL_11;
    }
    if (v9 == 1)
    {
      v10 = ((unint64_t)(*(unsigned __int8 *)(v3 + v7) | (*(unsigned __int8 *)(v3 + v7 - 1) << 8)) >> 4) & 0x3F;
      goto LABEL_9;
    }
    if (!v9)
    {
      v10 = (unint64_t)*(unsigned __int8 *)(v3 + v7) >> 2;
LABEL_9:
      v12 = 1;
      v11 = v8;
      goto LABEL_10;
    }
LABEL_11:
    if (v8)
    {
      HIDWORD(v13) = 678152731 * v8;
      LODWORD(v13) = 678152731 * v8;
      if ((v13 >> 2) <= 0x35E50D7)
        v6[v8++] = 10;
    }
    ++v7;
  }
  while (v4 > v7);
  v14 = v7 % 3;
  v15 = v3 + v7;
  if (v14 == 2)
  {
    v18 = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[4 * (*(_BYTE *)(v15 - 1) & 0xF)];
    v17 = 2;
    v19 = 1;
    v16 = v8;
LABEL_20:
    v20 = v19 + v8;
    v6[v16] = v18;
    v8 += v17;
    v6[v20] = 61;
  }
  else if (v14 == 1)
  {
    v16 = v8 + 1;
    v6[v8] = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[16
                                                                                         * (*(_BYTE *)(v15 - 1) & 3)];
    v17 = 3;
    v18 = 61;
    v19 = 2;
    goto LABEL_20;
  }
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v8, 1, 1);
}

+ (void)getIndexes:(void *)a3 fromCollection:(void *)a4 forObjectsInCollection:
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void **v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  const __CFAllocator *v23;
  const CFDictionaryKeyCallBacks *v24;
  const __CFDictionary *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t i;
  unint64_t v31;
  unint64_t *v32;
  const void **v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[24];
  __int128 v40;
  uint64_t v41;
  _BYTE v42[64];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (objc_msgSend(a4, "count"))
  {
    v81 = 0u;
    v80 = 0u;
    v79 = 0u;
    v78 = 0u;
    v77 = 0u;
    v76 = 0u;
    v75 = 0u;
    v74 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v7 = objc_msgSend(a3, "count");
    v32 = &v31;
    v8 = MEMORY[0x1E0C80A78](v7);
    v11 = (const void **)((char *)&v31 - v10);
    v12 = 8 * v9;
    v31 = v8;
    if (v8 > 0x200)
    {
      v11 = (const void **)NSAllocateScannedUncollectable();
      v34 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v31 - v10, 8 * v9);
      MEMORY[0x1E0C80A78](v13);
      v34 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v34, v12);
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16, v31, v32);
    v33 = v11;
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v44;
      do
      {
        v18 = 0;
        v19 = (char *)&v11[v16];
        v20 = &v34[8 * v16];
        do
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(a3);
          v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v18);
          *(_QWORD *)&v20[8 * v18] = v16 + v18 + 1;
          *(_QWORD *)&v19[8 * v18++] = v21;
        }
        while (v15 != v18);
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        v16 += v18;
        v11 = v33;
      }
      while (v15);
    }
    memset(v42, 0, sizeof(v42));
    objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", v42, &v48, 16);
    v22 = v31;
    v23 = _PFStackAllocatorCreate((unint64_t *)&v50, 1024);
    memset(v39, 0, sizeof(v39));
    v40 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
    v41 = *(_QWORD *)(MEMORY[0x1E0C9B390] + 40);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = 0;
    else
      v24 = (const CFDictionaryKeyCallBacks *)v39;
    v25 = CFDictionaryCreate(v23, v11, (const void **)v34, v22, v24, 0);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(a4);
          *(_DWORD *)(a2 + 4 * (v28 + i)) = CFDictionaryGetValue(v25, *(const void **)(*((_QWORD *)&v35 + 1)+ 8 * i))- 1;
        }
        v27 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        v28 += i;
      }
      while (v27);
    }
    if (v22 >= 0x201)
    {
      NSZoneFree(0, v34);
      NSZoneFree(0, v33);
    }
    if (*((_QWORD *)&v51 + 1))
    {
      if (v25)
        CFRelease(v25);
    }
  }
}

+ (uint64_t)newMutableOrderedSetFromCollection:(uint64_t)a1
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = objc_msgSend(a2, "count");
  v4 = v3;
  if (v3 <= 1)
    v5 = 1;
  else
    v5 = v3;
  if (v3 >= 0x201)
    v6 = 1;
  else
    v6 = v5;
  v7 = (char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 > 0x200)
    v7 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
  objc_msgSend(a2, "getObjects:", v7);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v7, v4);
  if (v4 >= 0x201)
    NSZoneFree(0, v7);
  return v8;
}

+ (uint64_t)_objectsInOrderedCollection:(void *)a3 formSubstringInOrderedCollection:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  objc_opt_self();
  v5 = objc_msgSend(a2, "count");
  if (v5 - 1 >= (unint64_t)objc_msgSend(a3, "count"))
    return 0;
  v6 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(a2, "firstObject"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v6;
  v8 = objc_msgSend(a2, "count") + v6;
  if (v8 > objc_msgSend(a3, "count"))
    return 0;
  v10 = objc_msgSend(a2, "count");
  if (!v10)
    return 1;
  v11 = v10;
  result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 0), "isEqual:", objc_msgSend(a3, "objectAtIndex:", v7));
  if ((_DWORD)result)
  {
    v12 = 1;
    do
    {
      v13 = v12;
      if (v11 == v12)
        break;
      v14 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", v12), "isEqual:", objc_msgSend(a3, "objectAtIndex:", v7 + v12));
      v12 = v13 + 1;
    }
    while (v14);
    return v13 >= v11;
  }
  return result;
}

+ (uint64_t)newOrderedSetFromCollection:(void *)a3 byInsertingItems:(uint64_t)a4 atIndex:
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  id v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (objc_msgSend(a3, "count"))
  {
    v7 = objc_msgSend(a2, "count");
    v8 = objc_msgSend(a3, "count");
    v9 = objc_msgSend(a2, "count");
    v10 = v9;
    if (v9 <= 1)
      v11 = 1;
    else
      v11 = v9;
    if (v9 >= 0x201)
      v12 = 1;
    else
      v12 = v11;
    v13 = (char *)v30 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v9 > 0x200)
      v13 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v30 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v11);
    v17 = v7 + v8 + 1;
    if (v17 > 1)
      v18 = v7 + v8 + 1;
    else
      v18 = 1;
    if (v17 >= 0x201)
      v19 = 1;
    else
      v19 = v18;
    v20 = (char *)v30 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v30[1] = v30;
    v31 = v7 + v8 + 1;
    v32 = v10;
    if (v17 > 0x200)
      v20 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v30 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v18);
    if (v8 <= 1)
      v21 = 1;
    else
      v21 = v8;
    if (v8 >= 0x201)
      v22 = 1;
    else
      v22 = v21;
    v23 = (char *)v30 - ((8 * v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200)
      v23 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v30 - ((8 * v22 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v21);
    v33 = v7;
    objc_msgSend(a2, "getObjects:", v13);
    objc_msgSend(a3, "getObjects:", v23);
    memmove(v20, v13, 8 * a4);
    if (v8)
    {
      v24 = 0;
      v25 = v23;
      v26 = v8;
      v27 = a4;
      do
      {
        if ((objc_msgSend(a2, "containsObject:", *(_QWORD *)v25) & 1) == 0)
        {
          *(_QWORD *)&v20[8 * a4++] = *(_QWORD *)v25;
          ++v24;
        }
        v25 += 8;
        --v26;
      }
      while (v26);
    }
    else
    {
      v27 = a4;
      v24 = 0;
    }
    v28 = v33;
    if (v33 != v27)
      memmove(&v20[8 * v24 + 8 * v27], &v13[8 * v27], 8 * (v33 - v27));
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v20, v28 + v24);
    if (v32 >= 0x201)
      NSZoneFree(0, v13);
    if (v31 >= 0x201)
      NSZoneFree(0, v20);
    if (v8 >= 0x201)
      NSZoneFree(0, v23);
    return v29;
  }
  else
  {
    v14 = objc_msgSend(a2, "isNSArray");
    v15 = objc_alloc(MEMORY[0x1E0C99E10]);
    if (v14)
      return objc_msgSend(v15, "initWithArray:", a2);
    else
      return objc_msgSend(v15, "initWithOrderedSet:", a2);
  }
}

+ (id)newOrderedSetFromCollection:(void *)a3 byRemovingItems:
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void **v21;
  const __CFAllocator *v22;
  uint64_t v23;
  const CFSetCallBacks *v24;
  const __CFSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  const void *v30;
  uint64_t v31;
  _QWORD v32[3];
  unint64_t v33;
  unint64_t v34;
  const void **v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a3, "count");
  v6 = objc_msgSend(a2, "count");
  if (!v6)
    return objc_alloc_init(MEMORY[0x1E0C99E10]);
  v7 = v6;
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v32 - v9;
  if (v8 > 0x200)
  {
    v11 = NSAllocateScannedUncollectable();
    v10 = (char *)v11;
    if (v5)
      goto LABEL_4;
  }
  else
  {
    bzero((char *)v32 - v9, 8 * v8);
    if (v5)
    {
LABEL_4:
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      MEMORY[0x1E0C80A78](v11);
      v33 = v7;
      v34 = v5;
      v32[2] = v13;
      if (v5 > 0x200)
      {
        v35 = (const void **)NSAllocateScannedUncollectable();
      }
      else
      {
        v35 = (const void **)((char *)v32 - v12);
        bzero((char *)v32 - v12, 8 * v5);
      }
      v32[1] = v32;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v44;
        do
        {
          v20 = 0;
          v21 = &v35[v18];
          do
          {
            if (*(_QWORD *)v44 != v19)
              objc_enumerationMutation(a3);
            v21[v20] = *(const void **)(*((_QWORD *)&v43 + 1) + 8 * v20);
            ++v20;
          }
          while (v17 != v20);
          v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          v18 += v20;
        }
        while (v17);
      }
      v22 = _PFStackAllocatorCreate((unint64_t *)&v49, 1024);
      v23 = *MEMORY[0x1E0C9B3B0];
      v40[1] = 0;
      v40[2] = 0;
      v40[0] = v23;
      v41 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 24);
      v42 = *(_QWORD *)(MEMORY[0x1E0C9B3B0] + 40);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = 0;
      else
        v24 = (const CFSetCallBacks *)v40;
      v25 = CFSetCreate(v22, v35, v34, v24);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v26 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v26)
      {
        v27 = v26;
        v15 = 0;
        v28 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v37 != v28)
              objc_enumerationMutation(a2);
            v30 = *(const void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (!CFSetGetValue(v25, v30))
              *(_QWORD *)&v10[8 * v15++] = v30;
          }
          v27 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        }
        while (v27);
      }
      else
      {
        v15 = 0;
      }
      if (v34 >= 0x201)
        NSZoneFree(0, v35);
      v7 = v33;
      if (*((_QWORD *)&v50 + 1))
      {
        if (v25)
          CFRelease(v25);
      }
      else
      {
        *((_QWORD *)&v49 + 1) = v49;
      }
      goto LABEL_37;
    }
  }
  objc_msgSend(a2, "getObjects:", v10);
  v15 = v7;
LABEL_37:
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v10, v15);
  if (v7 >= 0x201)
    NSZoneFree(0, v10);
  return (id)v31;
}

+ (id)newMutableSetFromCollection:(void *)a3 byIntersectingWithCollection:
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  const void **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  const __CFAllocator *v20;
  uint64_t v21;
  const CFSetCallBacks *v22;
  const void **v23;
  unint64_t v24;
  const __CFSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  const void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  const void **v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a2, "count");
  v6 = objc_msgSend(a3, "count");
  if (!v5)
    return objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = v6;
  if (!v6)
    return objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = (uint64_t)&v34;
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v34 - v8;
  if (v5 > 0x200)
  {
    v10 = NSAllocateScannedUncollectable();
    v9 = (char *)v10;
  }
  else
  {
    bzero((char *)&v34 - v8, 8 * v5);
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  MEMORY[0x1E0C80A78](v10);
  v13 = (const void **)((char *)&v34 - v12);
  if (v7 > 0x200)
    v13 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v34 - v12, 8 * v7);
  v35 = v7;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v50, 16, v34);
  v36 = v5;
  v37 = v13;
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v46;
    do
    {
      v18 = 0;
      v19 = (char *)&v13[v16];
      do
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(a3);
        *(_QWORD *)&v19[8 * v18] = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v18);
        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      v16 += v18;
      v13 = v37;
    }
    while (v15);
  }
  v20 = _PFStackAllocatorCreate((unint64_t *)&v51, 1024);
  v21 = *MEMORY[0x1E0C9B3B0];
  v42[1] = 0;
  v42[2] = 0;
  v42[0] = v21;
  v43 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 24);
  v44 = *(_QWORD *)(MEMORY[0x1E0C9B3B0] + 40);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = 0;
  else
    v22 = (const CFSetCallBacks *)v42;
  v23 = v13;
  v24 = v35;
  v25 = CFSetCreate(v20, v23, v35, v22);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v29 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(a2);
        v31 = *(const void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (CFSetGetValue(v25, v31))
          *(_QWORD *)&v9[8 * v28++] = v31;
      }
      v27 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v27);
  }
  else
  {
    v28 = 0;
  }
  if (v24 >= 0x201)
    NSZoneFree(0, v37);
  v32 = v36;
  if (*((_QWORD *)&v52 + 1))
  {
    if (v25)
      CFRelease(v25);
  }
  else
  {
    *((_QWORD *)&v51 + 1) = v51;
  }
  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", v9, v28);
  if (v32 >= 0x201)
    NSZoneFree(0, v9);
  return (id)v33;
}

+ (id)newMutableArrayFromCollection:(void *)a3 byRemovingItems:
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void **v21;
  const __CFAllocator *v22;
  uint64_t v23;
  const CFSetCallBacks *v24;
  const __CFSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  const void *v30;
  uint64_t v31;
  _QWORD v32[3];
  unint64_t v33;
  unint64_t v34;
  const void **v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a3, "count");
  v6 = objc_msgSend(a2, "count");
  if (!v6)
    return objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v32 - v9;
  if (v8 > 0x200)
  {
    v11 = NSAllocateScannedUncollectable();
    v10 = (char *)v11;
    if (v5)
      goto LABEL_4;
  }
  else
  {
    bzero((char *)v32 - v9, 8 * v8);
    if (v5)
    {
LABEL_4:
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      MEMORY[0x1E0C80A78](v11);
      v33 = v7;
      v34 = v5;
      v32[2] = v13;
      if (v5 > 0x200)
      {
        v35 = (const void **)NSAllocateScannedUncollectable();
      }
      else
      {
        v35 = (const void **)((char *)v32 - v12);
        bzero((char *)v32 - v12, 8 * v5);
      }
      v32[1] = v32;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v44;
        do
        {
          v20 = 0;
          v21 = &v35[v18];
          do
          {
            if (*(_QWORD *)v44 != v19)
              objc_enumerationMutation(a3);
            v21[v20] = *(const void **)(*((_QWORD *)&v43 + 1) + 8 * v20);
            ++v20;
          }
          while (v17 != v20);
          v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          v18 += v20;
        }
        while (v17);
      }
      v22 = _PFStackAllocatorCreate((unint64_t *)&v49, 1024);
      v23 = *MEMORY[0x1E0C9B3B0];
      v40[1] = 0;
      v40[2] = 0;
      v40[0] = v23;
      v41 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 24);
      v42 = *(_QWORD *)(MEMORY[0x1E0C9B3B0] + 40);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = 0;
      else
        v24 = (const CFSetCallBacks *)v40;
      v25 = CFSetCreate(v22, v35, v34, v24);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v26 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v26)
      {
        v27 = v26;
        v15 = 0;
        v28 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v37 != v28)
              objc_enumerationMutation(a2);
            v30 = *(const void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (!CFSetGetValue(v25, v30))
              *(_QWORD *)&v10[8 * v15++] = v30;
          }
          v27 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        }
        while (v27);
      }
      else
      {
        v15 = 0;
      }
      if (v34 >= 0x201)
        NSZoneFree(0, v35);
      v7 = v33;
      if (*((_QWORD *)&v50 + 1))
      {
        if (v25)
          CFRelease(v25);
      }
      else
      {
        *((_QWORD *)&v49 + 1) = v49;
      }
      goto LABEL_37;
    }
  }
  objc_msgSend(a2, "getObjects:", v10);
  v15 = v7;
LABEL_37:
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v10, v15);
  if (v7 >= 0x201)
    NSZoneFree(0, v10);
  return (id)v31;
}

+ (id)_newCollectionFromCollection:(uint64_t)a3 forParentContext:(objc_class *)a4 andClass:
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = objc_msgSend(a2, "count");
  if (!v7)
    return objc_alloc_init(a4);
  v8 = v7;
  if (v7 >= 0x201)
    v9 = 1;
  else
    v9 = v7;
  v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (char *)v21 - v10;
  if (v7 > 0x200)
    v11 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v21 - v10, 8 * v7);
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  v22 = 0u;
  v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v21[1] = v21;
    v15 = 0;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(a2);
        *(_QWORD *)&v11[8 * v15 + 8 * i] = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectID"), a3);
      }
      v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v15 += i;
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }
  v18 = objc_msgSend([a4 alloc], "initWithObjects:count:", v11, v15);
  v19 = 0;
  if (v8 <= 1)
    v20 = 1;
  else
    v20 = v8;
  do

  while (v20 != v19);
  if (v8 >= 0x201)
    NSZoneFree(0, v11);
  return (id)v18;
}

+ (id)newMutableArrayFromCollection:(uint64_t)a3 forParentContext:
{
  objc_class *v5;

  objc_opt_self();
  v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]((uint64_t)_PFRoutines, a2, a3, v5);
}

+ (id)newMutableSetFromCollection:(uint64_t)a3 forParentContext:
{
  objc_class *v5;

  objc_opt_self();
  v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]((uint64_t)_PFRoutines, a2, a3, v5);
}

+ (id)newMutableOrderedSetFromCollection:(uint64_t)a3 forParentContext:
{
  objc_class *v5;

  objc_opt_self();
  v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]((uint64_t)_PFRoutines, a2, a3, v5);
}

+ (id)_replaceBaseline:(void *)a3 inOrderedSet:(void *)a4 withOrderedSet:
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v19;
  void *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = objc_msgSend(a3, "count");
  v8 = objc_msgSend(a2, "count");
  if (!v7)
  {
    if (objc_msgSend(a4, "isNSOrderedSet"))
      return (id)objc_msgSend(a4, "mutableCopy");
    else
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", a4);
  }
  v9 = v8;
  if (!objc_msgSend(a4, "count"))
  {
    if (v9)
      return +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, a3, a2);
    else
      return (id)+[_PFRoutines newMutableOrderedSetFromCollection:]((uint64_t)_PFRoutines, a3);
  }
  if (!v9)
  {
    v19 = a4;
    v20 = a3;
    return +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v19, v20);
  }
  v10 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(a2, "firstObject"));
  if (!v10)
  {
    v20 = (void *)objc_msgSend(a3, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v9, v7 - v9));
    v19 = a4;
    return +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v19, v20);
  }
  v11 = v10;
  if (v10 + v9 == v7)
  {
    v12 = v7 - v9;
    v13 = objc_msgSend(a4, "count");
    v14 = v13 + v12;
    MEMORY[0x1E0C80A78](v13);
    v17 = (char *)&v36 - v16;
    if (v14 > 0x200)
      v17 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v36 - v16, 8 * v15);
    objc_msgSend(a3, "getObjects:range:", v17, 0, v12);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v17, v12);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v24 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(a4);
          v28 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((objc_msgSend(v23, "containsObject:", v28) & 1) == 0)
            *(_QWORD *)&v17[8 * v12++] = v28;
        }
        v25 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v25);
    }

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v17, v12);
    if (v14 >= 0x201)
      NSZoneFree(0, v17);
  }
  else
  {
    MEMORY[0x1E0C80A78](v10);
    v22 = (char *)&v36 - v21;
    if (v7 > 0x200)
      v22 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v36 - v21, 8 * v7);
    objc_msgSend(a3, "getObjects:", v22);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v22, v7);
    if (v7 >= 0x201)
      NSZoneFree(0, v22);
    v31 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v9);
    if (v9 == objc_msgSend(a4, "count"))
    {
      if ((objc_msgSend(a4, "isNSArray") & 1) == 0)
        a4 = (void *)objc_msgSend(a4, "array");
      objc_msgSend(v30, "replaceObjectsAtIndexes:withObjects:", v31, a4);
    }
    else
    {
      objc_msgSend(v30, "removeObjectsAtIndexes:", v31);
      v32 = objc_msgSend(a4, "count");
      v33 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v32);
      if (objc_msgSend(a4, "isNSArray"))
      {
        v34 = v30;
        v35 = (uint64_t)a4;
      }
      else
      {
        v35 = objc_msgSend(a4, "array");
        v34 = v30;
      }
      objc_msgSend(v34, "insertObjects:atIndexes:", v35, v33);
    }
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v30);

  }
  return (id)v29;
}

+ (uint64_t)_expressionIsCompoundIndexCompatible:(uint64_t)a1
{
  uint64_t result;
  uint64_t v4;

  objc_opt_self();
  result = objc_msgSend(a2, "expressionType");
  if (result != 1)
  {
    if (result == 3)
    {
      v4 = objc_msgSend(a2, "keyPath");
      return objc_msgSend(CFSTR("self"), "caseInsensitiveCompare:", v4)
          || objc_msgSend(CFSTR("self"), "caseInsensitiveCompare:", v4) != 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (uint64_t)fetchHeterogeneousCollectionByObjectIDs:(uint64_t)a3 intoContext:
{
  __CFDictionary *v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  objc_opt_self();
  objc_opt_self();
  v5 = +[_PFRoutines _createDictionaryPartitioningObjects:intoHierarchies:](_PFRoutines, "_createDictionaryPartitioningObjects:intoHierarchies:", a2, 1);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  v14 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke;
  v8[3] = &unk_1E1EDDA00;
  v8[4] = a3;
  v8[5] = &v9;
  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

+ (uint64_t)isUbiquitousURLUploaded:(uint64_t)a3 error:
{
  uint64_t result;
  id v6;

  objc_opt_self();
  v6 = 0;
  result = objc_msgSend(a2, "getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C99B38], a3);
  if ((_DWORD)result)
    return objc_msgSend(v6, "BOOLValue");
  return result;
}

+ (uint64_t)isUbiquitousURLDownloaded:(uint64_t)a3 error:
{
  uint64_t result;
  id v6;

  objc_opt_self();
  v6 = 0;
  result = objc_msgSend(a2, "getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C99B00], a3);
  if ((_DWORD)result)
    return objc_msgSend(v6, "BOOLValue");
  return result;
}

+ (BOOL)isSanitizedVersionOf:(void *)a3 equalTo:
{
  const char *v5;
  const char *v6;
  size_t v7;

  objc_opt_self();
  v5 = (const char *)objc_msgSend(a2, "UTF8String");
  v6 = (const char *)objc_msgSend(a3, "UTF8String");
  v7 = strlen(v6);
  return strncmp(v5, v6, v7) == 0;
}

+ (void)applicationDeactivateLifecyleNotifications
{
  objc_opt_self();
  return &unk_1E1F52380;
}

+ (void)applicationActivateLifecyleNotifications
{
  objc_opt_self();
  return &unk_1E1F52398;
}

+ (void)wrapBlockInGuardedAutoreleasePool:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*((void (**)(id))a3 + 2))(a3);

}

+ (void)efficientlyEnumerateManagedObjectsInFetchRequest:(void *)a3 usingManagedObjectContext:(uint64_t)a4 andApplyBlock:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  void *context;
  void *v45;
  char v47;
  uint64_t v48;
  const __CFString *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  const __CFString *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!objc_msgSend(a2, "fetchBatchSize"))
  {
    v38 = (void *)MEMORY[0x1E0C99DA0];
    v39 = *MEMORY[0x1E0C99778];
    v53 = CFSTR("offendingFetch");
    v54[0] = a2;
    v40 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v41 = CFSTR("This method can't be very efficient if you don't bother to set a batch size!");
    goto LABEL_24;
  }
  if (objc_msgSend(a3, "hasChanges"))
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to begin batch processing with pending changes. At best these changes may be saved unpredictably (depending on the batching algorithm used and downstream code) leading to inconsistent behavior across platforms / datasets. At worst they will be forgotten, and references to them invalidated when the context is reset between batches. Only call this method on clean contexts.");
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v42);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to begin batch processing with pending changes. At best these changes may be saved unpredictably (depending on the batching algorithm used and downstream code) leading to inconsistent behavior across platforms / datasets. At worst they will be forgotten, and references to them invalidated when the context is reset between batches. Only call this method on clean contexts.", buf, 2u);
    }
  }
  context = (void *)MEMORY[0x18D76B4E4]();
  v48 = 0;
  v47 = 0;
  v14 = (void *)objc_msgSend(a3, "queryGenerationToken");
  if (v14 == +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"))
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Efficient batching requires the use of query generations: %@");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)a2);
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = a2;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Efficient batching requires the use of query generations: %@", buf, 0xCu);
    }
  }
  buf[0] = 0;
  v23 = objc_msgSend(a3, "executeFetchRequest:error:", a2, &v48);
  if (v23)
  {
    v24 = (void *)v23;
    v43 = a2;
    v25 = objc_msgSend(a2, "fetchBatchSize");
    v45 = v24;
    v26 = objc_msgSend(v24, "count");
    if (v26 / v25 * v25 == v26)
      v27 = v26 / v25;
    else
      v27 = v26 / v25 + 1;
    if (v27)
    {
      v28 = v26;
      v29 = 0;
      v30 = 0;
      v31 = v25;
      while (1)
      {
        v32 = v28 >= v31 ? v31 : v28;
        v33 = a3;
        v34 = v32 + v29;
        v35 = (void *)MEMORY[0x18D76B4E4]();
        v36 = (void *)MEMORY[0x18D76B4E4]();
        v37 = v34;
        a3 = v33;
        (*(void (**)(uint64_t, uint64_t, _QWORD, char *, uint8_t *))(a4 + 16))(a4, objc_msgSend(v45, "subarrayWithRange:", v30, v37), 0, &v47, buf);
        objc_autoreleasePoolPop(v36);
        if (!v47)
        {
          if (objc_msgSend(v33, "hasChanges"))
            break;
        }
        objc_msgSend(v33, "reset");
        objc_autoreleasePoolPop(v35);
        v30 += v25;
        v31 += v25;
        v29 -= v25;
        if (!--v27)
          goto LABEL_22;
      }
      v38 = (void *)MEMORY[0x1E0C99DA0];
      v39 = *MEMORY[0x1E0C99778];
      v49 = CFSTR("offendingFetch");
      v50 = v43;
      v40 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v41 = CFSTR("Batch finished processing with pending changes in the moc. This prevents the context from being reset and purging rows / snapshots from memory. Please save at the end of each batch.");
LABEL_24:
      objc_exception_throw((id)objc_msgSend(v38, "exceptionWithName:reason:userInfo:", v39, v41, v40));
    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t, char *, uint8_t *))(a4 + 16))(a4, 0, v48, &v47, buf);
    v47 = 1;
  }
LABEL_22:
  objc_msgSend(a3, "reset");
  objc_autoreleasePoolPop(context);
}

@end
