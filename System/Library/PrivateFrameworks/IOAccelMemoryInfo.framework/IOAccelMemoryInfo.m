uint64_t classIsIOAF2(NSString *a1)
{
  __CFString *v1;
  uint64_t v2;
  __CFString *v3;

  v1 = a1;
  if ((-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("OSObject")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = v1;
    while (1)
    {
      v2 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("IOGraphicsAccelerator2"));
      if ((v2 & 1) != 0)
        break;
      v1 = (__CFString *)IOObjectCopySuperclassForClass(v3);

      v3 = v1;
      if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("OSObject")))
        goto LABEL_8;
    }
    v1 = v3;
  }
LABEL_8:

  return v2;
}

uint64_t classIsIOGPUFamily(NSString *a1)
{
  __CFString *v1;
  uint64_t v2;
  __CFString *v3;

  v1 = a1;
  if ((-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("OSObject")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = v1;
    while (1)
    {
      v2 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("IOGPU"));
      if ((v2 & 1) != 0)
        break;
      v1 = (__CFString *)IOObjectCopySuperclassForClass(v3);

      v3 = v1;
      if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("OSObject")))
        goto LABEL_8;
    }
    v1 = v3;
  }
LABEL_8:

  return v2;
}

uint64_t pid2name(uint64_t a1)
{
  uint64_t v3;
  size_t v4;
  _BYTE v5[243];
  _BYTE v6[5];
  int v7[2];
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v7 = 0xE00000001;
  v8 = 1;
  v9 = a1;
  v4 = 648;
  if (sysctl(v7, 4u, v5, &v4, 0, 0) || v4 != 648)
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown Process.%d"), a1, v3);
  else
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.%d"), v6, a1);
}

void sub_2124899A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,_QWORD *a42)
{
  std::__tree<int>::destroy((uint64_t)&a41, a42);
  _Unwind_Resume(a1);
}

void validateArray(NSDictionary *a1, NSString *a2, objc_class *a3, int a4)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = -[NSDictionary objectForKey:](a1, "objectForKey:", a2);
  if (v5)
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      validateArray();
    v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
          if ((objc_opt_isKindOfClass() & 1) == 0)
            validateArray();
          if (objc_msgSend(v7, "containsObject:", v13))
          {
            if (a4)
            {
              objc_msgSend(v8, "addObject:", v13);
            }
            else if (objc_msgSend(v7, "containsObject:", v13))
            {
              validateArray();
            }
          }
          objc_msgSend(v7, "addObject:", v13);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++)));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
}

uint64_t **std::__tree<int>::__emplace_unique_key_args<int,int const&>(uint64_t **a1, int *a2, _DWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v10 + 7) = *a3;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<int>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t validateAllocationList(NSArray *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = -[NSArray countByEnumeratingWithState:objects:count:](a1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
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
          objc_enumerationMutation(a1);
        +[IOAccelMemoryInfo validateDictionary:](IOAccelMemoryInfo, "validateDictionary:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      result = -[NSArray countByEnumeratingWithState:objects:count:](a1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t addIdentifiersInEntryToSet(NSMutableSet *a1, NSDictionary *a2)
{
  id v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSDictionary objectForKey:](a2, "objectForKey:", CFSTR("AllocationIdentifiers"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableSet addObject:](a1, "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

NSMutableDictionary *createMergedEntry(NSDictionary *a1, NSDictionary *a2)
{
  NSMutableDictionary *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
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
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSDictionary *v40;
  uint64_t v41;
  NSDictionary *v42;
  NSMutableDictionary *v43;
  NSMutableDictionary *v45;
  uint64_t v46;
  id v47;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, void *);
  void *v63;
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("MemoryPool"), a1, a2, v5);
  v6 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("Size"), a1, a2, v6);
  v7 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("DirtySize"), a1, a2, v7);
  v8 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("ResidentSize"), a1, a2, v8);
  v9 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("PageoffRequired"), a1, a2, v9);
  v10 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("Purgeable"), a1, a2, v10);
  v11 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("Wired"), a1, a2, v11);
  v12 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("CachedCopy"), a1, a2, v12);
  v13 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("IOSurfaceID"), a1, a2, v13);
  v14 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("IOAccelSurfaceID"), a1, a2, v14);
  v15 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("IOAccelSurfacePixelFormat"), a1, a2, v15);
  v16 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("IOAccelSurfaceBufferIndex"), a1, a2, v16);
  v17 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("IOAccelSurfaceWidth"), a1, a2, v17);
  v18 = (objc_class *)objc_opt_class();
  insertEitherValue(v4, CFSTR("IOAccelSurfaceHeight"), a1, a2, v18);
  insertMergedArray(v4, CFSTR("AllocationIdentifiers"), a1, a2);
  insertMergedArray(v4, CFSTR("Resources"), a1, a2);
  insertMergedArray(v4, CFSTR("Devices"), a1, a2);
  insertMergedArray(v4, CFSTR("Descriptions"), a1, a2);
  v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v20 = -[NSDictionary objectForKey:](a1, "objectForKey:", CFSTR("Processes"));
  v21 = -[NSDictionary objectForKey:](a2, "objectForKey:", CFSTR("Processes"));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v57;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v57 != v24)
          objc_enumerationMutation(v20);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v25), "objectForKey:", CFSTR("PID"));
        if (!v26)
          createMergedEntry();
        objc_msgSend(v19, "addObject:", v26);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v23);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v27 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v53;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(v21);
        v31 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v30), "objectForKey:", CFSTR("PID"));
        if (!v31)
          createMergedEntry();
        objc_msgSend(v19, "addObject:", v31);
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    }
    while (v28);
  }
  v45 = v4;
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v32 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
  if (v32)
  {
    v33 = v32;
    v46 = *(_QWORD *)v49;
    v34 = MEMORY[0x24BDAC760];
    v35 = v20;
    v36 = v21;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(v19);
        v38 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v37);
        v60 = v34;
        v61 = 3221225472;
        v62 = ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke;
        v63 = &unk_24CDC1758;
        v64 = v38;
        v39 = objc_msgSend(v20, "indexOfObjectPassingTest:", &v60);
        if (v39 == 0x7FFFFFFFFFFFFFFFLL)
          v40 = 0;
        else
          v40 = (NSDictionary *)objc_msgSend(v20, "objectAtIndex:", v39);
        v60 = v34;
        v61 = 3221225472;
        v62 = ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke;
        v63 = &unk_24CDC1758;
        v64 = v38;
        v41 = objc_msgSend(v21, "indexOfObjectPassingTest:", &v60);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
          v42 = 0;
        else
          v42 = (NSDictionary *)objc_msgSend(v21, "objectAtIndex:", v41);
        v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[NSMutableDictionary setValue:forKey:](v43, "setValue:forKey:", v38, CFSTR("PID"));
        insertMergedArray(v43, CFSTR("OpenGLObjects"), v40, v42);
        insertMergedArray(v43, CFSTR("OpenCLObjects"), v40, v42);
        insertMergedArray(v43, CFSTR("Mappings"), v40, v42);
        objc_msgSend(v47, "addObject:", v43);

        ++v37;
        v20 = v35;
        v21 = v36;
        v34 = MEMORY[0x24BDAC760];
      }
      while (v33 != v37);
      v33 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
    }
    while (v33);
  }
  -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v47, CFSTR("Processes"));

  return v45;
}

