@implementation _NSSQLGenerator

- (void)prepareInsertStatementWithRow:(int)a3 includeConstraints:(int)a4 includeOnConflict:(void *)a5 onConflictKeys:
{
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t i;
  void *v17;
  uint64_t j;
  void *v19;
  uint64_t k;
  void *v21;
  uint64_t m;
  void *v23;
  NSSQLBindVariable *v24;
  uint64_t v25;
  NSSQLBindVariable *v26;
  NSSQLBindVariable *v27;
  uint64_t v28;
  uint64_t v29;
  NSSQLBindVariable *v30;
  NSSQLBindVariable *v31;
  uint64_t v32;
  NSSQLBindVariable *v33;
  uint64_t n;
  void *v35;
  NSSQLBindVariable *v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  NSSQLBindVariable *v41;
  uint64_t ii;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  NSSQLBindVariable *v46;
  int v47;
  uint64_t jj;
  void *v49;
  void *v50;
  _BOOL4 v51;
  CFDateRef v52;
  NSSQLBindVariable *v53;
  id v54;
  _QWORD *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t kk;
  uint64_t mm;
  void *v62;
  unint64_t v63;
  void *v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
      v9 = 0;
    else
      v9 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
    v83 = v9;
    v78 = (void *)objc_msgSend(v9, "foreignKeyColumns");
    v10 = (void *)objc_msgSend(v83, "foreignEntityKeyColumns");
    v11 = (void *)objc_msgSend(v83, "foreignOrderKeyColumns");
    v79 = (void *)objc_msgSend(v83, "attributeColumns");
    if (v83)
    {
      v12 = (void *)v83[17];
      v72 = (void *)v83[18];
      v73 = (void *)v83[16];
    }
    else
    {
      v12 = 0;
      v72 = 0;
      v73 = 0;
    }
    v81 = objc_msgSend(v79, "count");
    v13 = objc_msgSend(v10, "count");
    v14 = objc_msgSend(v78, "count");
    v75 = v11;
    v76 = objc_msgSend(v11, "count");
    v71 = a4;
    if (a3 ^ 1 | a4)
      v15 = CFSTR("INSERT INTO ");
    else
      v15 = CFSTR("INSERT OR IGNORE INTO ");
    objc_msgSend(*(id *)(a1 + 24), "appendString:", v15);
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v83, "tableName"));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("("));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v73, "columnName"));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
    v70 = v12;
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v12, "columnName"));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v72, "columnName"));
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        v17 = (void *)objc_msgSend(v78, "objectAtIndex:", i);
        if (!objc_msgSend((id)objc_msgSend(v17, "toOneRelationship"), "isConstrained") || a3)
        {
          objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v17, "columnName"));
        }
      }
    }
    if (v13)
    {
      for (j = 0; j != v13; ++j)
      {
        v19 = (void *)objc_msgSend(v10, "objectAtIndex:", j);
        objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
        objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v19, "columnName"));
      }
    }
    v74 = v13;
    if (v76)
    {
      for (k = 0; k != v76; ++k)
      {
        v21 = (void *)objc_msgSend(v75, "objectAtIndex:", k);
        objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
        objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v21, "columnName"));
      }
    }
    if (v81)
    {
      for (m = 0; m != v81; ++m)
      {
        v23 = (void *)objc_msgSend(v79, "objectAtIndex:", m);
        if (!objc_msgSend(v23, "isConstrained") || a3)
        {
          objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v23, "columnName"));
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(") VALUES(?, ?, ?"));
    v24 = [NSSQLBindVariable alloc];
    if (a2)
      v25 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_referenceData64");
    else
      v25 = 0;
    v26 = -[NSSQLBindVariable initWithInt64:sqlType:](v24, "initWithInt64:sqlType:", v25, objc_msgSend(v73, "sqlType"));
    -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v26);

    v27 = [NSSQLBindVariable alloc];
    if (a2 && (v28 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1")) != 0)
      v29 = *(unsigned int *)(v28 + 184);
    else
      v29 = 0;
    v30 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:](v27, "initWithUnsignedInt:sqlType:", v29, objc_msgSend(v70, "sqlType"));
    -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v30);

    v31 = [NSSQLBindVariable alloc];
    if (a2)
      v32 = *(unsigned int *)(*(_QWORD *)(a2 + 40) + 12);
    else
      v32 = 0;
    v33 = -[NSSQLBindVariable initWithInt64:sqlType:](v31, "initWithInt64:sqlType:", v32, objc_msgSend(v72, "sqlType"));
    -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v33);

    if (v14)
    {
      for (n = 0; n != v14; ++n)
      {
        v35 = (void *)objc_msgSend(v78, "objectAtIndex:", n);
        if (!objc_msgSend((id)objc_msgSend(v35, "toOneRelationship"), "isConstrained") || a3)
        {
          v36 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", -[NSSQLRow foreignKeyForSlot:](a2, objc_msgSend(v35, "slot")), objc_msgSend(v35, "sqlType"));
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v36);

          objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("?"));
        }
      }
    }
    if (v13)
    {
      v37 = 0;
      do
      {
        v38 = (void *)objc_msgSend(v10, "objectAtIndex:", v37);
        v39 = objc_msgSend(v38, "slot");
        if (a2)
          v40 = *(unsigned __int16 *)(a2
                                    + _NSSQLRowInstanceSize
                                    + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                    + (((unint64_t)*(unsigned int *)(a2 + 16) >> 16) & 0xFFFC)
                                    + 2 * v39);
        else
          v40 = 0;
        v41 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]([NSSQLBindVariable alloc], "initWithUnsignedInt:sqlType:", v40, objc_msgSend(v38, "sqlType"));
        -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v41);

        objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
        objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("?"));
        ++v37;
      }
      while (v74 != v37);
    }
    if (v76)
    {
      for (ii = 0; ii != v76; ++ii)
      {
        v43 = (void *)objc_msgSend(v75, "objectAtIndex:", ii);
        v44 = objc_msgSend(v43, "slot");
        if (a2)
          v45 = *(unsigned int *)(a2
                                + _NSSQLRowInstanceSize
                                + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                + 4 * v44);
        else
          v45 = 0;
        v46 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]([NSSQLBindVariable alloc], "initWithUnsignedInt:sqlType:", v45, objc_msgSend(v43, "sqlType"));
        -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v46);

        objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
        objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("?"));
      }
    }
    v47 = a3;
    if (v81)
    {
      for (jj = 0; jj != v81; ++jj)
      {
        v49 = (void *)objc_msgSend(v79, "objectAtIndex:", jj);
        if (!objc_msgSend(v49, "isConstrained") || v47)
        {
          v50 = (void *)objc_msgSend(v49, "attributeDescription");
          if (v50)
            v51 = objc_msgSend(v50, "superCompositeAttribute") != 0;
          else
            v51 = 0;
          v52 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, objc_msgSend(v49, "slot"));
          if (v51)
            v52 = (CFDateRef)-[__CFDate valueForKeyPath:](v52, "valueForKeyPath:", -[NSPropertyDescription _elementPath]((__CFString *)objc_msgSend(v49, "propertyDescription")));
          v53 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v52, objc_msgSend(v49, "sqlType"), objc_msgSend(v49, "attributeDescription"));
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v53);

          objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("?"));
          v47 = a3;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(")"));
    if (v71)
    {
      v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v83)
      {
        v55 = v83;
        do
        {
          objc_msgSend(v54, "addObjectsFromArray:", v55[27]);
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v56 = (void *)v55[26];
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
          if (v57)
          {
            v58 = v57;
            v59 = *(_QWORD *)v89;
            do
            {
              for (kk = 0; kk != v58; ++kk)
              {
                if (*(_QWORD *)v89 != v59)
                  objc_enumerationMutation(v56);
                v93 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * kk);
                objc_msgSend(v54, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1));
              }
              v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
            }
            while (v58);
          }
          v55 = (_QWORD *)v55[20];
        }
        while (v55);
      }
      if (objc_msgSend(v54, "count"))
      {
        if (!objc_msgSend(a5, "count"))
          a5 = (void *)objc_msgSend((id)objc_msgSend(v83, "attributes"), "valueForKey:", CFSTR("name"));
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
        if (v82)
        {
          v80 = *(_QWORD *)v85;
          do
          {
            for (mm = 0; mm != v82; ++mm)
            {
              if (*(_QWORD *)v85 != v80)
                objc_enumerationMutation(v54);
              v62 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * mm);
              objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(" ON CONFLICT"));
              objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("("));
              if (objc_msgSend(v62, "count"))
              {
                v63 = 0;
                do
                {
                  v64 = (void *)objc_msgSend(v62, "objectAtIndex:", v63);
                  if (v63)
                    objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(" , "));
                  objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v64, "columnName"));
                  ++v63;
                }
                while (objc_msgSend(v62, "count") > v63);
              }
              objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(")"));
              objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(" DO UPDATE SET Z_OPT = Z_OPT+1"));
              if (objc_msgSend(a5, "count"))
              {
                v65 = 0;
                do
                {
                  v66 = objc_msgSend(a5, "objectAtIndexedSubscript:", v65);
                  if (v83)
                    v67 = (void *)v83[5];
                  else
                    v67 = 0;
                  v68 = (void *)objc_msgSend(v67, "objectForKey:", v66);
                  if (objc_msgSend(v68, "propertyType") == 1)
                  {
                    v69 = objc_msgSend(v68, "columnName");
                    if ((objc_msgSend(v62, "containsObject:", v68) & 1) == 0)
                    {
                      objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(" , "));
                      objc_msgSend(*(id *)(a1 + 24), "appendString:", v69);
                      objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR(" = "));
                      objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("excluded."));
                      objc_msgSend(*(id *)(a1 + 24), "appendString:", v69);
                    }
                  }
                  ++v65;
                }
                while (objc_msgSend(a5, "count") > v65);
              }
            }
            v82 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
          }
          while (v82);
        }
      }

    }
  }
}