uint64_t insertEitherValue(NSMutableDictionary *a1, NSString *a2, NSDictionary *a3, NSDictionary *a4, objc_class *a5)
{
  uint64_t v8;
  uint64_t result;

  v8 = -[NSDictionary valueForKey:](a3, "valueForKey:", a2);
  result = -[NSDictionary valueForKey:](a4, "valueForKey:", a2);
  if (!v8 || result)
  {
    if (v8 || !result)
    {
      if (!(v8 | result))
        return result;
      result = objc_msgSend((id)v8, "isEqual:", result);
      if (!v8)
        return result;
    }
    else
    {
      v8 = result;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
    insertEitherValue();
  return -[NSMutableDictionary setValue:forKey:](a1, "setValue:forKey:", v8, a2);
}

void insertMergedArray(NSMutableDictionary *a1, NSString *a2, NSDictionary *a3, NSDictionary *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = -[NSDictionary objectForKey:](a3, "objectForKey:", a2);
  v8 = -[NSDictionary objectForKey:](a4, "objectForKey:", a2);
  if (v7 | v8)
  {
    v9 = v8;
    if (!v7 || v8)
    {
      if (v7 || !v8)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v7);
        objc_msgSend(v10, "addObjectsFromArray:", v9);
        v7 = objc_msgSend(v10, "allObjects");

        if (!v7)
          return;
      }
      else
      {
        v7 = v8;
      }
    }
    -[NSMutableDictionary setValue:forKey:](a1, "setValue:forKey:", v7, a2);
  }
}

uint64_t ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "objectForKey:", CFSTR("PID"));
  if (!v3)
    ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToNumber:", v3);
}

void std::__tree<int>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<int>::destroy(a1, *a2);
    std::__tree<int>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void validateArray()
{
  __assert_rtn("validateArray", "IOAccelMemoryInfo.mm", 268, "[found_values containsObject: obj] == FALSE");
}

{
  __assert_rtn("validateArray", "IOAccelMemoryInfo.mm", 261, "[obj isKindOfClass: expected_type]");
}

{
  __assert_rtn("validateArray", "IOAccelMemoryInfo.mm", 254, "[array isKindOfClass: [NSArray class]]");
}

void createMergedEntry()
{
  __assert_rtn("createMergedEntry", "IOAccelMemoryInfo.mm", 420, "pid_num");
}

{
  __assert_rtn("createMergedEntry", "IOAccelMemoryInfo.mm", 414, "pid_num");
}

void insertEitherValue()
{
  __assert_rtn("insertEitherValue", "IOAccelMemoryInfo.mm", 325, "[value isKindOfClass: expected_type]");
}

void ___ZL13getDictForPIDP7NSArrayP8NSNumber_block_invoke_cold_1()
{
  __assert_rtn("getDictForPID_block_invoke", "IOAccelMemoryInfo.mm", 370, "test_pid_num");
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x24BDD7EC8](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x24BDD86C8](*(_QWORD *)&object);
}

CFStringRef IOObjectCopySuperclassForClass(CFStringRef classname)
{
  return (CFStringRef)MEMORY[0x24BDD86D0](classname);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void operator delete(void *__p)
{
  off_24CDC1460(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CDC1468(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x24BDAEC70](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