- (uint64_t)prepareUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  NSSQLBindVariable *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  NSSQLBindVariable *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  NSSQLBindVariable *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  CFDateRef v39;
  void *v40;
  _BOOL4 v41;
  NSSQLBindVariable *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSSQLBindVariable *v46;
  uint64_t v47;
  NSSQLBindVariable *v48;
  uint64_t v49;
  const __CFString *v50;
  NSSQLBindVariable *v51;
  NSSQLBindVariable *v52;
  _QWORD *v53;
  uint64_t v54;
  id obj;
  id v56;
  id v57;
  id v58;
  id v59;
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
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v5 = a2;
  v6 = result;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
    v7 = 0;
  else
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
  v54 = a3;
  v8 = (void *)objc_msgSend(v7, "foreignKeyColumns");
  v56 = (id)objc_msgSend(v7, "foreignEntityKeyColumns");
  v58 = (id)objc_msgSend(v7, "foreignOrderKeyColumns");
  v57 = (id)objc_msgSend(v7, "attributeColumns");
  objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR("UPDATE OR FAIL "));
  v53 = v7;
  objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v7, "tableName"));
  objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(" SET "));
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v74;
    v13 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v74 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (CFBitVectorGetBitAtIndex(a4, v11 + i))
        {
          v16 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", -[NSSQLRow foreignKeyForSlot:](v5, objc_msgSend(v15, "slot")), objc_msgSend(v15, "sqlType"));
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v6 + 8), v16);

          if ((v13 & 1) == 0)
            objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v15, "columnName"));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(" = ?"));
          v13 = 0;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      v11 += i;
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v13 = 1;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v17 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v70;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v70 != v19)
          objc_enumerationMutation(v56);
        v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v20);
        if (CFBitVectorGetBitAtIndex(a4, v11 + v20))
        {
          v22 = objc_msgSend(v21, "slot");
          if (v5)
            v23 = *(unsigned __int16 *)(v5
                                      + _NSSQLRowInstanceSize
                                      + (((unint64_t)*(unsigned int *)(v5 + 16) >> 1) & 0x1FFF8)
                                      + (((unint64_t)*(unsigned int *)(v5 + 16) >> 16) & 0xFFFC)
                                      + 2 * v22);
          else
            v23 = 0;
          v24 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]([NSSQLBindVariable alloc], "initWithUnsignedInt:sqlType:", v23, objc_msgSend(v21, "sqlType"));
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v6 + 8), v24);

          if ((v13 & 1) == 0)
            objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v21, "columnName"));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(" = ?"));
          v13 = 0;
        }
        ++v20;
      }
      while (v18 != v20);
      v25 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      v18 = v25;
      v11 += v20;
    }
    while (v25);
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v26 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v66;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v66 != v28)
          objc_enumerationMutation(v58);
        v30 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v29);
        if (CFBitVectorGetBitAtIndex(a4, v11 + v29))
        {
          v31 = objc_msgSend(v30, "slot");
          if (v5)
            v32 = *(unsigned int *)(v5
                                  + _NSSQLRowInstanceSize
                                  + (((unint64_t)*(unsigned int *)(v5 + 16) >> 1) & 0x1FFF8)
                                  + 4 * v31);
          else
            v32 = 0;
          v33 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]([NSSQLBindVariable alloc], "initWithUnsignedInt:sqlType:", v32, objc_msgSend(v30, "sqlType"));
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v6 + 8), v33);

          if ((v13 & 1) == 0)
            objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v30, "columnName"));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(" = ?"));
          v13 = 0;
        }
        ++v29;
      }
      while (v27 != v29);
      v34 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      v27 = v34;
      v11 += v29;
    }
    while (v34);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v35 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (v35)
  {
    v36 = v35;
    v59 = *(id *)v62;
    do
    {
      v37 = 0;
      do
      {
        if (*(id *)v62 != v59)
          objc_enumerationMutation(v57);
        v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v37);
        if (CFBitVectorGetBitAtIndex(a4, v11 + v37))
        {
          if ((objc_msgSend(v38, "isConstrained") & 1) != 0)
          {
            v39 = 0;
          }
          else
          {
            v40 = (void *)objc_msgSend(v38, "attributeDescription");
            if (v40)
              v41 = objc_msgSend(v40, "superCompositeAttribute") != 0;
            else
              v41 = 0;
            v39 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)v5, objc_msgSend(v38, "slot"));
            if (v41)
              v39 = (CFDateRef)-[__CFDate valueForKeyPath:](v39, "valueForKeyPath:", -[NSPropertyDescription _elementPath]((__CFString *)objc_msgSend(v38, "propertyDescription")));
          }
          v42 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v39, objc_msgSend(v38, "sqlType"), objc_msgSend(v38, "attributeDescription"));
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v6 + 8), v42);

          if ((v13 & 1) == 0)
            objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v38, "columnName"));
          objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(" = ?"));
          v13 = 0;
        }
        ++v37;
      }
      while (v36 != v37);
      v43 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      v36 = v43;
      v11 += v37;
    }
    while (v43);
  }
  if (v53)
    v44 = (void *)v53[18];
  else
    v44 = 0;
  if (v54)
    v45 = *(unsigned int *)(*(_QWORD *)(v54 + 40) + 12) + 1;
  else
    v45 = 1;
  objc_msgSend((id)v5, "setOptLock:", v45);
  v46 = [NSSQLBindVariable alloc];
  if (v5)
    v47 = *(unsigned int *)(*(_QWORD *)(v5 + 40) + 12);
  else
    v47 = 0;
  v48 = -[NSSQLBindVariable initWithInt64:sqlType:](v46, "initWithInt64:sqlType:", v47, objc_msgSend(v44, "sqlType"));
  -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v6 + 8), v48);

  if ((v13 & 1) == 0)
    objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v44, "columnName"));
  objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(" = ?"));
  objc_msgSend(*(id *)(v6 + 24), "appendString:", CFSTR(" "));
  if (!v54)
  {
    v49 = 0;
    if (!v5)
      goto LABEL_80;
    goto LABEL_79;
  }
  v49 = *(unsigned int *)(*(_QWORD *)(v54 + 40) + 12);
  if (v5)
LABEL_79:
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(v5 + 40) + 16), "_referenceData64");
LABEL_80:
  if (v49)
    v50 = CFSTR(" WHERE Z_PK = ? AND Z_OPT = ?");
  else
    v50 = CFSTR(" WHERE Z_PK = ? AND (Z_OPT = ? OR Z_OPT IS NULL)");
  v51 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", v5, 3);
  -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v6 + 8), v51);

  v52 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", v49, 3);
  -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v6 + 8), v52);

  objc_msgSend(*(id *)(v6 + 32), "appendString:", v50);
  result = objc_msgSend(CFSTR(" WHERE  (1 = 1) "), "isEqual:", *(_QWORD *)(v6 + 32));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(v6 + 24), "appendString:", *(_QWORD *)(v6 + 32));
  return result;
}

- (void)prepareDeleteStatementWithRow:(uint64_t)a1
{
  uint64_t v2;
  _QWORD *v4;
  void *v5;
  NSSQLBindVariable *v6;
  uint64_t v7;
  NSSQLBindVariable *v8;
  NSSQLBindVariable *v9;
  NSSQLBindVariable *v10;

  if (a1)
  {
    v2 = a2;
    if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
      v4 = 0;
    else
      v4 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
    objc_msgSend(*(id *)(a1 + 24), "appendString:", CFSTR("DELETE FROM "));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "entity"), "tableName"));
    if (v4)
    {
      v5 = (void *)v4[16];
      v4 = (_QWORD *)v4[18];
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" WHERE %@ = ? AND %@ = ?"), objc_msgSend(v5, "columnName"), objc_msgSend(v4, "columnName")));
    v6 = [NSSQLBindVariable alloc];
    if (v2)
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 16), "_referenceData64");
    else
      v7 = 0;
    v8 = -[NSSQLBindVariable initWithInt64:sqlType:](v6, "initWithInt64:sqlType:", v7, objc_msgSend(v5, "sqlType"));
    -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v8);

    v9 = [NSSQLBindVariable alloc];
    if (v2)
      v2 = *(unsigned int *)(*(_QWORD *)(v2 + 40) + 12);
    v10 = -[NSSQLBindVariable initWithInt64:sqlType:](v9, "initWithInt64:sqlType:", v2, objc_msgSend(v4, "sqlType"));
    -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(a1 + 8), v10);

  }
}

- (_QWORD)initWithStatement:(uint64_t)a3 forAdapter:
{
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_NSSQLGenerator;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
    v5[3] = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v6[4] = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v6[5] = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_selectList = 0;
  *(_OWORD *)&self->_sqlString = 0u;
  *(_OWORD *)&self->_statement = 0u;
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLGenerator;
  -[_NSSQLGenerator dealloc](&v3, sel_dealloc);
}

- (uint64_t)prepareConstrainedValuesUpdateStatementWithRow:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  const __CFBitVector *v13;
  uint64_t i;
  void *v15;
  NSSQLBindVariable *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFBitVector *v23;
  const __CFDate *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  CFDateRef v29;
  NSSQLBindVariable *v30;
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
  NSObject *v41;
  uint64_t v42;
  NSSQLBindVariable *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id obj;
  id obja;
  void *v49;
  CFBitVectorRef bv;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
  v5 = (void *)objc_msgSend(v4, "foreignKeyColumns");
  v6 = (void *)objc_msgSend(v4, "foreignEntityKeyColumns");
  v7 = (void *)objc_msgSend(v4, "foreignOrderKeyColumns");
  objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR("UPDATE OR FAIL "));
  objc_msgSend(*(id *)(v3 + 24), "appendString:", objc_msgSend(v4, "tableName"));
  objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" SET "));
  v49 = (void *)a2;
  if (a2)
    bv = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, 0, 8);
  else
    bv = 0;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  v46 = v4;
  if (v8)
  {
    v9 = v8;
    v45 = v7;
    obj = v6;
    v10 = 0;
    v11 = *(_QWORD *)v56;
    v12 = 1;
    v13 = bv;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (CFBitVectorGetBitAtIndex(v13, v10 + i)
          && objc_msgSend((id)objc_msgSend(v15, "toOneRelationship"), "isConstrained"))
        {
          v16 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", objc_msgSend((id)objc_msgSend(v49, "valueForKey:", objc_msgSend(v15, "name")), "_referenceData64"), 2);
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v3 + 8), v16);

          if ((v12 & 1) == 0)
            objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(v3 + 24), "appendString:", objc_msgSend(v15, "columnName"));
          objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ?"));
          v12 = 0;
          v13 = bv;
        }
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      v10 += i;
    }
    while (v9);
    v4 = v46;
    v6 = obj;
    v7 = v45;
  }
  else
  {
    v10 = 0;
    v12 = 1;
  }
  v17 = objc_msgSend(v6, "count");
  v18 = objc_msgSend(v7, "count");
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obja = (id)objc_msgSend(v4, "attributeColumns");
  v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v19)
  {
    v20 = v19;
    v21 = v17 + v10 + v18;
    v22 = *(_QWORD *)v52;
    v24 = (const __CFDate *)v49;
    v23 = bv;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(obja);
        v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v25);
        if (CFBitVectorGetBitAtIndex(v23, v21 + v25))
        {
          v27 = (void *)objc_msgSend(v26, "attributeDescription");
          if (v27)
            v28 = objc_msgSend(v27, "superCompositeAttribute") != 0;
          else
            v28 = 0;
          v29 = -[NSSQLRow attributeValueForSlot:](v24, objc_msgSend(v26, "slot"));
          if (v28)
            v29 = (CFDateRef)-[__CFDate valueForKeyPath:](v29, "valueForKeyPath:", -[NSPropertyDescription _elementPath]((__CFString *)objc_msgSend(v26, "propertyDescription")));
          v30 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v29, objc_msgSend(v26, "sqlType"), objc_msgSend(v26, "attributeDescription"));
          -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v3 + 8), v30);

          if ((v12 & 1) == 0)
            objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(", "));
          objc_msgSend(*(id *)(v3 + 24), "appendString:", objc_msgSend(v26, "columnName"));
          objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ?"));
          v12 = 0;
          v24 = (const __CFDate *)v49;
          v23 = bv;
        }
        ++v25;
      }
      while (v20 != v25);
      v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      v20 = v31;
      v21 += v25;
    }
    while (v31);
  }
  else
  {
    v24 = (const __CFDate *)v49;
    v23 = bv;
  }
  if ((v12 & 1) != 0)
  {
    v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Updating a constrained entity generated an UPDATE statement with no columns on entity %@");
    v33 = objc_msgSend(v46, "name");
    v34 = v32;
    v23 = bv;
    _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, v33);
    v41 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v44 = objc_msgSend(v46, "name");
      *(_DWORD *)buf = 138412290;
      v60 = v44;
      _os_log_fault_impl(&dword_18A253000, v41, OS_LOG_TYPE_FAULT, "CoreData: Updating a constrained entity generated an UPDATE statement with no columns on entity %@", buf, 0xCu);
      if (!bv)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  if (v23)
LABEL_44:
    CFRelease(v23);
LABEL_45:
  if (v24)
    v42 = objc_msgSend(*(id *)(*((_QWORD *)v24 + 5) + 16), "_referenceData64");
  else
    v42 = 0;
  v43 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", v42, 3);
  -[NSSQLiteStatement addBindVariable:](*(_QWORD *)(v3 + 8), v43);

  return objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" WHERE Z_PK = ?"));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_self();
  }
}

- (uint64_t)prepareInsertStatementForRelationship:(uint64_t)result
{
  uint64_t v3;
  _BOOL4 v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *data;
  const __CFString *v9;

  if (result)
  {
    v3 = result;
    if (a2)
      v4 = a2[1].length == (_QWORD)a2;
    else
      v4 = 0;
    objc_msgSend(*(id *)(result + 24), "appendString:", CFSTR("INSERT OR REPLACE INTO "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR("("));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(", "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    v5 = -[NSSQLManyToMany inverseOrderColumnName](a2);
    v6 = *(void **)(v3 + 24);
    if (v5)
    {
      objc_msgSend(v6, "appendString:", CFSTR(", "));
      objc_msgSend(*(id *)(v3 + 24), "appendString:", v5);
      v7 = *(void **)(v3 + 24);
      if (v4)
      {
        objc_msgSend(v7, "appendString:", CFSTR(", "));
        if (a2)
          data = a2[2].data;
        else
          data = 0;
        objc_msgSend(*(id *)(v3 + 24), "appendString:", data);
        objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(") VALUES (?, ?"));
        objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(", ?"));
        v6 = *(void **)(v3 + 24);
        v9 = CFSTR(", ?");
      }
      else
      {
        objc_msgSend(v7, "appendString:", CFSTR(") VALUES (?, ?"));
        v6 = *(void **)(v3 + 24);
        v9 = CFSTR(", ?");
      }
    }
    else
    {
      v9 = CFSTR(") VALUES (?, ?");
    }
    objc_msgSend(v6, "appendString:", v9);
    return objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(")"));
  }
  return result;
}

- (uint64_t)prepareMasterReorderStatementForRelationship:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 24), "appendString:", CFSTR("UPDATE OR FAIL "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" SET "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[NSSQLManyToMany inverseOrderColumnName](a2));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ? WHERE "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ? AND "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    return objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ?"));
  }
  return result;
}

- (uint64_t)prepareMasterReorderStatementPart2ForRelationship:(uint64_t)result
{
  uint64_t v3;
  char *data;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 24), "appendString:", CFSTR("UPDATE OR FAIL "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" SET "));
    if (a2)
      data = a2[2].data;
    else
      data = 0;
    objc_msgSend(*(id *)(v3 + 24), "appendString:", data);
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ? WHERE "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ? AND "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    return objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ?"));
  }
  return result;
}

- (uint64_t)prepareReorderStatementForRelationship:(uint64_t)result
{
  uint64_t v3;
  char *data;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 24), "appendString:", CFSTR("UPDATE OR FAIL "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" SET "));
    if (a2)
      data = a2[2].data;
    else
      data = 0;
    objc_msgSend(*(id *)(v3 + 24), "appendString:", data);
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ?"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" WHERE "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ? AND "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    return objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ?"));
  }
  return result;
}

- (uint64_t)prepareDeleteStatementForRelationship:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 24), "appendString:", CFSTR("DELETE FROM "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" WHERE "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ? AND "));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    return objc_msgSend(*(id *)(v3 + 24), "appendString:", CFSTR(" = ?"));
  }
  return result;
}

@end
