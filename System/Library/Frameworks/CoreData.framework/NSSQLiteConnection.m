@implementation NSSQLiteConnection

- (uint64_t)fetchResultSet:(uint64_t)a3 usingFetchPlan:
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int *plan_for_entity;
  sqlite3_int64 v17;
  int *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const unsigned __int8 *v27;
  const char *v28;
  BOOL *v29;
  BOOL v30;
  uint64_t v31;
  int v32;
  int *v33;
  uint64_t v34;
  void *v35;
  size_t v36;
  sqlite3_int64 v37;
  sqlite3_int64 v38;
  _BYTE *v39;
  BOOL v40;
  double v41;
  double v42;
  _BYTE *v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  _BYTE *v56;
  BOOL v57;
  const char *v58;
  int v59;
  size_t v60;
  int v61;
  uint64_t v62;
  void *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _PFExternalReferenceData *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  _BYTE *v76;
  BOOL v77;
  uint64_t v78;
  _BYTE *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const void *v83;
  uint64_t v84;
  uint64_t v85;
  _PFExternalReferenceData *v86;
  int v87;
  int v88;
  _BYTE *v89;
  BOOL v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const __CFString *v97;
  const char *v98;
  unsigned int v99;
  int v100;
  char v102;
  int v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  unsigned int v108;

  if (!result)
    return result;
  v4 = result;
  v5 = *(NSObject **)(result + 8);
  if (v5)
    dispatch_assert_queue_V2(v5);
  v6 = *(_DWORD *)(a3 + 16);
  if (!v6)
    v6 = 0x7FFFFFFF;
  v104 = v6;
  v7 = *(_QWORD *)(a3 + 48);
  if (v7)
    v100 = (*(unsigned __int8 *)(v7 + 43) >> 3) & 1;
  else
    v100 = 0;
  v8 = *(_DWORD *)(a3 + 72);
  v106 = objc_msgSend(*(id *)(a3 + 40), "model");
  if (v104 < 1)
  {
    result = 0;
    goto LABEL_125;
  }
  v9 = 0;
  v10 = 0;
  v102 = v8;
  v103 = v8 & 0x18;
  while ((*(_BYTE *)(v4 + 312) & 2) != 0)
  {
    fetchResultSetPrepareNextRow((int *)a2);
    v11 = *(unsigned int *)(a2 + 24);
    if ((v11 & 0x80000000) != 0)
    {
      v12 = 0;
      if ((v8 & 1) == 0)
      {
LABEL_13:
        v13 = *(_QWORD *)(a3 + 40);
        if (v13)
          v14 = *(_DWORD *)(v13 + 184);
        else
          v14 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a2 + 64) + 8 * v11) + *(_QWORD *)(a2 + 32);
      if ((v8 & 1) == 0)
        goto LABEL_13;
    }
    v15 = sqlite3_column_int(*(sqlite3_stmt **)(v4 + 80), 0);
    if (!v15)
    {
      v97 = CFSTR("The database appears corrupt.  (invalid entity key)");
      goto LABEL_130;
    }
    v14 = v15;
    if (v15 == *(_DWORD *)(v4 + 92))
    {
      v13 = *(_QWORD *)(v4 + 104);
    }
    else
    {
      v13 = (*(uint64_t (**)(uint64_t, char *, _QWORD))(a3 + 64))(v106, sel_entityForID_, v15);
      *(_QWORD *)(v4 + 104) = v13;
      *(_DWORD *)(v4 + 92) = v14;
    }
LABEL_20:
    *(_DWORD *)(v12 + 8) = v14;
    v108 = v9;
    v107 = v10;
    if (v103 == 16)
    {
      *(_QWORD *)(v12 + 24) = 0;
      if ((v8 & 2) == 0)
      {
        plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((_QWORD *)v13);
        goto LABEL_27;
      }
    }
    else
    {
      v17 = sqlite3_column_int64(*(sqlite3_stmt **)(v4 + 80), 1);
      *(_QWORD *)(v12 + 24) = v17;
      if (!v17)
      {
        v97 = CFSTR("The database appears corrupt.  (invalid primary key)");
LABEL_130:
        -[NSSQLiteConnection handleCorruptedDB:](v4, (uint64_t)v97);
      }
      if ((v8 & 2) == 0)
      {
        plan_for_entity = (int *)_sql_fetch_plan_for_entity((_QWORD *)v13);
LABEL_27:
        v18 = plan_for_entity;
        v19 = *plan_for_entity;
        if (*(_QWORD *)(a2 + 80) - *(_QWORD *)(a2 + 88) + *(int *)(a2 + 16) < v19)
          fetchResultSetReallocCurrentRow(a2, v19);
        v20 = v18[1];
        if ((_DWORD)v20)
        {
          v105 = v12;
          v21 = 0;
          v22 = v18 + 3;
          while (1)
          {
            v23 = *((unsigned __int8 *)v22 + 8) - 2;
            if (v23 > 6)
              v24 = 3;
            else
              v24 = qword_18A50A1B8[(char)v23];
            v25 = ~v24;
            v26 = (v24 + *(_QWORD *)(a2 + 88)) & ~v24;
            if (*(_QWORD *)(a2 + 80) - v26 + *(int *)(a2 + 16) <= 15)
            {
              fetchResultSetReallocCurrentRow(a2, 16);
              v26 = (v24 + *(_QWORD *)(a2 + 88)) & v25;
            }
            *(_QWORD *)(a2 + 88) = v26;
            objc_msgSend(*(id *)(v22 + 3), "propertyDescription");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend((id)objc_msgSend(*(id *)(v22 + 3), "propertyDescription"), "isOptional");
            switch(*((_BYTE *)v22 + 8))
            {
              case 1:
                v54 = sqlite3_column_int(*(sqlite3_stmt **)(v4 + 80), *v22);
                v55 = v54;
                v56 = *(_BYTE **)(a2 + 88);
                if ((v22[1] & 1) == 0)
                  goto LABEL_96;
                if (v54)
                  v57 = 1;
                else
                  v57 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v22) != 5;
                *v56 = !v57;
                v84 = *(_QWORD *)(a2 + 88) + 1;
                *(_QWORD *)(a2 + 88) = v84;
                if (*v56)
                  goto LABEL_98;
                v56 = (_BYTE *)((v84 + v24) & v25);
LABEL_96:
                *(_DWORD *)v56 = v55;
                v79 = v56 + 4;
                goto LABEL_97;
              case 2:
              case 3:
                v37 = sqlite3_column_int64(*(sqlite3_stmt **)(v4 + 80), *v22);
                v38 = v37;
                v39 = *(_BYTE **)(a2 + 88);
                if ((v22[1] & 1) == 0)
                  goto LABEL_81;
                if (v37)
                  v40 = 1;
                else
                  v40 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v22) != 5;
                *v39 = !v40;
                v78 = *(_QWORD *)(a2 + 88) + 1;
                *(_QWORD *)(a2 + 88) = v78;
                if (*v39)
                  goto LABEL_98;
                v39 = (_BYTE *)((v78 + v24) & v25);
LABEL_81:
                *(_QWORD *)v39 = v38;
                v79 = v39 + 8;
                goto LABEL_97;
              case 4:
              case 5:
              case 6:
              case 9:
              case 0xC:
              case 0xD:
              case 0xE:
                v27 = sqlite3_column_text(*(sqlite3_stmt **)(v4 + 80), *v22);
                v28 = (const char *)v27;
                if ((v22[1] & 1) == 0)
                  goto LABEL_46;
                v29 = *(BOOL **)(a2 + 88);
                v30 = v27 && *v27 || sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v22) != 5;
                *v29 = !v30;
                v31 = *(_QWORD *)(a2 + 88) + 1;
                *(_QWORD *)(a2 + 88) = v31;
                if (!*v29)
                {
                  *(_QWORD *)(a2 + 88) = (v31 + v24) & v25;
LABEL_46:
                  if (v28)
                  {
                    v32 = strlen(v28) + 1;
                    v34 = *(_QWORD *)(a2 + 80);
                    v33 = *(int **)(a2 + 88);
                    *v33 = v32;
                    v35 = v33 + 1;
                    *(_QWORD *)(a2 + 88) = v35;
                    v36 = v32;
                    if (v34 - (uint64_t)v35 + *(int *)(a2 + 16) < v32)
                    {
                      fetchResultSetReallocCurrentRow(a2, v32);
                      v35 = *(void **)(a2 + 88);
                    }
                    memcpy(v35, v28, v36);
                    *(_QWORD *)(a2 + 88) += v36;
                  }
                  else
                  {
                    v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Row (pk = %lld) for entity '%@' is missing mandatory text data for property '%@'"), *(_QWORD *)(v105 + 24), objc_msgSend((id)objc_msgSend((id)_sqlEntityForEntityID(v106, *(unsigned int *)(v105 + 8)), "entityDescription"), "name"), objc_msgSend((id)objc_msgSend(*(id *)(v22 + 3), "propertyDescription"), "name"));
                    _NSCoreDataLog(1, (uint64_t)CFSTR("%@\n"), v46, v47, v48, v49, v50, v51, v45);
                    v52 = *(unsigned int *)(a2 + 24);
                    if ((v52 & 0x80000000) != 0)
                      v53 = 0;
                    else
                      v53 = *(_QWORD *)(*(_QWORD *)(a2 + 64) + 8 * v52) + *(_QWORD *)(a2 + 32);
                    v20 = 0;
                    *(_DWORD *)v53 = -1;
                    *(_QWORD *)(v53 + 24) = 0;
                    *(_DWORD *)(v53 + 8) = 0;
                    --*(_DWORD *)a2;
                    *(_QWORD *)(a2 + 88) = v53;
                    --v108;
                  }
                }
                goto LABEL_98;
              case 7:
              case 8:
                v41 = sqlite3_column_double(*(sqlite3_stmt **)(v4 + 80), *v22);
                v42 = v41;
                v43 = *(_BYTE **)(a2 + 88);
                if ((v22[1] & 1) == 0)
                  goto LABEL_85;
                v44 = v41 != 0.0 || sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v22) != 5;
                *v43 = !v44;
                v80 = *(_QWORD *)(a2 + 88) + 1;
                *(_QWORD *)(a2 + 88) = v80;
                if (*v43)
                  goto LABEL_98;
                v43 = (_BYTE *)((v80 + v24) & v25);
LABEL_85:
                *(double *)v43 = v42;
                v79 = v43 + 8;
LABEL_97:
                *(_QWORD *)(a2 + 88) = v79;
                goto LABEL_98;
              case 0x10:
                if (!v100)
                  goto LABEL_73;
                if ((objc_msgSend((id)objc_msgSend(*(id *)(v22 + 3), "propertyDescription"), "_isFileBackedFuture") & 1) != 0)
                  goto LABEL_73;
                v58 = (const char *)sqlite3_column_blob(*(sqlite3_stmt **)(v4 + 80), *v22);
                v59 = sqlite3_column_bytes(*(sqlite3_stmt **)(v4 + 80), *v22);
                v60 = (v59 - 1);
                if (v59 < 1)
                  goto LABEL_73;
                v99 = v59;
                result = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v61 = *(unsigned __int8 *)v58;
                if (v61 == 1)
                {
                  v67 = [_PFExternalReferenceData alloc];
                  v85 = *(_QWORD *)(v4 + 16);
                  if (v85)
                    v69 = (*(_DWORD *)(v85 + 192) >> 2) & 7;
                  else
                    v69 = 0;
                  v71 = v99;
                  v70 = v58;
                  v72 = 0;
                  v73 = 0;
                }
                else
                {
                  if (v61 == 3)
                  {
                    __break(1u);
                    return result;
                  }
                  v98 = v58;
                  v62 = objc_msgSend((id)result, "stringWithFileSystemRepresentation:length:", v58 + 1, strnlen(v58 + 1, v60));
                  v63 = (void *)objc_msgSend(*(id *)(v4 + 16), "externalDataReferencesDirectory");
                  v64 = *(_QWORD **)(v4 + 16);
                  if (v64)
                  {
                    if (!v64[20])
                      objc_msgSend(*(id *)(v4 + 16), "externalDataReferencesDirectory");
                    v64 = (_QWORD *)v64[21];
                  }
                  v65 = objc_msgSend(v63, "stringByAppendingPathComponent:", v62);
                  v66 = objc_msgSend(v64, "stringByAppendingPathComponent:", v62);
                  v67 = [_PFExternalReferenceData alloc];
                  v68 = *(_QWORD *)(v4 + 16);
                  if (v68)
                    v69 = (*(_DWORD *)(v68 + 192) >> 2) & 7;
                  else
                    v69 = 0;
                  v70 = v98;
                  v71 = v99;
                  v72 = v65;
                  v73 = v66;
                }
                v86 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:](v67, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:", v70, v71, v72, v73, v69);
                v87 = -[_PFExternalReferenceData length](v86, "length");
                v88 = v87;
                v89 = *(_BYTE **)(a2 + 88);
                if ((v22[1] & 1) == 0)
                  goto LABEL_110;
                if (v87)
                  v90 = 1;
                else
                  v90 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v22) != 5;
                *v89 = !v90;
                v91 = *(_QWORD *)(a2 + 88) + 1;
                *(_QWORD *)(a2 + 88) = v91;
                if (*v89)
                {

                }
                else
                {
                  v89 = (_BYTE *)((v91 + v24) & v25);
LABEL_110:
                  *(_DWORD *)v89 = v88;
                  v92 = v89 + 4;
                  *(_QWORD *)(a2 + 88) = v92;
                  if (*(_QWORD *)(a2 + 80) - (_QWORD)v92 + *(int *)(a2 + 16) < v88)
                  {
                    fetchResultSetReallocCurrentRow(a2, v88);
                    v92 = *(void **)(a2 + 88);
                  }
                  memcpy(v92, -[_PFExternalReferenceData bytes](v86, "bytes"), v88);
                  *(_QWORD *)(a2 + 88) += v88;

                }
LABEL_98:
                ++v21;
                v22 += 6;
                if (v21 >= v20)
                  goto LABEL_115;
                break;
              default:
LABEL_73:
                v74 = sqlite3_column_bytes(*(sqlite3_stmt **)(v4 + 80), *v22);
                v75 = v74;
                v76 = *(_BYTE **)(a2 + 88);
                if ((v22[1] & 1) == 0)
                  goto LABEL_89;
                if (v74)
                  v77 = 1;
                else
                  v77 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v22) != 5;
                *v76 = !v77;
                v81 = *(_QWORD *)(a2 + 88) + 1;
                *(_QWORD *)(a2 + 88) = v81;
                if (!*v76)
                {
                  v76 = (_BYTE *)((v81 + v24) & v25);
LABEL_89:
                  *(_DWORD *)v76 = v75;
                  v82 = v76 + 4;
                  *(_QWORD *)(a2 + 88) = v82;
                  if (*(_QWORD *)(a2 + 80) - (_QWORD)v82 + *(int *)(a2 + 16) < v75)
                  {
                    fetchResultSetReallocCurrentRow(a2, v75);
                    v82 = *(void **)(a2 + 88);
                  }
                  v83 = sqlite3_column_blob(*(sqlite3_stmt **)(v4 + 80), *v22);
                  memcpy(v82, v83, v75);
                  *(_QWORD *)(a2 + 88) += v75;
                }
                goto LABEL_98;
            }
          }
        }
      }
    }
LABEL_115:
    v93 = *(int *)(a2 + 28);
    if ((_DWORD)v93 != -1)
    {
      v94 = *(_QWORD *)(*(_QWORD *)(a2 + 64) + 8 * v93);
      if (v94)
      {
        v95 = *(_QWORD *)(a2 + 32);
        v96 = v94 + *(_QWORD *)(a2 + 40);
        *(_DWORD *)(v96 + 4) = *(_DWORD *)(a2 + 24);
        *(_QWORD *)(v96 + 16) = v95;
      }
    }
    ++*(_DWORD *)(v4 + 88);
    v9 = v108 + 1;
    _execute(v4);
    v10 = v107 + 1;
    LOBYTE(v8) = v102;
    if (v107 + 1 == v104)
      break;
  }
  if (v9 <= 0x40000000)
    result = v9;
  else
    result = 0;
LABEL_125:
  *(_DWORD *)(a2 + 4) = result;
  if ((*(_BYTE *)(v4 + 312) & 2) == 0)
    *(_DWORD *)(a2 + 48) |= 1u;
  return result;
}

- (_QWORD)setColumnsToFetch:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[7];
    if (v4 != a2)
    {

      result = a2;
      v3[7] = result;
    }
  }
  return result;
}

- (_QWORD)_endFetch
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    result = -[NSSQLiteConnection setColumnsToFetch:](result, 0);
    *((_DWORD *)v1 + 78) &= ~2u;
    *(_QWORD *)((char *)v1 + 100) = 0;
    *(_QWORD *)((char *)v1 + 92) = 0;
    *((_DWORD *)v1 + 27) = 0;
  }
  return result;
}

- (void)endFetchAndRecycleStatement:(uint64_t)a1
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSSQLiteIndexStatistics *v19;
  int64_t v20;
  void *context;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, sqlite3_stmt *);
  void *v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 8);
    if (v3)
      dispatch_assert_queue_V2(v3);
    context = (void *)MEMORY[0x18D76B4E4]();
    if (*(_QWORD *)(a1 + 80))
    {
      v4 = *(_QWORD *)(a1 + 16);
      if (v4)
      {
        if ((*(_BYTE *)(v4 + 194) & 1) != 0)
        {
          v5 = (void *)objc_msgSend((id)a1, "sqlStatement");
          v6 = *(NSObject **)(a1 + 8);
          if (v6)
            dispatch_assert_queue_V2(v6);
          v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v8 = (void *)MEMORY[0x18D76B4E4]();
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EXPLAIN QUERY PLAN %@"), objc_msgSend(v5, "sqlString")), "UTF8String");
          v27 = MEMORY[0x1E0C809B0];
          v28 = 3221225472;
          v29 = __45__NSSQLiteConnection_indexesUsedByStatement___block_invoke;
          v30 = &unk_1E1EE0058;
          v31 = v7;
          sqlite3_exec_b();
          objc_autoreleasePoolPop(v8);
          v9 = v7;
          v10 = sqlite3_stmt_status(*(sqlite3_stmt **)(a1 + 80), 4, 1);
          v11 = *(int *)(a1 + 88);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = v10;
            v15 = *(_QWORD *)v24;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v9);
                v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
                v18 = (void *)MEMORY[0x18D76B4E4]();
                v19 = (NSSQLiteIndexStatistics *)objc_msgSend(*(id *)(a1 + 344), "objectForKeyedSubscript:", v17);
                if (v19
                  || (v19 = -[NSSQLiteIndexStatistics initWithName:storeID:]([NSSQLiteIndexStatistics alloc], "initWithName:storeID:", v17, objc_msgSend(*(id *)(a1 + 16), "identifier")), objc_msgSend(*(id *)(a1 + 344), "setObject:forKeyedSubscript:", v19, v17), v19, v19))
                {
                  v20 = v19->_instructionCount + v14;
                  ++v19->_executionCount;
                  v19->_instructionCount = v20;
                  v19->_rowCount += v11;
                }
                objc_autoreleasePoolPop(v18);
                ++v16;
              }
              while (v13 != v16);
              v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            }
            while (v13);
          }
        }
      }
    }
    if ((*(_BYTE *)(a1 + 312) & 2) != 0)
    {
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(_QWORD *)(a1 + 100) = 0;
      *(_QWORD *)(a1 + 92) = 0;
      *(_DWORD *)(a1 + 108) = 0;
    }
    if (a2)
      -[NSSQLiteConnection resetSQLStatement](a1);
    else
      -[NSSQLiteConnection releaseSQLStatement](a1);
    objc_autoreleasePoolPop(context);
  }
}

- (_QWORD)selectRowsWithStatement:(int)a3 cached:
{
  void *v5;

  if (result)
  {
    v5 = result;
    -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:](result, a2);
    -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v5, a2);
    if (a3 && (!a2 || !a2[8]))
      -[NSSQLiteConnection cacheCurrentDBStatementOn:]((uint64_t)v5, (sqlite3_stmt *)a2);
    return (_QWORD *)objc_msgSend(v5, "execute");
  }
  return result;
}

- (void)prepareSQLStatement:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  unsigned int v29;
  int v30;
  double v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  useconds_t v36;
  double Current;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  int v50;
  const __CFString *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  __CFString *v73;
  unsigned int v74;
  char *pzTail;
  const __CFString *v76;
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    v5 = *(void **)(a1 + 48);
    if (v5)
    {
      if (objc_msgSend(v5, "description"))
        v19 = objc_msgSend(*(id *)(a1 + 48), "description");
      else
        v19 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = v19;
      _NSCoreDataLog(1, (uint64_t)CFSTR("SQL statement is still active / leaked.  sql:'%@'"), v20, v21, v22, v23, v24, v25, v19);
      v27 = *MEMORY[0x1E0C99768];
      v76 = CFSTR("Statement");
      v77[0] = v26;
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v27, CFSTR("statement is still active"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1)));
    }
    *(_QWORD *)(a1 + 48) = a2;
    pzTail = 0;
    v74 = 0;
    -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    v7 = (_QWORD *)(a1 + 80);
    v6 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 88) = 0;
    if (!v6)
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      {
        v8 = *(unsigned __int8 *)(a1 + 42);
        v9 = objc_msgSend(a2, "sqlString");
        if (v8)
          v16 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
        else
          v16 = CFSTR("%@");
        _NSCoreDataLog(6, (uint64_t)v16, v10, v11, v12, v13, v14, v15, v9);
      }
      if (a2)
      {
        v17 = a2[8];
        *v7 = v17;
        if (v17)
        {
          v18 = *(_DWORD *)(a1 + 312) & 0xFFFFFFFE;
LABEL_47:
          *(_DWORD *)(a1 + 312) = v18;
          return;
        }
      }
      else
      {
        *v7 = 0;
      }
      v28 = (const char *)objc_msgSend((id)objc_msgSend(a2, "sqlString"), "UTF8String");
      v72 = 0;
      v29 = 0;
      v30 = 0;
      v31 = 0.0;
LABEL_20:
      v32 = 3 * v29 - 29999;
      while (1)
      {
        v33 = strlen(v28);
        v34 = sqlite3_prepare_v3(*(sqlite3 **)(a1 + 72), v28, v33, 1u, (sqlite3_stmt **)(a1 + 80), (const char **)&pzTail);
        v35 = v34;
        switch((char)v34)
        {
          case 0:
            v18 = *(_DWORD *)(a1 + 312) | 1;
            goto LABEL_47;
          case 1:
          case 7:
          case 10:
          case 17:
          case 21:
            goto LABEL_49;
          case 5:
            if (*(double *)(a1 + 232) > 0.0 && v31 == 0.0)
              v31 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
            if (v29 < 0x2711)
              goto LABEL_41;
            if (v29 - 10000 >= 0xB)
              v36 = v29 - 8899;
            else
              v36 = v32;
            goto LABEL_40;
          case 6:
            if (*(double *)(a1 + 232) > 0.0 && v31 == 0.0)
              v31 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
            goto LABEL_37;
          case 11:
          case 26:
            goto LABEL_54;
          case 14:
            if (v30 > 2)
            {
LABEL_49:
              v38 = v34;
              v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
              if (v38 == 10 && (sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v74), v74))
                v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d"), *(_QWORD *)(a1 + 32), v35, v39, v74);
              else
                v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@'"), *(_QWORD *)(a1 + 32), v35, v39, v71);
              v41 = (void *)v40;
              if (v40)
              {
                -[NSSQLiteConnection _forceDisconnectOnError](a1);
                v73 = 0;
                v42 = 256;
              }
              else
              {
LABEL_54:
                v41 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'"), *(_QWORD *)(a1 + 32), v35, sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
                v42 = (int)v35;
                v73 = CFSTR("NSSQLiteErrorDomain");
                -[NSSQLiteConnection _forceDisconnectOnError](a1);
                if (!v41)
                {
LABEL_59:
                  v49 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
                  v41 = 0;
                  v50 = 1;
LABEL_60:
                  if (*(_BYTE *)(a1 + 42))
                    v51 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m");
                  else
                    v51 = CFSTR("(%d) %s");
                  _NSCoreDataLog(1, (uint64_t)v51, v43, v44, v45, v46, v47, v48, v35);
                  if (v50)
                  {
                    v41 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during prepareSQL for SQL string '%s' : %s"), v28, v49);
                    v42 = 256;
                  }
                  *(_DWORD *)(a1 + 312) &= ~2u;
                  -[NSSQLiteConnection releaseSQLStatement](a1);
                  v52 = *MEMORY[0x1E0C99768];
                  v53 = (void *)MEMORY[0x1E0C99D80];
                  v54 = *(_QWORD *)(a1 + 32);
                  v55 = *MEMORY[0x1E0CB2AA0];
                  v56 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
                  if (v74)
                    v57 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
                  else
                    v57 = 0;
                  v58 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v52, v42, (uint64_t)v41, (void *)objc_msgSend(v53, "dictionaryWithObjectsAndKeys:", v54, v55, v56, CFSTR("NSSQLiteErrorDomain"), v57, *MEMORY[0x1E0CB2FE0], 0));
                  v59 = v58;
                  if (v73)
                    -[_NSCoreDataException _setDomain:]((uint64_t)v58, v73);
                  objc_exception_throw(v59);
                }
              }
              v49 = (const char *)objc_msgSend(v41, "UTF8String");
              v50 = 0;
              goto LABEL_60;
            }
            if (*(double *)(a1 + 232) > 0.0 && v31 == 0.0)
              v31 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
            ++v30;
LABEL_37:
            if (v29 <= 0xA)
              v36 = 3 * v29 + 1;
            else
              v36 = v29 + 1101;
LABEL_40:
            usleep(v36);
LABEL_41:
            if (v31 != 0.0)
            {
              Current = CFAbsoluteTimeGetCurrent();
              if (Current > v31)
              {
                if (v72 > 7)
                {
                  v60 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The database operation timed out after %.2f seconds."), Current - v31 + *(double *)(a1 + 232));
                  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
                  {
                    if (*(_BYTE *)(a1 + 42))
                      v67 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m");
                    else
                      v67 = CFSTR("(%d) %@");
                    v70 = v60;
                    _NSCoreDataLog(1, (uint64_t)v67, v61, v62, v63, v64, v65, v66, v35);
                  }
                  v68 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during SQL execution : %@"), v60, v70);
                  *(_DWORD *)(a1 + 312) &= ~2u;
                  -[NSSQLiteConnection releaseSQLStatement](a1);
                  v69 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134090, v68, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35), CFSTR("NSSQLiteErrorDomain")));
                  objc_exception_throw(v69);
                }
                ++v29;
                v31 = Current + *(double *)(a1 + 240);
                ++v72;
                goto LABEL_20;
              }
            }
            v32 += 3;
            ++v29;
            break;
          default:
            v73 = 0;
            v42 = 0;
            goto LABEL_59;
        }
      }
    }
  }
}

- (void)_ensureDatabaseOpen
{
  NSObject *v2;
  id v3;

  v2 = a1[1];
  if (v2)
    dispatch_assert_queue_V2(v2);
  if (!a1[9])
  {
    v3 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134060, (uint64_t)CFSTR("Attempted to perform an operation without an open database"), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a1[4], *MEMORY[0x1E0CB2AA0], 0));
    objc_exception_throw(v3);
  }
}

- (void)_ensureNoFetchInProgress
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  if ((*(_BYTE *)(a1 + 312) & 2) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Attempted to perform another operation with a fetch already in progress"), 0));
}

- (void)execute
{
  NSObject *queue;
  __sqliteConnectionFlags sqliteConnectionFlags;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
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
  sqlite3_stmt *v36;
  int v37;
  sqlite3_int64 v38;
  uint64_t v39;
  sqlite3_stmt *vmstatement;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  sqlite3_stmt *v56;
  int v57;
  const char *v58;
  uint64_t v59;
  unsigned int v60;
  sqlite3_stmt *v61;
  void *v62;
  sqlite3_stmt *v63;
  uint64_t v64;
  sqlite3_stmt *v65;
  sqlite3_stmt *v66;
  double v67;
  sqlite3_stmt *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  int v79;
  sqlite3_stmt *v80;
  int v81;
  const void *v82;
  uint64_t v83;
  uint64_t v84;
  sqlite3_stmt *v85;
  const void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  const __CFString *v92;
  uint64_t v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  objc_class *v106;
  uint64_t v107;
  void *v108;
  objc_class *v109;
  void *v110;
  void *v111;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2(queue);
  sqliteConnectionFlags = self->_sqliteConnectionFlags;
  if ((*(_BYTE *)&sqliteConnectionFlags & 1) == 0)
  {
    v5 = sqlite3_reset(self->_vmstatement);
    sqlite3_clear_bindings(self->_vmstatement);
    sqliteConnectionFlags = self->_sqliteConnectionFlags;
    if ((_DWORD)v5)
    {
      self->_sqliteConnectionFlags = (__sqliteConnectionFlags)(*(_DWORD *)&sqliteConnectionFlags & 0xFFFFFFFD);
      -[NSSQLiteConnection releaseSQLStatement]((uint64_t)self);
      v101 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(self->_db));
      v102 = *MEMORY[0x1E0C99768];
      v91 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5), CFSTR("NSSQLiteErrorDomain"));
      v93 = v102;
      v92 = (const __CFString *)v101;
LABEL_97:
      v94 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v93, 134180, (uint64_t)v92, v91);
      objc_exception_throw(v94);
    }
  }
  self->_sqliteConnectionFlags = (__sqliteConnectionFlags)(*(_DWORD *)&sqliteConnectionFlags & 0xFFFFFFFE);
  v6 = (void *)objc_msgSend(-[NSSQLiteConnection sqlStatement](self, "sqlStatement"), "bindVariables");
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v111 = v6;
    while (1)
    {
      v10 = (void *)objc_msgSend(v6, "objectAtIndex:", v9);
      v11 = objc_msgSend(v10, "sqlType");
      if (objc_msgSend(v10, "hasObjectValue"))
      {
        v12 = (void *)objc_msgSend(v10, "value");
        v13 = v12;
        if (v12 && objc_msgSend(v12, "isNSString") && objc_msgSend(v10, "allowsCoercion"))
          v14 = objc_msgSend(CFSTR("<null>"), "isEqualToString:", v13);
        else
          v14 = 0;
        v15 = 0;
      }
      else
      {
        v15 = objc_msgSend(v10, "int64");
        v14 = 0;
        v13 = 0;
      }
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") < 2)
        goto LABEL_26;
      if (!v13)
      {
        if (v15)
        {
          v110 = (void *)v15;
          _NSCoreDataLog(7, (uint64_t)CFSTR("SQLite bind[%ld] = (int64)%qd"), v16, v17, v18, v19, v20, v21, v9);
LABEL_27:
          if (v11 - 2 >= 2)
          {
            if (v11 != 1)
            {
LABEL_99:
              v95 = (void *)MEMORY[0x1E0C99DA0];
              v96 = *MEMORY[0x1E0C99768];
              v97 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("binding not implemented for this SQLType %d"), v11, v110);
              v98 = v95;
              v99 = v96;
              v100 = 0;
              goto LABEL_100;
            }
            vmstatement = self->_vmstatement;
            v41 = v9 + 1;
            v42 = v15;
LABEL_32:
            v39 = sqlite3_bind_int(vmstatement, v41, v42);
            goto LABEL_46;
          }
          v36 = self->_vmstatement;
          v37 = v9 + 1;
          v38 = v15;
        }
        else
        {
          _NSCoreDataLog(7, (uint64_t)CFSTR("SQLite bind[%ld] = nil"), v16, v17, v18, v19, v20, v21, v9);
LABEL_43:
          v36 = self->_vmstatement;
          v37 = v9 + 1;
          if (v11 != 3)
          {
            v39 = sqlite3_bind_null(v36, v37);
            goto LABEL_46;
          }
          v38 = 0;
        }
LABEL_29:
        v39 = sqlite3_bind_int64(v36, v37, v38);
        goto LABEL_46;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v110 = v13;
        _NSCoreDataLog(7, (uint64_t)CFSTR("SQLite bind[%ld] = \"%@\"), v30, v31, v32, v33, v34, v35, v9);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
          v110 = v49;
          _NSCoreDataLog(7, (uint64_t)CFSTR("SQLite bind[%ld] = (timestamp)%f"), v50, v51, v52, v53, v54, v55, v9);
        }
        else
        {
          v110 = v13;
          _NSCoreDataLog(7, (uint64_t)CFSTR("SQLite bind[%ld] = %@"), v43, v44, v45, v46, v47, v48, v9);
        }
      }
      if (v15)
        goto LABEL_27;
LABEL_38:
      if (!v13)
        goto LABEL_43;
      if (v11)
      {
        if (v14)
          goto LABEL_41;
      }
      else
      {
        v60 = -[NSSQLiteAdapter sqlTypeForExpressionConstantValue:]((uint64_t)-[NSSQLiteConnection adapter](self, "adapter"), v13);
        if (v60)
        {
          v11 = v60;
          if (v14)
            goto LABEL_41;
        }
        else
        {
          v13 = (void *)objc_msgSend(v13, "description");
          v11 = 6;
          if (v14)
          {
LABEL_41:
            v56 = self->_vmstatement;
            v57 = v9 + 1;
            v58 = "<null>";
LABEL_42:
            v39 = sqlite3_bind_text(v56, v57, v58, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            goto LABEL_46;
          }
        }
      }
      switch(v11)
      {
        case 1u:
          v65 = self->_vmstatement;
          v42 = objc_msgSend(v13, "intValue");
          vmstatement = v65;
          v6 = v111;
          v41 = v9 + 1;
          goto LABEL_32;
        case 2u:
        case 3u:
          v63 = self->_vmstatement;
          v38 = objc_msgSend(v13, "longLongValue");
          v36 = v63;
          v6 = v111;
          v37 = v9 + 1;
          goto LABEL_29;
        case 4u:
          v61 = self->_vmstatement;
          v62 = (void *)objc_msgSend(v13, "stringValue");
          goto LABEL_62;
        case 5u:
        case 6u:
        case 9u:
          v61 = self->_vmstatement;
          v62 = v13;
LABEL_62:
          v58 = (const char *)objc_msgSend(v62, "UTF8String");
          v56 = v61;
          v6 = v111;
          v57 = v9 + 1;
          goto LABEL_42;
        case 7u:
          v66 = self->_vmstatement;
          objc_msgSend(v13, "doubleValue");
          goto LABEL_65;
        case 8u:
          v66 = self->_vmstatement;
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
LABEL_65:
          v68 = v66;
          v6 = v111;
          v39 = sqlite3_bind_double(v68, v9 + 1, v67);
          goto LABEL_46;
        case 0xAu:
        case 0x11u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v84 = objc_msgSend(v13, "bytes");
            v85 = self->_vmstatement;
            if (v84)
              v86 = (const void *)v84;
            else
              v86 = v13;
            v79 = objc_msgSend(v13, "length");
            v80 = v85;
            v6 = v111;
            v81 = v9 + 1;
            v82 = v86;
            v83 = -1;
LABEL_86:
            v39 = sqlite3_bind_blob(v80, v81, v82, v79, (void (__cdecl *)(void *))v83);
LABEL_46:
            v59 = v39;
            if ((_DWORD)v39)
              goto LABEL_96;
            goto LABEL_47;
          }
          if (v13)
            -[_PFEvanescentData _openMapping]((uint64_t)v13);
          objc_msgSend(v13, "length");
          v64 = sqlite3_bind_blob_b();
LABEL_74:
          v59 = v64;
LABEL_79:
          v6 = v111;
          if ((_DWORD)v59)
          {
LABEL_96:
            v90 = *MEMORY[0x1E0C99768];
            v91 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59), CFSTR("NSSQLiteErrorDomain"));
            v92 = CFSTR("sqlite3_bind* failed");
            v93 = v90;
            goto LABEL_97;
          }
LABEL_47:
          if (v8 == ++v9)
            goto LABEL_88;
          break;
        case 0xBu:
          v69 = v13;
          if (objc_msgSend(v13, "isNSString"))
            v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v103 = (void *)MEMORY[0x1E0C99DA0];
            v104 = *MEMORY[0x1E0C99778];
            v105 = (void *)MEMORY[0x1E0CB3940];
            v106 = (objc_class *)objc_opt_class();
            v107 = objc_msgSend(v105, "stringWithFormat:", CFSTR("Unexpected or improperly formatted UUID parameter with type %@, expected NSUUID or well-formed NSString"), NSStringFromClass(v106), v110);
            goto LABEL_104;
          }
          v70 = malloc_type_malloc(0x10uLL, 0xF3EA0D21uLL);
          objc_msgSend(v69, "getUUIDBytes:", v70);
          v64 = sqlite3_bind_blob(self->_vmstatement, v9 + 1, v70, 16, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
          goto LABEL_74;
        case 0xCu:
          objc_opt_class();
          v71 = v13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v71 = (void *)objc_msgSend(v13, "absoluteString");
          if ((objc_msgSend(v71, "isNSString") & 1) == 0)
          {
            v103 = (void *)MEMORY[0x1E0C99DA0];
            v104 = *MEMORY[0x1E0C99778];
            v108 = (void *)MEMORY[0x1E0CB3940];
            v109 = (objc_class *)objc_opt_class();
            v107 = objc_msgSend(v108, "stringWithFormat:", CFSTR("Unexpected or improperly formatted URI parameter type %@, expected NSURL or well-formed NSString"), NSStringFromClass(v109), v110);
LABEL_104:
            v97 = v107;
            v100 = MEMORY[0x1E0C9AA70];
            v98 = v103;
            v99 = v104;
LABEL_100:
            objc_exception_throw((id)objc_msgSend(v98, "exceptionWithName:reason:userInfo:", v99, v97, v100));
          }
          v64 = sqlite3_bind_text(self->_vmstatement, v9 + 1, (const char *)objc_msgSend(v71, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          goto LABEL_74;
        case 0xDu:
          v72 = objc_alloc(MEMORY[0x1E0CB3940]);
          v73 = objc_msgSend(v13, "rangeValue");
          objc_msgSend(v13, "rangeValue");
          v75 = (void *)objc_msgSend(v72, "initWithFormat:", CFSTR("%lu/%lu"), v73, v74);
          v59 = sqlite3_bind_text(self->_vmstatement, v9 + 1, (const char *)objc_msgSend(v75, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_79;
        case 0xFu:
          v76 = (void *)objc_msgSend(v10, "tombstonedPropertyDescription");
          if (!v76)
            v76 = (void *)objc_msgSend(v10, "propertyDescription");
          v77 = +[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v13, v76);
          v59 = sqlite3_bind_blob(self->_vmstatement, v9 + 1, (const void *)objc_msgSend(v77, "bytes"), objc_msgSend(v77, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          objc_msgSend(v10, "setTombstonedPropertyDescription:", 0);
          goto LABEL_79;
        case 0x10u:
          v78 = objc_msgSend(v13, "_bytesPtrForStore");
          v79 = objc_msgSend(v13, "_bytesLengthForStore");
          v80 = self->_vmstatement;
          v81 = v9 + 1;
          v82 = (const void *)v78;
          v6 = v111;
          v83 = 0;
          goto LABEL_86;
        default:
          goto LABEL_99;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<FBF url=%@>"), objc_getProperty(v13, v22, 16, 1), v110);
    else
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSData len=%lu>"), objc_msgSend(v13, "length"), v110);
    v110 = (void *)v23;
    _NSCoreDataLog(7, (uint64_t)CFSTR("SQLite bind[%ld] = %@"), v24, v25, v26, v27, v28, v29, v9);
    v6 = v111;
LABEL_26:
    if (v15)
      goto LABEL_27;
    goto LABEL_38;
  }
LABEL_88:
  _execute((uint64_t)self);
  if ((*(_BYTE *)&self->_sqliteConnectionFlags & 2) != 0 && !self->_columnsToFetch)
  {
    v87 = objc_msgSend(-[NSSQLiteConnection sqlStatement](self, "sqlStatement"), "entity");
    while (v87)
    {
      v88 = v87;
      v87 = *(_QWORD *)(v87 + 168);
      if (v87 == v88)
      {
        v89 = *(void **)(v88 + 72);
        goto LABEL_94;
      }
    }
    v89 = 0;
LABEL_94:
    -[NSSQLiteConnection setColumnsToFetch:](self, v89);
  }
}

- (id)sqlStatement
{
  NSObject *queue;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2(queue);
  return self->_sqlStatement;
}

- (_QWORD)bindTempTablesForStatementIfNecessary:(_QWORD *)result
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (uint64_t)result;
    v4 = result[1];
    if (v4)
      dispatch_assert_queue_V2(v4);
    result = (_QWORD *)objc_msgSend(a2, "bindIntarrays");
    if (result)
    {
      v5 = result;
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      result = (_QWORD *)objc_msgSend(result, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v6 = result;
        v7 = *(_QWORD *)v10;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v5);
            -[NSSQLiteConnection bindTempTableForBindIntarray:](v3, *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
            v8 = (_QWORD *)((char *)v8 + 1);
          }
          while (v6 != v8);
          result = (_QWORD *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          v6 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)resetSQLStatement
{
  NSObject *v2;
  sqlite3_stmt *v3;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  v3 = *(sqlite3_stmt **)(a1 + 80);
  if (v3)
  {
    sqlite3_reset(v3);
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
  }

  *(_QWORD *)(a1 + 48) = 0;
}

- (void)releaseSQLStatement
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
      dispatch_assert_queue_V2(v2);
    -[NSSQLiteConnection _finalizeStatement](a1);
    -[NSSQLiteStatement clearCaches:](*(void **)(a1 + 48), 0);

    *(_QWORD *)(a1 + 48) = 0;
  }
}

- (void)_finalizeStatement
{
  NSObject *v2;
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
      dispatch_assert_queue_V2(v2);
    v3 = *(sqlite3_stmt **)(a1 + 80);
    if (v3)
    {
      v4 = *(sqlite3_stmt **)(a1 + 48);
      if (v4)
        v4 = (sqlite3_stmt *)*((_QWORD *)v4 + 8);
      if (v4 == v3)
      {
        sqlite3_reset(v3);
        sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 80));
      }
      else
      {
        sqlite3_finalize(v3);
      }
      *(_QWORD *)(a1 + 80) = 0;
    }
    -[NSSQLiteStatement clearCaches:](*(void **)(a1 + 48), 0);
  }
}

- (void)performAndWait:(uint64_t)a1
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  if (a1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__29;
    v12 = __Block_byref_object_dispose__29;
    v13 = 0;
    v3 = *(NSObject **)(a1 + 8);
    if (v3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __37__NSSQLiteConnection_performAndWait___block_invoke;
      v7[3] = &unk_1E1EDF8C0;
      v7[4] = a2;
      v7[5] = &v8;
      dispatch_sync(v3, v7);
    }
    else
    {
      v4 = (void *)MEMORY[0x18D76B4E4]();
      (*(void (**)(uint64_t))(a2 + 16))(a2);
      objc_autoreleasePoolPop(v4);
    }
    v5 = (void *)v9[5];
    if (v5)
    {
      v6 = v5;
      objc_exception_throw((id)v9[5]);
    }
    _Block_object_dispose(&v8, 8);
  }
}

- (void)bindTempTableForBindIntarray:(uint64_t)a1
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  sqlite3_intarray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSQLiteIntarrayTable *v16;
  const char *v17;
  NSSQLiteIntarrayTable *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
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
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  sqlite3_intarray *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    v5 = objc_msgSend(a2, "index");
    v57 = 0;
    if (v5 >= (int)objc_msgSend(*(id *)(a1 + 304), "count"))
    {
      v8 = (void *)objc_msgSend(a2, "tableName");
      objc_msgSend(v8, "UTF8String");
      v9 = sqlite3_intarray_create();
      if ((_DWORD)v9)
      {
        v48 = v9;
        v49 = *MEMORY[0x1E0C99768];
        v50 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: SQLite: error: Can't bind intarray. SQLite error code: %d"), v9);
        v45 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48), CFSTR("NSSQLiteErrorDomain"));
        v46 = v49;
        v47 = v50;
        goto LABEL_33;
      }
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
        _NSCoreDataLog(4, (uint64_t)CFSTR("Bound intarray %@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
      v16 = objc_alloc_init(NSSQLiteIntarrayTable);
      v18 = v16;
      if (v16)
      {
        objc_setProperty_nonatomic(v16, v17, v8, 16);
        v18->_intarrayTable = v57;
      }
      objc_msgSend(*(id *)(a1 + 304), "addObject:", v18);

    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 304), "objectAtIndex:", v5);
      if (v6)
        v7 = *(sqlite3_intarray **)(v6 + 8);
      else
        v7 = 0;
      v57 = v7;
    }
    v19 = (void *)objc_msgSend(a2, "value");
    v20 = sqlite3_malloc(8 * objc_msgSend(v19, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v26, "isNSNumber"))
            v27 = objc_msgSend(v26, "longLongValue");
          else
            v27 = objc_msgSend(v26, "_referenceData64");
          v28 = (v23 + i);
          v20[v28] = v27;
          if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 3)
            _NSCoreDataLog(7, (uint64_t)CFSTR("Bound intarray value %lu at %d"), v29, v30, v31, v32, v33, v34, v20[v28]);
        }
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        v23 += i;
      }
      while (v22);
    }
    v35 = sqlite3_intarray_bind();
    if (!(_DWORD)v35)
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
        _NSCoreDataLog(4, (uint64_t)CFSTR("Bound intarray values."), v36, v37, v38, v39, v40, v41, v52);
      return;
    }
    v42 = v35;
    v43 = *MEMORY[0x1E0C99768];
    v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: SQLite: error: Can't bind intarray. SQLite error code: %d"), v35);
    v45 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42), CFSTR("NSSQLiteErrorDomain"));
    v46 = v43;
    v47 = v44;
LABEL_33:
    v51 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v46, 134180, v47, v45);
    objc_exception_throw(v51);
  }
}

- (void)addVMCachedStatement:(uint64_t)a1
{
  _PFWeakReference *v4;
  _PFWeakReference *v5;

  if (a1)
  {
    v4 = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", a2);
    if (v4)
    {
      v5 = v4;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 152), a2, v4);
      v4 = v5;
    }

  }
}

- (NSSQLiteStatementCache)statementCacheForEntity:(uint64_t)a1
{
  NSObject *v4;
  NSSQLiteStatementCache *v5;

  if (!a1)
    return 0;
  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  if (!a2)
    return 0;
  v5 = (NSSQLiteStatementCache *)objc_msgSend(*(id *)(a1 + 200), "objectForKey:", a2);
  if (!v5)
  {
    v5 = -[NSSQLiteStatementCache initWithEntity:]([NSSQLiteStatementCache alloc], "initWithEntity:", a2);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 200), a2, v5);

  }
  return v5;
}

- (uint64_t)_hasTableWithName:(int)a3 isTemp:
{
  NSObject *v5;
  char v6;
  int v7;
  const __CFString *v8;
  void *v9;
  NSSQLiteStatement *v10;
  NSSQLColumn *v11;
  void *v12;
  void *v13;
  NSSQLiteStatement *v14;
  void *context;
  char v17;
  const __CFString *v18;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    if (v5)
      dispatch_assert_queue_V2(v5);
    context = (void *)MEMORY[0x18D76B4E4]();
    v6 = 0;
    v17 = 0;
    if ((*(_BYTE *)(a1 + 312) & 0x80) != 0)
      v7 = 1;
    else
      v7 = 3;
    if (a3)
      v8 = CFSTR("SQLITE_TEMP_MASTER");
    else
      v8 = CFSTR("SQLITE_MASTER");
    v18 = v8;
    while ((v6 & 1) == 0 && (v7 & 0x80000000) == 0)
    {
      -[NSSQLiteConnection connect](a1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT TBL_NAME FROM %@ WHERE TBL_NAME = '%@'"), v18, a2);
      v10 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)v9);

      v11 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("TBL_NAME"), 6);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v11, 0);

      -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
      objc_msgSend((id)a1, "execute");
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v12);

      v13 = -[NSSQLiteConnection newFetchedArray](a1);
      if (v13)
      {
        v17 = 1;

        v14 = v10;
        v6 = 1;
      }
      else
      {
        v6 = 1;
        v14 = v10;
      }
      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(_QWORD *)(a1 + 92) = 0;
      *(_QWORD *)(a1 + 100) = 0;
      *(_DWORD *)(a1 + 108) = 0;

      --v7;
    }
    objc_autoreleasePoolPop(context);
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

- (void)newFetchedArray
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _PFExternalReferenceData *v6;
  uint64_t v7;
  uint64_t v8;
  _PFExternalReferenceData *v9;
  unsigned __int8 *v10;
  sqlite3_stmt *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  _NSDataFileBackedFuture *v17;
  id v18;
  const void *v19;
  const unsigned __int8 *v20;
  CFStringRef v21;
  const void *v22;
  const unsigned __int8 *v23;
  const __CFString *v24;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFString *ValueAtIndex;
  SInt32 IntValue;
  const __CFString *v28;
  unsigned __int8 *v29;
  int v30;
  unsigned int v31;
  int v32;
  _PFExternalReferenceData *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  const void *v37;
  void *v38;
  _PFExternalReferenceData *v39;
  sqlite3_int64 *p_valuePtr;
  CFNumberType v41;
  int v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  _NSDataFileBackedFuture *v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  _PFExternalReferenceData *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _PFExternalReferenceData *v57;
  uint64_t v58;
  uint64_t v59;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  _PFExternalReferenceData *v66;
  void *v67;
  double valuePtr;
  sqlite3_int64 v69;

  if (!a1)
    return 0;
  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  v3 = (void *)MEMORY[0x18D76B4E4]();
  v4 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if ((*(_BYTE *)(a1 + 312) & 2) != 0)
  {
    v6 = (_PFExternalReferenceData *)v4;
    v65 = v3;
    v67 = *(void **)(a1 + 56);
    v7 = objc_msgSend(v67, "count");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    if (!v7)
    {
LABEL_61:
      ++*(_DWORD *)(a1 + 88);
      _execute(a1);
      v3 = v65;
      goto LABEL_62;
    }
    v8 = 0;
    v66 = v6;
    while (1)
    {
      v9 = v6;
      if (sqlite3_column_type(*(sqlite3_stmt **)(a1 + 80), v8) != 5)
        break;
LABEL_38:
      objc_msgSend(v5, "addObject:", v9);

      if (v7 == ++v8)
        goto LABEL_61;
    }
    v10 = (unsigned __int8 *)objc_msgSend(v67, "objectAtIndex:", v8);
    v11 = *(sqlite3_stmt **)(a1 + 80);
    v12 = *(NSObject **)(a1 + 8);
    if (v12)
      dispatch_assert_queue_V2(v12);
    v13 = objc_msgSend(v10, "sqlType");
    v69 = 0;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
    v9 = 0;
    if (sqlite3_column_type(v11, v8) != 5)
    {
      switch(v13)
      {
        case 0:
          if (v10)
          {
            v42 = v10[24];
            if (v42 == 7 || v42 == 4)
              goto LABEL_33;
          }
          goto LABEL_65;
        case 1:
          LODWORD(valuePtr) = sqlite3_column_int(v11, v8);
          p_valuePtr = (sqlite3_int64 *)&valuePtr;
          v41 = kCFNumberIntType;
          goto LABEL_35;
        case 2:
        case 3:
LABEL_33:
          v69 = sqlite3_column_int64(v11, v8);
          p_valuePtr = &v69;
          v41 = kCFNumberLongLongType;
          goto LABEL_35;
        case 4:
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_text(v11, v8));
          v39 = (_PFExternalReferenceData *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithString:", v38);
          goto LABEL_28;
        case 5:
        case 6:
        case 9:
          v16 = sqlite3_column_text(v11, v8);
          v17 = (_NSDataFileBackedFuture *)CFStringCreateWithCString(0, (const char *)v16, 0x8000100u);
          goto LABEL_36;
        case 7:
          valuePtr = sqlite3_column_double(v11, v8);
          p_valuePtr = (sqlite3_int64 *)&valuePtr;
          v41 = kCFNumberDoubleType;
LABEL_35:
          v17 = (_NSDataFileBackedFuture *)CFNumberCreate(0, v41, p_valuePtr);
          goto LABEL_36;
        case 8:
          v43 = sqlite3_column_double(v11, v8);
          v17 = (_NSDataFileBackedFuture *)CFDateCreate(0, v43);
          goto LABEL_36;
        case 10:
        case 17:
          v18 = objc_alloc(MEMORY[0x1E0C99D50]);
          v19 = sqlite3_column_blob(v11, v8);
          v17 = (_NSDataFileBackedFuture *)objc_msgSend(v18, "initWithBytes:length:", v19, sqlite3_column_bytes(v11, v8));
          goto LABEL_36;
        case 11:
          if (sqlite3_column_bytes(v11, v8) != 16)
            goto LABEL_41;
          v17 = (_NSDataFileBackedFuture *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", sqlite3_column_blob(v11, v8));
          goto LABEL_36;
        case 12:
          v20 = sqlite3_column_text(v11, v8);
          v21 = CFStringCreateWithCString(0, (const char *)v20, 0x8000100u);
          v9 = (_PFExternalReferenceData *)(id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
          v22 = v21;
          goto LABEL_19;
        case 13:
          v23 = sqlite3_column_text(v11, v8);
          v24 = CFStringCreateWithCString(0, (const char *)v23, 0x8000100u);
          ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v24, CFSTR("/"));
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
          IntValue = CFStringGetIntValue(ValueAtIndex);
          v28 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
          v9 = (_PFExternalReferenceData *)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", IntValue, CFStringGetIntValue(v28));
          CFRelease(v24);
          v22 = ArrayBySeparatingStrings;
LABEL_19:
          CFRelease(v22);
          break;
        case 15:
          v36 = objc_alloc(MEMORY[0x1E0C99D50]);
          v37 = sqlite3_column_blob(v11, v8);
          v38 = (void *)objc_msgSend(v36, "initWithBytes:length:", v37, sqlite3_column_bytes(v11, v8));
          v39 = (_PFExternalReferenceData *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v38, (void *)objc_msgSend(v10, "propertyDescription"));
LABEL_28:
          v9 = v39;

          break;
        case 16:
          v29 = (unsigned __int8 *)sqlite3_column_blob(v11, v8);
          v30 = sqlite3_column_bytes(v11, v8);
          if (v30 >= 1)
          {
            v31 = v30;
            v32 = *v29;
            if (v32 == 3)
            {
              v44 = objc_msgSend(*(id *)(a1 + 16), "fileBackedFuturesDirectory");
              v45 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, v31);
              v46 = [_NSDataFileBackedFuture alloc];
              v17 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:](v46, "initWithStoreMetadata:directory:", v45, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v44, 1));
LABEL_36:
              v9 = (_PFExternalReferenceData *)v17;
              break;
            }
            if (v32 == 1)
            {
              v33 = [_PFExternalReferenceData alloc];
              v34 = *(_QWORD *)(a1 + 16);
              if (v34)
                v35 = (*(_DWORD *)(v34 + 192) >> 2) & 7;
              else
                v35 = 0;
              v17 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:](v33, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:", v29, v31, 0, 0, v35);
              goto LABEL_36;
            }
            v64 = objc_msgSend(v14, "stringWithFileSystemRepresentation:length:", v29 + 1, strnlen((const char *)v29 + 1, (v30 - 1)));
            v47 = (void *)objc_msgSend(*(id *)(a1 + 16), "externalDataReferencesDirectory");
            v48 = *(_QWORD **)(a1 + 16);
            if (v48)
            {
              if (!v48[20])
                objc_msgSend(*(id *)(a1 + 16), "externalDataReferencesDirectory");
              v48 = (_QWORD *)v48[21];
            }
            v49 = objc_msgSend(v47, "stringByAppendingPathComponent:", v64);
            v50 = v48;
            v51 = v49;
            v52 = objc_msgSend(v50, "stringByAppendingPathComponent:", v64);
            v62 = v52;
            if (v15 && !objc_msgSend(v14, "fileExistsAtPath:", v51))
            {
              v9 = 0;
            }
            else
            {
              v53 = [_PFExternalReferenceData alloc];
              v54 = *(_QWORD *)(a1 + 16);
              if (v54)
                v55 = (*(_DWORD *)(v54 + 192) >> 2) & 7;
              else
                v55 = 0;
              v9 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:](v53, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:", v29, v31, v51, v52, v55, v52);
              if (!v15)
                break;
            }
            if ((objc_msgSend(v14, "fileExistsAtPath:", v51, v62) & 1) == 0)
            {

              v56 = +[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, v64, *(void **)(a1 + 16));
              v57 = [_PFExternalReferenceData alloc];
              v58 = *(_QWORD *)(a1 + 16);
              if (v58)
                v59 = (*(_DWORD *)(v58 + 192) >> 2) & 7;
              else
                v59 = 0;
              v17 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:ubiquitousLocation:](v57, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:ubiquitousLocation:", v29, v31, v51, v63, v59, v56);
              goto LABEL_36;
            }
            break;
          }
LABEL_41:
          v9 = 0;
          break;
        default:
LABEL_65:
          v61 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 256, (uint64_t)CFSTR("fetching not implemented for this value type"), 0);
          objc_exception_throw(v61);
      }
    }
    v6 = v66;
    goto LABEL_38;
  }
  v5 = 0;
LABEL_62:
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (uint64_t)_insertTransactionForRequestContext:(void *)a3 andStrings:
{
  id v6;
  void *v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  void *v10;
  void *v11;
  _WORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSSQLiteStatementCache *v25;
  uint64_t v26;
  id v27;
  id v29;
  const void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("TRANSACTION"));
  v8 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
  if (!v8)
  {
    v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("unable to generate primary keys for transaction"), 0);
    objc_exception_throw(v29);
  }
  v9 = v8;
  v31 = v6;
  v32 = a1;
  -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
  if (a2)
    v10 = *(void **)(a2 + 32);
  else
    v10 = 0;
  if (objc_msgSend((id)objc_msgSend(v10, "_queryGenerationToken"), "_isEnabled")
    && (!a2 ? (v11 = 0) : (v11 = *(void **)(a2 + 32)),
        (v12 = -[_NSQueryGenerationToken _generationalComponentForStore:](objc_msgSend(v11, "_queryGenerationToken"), *(id *)(a1 + 16))) == 0? (v13 = 0): (v13 = *((_QWORD *)v12 + 3)), objc_opt_class(), (objc_opt_isKindOfClass() & (v13 != 0)) == 1))
  {
    v14 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(v13 + 8), 48);
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(a3, "valueForKey:", CFSTR("AUTHORTS"));
  v35 = objc_msgSend(a3, "valueForKey:", CFSTR("BUNDLEIDTS"));
  v34 = objc_msgSend(a3, "valueForKey:", CFSTR("CONTEXTNAMETS"));
  v30 = v7;
  v33 = objc_msgSend(a3, "valueForKey:", CFSTR("PROCESSIDTS"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = (void *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "index");
        v22 = (void *)v15;
        v23 = v9;
        switch(v21)
        {
          case 0:
            goto LABEL_25;
          case 3:
            goto LABEL_24;
          case 4:
            v22 = (void *)v35;
            goto LABEL_24;
          case 5:
            v22 = (void *)v34;
            goto LABEL_24;
          case 6:
            v22 = (void *)v33;
LABEL_24:
            v23 = objc_msgSend(v22, "longLongValue", v9);
LABEL_25:
            objc_msgSend(v20, "setInt64:", v23);
            break;
          case 11:
            if (v14)
              objc_msgSend(v20, "setValue:", v14);
            break;
          case 12:
            v24 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v9);
            objc_msgSend(v20, "setValue:", objc_msgSend(v24, "numberWithDouble:"));
            break;
          default:
            continue;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v17);
  }
  objc_msgSend((id)v32, "execute");
  if (!*(_QWORD *)(v32 + 80))
  {
    v25 = -[NSSQLiteConnection statementCacheForEntity:](v32, v30);
    -[NSSQLiteStatementCache cacheInsertStatement:](v25, 0);
  }
  v26 = (int)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_last_insert_rowid(*(sqlite3 **)(v32 + 72))), "intValue");
  -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v32);
  -[NSSQLiteConnection resetSQLStatement](v32);
  objc_msgSend(v31, "drain");
  v27 = 0;
  return v26;
}

- (void)insertChanges:(uint64_t)a3 type:(sqlite3_int64)a4 transactionID:(uint64_t)a5 context:
{
  NSObject *v6;
  void *v7;
  sqlite3_int64 v8;
  uint64_t v9;
  uint64_t v10;
  sqlite3_int64 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  sqlite3_int64 v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t i;
  uint64_t v43;
  NSSQLiteStatementCache *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  char v58;
  void *context;
  uint64_t v60;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = *(NSObject **)(a1 + 8);
  if (v6)
    dispatch_assert_queue_V2(v6);
  if (a3 == 2)
    v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  else
    v51 = 0;
  v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "valueForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
  if (objc_msgSend(v7, "isNSDictionary"))
    v55 = objc_msgSend((id)objc_msgSend(v7, "valueForKey:", CFSTR("NSPersistentHistoryUseContextObjectsForDeletes")), "BOOLValue");
  else
    v55 = 0;
  v48 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v56 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
  v8 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v56, objc_msgSend(a2, "count"));
  if (!v8)
  {
    v46 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("unable to generate primary keys"), 0);
    objc_exception_throw(v46);
  }
  v9 = objc_msgSend(a2, "count");
  if (a5)
    v49 = *(void **)(a5 + 32);
  else
    v49 = 0;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v10)
  {
    v11 = v8 - v9;
    v52 = *(_QWORD *)v73;
    v53 = v10;
    v63 = a5;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v73 != v52)
          objc_enumerationMutation(a2);
        v64 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v60);
        context = (void *)MEMORY[0x18D76B4E4]();
        if (!v64 || (*(_BYTE *)(v64 + 16) & 2) != 0)
        {
          v13 = 0;
        }
        else
        {
          v12 = objc_msgSend(*(id *)(*(_QWORD *)(v64 + 40) + 16), "_storeInfo1");
          v13 = v12;
          if (v12)
          {
            v58 = 0;
            v65 = *(unsigned int *)(v12 + 184);
            goto LABEL_23;
          }
        }
        v65 = 0;
        v58 = 1;
LABEL_23:
        if (a3 == 2)
        {
          v62 = (id)objc_msgSend(v51, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v65));
          if (!v62)
          {
            v62 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (_QWORD *)v13);
            if ((v58 & 1) != 0)
              v14 = 0;
            else
              v14 = *(unsigned int *)(v13 + 184);
            objc_msgSend(v51, "setObject:forKey:", v62, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14));

          }
          if (objc_msgSend(v62, "count"))
            v15 = v55;
          else
            v15 = 0;
          if (v15 == 1)
          {
            v16 = (void *)objc_msgSend(v49, "objectRegisteredForID:", objc_msgSend((id)v64, "objectID"));
            if (objc_msgSend(v16, "isDeleted"))
              v17 = v16;
            else
              v17 = 0;
            goto LABEL_37;
          }
        }
        else
        {
          v62 = 0;
        }
        v17 = 0;
LABEL_37:
        -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v56);
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v18 = (void *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        v57 = v13;
        ++v11;
        if (!v19)
          goto LABEL_87;
        v20 = *(_QWORD *)v69;
        v21 = (void *)v64;
        if (v55)
          v21 = v17;
        v54 = v21;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v69 != v20)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v22);
            v24 = (void *)MEMORY[0x18D76B4E4]();
            if (!objc_msgSend(v23, "index"))
            {
              v25 = objc_msgSend(v23, "sqlType");
              v26 = v11;
              if (v25 == 2)
              {
LABEL_50:
                objc_msgSend(v23, "setInt64:", v26);
                goto LABEL_54;
              }
            }
            if (objc_msgSend(v23, "index") != 1 && objc_msgSend(v23, "index") != 2)
            {
              if (objc_msgSend(v23, "index") == 3)
              {
                v27 = objc_msgSend(v23, "sqlType");
                v26 = a4;
                if (v27 == 2)
                  goto LABEL_50;
              }
              if (objc_msgSend(v23, "index", v26) == 4)
              {
                v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
LABEL_53:
                objc_msgSend(v23, "setValue:", v28);
                goto LABEL_54;
              }
              if (objc_msgSend(v23, "index") == 5)
              {
                if (a3 == 1)
                {
                  v29 = v63;
                  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
                  if (v64)
                    v31 = objc_msgSend(*(id *)(*(_QWORD *)(v64 + 40) + 16), "_referenceData64");
                  else
                    v31 = 0;
                  v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("%u-%lld"), v65, v31);
                  if (v63)
                    v29 = objc_msgSend(*(id *)(v63 + 144), "objectForKey:", v32);

                  objc_msgSend(v23, "setValue:", v29);
                }
              }
              else
              {
                if (objc_msgSend(v23, "index") == 6)
                {
                  v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v65);
                  goto LABEL_53;
                }
                if (objc_msgSend(v23, "index") == 7)
                {
                  v33 = (void *)MEMORY[0x1E0CB37E8];
                  if (v64)
                    v34 = objc_msgSend(*(id *)(*(_QWORD *)(v64 + 40) + 16), "_referenceData64");
                  else
                    v34 = 0;
                  v28 = objc_msgSend(v33, "numberWithLongLong:", v34);
                  goto LABEL_53;
                }
                v35 = objc_msgSend((id)objc_msgSend(v23, "propertyDescription"), "name");
                if (a3 == 2)
                {
                  v36 = (void *)v35;
                  if (objc_msgSend(v62, "count"))
                  {
                    if (objc_msgSend(v36, "containsString:", CFSTR("TOMBSTONE")))
                    {
                      v37 = objc_msgSend((id)objc_msgSend(v36, "stringByReplacingOccurrencesOfString:withString:", CFSTR("TOMBSTONE"), &stru_1E1EE23F0), "intValue");
                      if (v37 < (int)objc_msgSend(v62, "count"))
                      {
                        v38 = (void *)objc_msgSend(v62, "objectAtIndexedSubscript:", v37);
                        if ((v58 & 1) != 0)
                          v39 = 0;
                        else
                          v39 = (void *)objc_msgSend(*(id *)(v57 + 40), "objectForKey:", v38);
                        objc_msgSend(v23, "setSQLType:", objc_msgSend(v39, "sqlType"));
                        if (objc_msgSend(v39, "sqlType") == 15)
                          objc_msgSend(v23, "setTombstonedPropertyDescription:", objc_msgSend(v39, "propertyDescription"));
                        v40 = (void *)objc_msgSend(v54, "valueForKey:", v38);
                        if (v40)
                        {
                          if (objc_msgSend((id)objc_msgSend(v39, "propertyDescription"), "superCompositeAttribute"))
                          {
                            v41 = (void *)objc_msgSend(v38, "componentsSeparatedByString:", CFSTR("."));
                            for (i = 1; objc_msgSend(v41, "count") > i; ++i)
                              v40 = (void *)objc_msgSend(v40, "objectForKey:", objc_msgSend(v41, "objectAtIndex:", i));
                          }
                          objc_msgSend(v23, "setValue:", v40);
                        }
                      }
                    }
                  }
                }
              }
            }
LABEL_54:
            objc_autoreleasePoolPop(v24);
            ++v22;
          }
          while (v22 != v19);
          v43 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
          v19 = v43;
        }
        while (v43);
LABEL_87:
        objc_msgSend((id)a1, "execute");
        if (!*(_QWORD *)(a1 + 80))
        {
          v44 = -[NSSQLiteConnection statementCacheForEntity:](a1, v56);
          -[NSSQLiteStatementCache cacheInsertStatement:](v44, 0);
        }
        -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
        -[NSSQLiteConnection resetSQLStatement](a1);
        objc_autoreleasePoolPop(context);
        ++v60;
      }
      while (v60 != v53);
      v45 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      v53 = v45;
    }
    while (v45);
  }
  objc_msgSend(v48, "drain");
  v47 = 0;

}

- (uint64_t)_clearBindVariablesForInsertedRow
{
  NSObject *v2;
  void *v3;
  void *v4;
  const __CFArray *v5;
  int v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "entity");
  v4 = (void *)objc_msgSend(v3, "attributeColumns");
  v5 = (const __CFArray *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
  v6 = objc_msgSend((id)objc_msgSend(v3, "foreignEntityKeyColumns"), "count");
  v21 = 0u;
  v22 = 0u;
  v7 = v6 + objc_msgSend((id)objc_msgSend(v3, "foreignOrderKeyColumns"), "count") + 3;
  v23 = 0u;
  v24 = 0u;
  v8 = (void *)objc_msgSend(v3, "foreignKeyColumns");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v7 += objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12++), "toOneRelationship"), "isConstrained") ^ 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v10);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (result)
  {
    v14 = result;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16), "isConstrained") & 1) == 0)
          objc_msgSend((id)CFArrayGetValueAtIndex(v5, v7++), "setValue:", 0);
        ++v16;
      }
      while (v14 != v16);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v14 = result;
    }
    while (result);
  }
  return result;
}

- (sqlite3_int64)generatePrimaryKeysForEntity:(unsigned int)a3 batch:
{
  NSObject *v6;
  uint64_t v7;
  sqlite3_stmt *v8;
  sqlite3_stmt **v9;
  __objc2_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  const char *v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  sqlite3_int64 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  sqlite3_stmt **v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  const char *v45;
  id v46;
  int v47;
  uint64_t v48;
  sqlite3_int64 v49;
  sqlite3_int64 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  char *pzTail;

  if (!a1)
    return 0;
  v6 = *(NSObject **)(a1 + 8);
  if (v6)
    dispatch_assert_queue_V2(v6);
  if (!*(_BYTE *)(a1 + 40))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("primary keys must be generated within a transaction"), 0));
  if (a2)
    v7 = *(unsigned int *)(a2 + 184);
  else
    v7 = 0;
  v9 = (sqlite3_stmt **)(a1 + 112);
  v8 = *(sqlite3_stmt **)(a1 + 112);
  v10 = &OBJC_METACLASS___NSSQLStoreRequestContext;
  if (!v8)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_ENT"));
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
    {
      if (*(_BYTE *)(a1 + 42))
        v18 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
      else
        v18 = CFSTR("%@");
      _NSCoreDataLog(6, (uint64_t)v18, v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
    pzTail = 0;
    v19 = (const char *)objc_msgSend(v11, "UTF8String");
    v20 = v11;
    -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
    v21 = strlen(v19);
    v22 = sqlite3_prepare_v3(*(sqlite3 **)(a1 + 72), v19, v21, 1u, (sqlite3_stmt **)(a1 + 112), (const char **)&pzTail);
    if ((_DWORD)v22)
    {
      v73 = v22;
      v74 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      {
        if (*(_BYTE *)(a1 + 42))
          v81 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m");
        else
          v81 = CFSTR("(%d) %s");
        _NSCoreDataLog(1, (uint64_t)v81, v75, v76, v77, v78, v79, v80, v73);
      }
      *v9 = 0;
      v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v74);
      v68 = *MEMORY[0x1E0C99768];
      v82 = (void *)MEMORY[0x1E0C99D80];
      v83 = (void *)MEMORY[0x1E0CB37E8];
      v84 = v73;
      goto LABEL_55;
    }
    v8 = *v9;
  }
  sqlite3_bind_int(v8, 1, v7);
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 2)
    _NSCoreDataLog(4, (uint64_t)CFSTR("getting max pk for entityID = %u"), v23, v24, v25, v26, v27, v28, v7);
  v29 = sqlite3_step(*v9);
  if ((_DWORD)v29 == 100)
  {
    v31 = sqlite3_column_int64(*v9, 0);
  }
  else
  {
    v30 = v29;
    if ((_DWORD)v29 != 101)
    {
      sqlite3_reset(*v9);
      sqlite3_clear_bindings(*v9);
      v72 = *MEMORY[0x1E0C99768];
      v64 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30), CFSTR("NSSQLiteErrorDomain"));
      v66 = CFSTR("Fetching maximum primary key failed");
      v65 = v72;
      goto LABEL_57;
    }
    v31 = -[NSSQLiteConnection fetchMaxPrimaryKeyForEntity:](a1, (void *)a2);
    v32 = (void *)MEMORY[0x1E0CB3940];
    v33 = objc_msgSend((id)a2, "name");
    if (a2)
    {
      v34 = *(_QWORD *)(a2 + 160);
      if (v34)
        v34 = *(unsigned int *)(v34 + 184);
    }
    else
    {
      v34 = 0;
    }
    -[NSSQLiteConnection _executeSQLString:](a1, (void *)objc_msgSend(v32, "stringWithFormat:", CFSTR("INSERT INTO %@(%@, %@, %@, %@) VALUES(%u, '%@', %u, %qd)"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_ENT"), CFSTR("Z_NAME"), CFSTR("Z_SUPER"), CFSTR("Z_MAX"), v7, v33, v34, v31));
    v10 = &OBJC_METACLASS___NSSQLStoreRequestContext;
  }
  v35 = sqlite3_reset(*v9);
  sqlite3_clear_bindings(*v9);
  if ((_DWORD)v35)
  {
    v60 = (void *)MEMORY[0x1E0CB3940];
LABEL_54:
    v67 = objc_msgSend(v60, "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
    v68 = *MEMORY[0x1E0C99768];
    v82 = (void *)MEMORY[0x1E0C99D80];
    v83 = (void *)MEMORY[0x1E0CB37E8];
    v84 = v35;
LABEL_55:
    v70 = objc_msgSend(v83, "numberWithInt:", v84);
    v71 = v82;
    goto LABEL_56;
  }
  v36 = (sqlite3_stmt **)(a1 + 120);
  if (!*(_QWORD *)(a1 + 120))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = ? WHERE %@ = ? AND %@ = ?"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), CFSTR("Z_ENT"), CFSTR("Z_MAX"));
    if ((int)objc_msgSend(&v10[73], "debugDefault") >= 1)
    {
      if (*(_BYTE *)(a1 + 42))
        v44 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
      else
        v44 = CFSTR("%@");
      _NSCoreDataLog(6, (uint64_t)v44, v38, v39, v40, v41, v42, v43, (uint64_t)v37);
    }
    pzTail = 0;
    v45 = (const char *)objc_msgSend(v37, "UTF8String");
    v46 = v37;
    -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
    v47 = strlen(v45);
    v48 = sqlite3_prepare_v3(*(sqlite3 **)(a1 + 72), v45, v47, 1u, (sqlite3_stmt **)(a1 + 120), (const char **)&pzTail);
    if ((_DWORD)v48)
    {
      v35 = v48;
      *(_QWORD *)(a1 + 120) = 0;
      v60 = (void *)MEMORY[0x1E0CB3940];
      goto LABEL_54;
    }
  }
  v49 = v31;
  if (v31 == -1)
    v49 = -[NSSQLiteConnection fetchMaxPrimaryKeyForEntity:](a1, (void *)a2);
  v50 = v49 + a3;
  sqlite3_bind_int64(*v36, 1, v50);
  sqlite3_bind_int(*v36, 2, v7);
  sqlite3_bind_int64(*v36, 3, v31);
  if ((int)objc_msgSend(&v10[73], "debugDefault") >= 2)
    _NSCoreDataLog(4, (uint64_t)CFSTR("updating max pk for entityID = %u with old = %qd and new = %qd"), v51, v52, v53, v54, v55, v56, v7);
  v57 = sqlite3_step(*v36);
  v58 = sqlite3_reset(*v36);
  sqlite3_clear_bindings(*v36);
  if ((_DWORD)v57 != 101)
  {
    v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
    v62 = *MEMORY[0x1E0C99768];
    v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating max pk failed: %@"), v61);
    v64 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v57), CFSTR("NSSQLiteErrorDomain"));
    v65 = v62;
    v66 = (const __CFString *)v63;
    goto LABEL_57;
  }
  if ((_DWORD)v58)
  {
    v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
    v68 = *MEMORY[0x1E0C99768];
    v69 = (void *)MEMORY[0x1E0C99D80];
    v70 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58);
    v71 = v69;
LABEL_56:
    v64 = (void *)objc_msgSend(v71, "dictionaryWithObject:forKey:", v70, CFSTR("NSSQLiteErrorDomain"));
    v65 = v68;
    v66 = (const __CFString *)v67;
LABEL_57:
    v85 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v65, 134030, (uint64_t)v66, v64);
    objc_exception_throw(v85);
  }
  return v50;
}

void __37__NSSQLiteConnection_performAndWait___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)connect
{
  NSObject *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  const __CFString *v29;
  int v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  __CFString *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  sqlite3 **v40;
  uint64_t v41;
  sqlite3 *v42;
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
  NSObject *v57;
  int v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  void *v69;
  NSSQLiteStatement *v70;
  NSSQLiteStatement *v71;
  void *v72;
  uint64_t v73;
  NSSQLiteStatement *v74;
  NSSQLiteStatement *v75;
  __CFString *v76;
  void *v77;
  NSSQLiteStatement *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSSQLiteStatement *v90;
  NSSQLiteStatement *PrimaryKeyTable;
  void *v92;
  uint64_t v93;
  uint64_t j;
  void *v95;
  NSSQLiteStatement *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  __int128 v105;
  uint64_t k;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t m;
  const __CFString *v125;
  uint64_t v126;
  void *v127;
  const __CFString *v128;
  uint64_t v129;
  void *v130;
  const __CFString *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  char f_flags;
  BOOL v137;
  int v138;
  unsigned int v139;
  int v140;
  uint64_t v141;
  void *v142;
  id v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const __CFString *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  id v157;
  uint64_t v158;
  void *v159;
  id v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  id v166;
  uint64_t v167;
  __int128 v168;
  void *v169;
  sqlite3 **v170;
  _BOOL4 v171;
  void *v172;
  NSSQLColumn *v173;
  NSSQLiteStatement *v174;
  id obj;
  uint64_t v176;
  int v177;
  char v178;
  uint64_t v179;
  char *v180;
  char v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  statfs v194;
  _BYTE v195[128];
  uint8_t v196[128];
  const __CFString *v197;
  _QWORD v198[3];

  v198[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
      dispatch_assert_queue_V2(v2);
    if (!*(_QWORD *)(a1 + 24))
    {
      *(_QWORD *)(a1 + 24) = (id)objc_msgSend(*(id *)(a1 + 16), "URL");

    }
    if (!*(_QWORD *)(a1 + 32))
      *(_QWORD *)(a1 + 32) = (id)objc_msgSend(*(id *)(a1 + 24), "path");
    if (!*(_QWORD *)(a1 + 72) && (*(_BYTE *)(a1 + 312) & 0x80) == 0)
    {
      v170 = (sqlite3 **)(a1 + 72);
      v169 = (void *)objc_msgSend(*(id *)(a1 + 16), "options");
      v3 = (const char *)objc_msgSend(*(id *)(a1 + 32), "fileSystemRepresentation");
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 16);
      if (!v5 || (*(_BYTE *)(v5 + 193) & 0x40) == 0)
        goto LABEL_12;
      if (!strcmp(v3, "/dev/null"))
      {
        v6 = 1;
        v4 = ":memory:";
      }
      else
      {
        v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "stringByReplacingOccurrencesOfString:withString:", CFSTR("/dev/null/"), &stru_1E1EE23F0);
        if (!v7 || (v8 = (uint64_t)v7, !objc_msgSend(v7, "length")))
        {
LABEL_12:
          v6 = 0;
          goto LABEL_18;
        }
        v167 = v8;
        v4 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("file:%@?mode=memory&cache=shared")), "fileSystemRepresentation");
        v6 = 1;
      }
LABEL_18:
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault"))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Connecting to sqlite database file at \"%@\"), v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 32));
      v180 = (char *)v4;
      if ((v6 & 1) != 0)
      {
        v15 = 0;
      }
      else
      {
        memset(&v194, 0, 144);
        v16 = stat(v4, (stat *)&v194);
        v15 = *(_QWORD *)&v194.f_mntonname[8];
        if (v16)
          v15 = 0;
      }
      if (v15)
        v17 = v6;
      else
        v17 = 1;
      v178 = v17;
      if (objc_msgSend(*(id *)(a1 + 16), "isReadOnly"))
        v18 = 1;
      else
        v18 = 6;
      v177 = v18;
      v19 = (void *)objc_msgSend(v169, "objectForKey:");
      if (v19)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v19, "count"));
        v184 = 0u;
        v185 = 0u;
        v182 = 0u;
        v183 = 0u;
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v183;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v183 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * i);
              if (v24 != (void *)NSKeyValueCoding_NullValue)
                objc_msgSend(v20, "setObject:forKey:", objc_msgSend(v19, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * i)), objc_msgSend(v24, "lowercaseString"));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
          }
          while (v21);
        }
        objc_msgSend(*(id *)(a1 + 160), "setDictionary:", v20);

      }
      objc_msgSend(*(id *)(a1 + 160), "removeObjectForKey:", CFSTR("recursive_triggers"));
      if ((v6 & 1) != 0)
      {
        v25 = *(_DWORD *)(a1 + 312) & 0xFFFFFFF3;
      }
      else
      {
        memset(&v194, 0, 512);
        if (!statfs(v180, &v194))
        {
          f_flags = v194.f_flags;
          if ((v194.f_flags & 0x1000) != 0)
          {
            v139 = *(_DWORD *)(a1 + 312) & 0xFFFFFFF3 | 4;
          }
          else
          {
            v137 = *(_DWORD *)v194.f_fstypename == 1684170103 && *(_DWORD *)&v194.f_fstypename[3] == 7758180;
            v138 = *(_DWORD *)(a1 + 312);
            if (v137)
              v139 = v138 | 0xC;
            else
              v139 = v138 & 0xFFFFFFF3 | 8;
          }
          *(_DWORD *)(a1 + 312) = v139;
          if ((f_flags & 1) != 0)
            v140 = 1;
          else
            v140 = v177;
          v177 = v140;
LABEL_46:
          v26 = objc_msgSend(*(id *)(a1 + 160), "objectForKey:", CFSTR("lock_proxy_file"));
          if (v26 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
          {
            v27 = *(_DWORD *)(a1 + 312);
          }
          else
          {
            v27 = *(_DWORD *)(a1 + 312);
            if (v26 || BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
            {
              v177 |= 0x20u;
              v27 |= 0x10u;
              *(_DWORD *)(a1 + 312) = v27;
            }
          }
          *(_DWORD *)(a1 + 312) = v27 & 0xFFFFFFBF;
          v28 = objc_msgSend(*(id *)(a1 + 160), "objectForKey:", CFSTR("journal_mode"));
          if ((_BYTE)dword_1ECD8DE18)
            v29 = CFSTR("wal");
          else
            v29 = 0;
          if (v28)
            v29 = (const __CFString *)v28;
          v30 = *(_DWORD *)(a1 + 312);
          if ((v30 & 8) != 0)
            v31 = CFSTR("delete");
          else
            v31 = v29;
          if ((v30 & 0x10) != 0)
            v32 = v29;
          else
            v32 = v31;
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
          {
            v33 = CFSTR("delete");
          }
          else
          {
            v33 = v32;
          }
          if (v6)
            v34 = CFSTR("memory");
          else
            v34 = (__CFString *)v33;
          if (v34 && v34 != (__CFString *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
          {
            objc_msgSend(*(id *)(a1 + 160), "setObject:forKey:", v34, CFSTR("journal_mode"));
            *(_DWORD *)(a1 + 312) = *(_DWORD *)(a1 + 312) & 0xFFFFFFBF | ((-[__CFString compare:options:](v34, "compare:options:", CFSTR("wal"), 1) == 0) << 6);
          }
          if ((v6 & 1) == 0)
          {
            v35 = *(_QWORD *)(a1 + 16);
            if (v35)
            {
              v35 = (((unint64_t)*(unsigned int *)(v35 + 192) >> 2) & 7) - 1;
              if (v35 > 6)
                LODWORD(v35) = 0;
              else
                LODWORD(v35) = dword_18A50A19C[v35];
            }
            v177 |= v35;
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 24), "query"), "length"))
          {
            v36 = *(void **)(a1 + 24);
            objc_opt_self();
            v180 = (char *)objc_msgSend((id)objc_msgSend(v36, "absoluteString"), "fileSystemRepresentation");
          }
          v37 = *(_QWORD *)(a1 + 16);
          if (v37)
            v38 = *(void **)(v37 + 240);
          else
            v38 = 0;
          v39 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v180, v38, v170, v177, 0);
          if ((_DWORD)v39)
          {
            v42 = *v170;
            if (*v170)
            {
LABEL_268:
              v144 = sqlite3_errmsg(v42);
LABEL_269:
              if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
              {
                if (*(_BYTE *)(a1 + 42))
                  v151 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m");
                else
                  v151 = CFSTR("(%d) %s");
                _NSCoreDataLog(1, (uint64_t)v151, v145, v146, v147, v148, v149, v150, v39);
              }
              if (*v170)
              {
                sqlite3_close_v2(*v170);
                *v170 = 0;
              }
              if ((_DWORD)v39 == 26)
              {
                v152 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File at path does not appear to be a SQLite database: %@"), *(_QWORD *)(a1 + 32));
                v153 = (void *)MEMORY[0x1E0C99D80];
                v154 = *(_QWORD *)(a1 + 32);
                v155 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 26);
                v156 = (void *)objc_msgSend(v153, "dictionaryWithObjectsAndKeys:", v154, *MEMORY[0x1E0CB2AA0], v155, CFSTR("NSSQLiteErrorDomain"), 0);
                v157 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 259, v152, v156);
                objc_exception_throw(v157);
              }
              v161 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v144);
              v162 = (void *)MEMORY[0x1E0C99D80];
              v163 = *(_QWORD *)(a1 + 32);
              v164 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
              v165 = (void *)objc_msgSend(v162, "dictionaryWithObjectsAndKeys:", v163, *MEMORY[0x1E0CB2AA0], v164, CFSTR("NSSQLiteErrorDomain"), 0);
              v166 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 256, v161, v165);
              objc_exception_throw(v166);
            }
          }
          else
          {
            v40 = (sqlite3 **)(a1 + 72);
            if ((*(_BYTE *)(a1 + 313) & 8) != 0)
            {
              v167 = 0;
              sqlite3_db_config(*v170, 1001);
              v40 = (sqlite3 **)(a1 + 72);
            }
            if ((v6 & 1) != 0 || (v41 = *(_QWORD *)(a1 + 16)) != 0 && *(_QWORD *)(v41 + 240))
            {
              v39 = 0;
            }
            else
            {
              if (readMagicWordFromDBHandle(*v40))
                v39 = 26;
              else
                v39 = 0;
              v40 = (sqlite3 **)(a1 + 72);
            }
            v42 = *v40;
            if (*v40 && !(_DWORD)v39)
            {
              if (*(_QWORD *)(a1 + 328))
              {
                v167 = 1;
                v43 = sqlite3_db_config(v42, 1006);
                if ((_DWORD)v43)
                  _NSCoreDataLog(1, (uint64_t)CFSTR("sqlite3_db_config for SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE failed (_qGTC): %d"), v44, v45, v46, v47, v48, v49, v43);
              }
              if (objc_msgSend((id)objc_msgSend(v169, "objectForKey:", CFSTR("NSPersistentStoreServiceConfigurationOptionKey")), "intValue"))
              {
                v167 = 0;
                v50 = sqlite3_db_config(*v170, 1001);
                if ((_DWORD)v50)
                  _NSCoreDataLog(1, (uint64_t)CFSTR("sqlite3_db_config for SQLITE_DBCONFIG_LOOKASIDE failed: %d"), v51, v52, v53, v54, v55, v56, v50);
                -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("pragma cache_spill = 64"));
              }
              *(_QWORD *)(a1 + 304) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              *(_DWORD *)(a1 + 312) &= ~2u;
              v57 = *(NSObject **)(a1 + 8);
              if (v57)
                dispatch_assert_queue_V2(v57);
              if (NSSQLiteRegisterFunctions(*(sqlite3 **)(a1 + 72), (void **)a1))
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("An internal error occurred while configuring functions in the SQLite database."), 0));
              sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 72), 1);
              -[NSSQLiteConnection _restoreBusyTimeOutSettings](a1);
              *(_DWORD *)(a1 + 312) |= 0x80u;
              if ((v177 & 1) == 0)
                objc_msgSend(*(id *)(a1 + 160), "objectForKey:", CFSTR("synchronous"));
              if ((v178 & 1) != 0)
                v58 = 1;
              else
                v58 = -[NSSQLiteConnection _hasTableWithName:isTemp:](a1, (uint64_t)CFSTR("Z_METADATA"), 0) ^ 1;
              v59 = (void *)objc_msgSend(*(id *)(a1 + 160), "objectForKey:", CFSTR("integrity_check"));
              if (objc_msgSend(v59, "isNSString"))
              {
                if ((objc_msgSend(v59, "isEqualToString:", CFSTR("1")) & 1) != 0
                  || !objc_msgSend(v59, "caseInsensitiveCompare:", CFSTR("YES")))
                {
                  goto LABEL_108;
                }
              }
              else if (v59 == (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
              {
LABEL_108:
                objc_msgSend(*(id *)(a1 + 160), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("integrity_check"));
                goto LABEL_111;
              }
              objc_msgSend(*(id *)(a1 + 160), "removeObjectForKey:", CFSTR("integrity_check"));
LABEL_111:
              if (!v58)
              {
                objc_msgSend(*(id *)(a1 + 160), "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("auto_vacuum"));
                goto LABEL_158;
              }
              if ((v177 & 1) != 0)
              {
                v158 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create a new database file with the read only option at path: %@"), *(_QWORD *)(a1 + 32));
                v159 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2AA0], 0);
                v160 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 257, v158, v159);
                objc_exception_throw(v160);
              }
              v60 = *(NSObject **)(a1 + 8);
              if (v60)
                dispatch_assert_queue_V2(v60);
              if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
                _NSCoreDataLog(4, (uint64_t)CFSTR("creating schema."), v61, v62, v63, v64, v65, v66, v167);
              v67 = (_QWORD *)objc_msgSend(*(id *)(a1 + 16), "model");
              v68 = *(_QWORD *)(a1 + 16);
              if (v68)
                objc_msgSend(*(id *)(v68 + 208), "lock");
              v69 = (void *)objc_msgSend(*(id *)(a1 + 160), "objectForKey:", CFSTR("lock_proxy_file"));
              if (v69
                && v69 != (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null")
                && (objc_msgSend(v69, "isEqual:", CFSTR(":auto:")) & 1) == 0)
              {
                v70 = (NSSQLiteStatement *)objc_msgSend((id)a1, "adapter");
                v71 = -[NSSQLiteAdapter newStatementWithSQLString:](v70, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma lock_proxy_file='%@'"), v69));
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v71);

              }
              v72 = (void *)objc_msgSend(*(id *)(a1 + 16), "options");
              v73 = objc_msgSend((id)objc_msgSend(v72, "objectForKey:", 0x1E1EF1450), "intValue");
              if (!(_DWORD)v73)
              {
                v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v72, "objectForKey:", CFSTR("NSSQLitePragmasOption")), "objectForKey:", CFSTR("page_size")), "intValue");
                if (!(_DWORD)v73)
                {
                  if ((*(_DWORD *)(a1 + 312) & 0xC) == 8)
                    v73 = 0x2000;
                  else
                    v73 = 4096;
                }
              }
              v74 = (NSSQLiteStatement *)objc_msgSend((id)a1, "adapter");
              v75 = -[NSSQLiteAdapter newStatementWithSQLString:](v74, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma page_size=%d"), v73));
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v75);

              v76 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSSQLitePragmasOption")), "objectForKey:", CFSTR("auto_vacuum")), "lowercaseString");
              if (!v76 || v76 == (__CFString *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
                v76 = CFSTR("2");
              v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("pragma auto_vacuum=%@"));
              v78 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)v77);

              -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v78);
              if ((-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("2")) & 1) != 0)
              {
                v79 = 0;
              }
              else
              {
                v80 = -[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("incremental"));
                v79 = 0x7FFFFFFFFFFFFFFFLL;
                if (v80)
                  v79 = 0;
              }
              *(_QWORD *)(a1 + 296) = v79;
              *(_DWORD *)(a1 + 312) &= ~0x20u;
              v197 = CFSTR("_NSAutoVacuumLevel");
              v198[0] = v76;
              -[NSSQLCore _updateAutoVacuumMetadataWithValues:](*(unsigned __int8 **)(a1 + 16), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v198, &v197, 1));
              -[NSSQLiteConnection beginTransaction](a1);
              if (-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, (uint64_t)CFSTR("Z_METADATA"), 0))
              {
                -[NSSQLiteConnection commitTransaction](a1);
                -[NSSQLiteConnection didCreateSchema]((_BYTE *)a1);
                v81 = *(_QWORD *)(a1 + 16);
                if (!v81)
                  goto LABEL_157;
              }
              else
              {
                if (v67)
                  v82 = (void *)v67[5];
                else
                  v82 = 0;
                -[NSSQLiteConnection createTablesForEntities:](a1, v82);
                v83 = *(NSObject **)(a1 + 8);
                if (v83)
                  dispatch_assert_queue_V2(v83);
                if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
                  _NSCoreDataLog(4, (uint64_t)CFSTR("Creating primary key table."), v84, v85, v86, v87, v88, v89, (uint64_t)v76);
                v90 = (NSSQLiteStatement *)objc_msgSend((id)a1, "adapter");
                PrimaryKeyTable = -[NSSQLiteAdapter newCreatePrimaryKeyTableStatement](v90);
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, PrimaryKeyTable);

                if (v67)
                  v92 = (void *)v67[5];
                else
                  v92 = 0;
                v93 = objc_msgSend(v92, "count");
                if (v93)
                {
                  for (j = 0; j != v93; ++j)
                  {
                    v95 = (void *)MEMORY[0x18D76B4E4]();
                    v96 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](v90, objc_msgSend(v92, "objectAtIndex:", j), 0);
                    -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v96);

                    objc_autoreleasePoolPop(v95);
                  }
                }
                -[NSSQLiteConnection createMetadata]((void *)a1);
                -[NSSQLiteConnection saveMetadata:]((_QWORD *)a1, (__CFString *)objc_msgSend(*(id *)(a1 + 16), "_updatedMetadataWithSeed:includeVersioning:", objc_msgSend(*(id *)(a1 + 16), "metadata"), 1));
                v97 = -[NSSQLiteConnection saveCachedModel:](a1, objc_msgSend(v67, "managedObjectModel"));
                v98 = *(_QWORD *)(a1 + 16);
                if (v98 && (*(_BYTE *)(v98 + 193) & 4) != 0)
                {
                  v99 = (void *)MEMORY[0x18D76B4E4](v97);
                  v100 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
                  if (v100)
                    v101 = *(void **)(v100 + 40);
                  else
                    v101 = 0;
                  -[NSSQLiteConnection createTablesForEntities:](a1, v101);
                  objc_autoreleasePoolPop(v99);
                }
                -[NSSQLiteConnection commitTransaction](a1);
                -[NSSQLiteConnection didCreateSchema]((_BYTE *)a1);
                v81 = *(_QWORD *)(a1 + 16);
                if (!v81)
                  goto LABEL_157;
              }
              objc_msgSend(*(id *)(v81 + 208), "unlock");
LABEL_157:
              -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);
LABEL_158:
              v102 = objc_msgSend(*(id *)(a1 + 160), "objectForKey:", CFSTR("page_size"));
              if (v102)
              {
                if (v102 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
                  v103 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma %@"), CFSTR("page_size"));
                else
                  v103 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma %@=%@"), CFSTR("page_size"), v102);
                -[NSSQLiteConnection _executeSQLString:](a1, v103);
              }
              if ((v177 & 1) == 0)
                -[NSSQLiteConnection _executeSQLString:](a1, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma recursive_triggers=1")));
              v171 = (v58 & 1) == 0
                  && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSSQLiteManualVacuumOption")) != 0;
              v188 = 0u;
              v189 = 0u;
              v186 = 0u;
              v187 = 0u;
              obj = *(id *)(a1 + 160);
              v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v196, 16);
              if (v104)
              {
                v176 = *(_QWORD *)v187;
                *(_QWORD *)&v105 = 138412290;
                v168 = v105;
                do
                {
                  v179 = v104;
                  for (k = 0; k != v179; ++k)
                  {
                    if (*(_QWORD *)v187 != v176)
                      objc_enumerationMutation(obj);
                    v107 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * k);
                    v108 = objc_msgSend(*(id *)(a1 + 160), "objectForKey:", v107);
                    if (((v177 & 1) == 0
                       || (objc_msgSend(v107, "isEqualToString:", CFSTR("journal_mode")) & 1) == 0
                       && (objc_msgSend(v107, "isEqualToString:", CFSTR("synchronous")) & 1) == 0)
                      && (objc_msgSend(v107, "isEqualToString:", CFSTR("page_size")) & 1) == 0
                      && (!v171 || (objc_msgSend(v107, "isEqualToString:", CFSTR("journal_mode")) & 1) == 0)
                      && (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault")
                       || v108 != objc_msgSend(MEMORY[0x1E0C99E38], "null")
                       || (objc_msgSend(v107, "isEqualToString:", CFSTR("journal_mode")) & 1) == 0))
                    {
                      if (objc_msgSend(v107, "isEqualToString:", CFSTR("integrity_check")))
                      {
                        v109 = *(NSObject **)(a1 + 8);
                        if (v109)
                          dispatch_assert_queue_V2(v109);
                        v174 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)CFSTR("pragma integrity_check"));
                        v173 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("*"), 6);
                        v172 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v173, 0);
                        -[NSSQLiteConnection prepareSQLStatement:](a1, v174);
                        objc_msgSend((id)a1, "execute");
                        -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v172);
                        v110 = 0;
                        v181 = 1;
LABEL_184:
                        v111 = -[NSSQLiteConnection newFetchedArray](a1);
                        v112 = v111;
                        if (!v111)
                        {
LABEL_208:

                          -[NSSQLiteConnection releaseSQLStatement](a1);
                          -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
                          *(_DWORD *)(a1 + 312) &= ~2u;
                          *(_QWORD *)(a1 + 92) = 0;
                          *(_QWORD *)(a1 + 100) = 0;
                          *(_DWORD *)(a1 + 108) = 0;

                          if ((v181 & 1) == 0)
                          {
                            v141 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Database failed integrity check.  Corrupted SQLite database at path: %@"), *(_QWORD *)(a1 + 32));
                            v142 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2AA0], v141, CFSTR("message"), 0, v168);
                            v143 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 259, v141, v142);
                            objc_exception_throw(v143);
                          }
                          continue;
                        }
                        v113 = (void *)objc_msgSend(v111, "objectAtIndex:", 0);
                        v114 = v113;
                        if (v110 || (objc_msgSend(v113, "isEqualToString:", CFSTR("ok")) & 1) == 0)
                        {
                          v181 = 0;
                        }
                        else if ((v181 & 1) != 0)
                        {
LABEL_201:

                          ++v110;
                          goto LABEL_184;
                        }
                        if (!+[NSSQLCore debugDefault](NSSQLCore, "debugDefault"))
                          goto LABEL_208;
                        v115 = (void *)objc_msgSend(v114, "componentsSeparatedByString:", CFSTR("\n"));
                        v192 = 0u;
                        v193 = 0u;
                        v190 = 0u;
                        v191 = 0u;
                        v122 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v190, &v194, 16);
                        if (v122)
                        {
                          v123 = *(_QWORD *)v191;
                          do
                          {
                            for (m = 0; m != v122; ++m)
                            {
                              if (*(_QWORD *)v191 != v123)
                                objc_enumerationMutation(v115);
                              if (*(_BYTE *)(a1 + 42))
                                v125 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m %@\x1B[0m");
                              else
                                v125 = CFSTR("%@");
                              _NSCoreDataLog(1, (uint64_t)v125, v116, v117, v118, v119, v120, v121, *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * m));
                            }
                            v122 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v190, &v194, 16);
                          }
                          while (v122);
                        }
                        goto LABEL_201;
                      }
                      if (objc_msgSend(v107, "isEqualToString:", CFSTR("lock_proxy_file")))
                      {
                        v126 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                        v127 = (void *)MEMORY[0x1E0CB3940];
                        if (v108 != v126)
                        {
                          v128 = CFSTR("pragma %@='%@'");
                          goto LABEL_215;
                        }
                        v131 = CFSTR("pragma %@=''");
LABEL_224:
                        v130 = (void *)objc_msgSend(v127, "stringWithFormat:", v131, v107);
                        goto LABEL_225;
                      }
                      if (!objc_msgSend(v107, "isEqualToString:", CFSTR("auto_vacuum")))
                      {
                        v129 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                        v127 = (void *)MEMORY[0x1E0CB3940];
                        if (v108 == v129)
                        {
                          v131 = CFSTR("pragma %@");
                          goto LABEL_224;
                        }
                        v128 = CFSTR("pragma %@=%@");
LABEL_215:
                        v130 = (void *)objc_msgSend(v127, "stringWithFormat:", v128, v107, v108);
LABEL_225:
                        -[NSSQLiteConnection _executeSQLString:](a1, v130);
                        continue;
                      }
                      if (objc_msgSend(*(id *)(a1 + 16), "isReadOnly"))
                      {
LABEL_212:
                        *(_QWORD *)(a1 + 296) = 0x7FFFFFFFFFFFFFFFLL;
                        continue;
                      }
                      v132 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "metadata"), "objectForKey:", CFSTR("_NSAutoVacuumLevel"));
                      if (v132)
                      {
                        v133 = (void *)objc_msgSend(*(id *)(a1 + 160), "objectForKey:", CFSTR("auto_vacuum"));
                        if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v133
                          || (v134 = (void *)objc_msgSend(v133, "lowercaseString")) == 0)
                        {
                          if ((objc_msgSend(CFSTR("2"), "isEqualToString:", v132) & 1) == 0)
                          {
LABEL_230:
                            if (!objc_msgSend(CFSTR("incremental"), "isEqualToString:", v132))
                              goto LABEL_212;
                          }
LABEL_231:
                          *(_QWORD *)(a1 + 296) = 0;
                          continue;
                        }
                        if (objc_msgSend(v134, "isEqualToString:", v132))
                        {
                          if ((objc_msgSend(CFSTR("2"), "isEqualToString:", v132) & 1) == 0)
                            goto LABEL_230;
                          goto LABEL_231;
                        }
                      }
                      *(_DWORD *)(a1 + 312) |= 0x20u;
                      continue;
                    }
                  }
                  v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v196, 16);
                }
                while (v104);
              }
              if ((v177 & 1) != 0)
                goto LABEL_257;
              -[NSSQLiteConnection configureUbiquityMetadataTable](a1);
              if ((v58 & 1) == 0)
              {
                if (objc_msgSend(v169, "objectForKey:", CFSTR("NSSQLiteAnalyzeOption")))
                  -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("ANALYZE"));
                if (objc_msgSend(v169, "objectForKey:", CFSTR("NSSQLiteManualVacuumOption")))
                  -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("VACUUM"));
              }
              if ((*(_BYTE *)(a1 + 312) & 0x40) == 0)
                goto LABEL_257;
              v194.f_bsize = 0;
              v135 = (void *)objc_msgSend(v169, "objectForKey:", CFSTR("NSSQLitePersistWALOption"));
              if (v135)
              {
                if (objc_msgSend(v135, "intValue") != 1)
                  goto LABEL_256;
              }
              else if (!(_BYTE)dword_1ECD8DE18)
              {
LABEL_257:
                *(_DWORD *)(a1 + 312) &= ~0x80u;
                return;
              }
              v194.f_bsize = 1;
LABEL_256:
              sqlite3_file_control(*v170, 0, 10, &v194);
              goto LABEL_257;
            }
            if (v42)
              goto LABEL_268;
          }
          v144 = "unknown";
          goto LABEL_269;
        }
        v25 = *(_DWORD *)(a1 + 312) | 0xC;
      }
      *(_DWORD *)(a1 + 312) = v25;
      goto LABEL_46;
    }
  }
}

- (void)currentStats
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSSQLiteStatement *v26;
  id v27;
  NSSQLColumn *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39[2];
  int pCur[2];
  int pHiwtr[2];

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (a1)
  {
    *(_QWORD *)pHiwtr = 0;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 8, pHiwtr, &pHiwtr[1], 0))
    {
      v4 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to get SQLITE_DBSTATUS_CACHE_MISS: %s (%d)\n"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    }
    else
    {
      *(_QWORD *)a2 = pHiwtr[0];
    }
    *(_QWORD *)pCur = 0;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 7, pCur, &pCur[1], 0))
    {
      v11 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to get SQLITE_DBSTATUS_CACHE_HIT: %s (%d)\n"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
    else
    {
      *(_QWORD *)(a2 + 8) = pCur[0];
    }
    *(_QWORD *)v39 = 0;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 12, v39, &v39[1], 0))
    {
      v18 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to get SQLITE_DBSTATUS_CACHE_SPILL: %s (%d)\n"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }
    else
    {
      *(_QWORD *)(a2 + 16) = v39[0];
    }
    v25 = *(_QWORD *)(a1 + 352);
    if (!v25)
    {
      v26 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)CFSTR("pragma page_size"));
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v28 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("page_size"), 2);
      objc_msgSend(v27, "addObject:", v28);

      -[NSSQLiteConnection prepareSQLStatement:](a1, v26);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v27);
      objc_msgSend((id)a1, "execute");
      v25 = 0;
      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      while (1)
      {
        v30 = -[NSSQLiteConnection newFetchedArray](a1);
        if (!v30)
          break;
        v31 = v30;
        if (objc_msgSend(v30, "count") == 1)
        {
          v32 = objc_msgSend((id)objc_msgSend(v31, "objectAtIndex:", 0), "longLongValue");
          if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
            _NSCoreDataLog(4, (uint64_t)CFSTR("Fetched page size: %lld"), v33, v34, v35, v36, v37, v38, v32);
        }
        else
        {
          v32 = v25;
        }
        v25 = v32;

      }
      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(_QWORD *)(a1 + 100) = 0;
      *(_QWORD *)(a1 + 92) = 0;
      *(_DWORD *)(a1 + 108) = 0;

      *(_QWORD *)(a1 + 352) = v25;
    }
    *(_QWORD *)(a2 + 24) = v25;
  }
}

- (void)_executeSQLString:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const char *v12;
  unsigned int v13;
  int v14;
  double v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  useconds_t v20;
  double Current;
  unsigned int v22;
  int v23;
  int v24;
  uint64_t v25;
  useconds_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  int v40;
  const __CFString *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *context;
  unsigned int v67;
  unsigned int v68;
  __CFString *v69;
  unsigned int v70;
  sqlite3_stmt *ppStmt;
  char *pzTail;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    context = (void *)MEMORY[0x18D76B4E4]();
    ppStmt = 0;
    pzTail = 0;
    v70 = 0;
    -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
    {
      if (*(_BYTE *)(a1 + 42))
        v11 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
      else
        v11 = CFSTR("%@");
      _NSCoreDataLog(6, (uint64_t)v11, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    }
    v12 = (const char *)objc_msgSend(a2, "UTF8String");
    v67 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0.0;
    while (2)
    {
      v16 = 3 * v13 - 29999;
LABEL_11:
      v17 = strlen(v12);
      v18 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v12, v17, &ppStmt, (const char **)&pzTail);
      v19 = v18;
      switch((char)v18)
      {
        case 0:
          v68 = 0;
          v22 = 0;
          v23 = 0;
          v15 = 0.0;
LABEL_37:
          v24 = 3 * v22 - 29999;
          break;
        case 1:
        case 7:
        case 10:
        case 17:
        case 21:
          goto LABEL_66;
        case 5:
          if (*(double *)(a1 + 232) > 0.0 && v15 == 0.0)
            v15 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          if (v13 < 0x2711)
            goto LABEL_31;
          if (v13 - 10000 >= 0xB)
            v20 = v13 - 8899;
          else
            v20 = v16;
          goto LABEL_30;
        case 6:
          if (*(double *)(a1 + 232) > 0.0 && v15 == 0.0)
            v15 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          goto LABEL_27;
        case 11:
        case 26:
          goto LABEL_72;
        case 14:
          if (v14 > 2)
          {
LABEL_66:
            v27 = v18;
            v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
            if (v27 == 10)
              sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v70);
            v29 = *(_QWORD *)(a1 + 32);
            if (v70)
              v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d"), v29, v19, v28, v70);
            else
              v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@'"), v29, v19, v28, v65);
            v31 = (void *)v30;
            if (v30)
            {
              v69 = 0;
              v32 = 256;
            }
            else
            {
LABEL_72:
              v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'"), *(_QWORD *)(a1 + 32), v19, sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
              v32 = (int)v19;
              v69 = CFSTR("NSSQLiteErrorDomain");
            }
            sqlite3_finalize(ppStmt);
            ppStmt = 0;
            -[NSSQLiteConnection _forceDisconnectOnError](a1);
            if (v31)
            {
              v39 = (const char *)objc_msgSend(v31, "UTF8String");
              v40 = 0;
            }
            else
            {
LABEL_75:
              v39 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
              v31 = 0;
              v40 = 1;
            }
            if (*(_BYTE *)(a1 + 42))
              v41 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m");
            else
              v41 = CFSTR("(%d) %s");
LABEL_97:
            _NSCoreDataLog(1, (uint64_t)v41, v33, v34, v35, v36, v37, v38, v19);
            if (v40)
            {
              v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during execution of SQL string '%s' : %s"), v12, v39);
              v32 = 256;
            }
            if (ppStmt)
              sqlite3_finalize(ppStmt);
            v46 = *MEMORY[0x1E0C99768];
            v47 = (void *)MEMORY[0x1E0C99D80];
            v48 = *(_QWORD *)(a1 + 32);
            v49 = *MEMORY[0x1E0CB2AA0];
            v50 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
            if (v70)
              v51 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
            else
              v51 = 0;
            v52 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v46, v32, (uint64_t)v31, (void *)objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, v49, v50, CFSTR("NSSQLiteErrorDomain"), v51, *MEMORY[0x1E0CB2FE0], 0));
            v53 = v52;
            if (v69)
              -[_NSCoreDataException _setDomain:]((uint64_t)v52, v69);
            objc_exception_throw(v53);
          }
          if (*(double *)(a1 + 232) > 0.0 && v15 == 0.0)
            v15 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          ++v14;
LABEL_27:
          if (v13 <= 0xA)
            v20 = 3 * v13 + 1;
          else
            v20 = v13 + 1101;
LABEL_30:
          usleep(v20);
LABEL_31:
          if (v15 != 0.0)
          {
            Current = CFAbsoluteTimeGetCurrent();
            if (Current > v15)
            {
              if (v67 > 7)
              {
LABEL_107:
                v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The database operation timed out after %.2f seconds."), Current - v15 + *(double *)(a1 + 232));
                if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
                {
                  if (*(_BYTE *)(a1 + 42))
                    v61 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m");
                  else
                    v61 = CFSTR("(%d) %@");
                  v64 = v54;
                  _NSCoreDataLog(1, (uint64_t)v61, v55, v56, v57, v58, v59, v60, v19);
                }
                if (ppStmt)
                  sqlite3_finalize(ppStmt);
                v62 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during SQL execution : %@"), v54, v64);
                v63 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134090, v62, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19), CFSTR("NSSQLiteErrorDomain")));
                objc_exception_throw(v63);
              }
              ++v13;
              v15 = Current + *(double *)(a1 + 240);
              ++v67;
              continue;
            }
          }
          v16 += 3;
          ++v13;
          goto LABEL_11;
        default:
          v69 = 0;
          v32 = 0;
          goto LABEL_75;
      }
      break;
    }
    while (2)
    {
      v25 = sqlite3_step(ppStmt);
      v19 = v25;
      switch((char)v25)
      {
        case 5:
          sqlite3_reset(ppStmt);
          if (*(double *)(a1 + 232) > 0.0 && v15 == 0.0)
            v15 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          if (v22 < 0x2711)
            goto LABEL_58;
          if (v22 - 10000 >= 0xB)
            v26 = v22 - 8899;
          else
            v26 = v24;
          goto LABEL_57;
        case 6:
          sqlite3_reset(ppStmt);
          if (*(double *)(a1 + 232) > 0.0 && v15 == 0.0)
            v15 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          goto LABEL_54;
        case 7:
        case 10:
        case 17:
        case 21:
          goto LABEL_82;
        case 8:
        case 9:
        case 12:
        case 13:
        case 15:
        case 16:
        case 18:
        case 19:
        case 20:
        case 22:
        case 23:
        case 24:
        case 25:
          goto LABEL_92;
        case 11:
        case 26:
          goto LABEL_88;
        case 14:
          if (v23 > 2)
            goto LABEL_82;
          if (*(double *)(a1 + 232) > 0.0 && v15 == 0.0)
            v15 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          ++v23;
LABEL_54:
          if (v22 <= 0xA)
            v26 = 3 * v22 + 1;
          else
            v26 = v22 + 1101;
LABEL_57:
          usleep(v26);
LABEL_58:
          if (v15 == 0.0 || (Current = CFAbsoluteTimeGetCurrent(), Current <= v15))
          {
            v24 += 3;
            ++v22;
            continue;
          }
          if (v68 <= 7)
          {
            ++v22;
            v15 = Current + *(double *)(a1 + 240);
            ++v68;
            goto LABEL_37;
          }
          goto LABEL_107;
        default:
          if (v25 - 100 < 2)
          {
            sqlite3_finalize(ppStmt);
            objc_autoreleasePoolPop(context);
            return;
          }
          if (v25 == 1)
          {
LABEL_82:
            v42 = v25;
            v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
            if (v42 == 10)
              sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v70);
            v44 = *(_QWORD *)(a1 + 32);
            if (v70)
              v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d"), v44, v19, v43, v70);
            else
              v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@'"), v44, v19, v43, v65);
            v31 = (void *)v45;
            if (v45)
            {
              v69 = 0;
              v32 = 256;
            }
            else
            {
LABEL_88:
              v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'"), *(_QWORD *)(a1 + 32), v19, sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
              v32 = (int)v19;
              v69 = CFSTR("NSSQLiteErrorDomain");
            }
            sqlite3_finalize(ppStmt);
            ppStmt = 0;
            -[NSSQLiteConnection _forceDisconnectOnError](a1);
            if (v31)
            {
              v39 = (const char *)objc_msgSend(v31, "UTF8String");
              v40 = 0;
              goto LABEL_94;
            }
          }
          else
          {
LABEL_92:
            v69 = 0;
            v32 = 0;
          }
          v39 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
          v31 = 0;
          v40 = 1;
LABEL_94:
          if (*(_BYTE *)(a1 + 42))
            v41 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m");
          else
            v41 = CFSTR("(%d) %s");
          goto LABEL_97;
      }
    }
  }
}

- (uint64_t)_restoreBusyTimeOutSettings
{
  double v1;
  double v2;
  int v3;

  v1 = *(double *)(a1 + 232) * 0.125;
  v2 = 30.0;
  if (v1 >= 30.0)
  {
    v3 = 30000;
  }
  else
  {
    v2 = 2.0;
    if (v1 >= 2.0)
    {
      v2 = ceil(v1);
      v3 = 1000 * vcvtpd_s64_f64(v1);
    }
    else
    {
      v3 = 2000;
    }
  }
  *(double *)(a1 + 240) = v2;
  return sqlite3_busy_timeout(*(sqlite3 **)(a1 + 72), v3);
}

- (uint64_t)adoptQueryGenerationWithIdentifier:(uint64_t)result
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result)
  {
    v3 = result;
    v4 = *(NSObject **)(result + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if ((*(_BYTE *)(v3 + 313) & 2) == 0)
    {
      v5 = sqlite3_snapshot_recover(*(sqlite3 **)(v3 + 72), "main");
      if ((_DWORD)v5 && (v6 = v5, readFileSizeFromJournalHandle(*(sqlite3 **)(v3 + 72)) >= 1))
        _NSCoreDataLog(1, (uint64_t)CFSTR("sqlite3_snapshot_recover failed with %d"), v7, v8, v9, v10, v11, v12, v6);
      else
        *(_DWORD *)(v3 + 312) |= 0x200u;
    }
    return -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](v3, a2);
  }
  return result;
}

- (uint64_t)_hasPersistentHistoryTables
{
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = 0;
  if (-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, (uint64_t)CFSTR("ACHANGE"), 0))
    v3 = -[NSSQLiteConnection _hasTableWithName:isTemp:](a1, (uint64_t)CFSTR("ATRANSACTION"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (void)configureUbiquityMetadataTable
{
  if (a1 && (objc_msgSend(*(id *)(a1 + 16), "isReadOnly") & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
    {
      -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("CREATE TABLE IF NOT EXISTS Y_UBMETA (Y_PK INTEGER PRIMARY KEY ASC, YPEERID VARCHAR UNIQUE, YTRANSACTIONNUMBER INTEGER)"));
      -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("CREATE TABLE IF NOT EXISTS Y_UBRANGE (Y_PK INTEGER PRIMARY_KEY ASC, YPEERID VARCHAR, YENTITYNAME VARCHAR, YRANGESTART INTEGER, YRANGEEND INTEGER, YPEERSTART INTEGER, YPEEREND INTEGER)"));
      -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("CREATE TABLE IF NOT EXISTS Y_UBKVS (Y_PK INTEGER PRIMARY KEY ASC, YKEY VARCHAR UNIQUE, YVALUE VARCHAR)"));
    }
  }
}

- (uint64_t)deleteRow:(uint64_t)a3 forRequestContext:
{
  uint64_t v5;
  NSObject *v6;
  const void *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  void *v10;
  void *v11;
  void *v12;
  NSSQLiteStatementCache *v13;
  NSSQLiteStatementCache *v14;
  NSSQLiteStatement *deletionStatementCache;
  sqlite3_stmt *cachedSQLiteStatement;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSSQLiteStatement *v33;
  sqlite3 *v34;
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
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = *(NSObject **)(result + 8);
    if (v6)
      dispatch_assert_queue_V2(v6);
    if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
      v7 = 0;
    else
      v7 = (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
    v8 = objc_msgSend((id)a2, "objectID");
    v9 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](a3, (const void *)objc_msgSend((id)a2, "objectID"));
    if (a3)
      v10 = *(void **)(a3 + 32);
    else
      v10 = 0;
    v11 = (void *)objc_msgSend(v10, "objectRegisteredForID:", objc_msgSend((id)a2, "objectID"));
    if (v11)
    {
      if (v9)
      {
        v12 = v11;
        if (objc_msgSend(v11, "_versionReference"))
        {
          if (*(_DWORD *)(*(_QWORD *)&v9[10]._os_unfair_lock_opaque + 12) != objc_msgSend(v12, "_versionReference"))
          {
            if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) <= 1)
            {
              if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) >= 1)
                _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@. During deleteRow. version match = %d"), v41, v42, v43, v44, v45, v46, v8);
            }
            else
            {
              _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  During deleteRow.  Original row = %@ New Row = %@ context version match = %d"), v35, v36, v37, v38, v39, v40, v8);
            }
            v47 = *MEMORY[0x1E0C99768];
            v49 = v8;
            v50[0] = CFSTR("_NSCoreDataOptimisticLockingFailureConflictsKey");
            v48 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
            v50[1] = CFSTR("_NSCoreDataOptimisticLockingFailureMismatchWithObject");
            v51[0] = v48;
            v51[1] = &unk_1E1F4B6C0;
            objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", v47, CFSTR("optimistic locking failure"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2)));
          }
        }
      }
    }
    v13 = -[NSSQLiteConnection statementCacheForEntity:](v5, v7);
    v14 = v13;
    if (v13
      && (deletionStatementCache = v13->_deletionStatementCache) != 0
      && (cachedSQLiteStatement = deletionStatementCache->_cachedSQLiteStatement) != 0)
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      {
        v17 = *(unsigned __int8 *)(v5 + 42);
        v18 = -[NSSQLiteStatement sqlString](deletionStatementCache, "sqlString");
        if (v17)
          v25 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
        else
          v25 = CFSTR("%@");
        _NSCoreDataLog(6, (uint64_t)v25, v19, v20, v21, v22, v23, v24, v18);
      }
      *(_QWORD *)(v5 + 48) = deletionStatementCache;
      v26 = *(NSObject **)(v5 + 8);
      if (v26)
      {
        dispatch_assert_queue_V2(v26);
        deletionStatementCache = *(NSSQLiteStatement **)(v5 + 48);
      }
      v27 = -[NSSQLiteStatement bindVariables](deletionStatementCache, "bindVariables");
      v28 = (void *)objc_msgSend(v27, "objectAtIndex:", 0);
      if (a2)
        v29 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_referenceData64");
      else
        v29 = 0;
      objc_msgSend(v28, "setInt64:", v29);
      v30 = (void *)objc_msgSend(v27, "objectAtIndex:", 1);
      if (a2)
        v31 = *(unsigned int *)(*(_QWORD *)(a2 + 40) + 12);
      else
        v31 = 0;
      objc_msgSend(v30, "setInt64:", v31);
      *(_QWORD *)(v5 + 80) = cachedSQLiteStatement;
      v32 = *(id *)(v5 + 48);
    }
    else
    {
      v33 = -[NSSQLiteAdapter newDeleteStatementWithRow:]((NSSQLiteStatement *)objc_msgSend((id)v5, "adapter"), a2);
      -[NSSQLiteConnection prepareSQLStatement:](v5, v33);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v5 + 48), *(sqlite3_stmt **)(v5 + 80), v5);
      -[NSSQLiteStatementCache cacheDeletionStatement:](v14, *(_QWORD **)(v5 + 48));

      -[NSSQLiteConnection addVMCachedStatement:](v5, *(const void **)(v5 + 48));
    }
    objc_msgSend((id)v5, "execute");
    if (!*(_QWORD *)(v5 + 80))
      -[NSSQLiteStatementCache cacheDeletionStatement:](v14, 0);
    -[NSSQLiteConnection resetSQLStatement](v5);
    v34 = *(sqlite3 **)(v5 + 72);
    if (v34)
      LODWORD(v34) = sqlite3_changes(v34);
    *(_DWORD *)(v5 + 88) = (_DWORD)v34;
    return (_DWORD)v34 == 1;
  }
  return result;
}

- (uint64_t)updateRow:(uint64_t)a3 forRequestContext:
{
  uint64_t v4;
  NSObject *v5;
  const void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  const __CFBitVector *v12;
  NSObject *v13;
  const __CFDictionary *Value;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  void *v27;
  NSSQLiteStatement *v28;
  void *v29;
  const __CFArray *v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  CFDateRef v60;
  void *v61;
  _BOOL4 v62;
  uint64_t v63;
  uint64_t v64;
  void *ValueAtIndex;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  const __CFArray *v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const __CFBitVector *v96;
  unsigned int *v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  sqlite3 *v102;
  const void *v103;
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
  void *v129;
  unsigned int v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *context;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unsigned int *key;
  id v141;
  id v142;
  id obj;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  const __CFString *v162;
  uint64_t v163[7];
  const void *v164;
  _QWORD v165[2];
  _QWORD v166[2];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    v5 = *(NSObject **)(result + 8);
    if (v5)
      dispatch_assert_queue_V2(v5);
    if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
      key = 0;
    else
      key = (unsigned int *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
    v6 = (const void *)objc_msgSend((id)a2, "objectID");
    v7 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](a3, v6);
    if (a3)
      v8 = *(void **)(a3 + 32);
    else
      v8 = 0;
    v9 = (void *)objc_msgSend(v8, "objectRegisteredForID:", v6);
    v10 = v9;
    v11 = 0;
    if (v9 && v7)
    {
      if (objc_msgSend(v9, "_versionReference"))
        v11 = *(_DWORD *)(*(_QWORD *)&v7[10]._os_unfair_lock_opaque + 12) != objc_msgSend(v10, "_versionReference");
      else
        v11 = 0;
    }
    v139 = (uint64_t)v7;
    if (!v7 || v11)
    {
      v103 = v6;
      if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) <= 1)
      {
        if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) >= 1)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@. During updateRow.  Original row = %p context version match = %d"), v123, v124, v125, v126, v127, v128, (uint64_t)v6);
      }
      else
      {
        _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  During updateRow.  Original row = %@ New Row = %@ context version match = %d"), v104, v105, v106, v107, v108, v109, (uint64_t)v6);
      }
      v129 = &unk_1E1F4B6A8;
      if (v11)
      {
        v130 = objc_msgSend(v10, "_versionReference");
        v131 = v139;
        if (v139)
          v131 = *(unsigned int *)(*(_QWORD *)(v139 + 40) + 12);
        if (v131 >= v130)
          v129 = &unk_1E1F4B6C0;
      }
      v164 = v103;
      v165[0] = CFSTR("_NSCoreDataOptimisticLockingFailureConflictsKey");
      v132 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v164, 1);
      v165[1] = CFSTR("_NSCoreDataOptimisticLockingFailureMismatchWithObject");
      v166[0] = v132;
      v166[1] = v129;
      v133 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
      objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("optimistic locking failure"), v133));
    }
    v137 = a3;
    v135 = (uint64_t)v6;
    if (a2)
      v12 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, (uint64_t)v7, 30);
    else
      v12 = 0;
    v13 = *(NSObject **)(v4 + 8);
    if (v13)
      dispatch_assert_queue_V2(v13);
    Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v4 + 216), key);
    v138 = v4;
    if (Value
      && (v15 = (void *)CFDictionaryGetValue(Value, v12)) != 0
      && (v16 = v15, (v136 = *((_QWORD *)v15 + 8)) != 0))
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      {
        v17 = *(unsigned __int8 *)(v4 + 42);
        v18 = objc_msgSend(v16, "sqlString");
        if (v17)
          v25 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
        else
          v25 = CFSTR("%@");
        _NSCoreDataLog(6, (uint64_t)v25, v19, v20, v21, v22, v23, v24, v18);
      }
      *(_QWORD *)(v4 + 48) = v16;
      v26 = *(NSObject **)(v4 + 8);
      if (v26)
        dispatch_assert_queue_V2(v26);
      context = (void *)MEMORY[0x18D76B4E4]();
      if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
        v27 = 0;
      else
        v27 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
      v29 = (void *)objc_msgSend(v27, "foreignKeyColumns");
      obj = (id)objc_msgSend(v27, "foreignEntityKeyColumns");
      v142 = (id)objc_msgSend(v27, "foreignOrderKeyColumns");
      v141 = (id)objc_msgSend(v27, "attributeColumns");
      v30 = (const __CFArray *)objc_msgSend(*(id *)(v4 + 48), "bindVariables");
      v157 = 0u;
      v158 = 0u;
      v159 = 0u;
      v160 = 0u;
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
      if (v31)
      {
        v32 = 0;
        v33 = 0;
        v34 = *(_QWORD *)v158;
        do
        {
          v35 = 0;
          v36 = v32;
          do
          {
            if (*(_QWORD *)v158 != v34)
              objc_enumerationMutation(v29);
            v37 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v35);
            if (CFBitVectorGetBitAtIndex(v12, (v36 + v35)))
            {
              v38 = -[NSSQLRow foreignKeyForSlot:](a2, objc_msgSend(v37, "slot"));
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setInt64:", v38);
            }
            ++v35;
          }
          while (v31 != v35);
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
          v32 = v36 + v35;
        }
        while (v31);
        v39 = v36 + v35;
      }
      else
      {
        v39 = 0;
        v33 = 0;
      }
      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v154;
        do
        {
          v42 = 0;
          v43 = v39;
          do
          {
            if (*(_QWORD *)v154 != v41)
              objc_enumerationMutation(obj);
            v44 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v42);
            if (CFBitVectorGetBitAtIndex(v12, (v43 + v42)))
            {
              v45 = objc_msgSend(v44, "slot");
              if (a2)
                v46 = *(unsigned __int16 *)(a2
                                          + _NSSQLRowInstanceSize
                                          + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                          + (((unint64_t)*(unsigned int *)(a2 + 16) >> 16) & 0xFFFC)
                                          + 2 * v45);
              else
                v46 = 0;
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setUnsignedInt:", v46);
            }
            ++v42;
          }
          while (v40 != v42);
          v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
          v40 = v47;
          v39 = v43 + v42;
        }
        while (v47);
        v39 = v43 + v42;
      }
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v48 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v149, v168, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v150;
        do
        {
          v50 = 0;
          v51 = v39;
          do
          {
            if (*(_QWORD *)v150 != v49)
              objc_enumerationMutation(v142);
            v52 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * v50);
            if (CFBitVectorGetBitAtIndex(v12, (v51 + v50)))
            {
              v53 = objc_msgSend(v52, "slot");
              if (a2)
                v54 = *(unsigned int *)(a2
                                      + _NSSQLRowInstanceSize
                                      + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                      + 4 * v53);
              else
                v54 = 0;
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setUnsignedInt:", v54);
            }
            ++v50;
          }
          while (v48 != v50);
          v55 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v149, v168, 16);
          v48 = v55;
          v39 = v51 + v50;
        }
        while (v55);
        v39 = v51 + v50;
      }
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v56 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v145, v167, 16);
      if (v56)
      {
        v57 = *(_QWORD *)v146;
        do
        {
          v58 = 0;
          do
          {
            if (*(_QWORD *)v146 != v57)
              objc_enumerationMutation(v141);
            v59 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v58);
            if (CFBitVectorGetBitAtIndex(v12, (v39 + v58)))
            {
              if ((objc_msgSend(v59, "isConstrained") & 1) != 0)
              {
                v60 = 0;
              }
              else
              {
                v61 = (void *)objc_msgSend(v59, "attributeDescription");
                if (v61)
                  v62 = objc_msgSend(v61, "superCompositeAttribute") != 0;
                else
                  v62 = 0;
                v60 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, objc_msgSend(v59, "slot"));
                if (v62)
                  v60 = (CFDateRef)-[__CFDate valueForKeyPath:](v60, "valueForKeyPath:", -[NSPropertyDescription _elementPath]((__CFString *)objc_msgSend(v59, "propertyDescription")));
              }
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setValue:", v60);
            }
            ++v58;
          }
          while (v56 != v58);
          v63 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v145, v167, 16);
          v56 = v63;
          v39 += v58;
        }
        while (v63);
      }
      if (v139)
        v64 = *(unsigned int *)(*(_QWORD *)(v139 + 40) + 12) + 1;
      else
        v64 = 1;
      objc_msgSend((id)a2, "setOptLock:", v64);
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v30, v33);
      if (a2)
      {
        v66 = a2;
        v67 = *(unsigned int *)(*(_QWORD *)(a2 + 40) + 12);
      }
      else
      {
        v67 = 0;
        v66 = 0;
      }
      v68 = v66 == 0;
      objc_msgSend(ValueAtIndex, "setInt64:", v67);
      v69 = (void *)CFArrayGetValueAtIndex(v30, v33 + 1);
      if (v68)
        v70 = 0;
      else
        v70 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_referenceData64");
      objc_msgSend(v69, "setInt64:", v70);
      v71 = (void *)CFArrayGetValueAtIndex(v30, v33 + 2);
      if (v139)
        v72 = *(unsigned int *)(*(_QWORD *)(v139 + 40) + 12);
      else
        v72 = 0;
      objc_msgSend(v71, "setInt64:", v72);
      objc_autoreleasePoolPop(context);
      v4 = v138;
      *(_QWORD *)(v138 + 80) = v136;
      v73 = *(id *)(v138 + 48);
    }
    else
    {
      v28 = -[NSSQLiteAdapter newUpdateStatementWithRow:originalRow:withMask:]((NSSQLiteStatement *)objc_msgSend((id)v4, "adapter"), a2, (uint64_t)v7, v12);
      -[NSSQLiteConnection prepareSQLStatement:](v4, v28);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v4 + 48), *(sqlite3_stmt **)(v4 + 80), v4);
      -[NSSQLiteConnection cacheUpdateStatement:forEntity:andDeltasMask:](v4, *(const void **)(v4 + 48), key, v12);

      -[NSSQLiteConnection addVMCachedStatement:](v4, *(const void **)(v4 + 48));
    }
    objc_msgSend((id)v4, "execute");
    if (!*(_QWORD *)(v4 + 80))
      -[NSSQLiteConnection cacheUpdateStatement:forEntity:andDeltasMask:](v4, 0, key, v12);
    v74 = *(void **)(v4 + 48);
    v75 = *(NSObject **)(v4 + 8);
    if (v75)
      dispatch_assert_queue_V2(v75);
    v76 = (void *)objc_msgSend(v74, "entity");
    v77 = (void *)objc_msgSend(v76, "foreignKeyColumns");
    v78 = (void *)objc_msgSend(v76, "foreignEntityKeyColumns");
    v79 = (void *)objc_msgSend(v76, "foreignOrderKeyColumns");
    v80 = (void *)objc_msgSend(v76, "attributeColumns");
    v81 = (const __CFArray *)objc_msgSend(*(id *)(v4 + 48), "bindVariables");
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v82 = 0;
    v83 = 0;
    v84 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
    if (v84)
    {
      v85 = *(_QWORD *)v158;
      while (1)
      {
        if (*(_QWORD *)v158 != v85)
          objc_enumerationMutation(v77);
        if (CFBitVectorGetBitAtIndex(v12, v83++))
          ++v82;
        if (!--v84)
        {
          v84 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
          if (!v84)
            break;
        }
      }
    }
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v87 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v154;
      while (1)
      {
        if (*(_QWORD *)v154 != v88)
          objc_enumerationMutation(v78);
        if (CFBitVectorGetBitAtIndex(v12, v83++))
          ++v82;
        if (!--v87)
        {
          v87 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
          if (!v87)
            break;
        }
      }
    }
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v90 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v149, v168, 16);
    if (v90)
    {
      v91 = *(_QWORD *)v150;
      while (1)
      {
        if (*(_QWORD *)v150 != v91)
          objc_enumerationMutation(v79);
        if (CFBitVectorGetBitAtIndex(v12, v83++))
          ++v82;
        if (!--v90)
        {
          v90 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v149, v168, 16);
          if (!v90)
            break;
        }
      }
    }
    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v93 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v145, v167, 16);
    if (v93)
    {
      v94 = *(_QWORD *)v146;
      while (1)
      {
        if (*(_QWORD *)v146 != v94)
          objc_enumerationMutation(v80);
        if (CFBitVectorGetBitAtIndex(v12, v83))
          objc_msgSend((id)CFArrayGetValueAtIndex(v81, v82++), "setValue:", 0);
        ++v83;
        if (!--v93)
        {
          v93 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v145, v167, 16);
          if (!v93)
            break;
        }
      }
    }
    -[NSSQLiteConnection resetSQLStatement](v138);
    v95 = *(_QWORD *)(v138 + 16);
    if (v95 && (*(_BYTE *)(v95 + 193) & 4) != 0)
    {
      if (a2)
        v96 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, v139, 30);
      else
        v96 = 0;
      v97 = key;
      v98 = +[_NSPersistentHistoryChange _dataMaskForEntity:andDeltaMask:]((uint64_t)_NSPersistentHistoryChange, key, v96);
      if (v98)
      {
        v99 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (key)
          v97 = (unsigned int *)key[46];
        if (a2)
          v100 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_referenceData64");
        else
          v100 = 0;
        v101 = (void *)objc_msgSend(v99, "initWithFormat:", CFSTR("%u-%lld"), v97, v100);
        -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](v137, v98, (uint64_t)v101);

      }
      if (v96)
        CFRelease(v96);
    }
    if (v12)
      CFRelease(v12);
    v102 = *(sqlite3 **)(v138 + 72);
    if (v102)
    {
      result = sqlite3_changes(v102);
      *(_DWORD *)(v138 + 88) = result;
      if ((_DWORD)result == 1)
        return result;
    }
    else
    {
      *(_DWORD *)(v138 + 88) = 0;
    }
    if ((int)-[NSSQLStoreRequestContext debugLogLevel](v137) <= 1)
    {
      if ((int)-[NSSQLStoreRequestContext debugLogLevel](v137) >= 1)
        _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  During updateRow, rows processed = %d."), v116, v117, v118, v119, v120, v121, v135);
    }
    else
    {
      _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  During updateRow, rows processed = %d.  Original row = %@ New row = %@"), v110, v111, v112, v113, v114, v115, v135);
    }
    v161 = v135;
    v162 = CFSTR("_NSCoreDataOptimisticLockingFailureConflictsKey");
    v163[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
    v122 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, &v162, 1);
    objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("optimistic locking failure"), v122));
  }
  return result;
}

- (void)cacheUpdateStatement:(void *)key forEntity:(const void *)a4 andDeltasMask:
{
  NSObject *v8;
  __CFDictionary *Value;
  CFMutableDictionaryRef v10;
  CFDictionaryKeyCallBacks v11;

  v8 = *(NSObject **)(a1 + 8);
  if (v8)
    dispatch_assert_queue_V2(v8);
  Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 216), key);
  if (Value)
  {
    v10 = Value;
    if (!a2)
    {
      CFDictionaryRemoveValue(Value, a4);
      return;
    }
  }
  else
  {
    if (!a2)
      return;
    v11.version = *MEMORY[0x1E0C9B390];
    *(_OWORD *)&v11.retain = *(_OWORD *)(MEMORY[0x1E0C9B390] + 8);
    v11.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E0C9B390] + 24);
    v11.equal = (CFDictionaryEqualCallBack)PFVectorEqual;
    v11.hash = (CFDictionaryHashCallBack)PFVectorHash;
    v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v11, MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 216), key, v10);

  }
  CFDictionarySetValue(v10, a4, a2);
}

- (void)prepareInsertStatementForAncillaryEntity:(uint64_t)a1
{
  NSSQLiteStatementCache *v4;
  NSSQLiteStatementCache *v5;
  NSSQLiteStatement *insertStatementCache;
  sqlite3_stmt *cachedSQLiteStatement;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  NSSQLiteStatement *v17;
  void *v18;
  NSSQLiteStatement *v19;
  _QWORD *v20;
  const __CFString *v21;
  NSString *v22;
  NSString *sqlString;
  NSSQLiteStatement *v24;
  id v25;

  v4 = -[NSSQLiteConnection statementCacheForEntity:](a1, a2);
  v5 = v4;
  if (!v4
    || (insertStatementCache = v4->_insertStatementCache) == 0
    || (cachedSQLiteStatement = insertStatementCache->_cachedSQLiteStatement) == 0)
  {
    v18 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "adapter"), "sqlCore"), "objectIDFactoryForPersistentHistoryEntity:", a2), "alloc"), "initWithPK64:", 1);
    v25 = (id)objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, a2), "initWithSQLEntity:objectID:", a2, v18);
    v19 = -[NSSQLiteAdapter newStatementWithEntity:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)a2);
    v20 = -[NSSQLiteAdapter newGeneratorWithStatement:]((_QWORD *)objc_msgSend((id)a1, "adapter"), (uint64_t)v19);
    v21 = (const __CFString *)objc_msgSend(a2, "name");
    if (v20)
    {
      -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]((uint64_t)v20, (uint64_t)v25, v21 == CFSTR("TRANSACTIONSTRING"), 0, (void *)NSArray_EmptyArray);
      v22 = (NSString *)v20[3];
      if (v19)
        goto LABEL_12;
    }
    else
    {
      v22 = 0;
      if (v19)
      {
LABEL_12:
        sqlString = v19->_sqlString;
        if (sqlString != v22)
        {

          v19->_sqlString = (NSString *)-[NSString copy](v22, "copy");
        }
      }
    }
    -[NSSQLiteConnection prepareSQLStatement:](a1, v19);
    -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(a1 + 48), *(sqlite3_stmt **)(a1 + 80), a1);
    -[NSSQLiteStatementCache cacheInsertStatement:](v5, *(_QWORD **)(a1 + 48));
    -[NSSQLiteConnection addVMCachedStatement:](a1, *(const void **)(a1 + 48));

    return;
  }
  v24 = v5->_insertStatementCache;
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
  {
    v8 = *(unsigned __int8 *)(a1 + 42);
    v9 = -[NSSQLiteStatement sqlString](v24, "sqlString");
    if (v8)
      v16 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
    else
      v16 = CFSTR("%@");
    _NSCoreDataLog(6, (uint64_t)v16, v10, v11, v12, v13, v14, v15, v9);
  }
  *(_QWORD *)(a1 + 48) = v24;
  *(_QWORD *)(a1 + 80) = cachedSQLiteStatement;
  v17 = v24;
}

- (id)adapter
{
  return -[NSSQLCore adapter](self->_sqlCore, "adapter");
}

- (void)beginTransaction
{
  void *v2;
  NSSQLiteStatement *v3;
  sqlite3_stmt *v4;
  uint64_t v5;

  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    v3 = *(NSSQLiteStatement **)(a1 + 128);
    if (!v3)
    {
      v3 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, CFSTR("BEGIN EXCLUSIVE"));
      *(_QWORD *)(a1 + 128) = v3;
    }
    -[NSSQLiteConnection prepareSQLStatement:](a1, v3);
    v4 = *(sqlite3_stmt **)(a1 + 128);
    if (v4)
      v5 = *((_QWORD *)v4 + 8);
    else
      v5 = 0;
    if (*(_QWORD *)(a1 + 80) != v5)
      -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v4);
    _execute(a1);
    -[NSSQLiteConnection resetSQLStatement](a1);
    *(_BYTE *)(a1 + 41) = 0;
    if (!*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 1;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NSSQLConnectionBeginTransactionNotification"), a1);
    }
    objc_autoreleasePoolPop(v2);
  }
}

- (void)_ensureNoTransactionOpen
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  if (*(_BYTE *)(a1 + 40))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Nested transactions are not supported"), 0));
}

- (void)commitTransaction
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSString *v5;
  objc_class *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  uint64_t v11;
  CFMutableArrayRef v12;
  uint64_t v13;
  NSSQLiteStatement *v14;
  sqlite3_stmt *v15;
  uint64_t v16;
  int v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((*(_BYTE *)(a1 + 312) & 2) != 0)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99768];
    v5 = NSStringFromSelector(sel_commitTransaction);
    v6 = (objc_class *)objc_opt_class();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ -- %@ %p: attempted to commit a transaction while a fetch was in progress"), v5, NSStringFromClass(v6), a1);
  }
  if (!*(_BYTE *)(a1 + 41) && (*(_BYTE *)(a1 + 312) & 0x20) != 0)
  {
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSSQLitePragmasOption")), "objectForKey:", CFSTR("auto_vacuum"));
    if (!v7 || (v8 = (__CFString *)v7, objc_msgSend(MEMORY[0x1E0C99E38], "null") == v7))
    {
      v8 = CFSTR("2");
    }
    else if (-[__CFString isNSString](v8, "isNSString"))
    {
      v8 = (__CFString *)-[__CFString lowercaseString](v8, "lowercaseString");
    }
    v9 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, CFSTR("pragma auto_vacuum"));
    if (v9)
    {
      v10 = v9;
      if (CFArrayGetCount(v9) && *(_QWORD *)CFArrayGetValueAtIndex(v10, 0))
      {
        v11 = *(_QWORD *)CFArrayGetValueAtIndex(v10, 1);
        CFRelease(v10);
        if (v11)
        {
          v12 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma auto_vacuum=%@"), v8));
          if (v12)
            CFRelease(v12);
          if ((objc_msgSend(CFSTR("2"), "isEqualToString:", v8) & 1) != 0)
          {
            v13 = 0;
          }
          else
          {
            v17 = objc_msgSend(CFSTR("incremental"), "isEqualToString:", v8);
            v13 = 0x7FFFFFFFFFFFFFFFLL;
            if (v17)
              v13 = 0;
          }
          goto LABEL_21;
        }
      }
      else
      {
        CFRelease(v10);
      }
    }
    v8 = CFSTR("0");
    v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
    *(_QWORD *)(a1 + 296) = v13;
    v18 = CFSTR("_NSAutoVacuumLevel");
    v19[0] = v8;
    -[NSSQLCore _updateAutoVacuumMetadataWithValues:](*(unsigned __int8 **)(a1 + 16), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
    *(_DWORD *)(a1 + 312) &= ~0x20u;
  }
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  v14 = *(NSSQLiteStatement **)(a1 + 136);
  if (!v14)
  {
    v14 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, CFSTR("COMMIT"));
    *(_QWORD *)(a1 + 136) = v14;
  }
  -[NSSQLiteConnection prepareSQLStatement:](a1, v14);
  v15 = *(sqlite3_stmt **)(a1 + 136);
  if (v15)
    v16 = *((_QWORD *)v15 + 8);
  else
    v16 = 0;
  if (*(_QWORD *)(a1 + 80) != v16)
    -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v15);
  _execute(a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  *(_BYTE *)(a1 + 41) = 0;
  -[NSSQLiteConnection _clearTransactionCaches](a1);
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(a1 + 40) = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NSSQLConnectionCommitTransactionNotification"), a1);
  }
  objc_autoreleasePoolPop(v2);
}

- (void)_ensureNoStatementPrepared
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  if (*(_QWORD *)(a1 + 80))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Attempted to perform another operation with a statement prepared"), 0));
}

- (void)_clearTransactionCaches
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *Value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  __CFDictionary *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  __CFDictionary *v22;
  BOOL v23;
  __int128 v24;
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
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = *(void **)(a1 + 216);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 216), *(const void **)(*((_QWORD *)&v32 + 1) + 8 * i));
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v9 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v29 != v11)
                objc_enumerationMutation(Value);
              v13 = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, *(const void **)(*((_QWORD *)&v28 + 1) + 8 * j));
              -[NSSQLiteStatement clearCaches:](v13, 0);
              v14 = *(__CFDictionary **)(a1 + 152);
              if (v13)
                v15 = v14 == 0;
              else
                v15 = 1;
              if (!v15)
                CFDictionaryRemoveValue(v14, v13);
            }
            v10 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v10);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 216));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = *(void **)(a1 + 224);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 224), *(const void **)(*((_QWORD *)&v24 + 1) + 8 * k));
        -[NSSQLiteStatement clearCaches:](v21, 0);
        v22 = *(__CFDictionary **)(a1 + 152);
        if (v21)
          v23 = v22 == 0;
        else
          v23 = 1;
        if (!v23)
          CFDictionaryRemoveValue(v22, v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v18);
  }
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 224));
}

- (void)_performPostSaveTasks:(int)a3 andForceFullVacuum:
{
  NSObject *v6;
  uint64_t FileSizeFromJournalHandle;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  const __CFString *v18;
  CFMutableArrayRef v19;
  const __CFArray *v20;
  const __CFArray *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFArray *v24;
  const __CFArray *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CFMutableArrayRef v29;
  CFMutableArrayRef v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  if (a1)
  {
    v6 = *(NSObject **)(a1 + 8);
    if (v6)
      dispatch_assert_queue_V2(v6);
    if (*(_QWORD *)(a1 + 72) && (objc_msgSend(*(id *)(a1 + 16), "isReadOnly") & 1) == 0)
    {
      FileSizeFromJournalHandle = readFileSizeFromJournalHandle(*(sqlite3 **)(a1 + 72));
      if (FileSizeFromJournalHandle <= 0x800000)
      {
        v14 = 0;
        if ((a2 & 1) != 0)
          goto LABEL_16;
      }
      else
      {
        _NSCoreDataLog(9, (uint64_t)CFSTR("PostSaveMaintenance: fileSize %lld greater than prune threshold"), v8, v9, v10, v11, v12, v13, FileSizeFromJournalHandle);
        if (*(_QWORD *)(a1 + 296) != 0x7FFFFFFFFFFFFFFFLL)
          *(_QWORD *)(a1 + 296) = 0;
        v14 = 1;
        if ((a2 & 1) != 0)
          goto LABEL_16;
      }
      if (!a3)
      {
        v15 = *(_QWORD *)(a1 + 296);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_45;
        v16 = (uint64_t *)(a1 + 296);
        if (v15)
        {
          v17 = v15 - 1;
LABEL_44:
          *v16 = v17;
          goto LABEL_45;
        }
LABEL_20:
        if ((a3 & 1) != 0)
        {
          _NSCoreDataLog(2, (uint64_t)CFSTR("PostSaveMaintenance: Full Vacuum"), v8, v9, v10, v11, v12, v13, v34);
          v19 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, CFSTR("vacuum"));
          if (v19)
            CFRelease(v19);
          goto LABEL_43;
        }
        v20 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, CFSTR("pragma page_count"));
        v21 = v20;
        if (v20)
        {
          if (CFArrayGetCount(v20))
          {
            v22 = *(_QWORD *)CFArrayGetValueAtIndex(v21, 0);
            if (!v22)
            {
              *v16 = 10;
              CFRelease(v21);
              v21 = 0;
            }
            v23 = *(_QWORD *)CFArrayGetValueAtIndex(v21, 1);
            if (v21)
              CFRelease(v21);
            if (v22)
            {
              v24 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, CFSTR("pragma freelist_count"));
              v25 = v24;
              if (v24)
              {
                if (CFArrayGetCount(v24))
                {
                  v26 = *(_QWORD *)CFArrayGetValueAtIndex(v25, 0);
                  if (!v26)
                  {
                    *v16 = 10;
                    CFRelease(v25);
                    v25 = 0;
                  }
                  v27 = *(_QWORD *)CFArrayGetValueAtIndex(v25, 1);
                  if (v25)
                    CFRelease(v25);
                  *v16 = 10;
                  if (v27)
                  {
                    if ((a2 & 1) != 0)
                    {
                      _NSCoreDataLog(4, (uint64_t)CFSTR("PostSaveMaintenance: forced incremental_vacuum - %ld"), v8, v9, v10, v11, v12, v13, v27);
                      v34 = v27;
                      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("pragma incremental_vacuum(%d)"));
                      v29 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, v28);

                      if (!v29)
                        goto LABEL_45;
                      goto LABEL_39;
                    }
                    if (v26)
                    {
                      v31 = (double)(v23 - v27) / (double)v23;
                      if (v27 > 1023 || v31 <= 0.85)
                      {
                        v32 = v31 >= 0.4 ? v27 / 5 : v27 - (v23 - v27);
                        _NSCoreDataLog(9, (uint64_t)CFSTR("PostSaveMaintenance: incremental_vacuum with freelist_count - %ld and pages_to_free %lld"), v8, v9, v10, v11, v12, v13, v27);
                        v34 = v32;
                        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("pragma incremental_vacuum(%d)"));
                        v29 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, v33);

                        if (v29)
LABEL_39:
                          CFRelease(v29);
                      }
                    }
                  }
LABEL_45:
                  if (!v14)
                    return;
                  goto LABEL_46;
                }
                *v16 = 10;
                CFRelease(v25);
LABEL_43:
                v17 = 10;
                goto LABEL_44;
              }
            }
          }
          else
          {
            *v16 = 10;
            CFRelease(v21);
          }
        }
        else
        {
          *v16 = 10;
        }
        *v16 = 10;
        goto LABEL_43;
      }
LABEL_16:
      v18 = CFSTR("forceVacuum");
      if (a2)
        v18 = CFSTR("forceWalCheckpoint");
      _NSCoreDataLog(4, (uint64_t)CFSTR("PostSaveMaintenance: %@ override"), v8, v9, v10, v11, v12, v13, (uint64_t)v18);
      if (*(_QWORD *)(a1 + 296) == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_46:
        _NSCoreDataLog(4, (uint64_t)CFSTR("PostSaveMaintenance: wal_checkpoint(TRUNCATE) "), v8, v9, v10, v11, v12, v13, v34);
        sqlite3_busy_timeout(*(sqlite3 **)(a1 + 72), 1);
        v30 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, CFSTR("pragma wal_checkpoint(TRUNCATE)"));
        if (v30)
          CFRelease(v30);
        -[NSSQLiteConnection _restoreBusyTimeOutSettings](a1);
        return;
      }
      v16 = (uint64_t *)(a1 + 296);
      *(_QWORD *)(a1 + 296) = 0;
      v14 = 1;
      goto LABEL_20;
    }
  }
}

- (uint64_t)_clearSaveGeneratedCachedStatements
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(NSObject **)(result + 8);
    if (v2)
      dispatch_assert_queue_V2(v2);
    result = -[NSSQLiteConnection _countOfVMCachedStatements](v1);
    v3 = *(void **)(v1 + 200);
    if (v3)
    {
      v9 = 0u;
      v10 = 0u;
      v7 = 0u;
      v8 = 0u;
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (result)
      {
        v4 = result;
        v5 = *(_QWORD *)v8;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v8 != v5)
              objc_enumerationMutation(v3);
            -[NSSQLiteStatementCache _clearSaveGeneratedCachedStatements](objc_msgSend(*(id *)(v1 + 200), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++)));
          }
          while (v4 != v6);
          result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
          v4 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_countOfVMCachedStatements
{
  const __CFDictionary *v2;
  unint64_t Count;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void **v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  id *Value;
  id WeakRetained;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(const __CFDictionary **)(a1 + 152);
  if (!v2)
    return 0;
  Count = CFDictionaryGetCount(v2);
  v4 = Count;
  if (Count <= 1)
    v5 = 1;
  else
    v5 = Count;
  if (Count >= 0x201)
    v6 = 1;
  else
    v6 = v5;
  v7 = (const void **)((char *)v14 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (Count >= 0x201)
  {
    v7 = (const void **)NSAllocateScannedUncollectable();
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 152), v7, 0);
  }
  else
  {
    bzero((char *)v14 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 152), v7, 0);
    if (!v4)
      return 0;
  }
  v9 = 0;
  v8 = 0;
  do
  {
    v10 = v7[v9];
    Value = (id *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 152), v10);
    if (Value && (WeakRetained = objc_loadWeakRetained(Value + 1)) != 0)
    {
      ++v8;

    }
    else
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 152), v10);
    }
    ++v9;
  }
  while (v4 != v9);
  if (v4 >= 0x201)
    NSZoneFree(0, v7);
  return v8;
}

- (id)_setSaveRequest:(id *)result
{
  id *v3;

  if (result)
  {
    v3 = result;

    result = a2;
    v3[24] = result;
  }
  return result;
}

- (void)cacheCurrentDBStatementOn:(uint64_t)a1
{
  NSObject *v4;
  sqlite3_stmt *v5;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    v5 = *(sqlite3_stmt **)(a1 + 80);
    if (v5)
    {
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](a2, v5, a1);
      -[NSSQLiteConnection addVMCachedStatement:](a1, a2);
    }
  }
}

- (uint64_t)insertRow:(uint64_t)result
{
  NSObject *v3;
  const void *v4;
  NSSQLiteStatementCache *v5;
  NSSQLiteStatement *insertStatementCache;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSSQLiteStatementCache *v19;
  NSSQLiteStatement *v20;
  void *v21;
  void *v22;
  const __CFArray *v23;
  void *ValueAtIndex;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  __CFString *v56;
  CFDateRef v57;
  id v58;
  void *context;
  NSSQLiteStatementCache *v60;
  sqlite3_stmt *cachedSQLiteStatement;
  uint64_t v62;
  id v63;
  id obj;
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
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v62 = result;
    v3 = *(NSObject **)(result + 8);
    if (v3)
      dispatch_assert_queue_V2(v3);
    if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
      v4 = 0;
    else
      v4 = (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
    v5 = -[NSSQLiteConnection statementCacheForEntity:](v62, v4);
    v60 = v5;
    if (v5
      && (insertStatementCache = v5->_insertStatementCache) != 0
      && (cachedSQLiteStatement = insertStatementCache->_cachedSQLiteStatement) != 0)
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      {
        v7 = *(unsigned __int8 *)(v62 + 42);
        v8 = -[NSSQLiteStatement sqlString](insertStatementCache, "sqlString");
        if (v7)
          v15 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
        else
          v15 = CFSTR("%@");
        _NSCoreDataLog(6, (uint64_t)v15, v9, v10, v11, v12, v13, v14, v8);
      }
      *(_QWORD *)(v62 + 48) = insertStatementCache;
      v16 = *(NSObject **)(v62 + 8);
      if (v16)
        dispatch_assert_queue_V2(v16);
      context = (void *)MEMORY[0x18D76B4E4]();
      if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
        v17 = 0;
      else
        v17 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
      v21 = (void *)objc_msgSend(v17, "foreignKeyColumns");
      v22 = (void *)objc_msgSend(v17, "foreignEntityKeyColumns");
      obj = (id)objc_msgSend(v17, "foreignOrderKeyColumns");
      v63 = (id)objc_msgSend(v17, "attributeColumns");
      v23 = (const __CFArray *)objc_msgSend(*(id *)(v62 + 48), "bindVariables");
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v23, 0);
      if (a2)
        v25 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_referenceData64");
      else
        v25 = 0;
      objc_msgSend(ValueAtIndex, "setInt64:", v25);
      v26 = (void *)CFArrayGetValueAtIndex(v23, 1);
      if (a2 && (v27 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1")) != 0)
        v28 = *(unsigned int *)(v27 + 184);
      else
        v28 = 0;
      objc_msgSend(v26, "setUnsignedInt:", v28);
      v29 = (void *)CFArrayGetValueAtIndex(v23, 2);
      if (a2)
        v30 = *(unsigned int *)(*(_QWORD *)(a2 + 40) + 12);
      else
        v30 = 0;
      objc_msgSend(v29, "setInt64:", v30);
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v31 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v78;
        v33 = 3;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v78 != v32)
              objc_enumerationMutation(v21);
            v35 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            if ((objc_msgSend((id)objc_msgSend(v35, "toOneRelationship"), "isConstrained") & 1) == 0)
            {
              v36 = -[NSSQLRow foreignKeyForSlot:](a2, objc_msgSend(v35, "slot"));
              objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33++), "setInt64:", v36);
            }
          }
          v31 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
        }
        while (v31);
      }
      else
      {
        v33 = 3;
      }
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v37 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v74;
        do
        {
          v39 = 0;
          v40 = v33;
          do
          {
            if (*(_QWORD *)v74 != v38)
              objc_enumerationMutation(v22);
            v41 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v39), "slot");
            if (a2)
              v42 = *(unsigned __int16 *)(a2
                                        + _NSSQLRowInstanceSize
                                        + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                        + (((unint64_t)*(unsigned int *)(a2 + 16) >> 16) & 0xFFFC)
                                        + 2 * v41);
            else
              v42 = 0;
            objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33 + v39++), "setUnsignedInt:", v42);
          }
          while (v37 != v39);
          v43 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
          v37 = v43;
          v33 += v39;
        }
        while (v43);
        v33 = v40 + v39;
      }
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v70;
        do
        {
          v46 = 0;
          v47 = v33;
          do
          {
            if (*(_QWORD *)v70 != v45)
              objc_enumerationMutation(obj);
            v48 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v46), "slot");
            if (a2)
              v49 = *(unsigned int *)(a2
                                    + _NSSQLRowInstanceSize
                                    + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                    + 4 * v48);
            else
              v49 = 0;
            objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33 + v46++), "setUnsignedInt:", v49);
          }
          while (v44 != v46);
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          v44 = v50;
          v33 += v46;
        }
        while (v50);
        v33 = v47 + v46;
      }
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v51 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      if (v51)
      {
        v52 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v51; ++j)
          {
            if (*(_QWORD *)v66 != v52)
              objc_enumerationMutation(v63);
            v54 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            if ((objc_msgSend(v54, "isConstrained") & 1) == 0)
            {
              v55 = (void *)objc_msgSend(v54, "attributeDescription");
              if (v55 && objc_msgSend(v55, "superCompositeAttribute"))
              {
                v56 = -[NSPropertyDescription _elementPath]((__CFString *)objc_msgSend(v54, "propertyDescription"));
                v57 = (CFDateRef)-[__CFDate valueForKeyPath:](-[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, objc_msgSend(v54, "slot")), "valueForKeyPath:", v56);
              }
              else
              {
                v57 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, objc_msgSend(v54, "slot"));
              }
              objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33++), "setValue:", v57);
            }
          }
          v51 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
        }
        while (v51);
      }
      objc_autoreleasePoolPop(context);
      v18 = v62;
      *(_QWORD *)(v62 + 80) = cachedSQLiteStatement;
      v58 = *(id *)(v62 + 48);
    }
    else
    {
      v18 = v62;
      v19 = v5;
      v20 = -[NSSQLiteAdapter newInsertStatementWithRow:]((NSSQLiteStatement *)objc_msgSend((id)v62, "adapter"), a2);
      -[NSSQLiteConnection prepareSQLStatement:](v62, v20);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v18 + 48), *(sqlite3_stmt **)(v18 + 80), v18);
      -[NSSQLiteStatementCache cacheInsertStatement:](v19, *(_QWORD **)(v62 + 48));

      -[NSSQLiteConnection addVMCachedStatement:](v18, *(const void **)(v18 + 48));
    }
    objc_msgSend((id)v18, "execute");
    if (!*(_QWORD *)(v18 + 80))
      -[NSSQLiteStatementCache cacheInsertStatement:](v60, 0);
    -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v18);
    -[NSSQLiteConnection resetSQLStatement](v18);
    result = *(_QWORD *)(v18 + 72);
    if (result)
      result = sqlite3_changes((sqlite3 *)result);
    *(_DWORD *)(v18 + 88) = result;
  }
  return result;
}

- (void)processSaveRequest:(uint64_t)a1
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _DWORD *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  sqlite3_int64 v99;
  NSObject *v100;
  sqlite3_int64 v101;
  uint64_t v102;
  uint64_t v103;
  sqlite3_int64 v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  int v113;
  sqlite3_int64 v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSSQLiteStatementCache *v119;
  void *v120;
  id v121;
  id v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  id obj;
  uint64_t v135;
  uint64_t v136;
  void *context;
  void *contexta;
  void *m;
  void *v140;
  id v141;
  id v142;
  id n;
  id v144;
  id v145;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _QWORD v181[7];
  _QWORD v182[8];
  _QWORD v183[8];
  _QWORD v184[7];
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _BYTE v202[128];
  _BYTE v203[128];
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!a2)
  {
    obj = (id)-[NSSQLSavePlan newInsertedRows](0);
    goto LABEL_244;
  }
  v2 = *(id **)(a2 + 96);
  obj = (id)-[NSSQLSavePlan newInsertedRows]((uint64_t)v2);
  if (!v2)
  {
LABEL_244:
    v128 = 0;
    v129 = 0;
    v148 = 0;
    goto LABEL_5;
  }
  v148 = (id)objc_msgSend(v2[6], "mutableCopy");
  v128 = (id)objc_msgSend(v2[7], "mutableCopy");
  v129 = v2[5];
LABEL_5:
  v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (!objc_msgSend(obj, "count"))
    goto LABEL_28;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v192, 16);
  if (!v4)
    goto LABEL_25;
  v5 = *(_QWORD *)v162;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v162 != v5)
        objc_enumerationMutation(obj);
      v7 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * i);
      v8 = *(_QWORD *)(a1 + 16);
      if (v8)
        v9 = (void *)objc_msgSend(*(id *)(v8 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
      else
        v9 = 0;
      if (objc_msgSend(v9, "count"))
      {
        v10 = *(_QWORD *)(a1 + 16);
        if (v10)
        {
          v11 = (void *)objc_msgSend(*(id *)(v10 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
          if (v7)
            goto LABEL_16;
LABEL_20:
          v12 = 0;
        }
        else
        {
          v11 = 0;
          if (!v7)
            goto LABEL_20;
LABEL_16:
          if ((*(_BYTE *)(v7 + 16) & 2) != 0)
            goto LABEL_20;
          v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v7 + 40) + 16), "_storeInfo1");
        }
        if ((objc_msgSend(v11, "containsObject:", objc_msgSend(v12, "name")) & 1) != 0)
          continue;
      }
      objc_msgSend(v3, "addObject:", v7);
    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v192, 16);
  }
  while (v4);
LABEL_25:
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v124, "setValue:forKey:", v3, CFSTR("inserted"));

LABEL_28:
  if (objc_msgSend(v148, "count"))
  {
    v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v148, "count"));
    v144 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v141 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a2)
      v13 = *(_QWORD *)(a2 + 96);
    else
      v13 = 0;
    v130 = (id)-[NSSQLSavePlan newCorrelationTableUpdates](v13);
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v14 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v185, v203, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v186;
      v16 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v186 != v15)
            objc_enumerationMutation(v130);
          v18 = *(_QWORD **)(*((_QWORD *)&v185 + 1) + 8 * j);
          v19 = (void *)MEMORY[0x18D76B4E4]();
          if (v18)
          {
            if (v18[2])
            {
              v184[0] = v16;
              v184[1] = 3221225472;
              v184[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke;
              v184[3] = &unk_1E1EE0080;
              v184[4] = a1;
              v184[5] = v144;
              v184[6] = v18;
              -[NSSQLCorrelationTableUpdateTracker enumerateInsertsOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v184);
            }
            if (v18[5])
            {
              v183[0] = v16;
              v183[1] = 3221225472;
              v183[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_2;
              v183[3] = &unk_1E1EE00A8;
              v183[4] = a1;
              v183[5] = v144;
              v183[6] = v18;
              v183[7] = v141;
              -[NSSQLCorrelationTableUpdateTracker enumerateReordersOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v183);
            }
            if (v18[4])
            {
              v182[0] = v16;
              v182[1] = 3221225472;
              v182[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_3;
              v182[3] = &unk_1E1EE00A8;
              v182[4] = a1;
              v182[5] = v144;
              v182[6] = v18;
              v182[7] = v141;
              -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v182);
            }
            if (v18[3])
            {
              v181[0] = v16;
              v181[1] = 3221225472;
              v181[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_4;
              v181[3] = &unk_1E1EE0080;
              v181[4] = a1;
              v181[5] = v144;
              v181[6] = v18;
              -[NSSQLCorrelationTableUpdateTracker enumerateDeletesOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v181);
            }
          }
          objc_autoreleasePoolPop(v19);
        }
        v14 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v185, v203, 16);
      }
      while (v14);
    }
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    if (a2 && (v20 = *(_QWORD *)(a2 + 96)) != 0)
      v21 = *(void **)(v20 + 128);
    else
      v21 = 0;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v177, v202, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v178;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v178 != v23)
            objc_enumerationMutation(v21);
          v25 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * v24);
          v26 = (void *)MEMORY[0x18D76B4E4]();
          v27 = (void *)objc_msgSend(v144, "objectForKey:", v25);
          if (a2 && (v28 = *(_QWORD *)(a2 + 96)) != 0)
            v29 = *(void **)(v28 + 128);
          else
            v29 = 0;
          v30 = objc_msgSend(v29, "objectForKey:", v25);
          if (v27)
            objc_msgSend(v27, "unionSet:", v30);
          else
            objc_msgSend(v144, "setValue:forKey:", v30, v25);
          objc_autoreleasePoolPop(v26);
          ++v24;
        }
        while (v22 != v24);
        v31 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v177, v202, 16);
        v22 = v31;
      }
      while (v31);
    }
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v32 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v173, &v198, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v174;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v174 != v33)
            objc_enumerationMutation(v144);
          v35 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * k);
          v36 = (void *)MEMORY[0x18D76B4E4]();
          v37 = (void *)_sqlEntityForEntityID(objc_msgSend(*(id *)(a1 + 16), "model"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "componentsSeparatedByString:", CFSTR("-")), "firstObject"), "longLongValue"));
          v38 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]((uint64_t)_NSPersistentHistoryChange, v37, (void *)objc_msgSend(v144, "objectForKey:", v35));
          -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](a2, v38, (uint64_t)v35);

          objc_autoreleasePoolPop(v36);
        }
        v32 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v173, &v198, 16);
      }
      while (v32);
    }
    if (objc_msgSend(v141, "count"))
    {
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v141, "count"));
      v171 = 0u;
      v172 = 0u;
      v169 = 0u;
      v170 = 0u;
      v40 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v169, &v194, 16);
      if (!v40)
        goto LABEL_103;
      v135 = v40;
      v125 = v39;
      v132 = *(_QWORD *)v170;
      while (1)
      {
        for (m = 0; m != (void *)v135; m = (char *)m + 1)
        {
          if (*(_QWORD *)v170 != v132)
            objc_enumerationMutation(v141);
          v41 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)m);
          context = (void *)MEMORY[0x18D76B4E4]();
          v42 = (void *)objc_msgSend(v41, "componentsSeparatedByString:", CFSTR("-"));
          v43 = _sqlEntityForEntityID(objc_msgSend(*(id *)(a1 + 16), "model"), objc_msgSend((id)objc_msgSend(v42, "firstObject"), "longLongValue"));
          v44 = (void *)objc_msgSend(v141, "objectForKey:", v41);
          if (a2 && objc_msgSend(*(id *)(a2 + 144), "objectForKey:", v41))
          {
            v44 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v44);
            objc_msgSend(v44, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v144, "objectForKey:", v41), "allObjects"));
          }
          v45 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]((uint64_t)_NSPersistentHistoryChange, v43, v44);
          -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](a2, v45, (uint64_t)v41);

          v167 = 0u;
          v168 = 0u;
          v165 = 0u;
          v166 = 0u;
          v46 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v165, v193, 16);
          if (!v46)
            goto LABEL_97;
          v47 = *(_QWORD *)v166;
          do
          {
            v48 = 0;
            do
            {
              if (*(_QWORD *)v166 != v47)
                objc_enumerationMutation(v148);
              v49 = *(_QWORD **)(*((_QWORD *)&v165 + 1) + 8 * v48);
              if (v49 && (v50 = objc_msgSend(*(id *)(v49[5] + 16), "_storeInfo1")) != 0)
              {
                v51 = *(_DWORD *)(v50 + 184);
                if (!v43)
                  goto LABEL_95;
              }
              else
              {
                v51 = 0;
                if (!v43)
                {
LABEL_95:
                  v52 = 0;
                  goto LABEL_90;
                }
              }
              v52 = v43[46];
LABEL_90:
              if (v51 == v52)
              {
                v53 = objc_msgSend((id)objc_msgSend(v49, "objectID"), "_referenceData64");
                if (v53 == objc_msgSend((id)objc_msgSend(v42, "lastObject"), "longLongValue"))
                  goto LABEL_98;
              }
              ++v48;
            }
            while (v46 != v48);
            v54 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v165, v193, 16);
            v46 = v54;
          }
          while (v54);
LABEL_97:
          objc_msgSend(v125, "setValue:forKey:", v44, v41);
LABEL_98:
          objc_autoreleasePoolPop(context);
        }
        v135 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v169, &v194, 16);
        if (!v135)
        {
          v39 = v125;
          goto LABEL_103;
        }
      }
    }
    v39 = 0;
LABEL_103:

    if (!objc_msgSend(v39, "count"))
    {

      v39 = 0;
    }
    v145 = v39;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v55 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v157, v191, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v158;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v158 != v56)
            objc_enumerationMutation(v148);
          v58 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * v57);
          v59 = (void *)MEMORY[0x18D76B4E4]();
          v60 = *(_QWORD *)(a1 + 16);
          if (v60)
            v61 = (void *)objc_msgSend(*(id *)(v60 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
          else
            v61 = 0;
          if (objc_msgSend(v61, "count"))
          {
            v62 = *(_QWORD *)(a1 + 16);
            if (v62)
            {
              v63 = (void *)objc_msgSend(*(id *)(v62 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
              if (v58)
                goto LABEL_115;
LABEL_119:
              v64 = 0;
            }
            else
            {
              v63 = 0;
              if (!v58)
                goto LABEL_119;
LABEL_115:
              if ((*(_BYTE *)(v58 + 16) & 2) != 0)
                goto LABEL_119;
              v64 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v58 + 40) + 16), "_storeInfo1");
            }
            if ((objc_msgSend(v63, "containsObject:", objc_msgSend(v64, "name")) & 1) != 0)
              goto LABEL_128;
          }
          v65 = (void *)MEMORY[0x1E0CB3940];
          if (v58)
          {
            v66 = objc_msgSend(*(id *)(*(_QWORD *)(v58 + 40) + 16), "_storeInfo1");
            if (v66)
              v67 = *(unsigned int *)(v66 + 184);
            else
              v67 = 0;
            v68 = objc_msgSend(*(id *)(*(_QWORD *)(v58 + 40) + 16), "_referenceData64");
          }
          else
          {
            v67 = 0;
            v68 = 0;
          }
          v69 = objc_msgSend(v65, "stringWithFormat:", CFSTR("%u-%lld"), v67, v68);
          if (a2 && objc_msgSend(*(id *)(a2 + 144), "objectForKey:", v69))
            objc_msgSend(v126, "addObject:", v58);
LABEL_128:
          objc_autoreleasePoolPop(v59);
          ++v57;
        }
        while (v55 != v57);
        v70 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v157, v191, 16);
        v55 = v70;
      }
      while (v70);
    }
    if (objc_msgSend(v126, "count"))
      objc_msgSend(v124, "setValue:forKey:", v126, CFSTR("updated"));

  }
  else
  {
    v145 = 0;
  }
  if (!objc_msgSend(v128, "count"))
    goto LABEL_170;
  v142 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v128, "count"));
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v71 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v153, v190, 16);
  if (!v71)
    goto LABEL_165;
  v72 = *(_QWORD *)v154;
  while (2)
  {
    v73 = 0;
    while (2)
    {
      if (*(_QWORD *)v154 != v72)
        objc_enumerationMutation(v128);
      v74 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * v73);
      v75 = (void *)MEMORY[0x18D76B4E4]();
      v76 = *(_QWORD *)(a1 + 16);
      if (v76)
        v77 = (void *)objc_msgSend(*(id *)(v76 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
      else
        v77 = 0;
      if (!objc_msgSend(v77, "count"))
        goto LABEL_153;
      v78 = *(_QWORD *)(a1 + 16);
      if (v78)
      {
        v79 = (void *)objc_msgSend(*(id *)(v78 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
        if (v74)
          goto LABEL_147;
LABEL_151:
        v80 = 0;
      }
      else
      {
        v79 = 0;
        if (!v74)
          goto LABEL_151;
LABEL_147:
        if ((*(_BYTE *)(v74 + 16) & 2) != 0)
          goto LABEL_151;
        v80 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v74 + 40) + 16), "_storeInfo1");
      }
      if ((objc_msgSend(v79, "containsObject:", objc_msgSend(v80, "name")) & 1) == 0)
      {
LABEL_153:
        v81 = (void *)MEMORY[0x1E0CB3940];
        if (v74)
        {
          v82 = objc_msgSend(*(id *)(*(_QWORD *)(v74 + 40) + 16), "_storeInfo1");
          if (v82)
            v83 = *(unsigned int *)(v82 + 184);
          else
            v83 = 0;
          v84 = objc_msgSend(*(id *)(*(_QWORD *)(v74 + 40) + 16), "_referenceData64");
        }
        else
        {
          v83 = 0;
          v84 = 0;
        }
        v85 = objc_msgSend(v81, "stringWithFormat:", CFSTR("%u-%lld"), v83, v84);
        if (a2)
        {
          v86 = v85;
          if (objc_msgSend(*(id *)(a2 + 144), "objectForKey:", v85))
          {
            objc_msgSend(v142, "addObject:", v74);
            objc_msgSend(v145, "removeObjectForKey:", v86);
          }
        }
      }
      objc_autoreleasePoolPop(v75);
      if (v71 != ++v73)
        continue;
      break;
    }
    v87 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v153, v190, 16);
    v71 = v87;
    if (v87)
      continue;
    break;
  }
LABEL_165:
  if (objc_msgSend(v142, "count"))
  {
    v88 = (void *)objc_msgSend(v124, "objectForKey:", CFSTR("updated"));
    if (v88)
      objc_msgSend(v88, "addObjectsFromArray:", objc_msgSend(v142, "allObjects"));
    else
      objc_msgSend(v124, "setValue:forKey:", v142, CFSTR("updated"));
  }

LABEL_170:
  if (!objc_msgSend(v129, "count"))
    goto LABEL_193;
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v129, "count"));
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v90 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v149, v189, 16);
  if (!v90)
    goto LABEL_190;
  v91 = *(_QWORD *)v150;
  while (2)
  {
    v92 = 0;
    while (2)
    {
      if (*(_QWORD *)v150 != v91)
        objc_enumerationMutation(v129);
      v93 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * v92);
      v94 = *(_QWORD *)(a1 + 16);
      if (v94)
        v95 = (void *)objc_msgSend(*(id *)(v94 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
      else
        v95 = 0;
      if (!objc_msgSend(v95, "count"))
        goto LABEL_187;
      v96 = *(_QWORD *)(a1 + 16);
      if (v96)
      {
        v97 = (void *)objc_msgSend(*(id *)(v96 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
        if (v93)
          goto LABEL_181;
LABEL_185:
        v98 = 0;
      }
      else
      {
        v97 = 0;
        if (!v93)
          goto LABEL_185;
LABEL_181:
        if ((*(_BYTE *)(v93 + 16) & 2) != 0)
          goto LABEL_185;
        v98 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v93 + 40) + 16), "_storeInfo1");
      }
      if ((objc_msgSend(v97, "containsObject:", objc_msgSend(v98, "name")) & 1) == 0)
LABEL_187:
        objc_msgSend(v89, "addObject:", v93);
      if (v90 != ++v92)
        continue;
      break;
    }
    v90 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v149, v189, 16);
    if (v90)
      continue;
    break;
  }
LABEL_190:
  if (objc_msgSend(v89, "count"))
    objc_msgSend(v124, "setValue:forKey:", v89, CFSTR("deleted"));

LABEL_193:
  if (objc_msgSend(v124, "count"))
  {
    v131 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, a2);
    v99 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, a2, v131);
    if (objc_msgSend(v124, "objectForKey:", CFSTR("inserted")))
      -[NSSQLiteConnection insertChanges:type:transactionID:context:](a1, (void *)objc_msgSend(v124, "objectForKey:", CFSTR("inserted")), 0, v99, a2);
    if (objc_msgSend(v124, "objectForKey:", CFSTR("updated")))
      -[NSSQLiteConnection insertChanges:type:transactionID:context:](a1, (void *)objc_msgSend(v124, "objectForKey:", CFSTR("updated")), 1, v99, a2);
    if (objc_msgSend(v124, "objectForKey:", CFSTR("deleted")))
      -[NSSQLiteConnection insertChanges:type:transactionID:context:](a1, (void *)objc_msgSend(v124, "objectForKey:", CFSTR("deleted")), 2, v99, a2);
    if (objc_msgSend(v145, "count"))
    {
      v100 = *(NSObject **)(a1 + 8);
      if (v100)
        dispatch_assert_queue_V2(v100);
      if (objc_msgSend(v145, "count"))
      {
        v127 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        contexta = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
        v101 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)contexta, objc_msgSend(v145, "count"));
        if (!v101)
        {
          v121 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("unable to generate primary keys"), 0);
          objc_exception_throw(v121);
        }
        v102 = objc_msgSend(v145, "count");
        v201 = 0u;
        v200 = 0u;
        v199 = 0u;
        v198 = 0u;
        v103 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v198, v203, 16);
        if (v103)
        {
          v136 = v103;
          v104 = v101 - v102;
          v133 = *(_QWORD *)v199;
          do
          {
            for (n = 0; n != (id)v136; n = (char *)n + 1)
            {
              if (*(_QWORD *)v199 != v133)
                objc_enumerationMutation(v145);
              v105 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * (_QWORD)n);
              v140 = (void *)MEMORY[0x18D76B4E4]();
              v106 = (void *)objc_msgSend(v105, "componentsSeparatedByString:", CFSTR("-"));
              -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, contexta);
              v197 = 0u;
              v196 = 0u;
              v195 = 0u;
              v194 = 0u;
              v107 = (void *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
              v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v194, v202, 16);
              ++v104;
              if (v108)
              {
                v109 = *(_QWORD *)v195;
                do
                {
                  v110 = 0;
                  do
                  {
                    if (*(_QWORD *)v195 != v109)
                      objc_enumerationMutation(v107);
                    v111 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v110);
                    v112 = (void *)MEMORY[0x18D76B4E4]();
                    if (!objc_msgSend(v111, "index"))
                    {
                      v113 = objc_msgSend(v111, "sqlType");
                      v114 = v104;
                      if (v113 == 2)
                      {
LABEL_221:
                        objc_msgSend(v111, "setInt64:", v114);
                        goto LABEL_229;
                      }
                    }
                    if (objc_msgSend(v111, "index") != 1
                      && objc_msgSend(v111, "index") != 2)
                    {
                      if (objc_msgSend(v111, "index") == 3)
                      {
                        v115 = objc_msgSend(v111, "sqlType");
                        v114 = v99;
                        if (v115 == 2)
                          goto LABEL_221;
                      }
                      if (objc_msgSend(v111, "index", v114) == 4)
                      {
                        v116 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
LABEL_224:
                        objc_msgSend(v111, "setValue:", v116);
                        goto LABEL_229;
                      }
                      if (objc_msgSend(v111, "index") == 5)
                      {
                        if (a2)
                          v117 = objc_msgSend(*(id *)(a2 + 144), "objectForKey:", v105);
                        else
                          v117 = 0;
                        objc_msgSend(v111, "setValue:", v117);
                      }
                      else
                      {
                        if (objc_msgSend(v111, "index") == 6)
                        {
                          v116 = objc_msgSend(v106, "firstObject");
                          goto LABEL_224;
                        }
                        if (objc_msgSend(v111, "index") == 7)
                        {
                          v116 = objc_msgSend(v106, "lastObject");
                          goto LABEL_224;
                        }
                      }
                    }
LABEL_229:
                    objc_autoreleasePoolPop(v112);
                    ++v110;
                  }
                  while (v108 != v110);
                  v118 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v194, v202, 16);
                  v108 = v118;
                }
                while (v118);
              }
              objc_msgSend((id)a1, "execute");
              if (!*(_QWORD *)(a1 + 80))
              {
                v119 = -[NSSQLiteConnection statementCacheForEntity:](a1, contexta);
                -[NSSQLiteStatementCache cacheInsertStatement:](v119, 0);
              }
              -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
              -[NSSQLiteConnection resetSQLStatement](a1);
              objc_autoreleasePoolPop(v140);
            }
            v136 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v198, v203, 16);
          }
          while (v136);
        }
        objc_msgSend(v127, "drain");
        v122 = 0;
      }
    }
    v123 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v99);
    if (a2)
      *(_QWORD *)(a2 + 72) = v123;
    v120 = v131;
  }
  else
  {
    v120 = 0;
  }

}

- (void)writeCorrelationReordersFromTracker:(uint64_t)a1
{
  NSObject *v4;
  __CFString *v5;
  void *v6;
  NSSQLiteStatementCache *v7;
  __CFDictionary *v8;
  const __CFDictionary *correlationReorderCache;
  NSSQLiteStatement *Value;
  NSSQLiteStatement *v11;
  sqlite3_stmt *cachedSQLiteStatement;
  int v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if (a2 && *(_QWORD *)(a2 + 40))
    {
      v5 = *(__CFString **)(a2 + 8);
      v6 = v5 ? (void *)objc_msgSend(*(id *)(a2 + 8), "propertyDescription") : 0;
      if (objc_msgSend((id)objc_msgSend(v6, "inverseRelationship"), "isOrdered"))
      {
        v7 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
        v8 = (__CFDictionary *)v7;
        if (v7
          && (correlationReorderCache = v7->_correlationReorderCache) != 0
          && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationReorderCache, v5)) != 0
          && (v11 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
        {
          v13 = 0;
          *(_QWORD *)(a1 + 80) = cachedSQLiteStatement;
        }
        else
        {
          v11 = -[NSSQLiteAdapter newCorrelationReorderStatementForRelationship:]((_QWORD *)objc_msgSend((id)a1, "adapter"), v5);
          -[NSSQLiteConnection prepareSQLStatement:](a1, v11);
          -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v11, *(sqlite3_stmt **)(a1 + 80), a1);
          -[NSSQLiteStatementCache cacheCorrelationReorderStatement:forRelationship:](v8, v11, v5);

          v13 = 1;
        }
        v21 = 0;
        v22 = &v21;
        v23 = 0x2020000000;
        v24 = 0;
        v15 = 0;
        v16 = &v15;
        v17 = 0x3052000000;
        v18 = __Block_byref_object_copy__29;
        v19 = __Block_byref_object_dispose__29;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __58__NSSQLiteConnection_writeCorrelationReordersFromTracker___block_invoke;
        v14[3] = &unk_1E1EDFFE0;
        v14[4] = a1;
        v14[5] = &v21;
        v14[6] = &v15;
        -[NSSQLCorrelationTableUpdateTracker enumerateReordersUsingBlock:](a2, (uint64_t)v14);
        if (v13)
          -[NSSQLiteConnection addVMCachedStatement:](a1, v11);
        if (*((_BYTE *)v22 + 24))
          objc_exception_throw((id)v16[5]);
        -[NSSQLiteConnection resetSQLStatement](a1);
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v21, 8);
      }
    }
  }
}

- (uint64_t)updateConstrainedValuesForRow:(uint64_t)result
{
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  NSObject *v6;
  void *Value;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSSQLiteStatement *v21;
  void *v22;
  void *v23;
  const __CFArray *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *ValueAtIndex;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  CFDateRef v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  const __CFArray *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  sqlite3 *v53;
  void *v54;
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
  void *context;
  uint64_t v71;
  void *key;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = *(NSObject **)(result + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
      v5 = 0;
    else
      v5 = (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
    v68 = objc_msgSend((id)a2, "objectID");
    v6 = *(NSObject **)(v3 + 8);
    if (v6)
      dispatch_assert_queue_V2(v6);
    Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 224), v5);
    key = (void *)v5;
    if (Value && (v8 = Value, (v71 = *((_QWORD *)Value + 8)) != 0))
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      {
        v9 = *(unsigned __int8 *)(v3 + 42);
        v10 = objc_msgSend(v8, "sqlString");
        if (v9)
          v17 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
        else
          v17 = CFSTR("%@");
        _NSCoreDataLog(6, (uint64_t)v17, v11, v12, v13, v14, v15, v16, v10);
      }
      *(_QWORD *)(v3 + 48) = v8;
      v18 = *(NSObject **)(v3 + 8);
      if (v18)
        dispatch_assert_queue_V2(v18);
      context = (void *)MEMORY[0x18D76B4E4]();
      if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
        v19 = 0;
      else
        v19 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
      v22 = (void *)objc_msgSend(v19, "attributeColumns");
      v23 = (void *)objc_msgSend(v19, "foreignKeyColumns");
      v69 = v3;
      v24 = (const __CFArray *)objc_msgSend(*(id *)(v3 + 48), "bindVariables");
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v25 = 0;
      v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v78 != v27)
              objc_enumerationMutation(v23);
            v29 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v29, "toOneRelationship"), "isConstrained"))
            {
              ValueAtIndex = (void *)CFArrayGetValueAtIndex(v24, v25);
              objc_msgSend(ValueAtIndex, "setInt64:", -[NSSQLRow foreignKeyForSlot:](a2, objc_msgSend(v29, "slot")));
              ++v25;
            }
          }
          v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        }
        while (v26);
      }
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v74 != v32)
              objc_enumerationMutation(v22);
            v34 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            if (objc_msgSend(v34, "isConstrained"))
            {
              v35 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, objc_msgSend(v34, "slot"));
              objc_msgSend((id)CFArrayGetValueAtIndex(v24, v25++), "setValue:", v35);
            }
          }
          v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
        }
        while (v31);
      }
      v36 = (void *)CFArrayGetValueAtIndex(v24, v25);
      if (a2)
        v37 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_referenceData64");
      else
        v37 = 0;
      objc_msgSend(v36, "setInt64:", v37);
      objc_autoreleasePoolPop(context);
      v3 = v69;
      *(_QWORD *)(v69 + 80) = v71;
      v38 = *(id *)(v69 + 48);
    }
    else
    {
      v20 = (void *)v5;
      v21 = -[NSSQLiteAdapter newConstrainedValuesUpdateStatementWithRow:]((NSSQLiteStatement *)objc_msgSend((id)v3, "adapter"), a2);
      -[NSSQLiteConnection prepareSQLStatement:](v3, v21);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v3 + 48), *(sqlite3_stmt **)(v3 + 80), v3);
      -[NSSQLiteConnection cacheUpdateConstrainedValuesStatement:forEntity:](v3, *(void **)(v3 + 48), v20);

      -[NSSQLiteConnection addVMCachedStatement:](v3, *(const void **)(v3 + 48));
    }
    objc_msgSend((id)v3, "execute");
    v39 = key;
    if (!*(_QWORD *)(v3 + 80))
      -[NSSQLiteConnection cacheUpdateConstrainedValuesStatement:forEntity:](v3, 0, key);
    v40 = *(NSObject **)(v3 + 8);
    if (v40)
      dispatch_assert_queue_V2(v40);
    v41 = (void *)objc_msgSend(*(id *)(v3 + 48), "entity", v39);
    v42 = v3;
    v43 = (const __CFArray *)objc_msgSend(*(id *)(v3 + 48), "bindVariables");
    v44 = (void *)objc_msgSend(v41, "foreignKeyColumns");
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v45 = 0;
    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v78 != v47)
            objc_enumerationMutation(v44);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * k), "toOneRelationship"), "isConstrained"))objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45++), "setInt64:", 0);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      }
      while (v46);
    }
    v49 = (void *)objc_msgSend(v41, "attributeColumns");
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v50; ++m)
        {
          if (*(_QWORD *)v74 != v51)
            objc_enumerationMutation(v49);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * m), "isConstrained"))
            objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45++), "setValue:", 0);
        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      }
      while (v50);
    }
    objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45), "setInt64:", 0);
    -[NSSQLiteConnection resetSQLStatement](v42);
    v53 = *(sqlite3 **)(v42 + 72);
    if (v53)
    {
      result = sqlite3_changes(v53);
      *(_DWORD *)(v42 + 88) = result;
      if ((_DWORD)result == 1)
        return result;
    }
    else
    {
      *(_DWORD *)(v42 + 88) = 0;
    }
    v54 = (void *)objc_opt_class();
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") <= 1)
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
        _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  During updateConstrainedValuesForRow, rows processed = %d.  Row was updated."), v61, v62, v63, v64, v65, v66, v68);
    }
    else
    {
      _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  During updateConstrainedValuesForRow, rows processed = %d.  New Row = %@"), v55, v56, v57, v58, v59, v60, v68);
    }
    v82 = CFSTR("_NSCoreDataOptimisticLockingFailureConflictsKey");
    v81 = objc_msgSend((id)a2, "objectID");
    v83 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v67 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    objc_exception_throw((id)objc_msgSend(v54, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("optimistic locking failure"), v67));
  }
  return result;
}

- (void)cacheUpdateConstrainedValuesStatement:(void *)key forEntity:
{
  NSObject *v6;
  __CFDictionary *v7;

  v6 = *(NSObject **)(a1 + 8);
  if (v6)
    dispatch_assert_queue_V2(v6);
  v7 = *(__CFDictionary **)(a1 + 224);
  if (value)
    CFDictionarySetValue(v7, key, value);
  else
    CFDictionaryRemoveValue(v7, key);
}

- (uint64_t)_hasHistoryTransactionStringTable
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = result;
    if ((*(_DWORD *)(result + 312) & 0x400) != 0)
    {
      v2 = *(_DWORD *)(result + 312) & 0x400;
    }
    else
    {
      if (-[NSSQLiteConnection _hasTableWithName:isTemp:](result, (uint64_t)CFSTR("ATRANSACTIONSTRING"), 0))v2 = 1024;
      else
        v2 = 0;
      *(_DWORD *)(v1 + 312) = *(_DWORD *)(v1 + 312) & 0xFFFFFBFF | v2;
    }
    return v2 != 0;
  }
  return result;
}

- (void)dealloc
{
  NSObject *current_queue;
  objc_super v4;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__NSSQLiteConnection_dealloc__block_invoke;
  block[3] = &unk_1E1EDD520;
  block[4] = self;
  current_queue = dispatch_get_current_queue();
  if (dispatch_get_context(current_queue) == self)
    __29__NSSQLiteConnection_dealloc__block_invoke((uint64_t)block);
  else
    dispatch_sync((dispatch_queue_t)self->_queue, block);
  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLiteConnection;
  -[NSSQLiteConnection dealloc](&v4, sel_dealloc);
}

+ (uint64_t)readMagicWordFromPath:(void *)a3 options:
{
  int v5;
  uint64_t MagicWordFromDBHandle;
  BOOL v7;
  char v8;
  id v9;
  int v10;
  sqlite3 *v11;
  stat v13;
  sqlite3 *v14;

  objc_opt_self();
  v14 = 0;
  memset(&v13, 0, sizeof(v13));
  v5 = stat(a2, &v13);
  MagicWordFromDBHandle = 0;
  if (v5)
    v7 = 0;
  else
    v7 = v13.st_size == 0;
  v8 = v7;
  if (v5 != 2 && (v8 & 1) == 0)
  {
    if (!strncmp("/dev/null", a2, 9uLL))
    {
      return 0;
    }
    else
    {
      v9 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
      v10 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, a2, v9, &v14, 1, 0);
      v11 = v14;
      if (v10 == 26)
      {
        MagicWordFromDBHandle = 92;
        if (!v14)
          return MagicWordFromDBHandle;
        goto LABEL_19;
      }
      if (v14)
      {
        if (v10)
          MagicWordFromDBHandle = 92;
        else
          MagicWordFromDBHandle = readMagicWordFromDBHandle(v14);
LABEL_19:
        sqlite3_close_v2(v11);
        return MagicWordFromDBHandle;
      }
      return 0xFFFFFFFFLL;
    }
  }
  return MagicWordFromDBHandle;
}

+ (uint64_t)openAtPath:(uint64_t)a1 withKey:(const char *)a2 handle:(void *)a3 flags:(sqlite3 *)a4 module:(int)a5 checkpointOnClose:(char)a6
{
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
  uint64_t v26;
  sqlite3 *ppDb;

  objc_opt_self();
  ppDb = 0;
  v11 = sqlite3_open_v2(a2, &ppDb, a5, 0);
  if (ppDb)
  {
    if ((a6 & 1) == 0)
    {
      v26 = 1;
      v12 = sqlite3_db_config(ppDb, 1006);
      if ((_DWORD)v12)
      {
        if (!(_DWORD)v11)
          _NSCoreDataLog(1, (uint64_t)CFSTR("sqlite3_db_config for SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE failed: %d"), v13, v14, v15, v16, v17, v18, v12);
      }
    }
  }
  if (a3)
  {
    if (!(_DWORD)v11)
    {
      objc_msgSend(a3, "bytes");
      objc_msgSend(a3, "length");
      v11 = sqlite3_key_v2();
      if ((_DWORD)v11 == 21)
        _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to activate SQLite encryption extension"), v19, v20, v21, v22, v23, v24, v26);
    }
  }
  *a4 = ppDb;
  return v11;
}

- (_PFSQLiteSnapshotWrapper)currentQueryGenerationIdentifier
{
  uint64_t v1;
  NSObject *s;
  _PFSQLiteSnapshotWrapper *v3;
  int v4;
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
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int *p_externalReferences;
  unsigned int v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = (uint64_t)result;
  s = result->_s;
  if (s)
    dispatch_assert_queue_V2(s);
  if (!objc_msgSend(*(id *)(v1 + 328), "count"))
  {
    v40 = 0;
    v4 = 3;
    do
    {
      -[NSSQLiteConnection connect](v1);
      if (-[NSSQLiteConnection _ensureWalFileExists](v1) < 0)
      {
        v18 = 14;
      }
      else
      {
        -[NSSQLiteConnection beginReadTransaction](v1);
        v40 = 0;
        v3 = -[NSSQLiteConnection _currentQueryGenerationSnapshot:]((_PFSQLiteSnapshotWrapper *)v1, &v40);
        if (v3)
        {
          v11 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](v1, (uint64_t)v3);
          v18 = v11;
          if (!(_DWORD)v11)
          {
            objc_msgSend(*(id *)(v1 + 328), "addObject:", v3);

            goto LABEL_21;
          }
          _NSCoreDataLog(1, (uint64_t)CFSTR("currentQueryGenerationIdentifier failed to adopt currentQueryGeneration: %d"), v12, v13, v14, v15, v16, v17, v11);

        }
        else
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to get a currentQueryGeneration: %@"), v5, v6, v7, v8, v9, v10, v40);
          v18 = 0;
        }
        -[NSSQLiteConnection rollbackTransaction](v1);
      }
      --v4;
    }
    while (v4);
    if (v40)
    {
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "currentQueryGenerationIdentifier failed with NSError: %@");
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, v40);
      v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v40;
        v27 = "CoreData: currentQueryGenerationIdentifier failed with NSError: %@";
        v28 = v26;
        v29 = 12;
LABEL_27:
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, v27, buf, v29);
      }
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "currentQueryGenerationIdentifier failed with sqlite error: %d");
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, v18);
      v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = v18;
        v27 = "CoreData: currentQueryGenerationIdentifier failed with sqlite error: %d";
        v28 = v37;
        v29 = 8;
        goto LABEL_27;
      }
    }
    v3 = 0;
    goto LABEL_21;
  }
  v3 = (_PFSQLiteSnapshotWrapper *)objc_msgSend(*(id *)(v1 + 328), "lastObject");
LABEL_21:
  if (v3)
  {
    p_externalReferences = (unsigned int *)&v3->_externalReferences;
    do
      v39 = __ldxr(p_externalReferences);
    while (__stxr(v39 + 1, p_externalReferences));
  }
  return v3;
}

- (void)beginReadTransaction
{
  void *v2;
  NSSQLiteStatement *v3;

  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    v3 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, CFSTR("BEGIN TRANSACTION"));
    -[NSSQLiteConnection prepareSQLStatement:](a1, v3);
    _execute(a1);
    -[NSSQLiteConnection releaseSQLStatement](a1);
    *(_BYTE *)(a1 + 41) = 1;

    if (!*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 1;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NSSQLConnectionBeginTransactionNotification"), a1);
    }
    objc_autoreleasePoolPop(v2);
  }
}

BOOL __56__NSSQLiteConnection_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:", *(_QWORD *)(a1 + 32)) == 0;
}

- (uint64_t)_adoptQueryGenerationWithSnapshot:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  sqlite3_snapshot *v6;
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
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v30;
  uint8_t buf[16];

  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  if (a2)
  {
    if (!*(_QWORD *)(a1 + 72))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("database connection must not be nil here"), 0));
    v5 = objc_msgSend((id)a2, "bytes");
    if (v5)
    {
      v6 = (sqlite3_snapshot *)v5;
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, 48);
        _NSCoreDataLog(4, (uint64_t)CFSTR("connection %p adopting snapshot:\n\tss value: %@\n\tpointer value:%@\n\tpointer: %p"), v7, v8, v9, v10, v11, v12, a1);
      }
      a2 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v6);
      v19 = a2 == 0;
      if ((_DWORD)a2 != 517 && (_BYTE)a2)
      {
        if (a2 != 5)
        {
LABEL_18:
          _NSCoreDataLog(1, (uint64_t)CFSTR("sqlite3_snapshot_open failed with %ld"), v13, v14, v15, v16, v17, v18, a2);
          return a2;
        }
        while (1)
        {
          usleep(0x64u);
          a2 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v6);
          v19 = a2 == 0;
          if ((_DWORD)a2 == 517 || a2 == 0)
            break;
          if (a2 != 5)
            goto LABEL_18;
        }
      }
      if (!v19)
        goto LABEL_18;
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sqlite3_snapshot data was unexpectedly NULL");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, v30);
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: sqlite3_snapshot data was unexpectedly NULL", buf, 2u);
      }
      return 7;
    }
  }
  return a2;
}

- (uint64_t)freeQueryGenerationWithIdentifier:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  unint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int *v9;
  int v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  unint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    v5 = *(void **)(a1 + 328);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__NSSQLiteConnection_freeQueryGenerationWithIdentifier___block_invoke;
    v28[3] = &unk_1E1EE0120;
    v28[4] = a2;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v28);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (unsigned int *)(id)objc_msgSend(*(id *)(a1 + 328), "objectAtIndex:", v6);
      v8 = v7;
      if (!v7)
        goto LABEL_9;
      v9 = v7 + 4;
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 - 1, v9));
      if (v10 <= 1)
      {
LABEL_9:
        v11 = *(void **)(a1 + 328);
        if (!v6)
        {
          if ((unint64_t)objc_msgSend(v11, "count") < 2)
          {
            objc_msgSend(*(id *)(a1 + 328), "removeObject:", v8);
            v17 = *(_QWORD *)(a1 + 16);
            if (v17)
              -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(_QWORD *)(v17 + 128), (uint64_t)v8);
            v13 = 1;
          }
          else
          {
            for (i = 1; i < objc_msgSend(*(id *)(a1 + 328), "count"); ++i)
            {
              v16 = objc_msgSend(*(id *)(a1 + 328), "objectAtIndex:", i);
              if (v16)
              {
                if (*(int *)(v16 + 16) > 0)
                  break;
              }
            }
            v18 = (void *)objc_msgSend(*(id *)(a1 + 328), "subarrayWithRange:", 0, i);
            v19 = (void *)objc_msgSend(*(id *)(a1 + 328), "copy");
            objc_msgSend(*(id *)(a1 + 328), "removeObjectsInRange:", 0, i);
            if (objc_msgSend(*(id *)(a1 + 328), "count")
              && -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, objc_msgSend(*(id *)(a1 + 328), "firstObject")))
            {
              v13 = 0;
              objc_msgSend(*(id *)(a1 + 328), "setArray:", v19);
            }
            else
            {
              v26 = 0u;
              v27 = 0u;
              v24 = 0u;
              v25 = 0u;
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v25;
                do
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v25 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(_QWORD *)(a1 + 16);
                    if (v23)
                      -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(_QWORD *)(v23 + 128), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
                }
                while (v20);
              }
              v13 = objc_msgSend(*(id *)(a1 + 328), "count") == 0;
            }

          }
          goto LABEL_15;
        }
        if (v6 < objc_msgSend(v11, "count") - 1)
          objc_msgSend(*(id *)(a1 + 328), "removeObject:", v8);
        v12 = *(_QWORD *)(a1 + 16);
        if (v12)
          -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(_QWORD *)(v12 + 128), (uint64_t)v8);
      }
      v13 = 0;
LABEL_15:

      if (v13)
      {
        -[NSSQLiteConnection rollbackTransaction](a1);
        -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](a1, 0, 0);
        -[NSSQLiteConnection _ensureWalFileExists](a1);
      }
    }
  }
  return 0;
}

- (uint64_t)_ensureWalFileExists
{
  sqlite3 *v2;
  unint64_t FileSizeFromJournalHandle;

  if (!a1)
    return 0;
  v2 = *(sqlite3 **)(a1 + 72);
  if (!v2)
    return -1;
  FileSizeFromJournalHandle = readFileSizeFromJournalHandle(v2);
  if (FileSizeFromJournalHandle <= 0x3FF)
  {
    -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("BEGIN EXCLUSIVE"));
    -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("INSERT INTO Z_METADATA (Z_VERSION) VALUES (999)"));
    -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DELETE FROM Z_METADATA where Z_VERSION = 999"));
    -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("COMMIT"));
  }
  return FileSizeFromJournalHandle;
}

- (void)rollbackTransaction
{
  void *v2;
  uint64_t v3;
  NSString *v4;
  objc_class *v5;
  NSSQLiteStatement *v6;
  sqlite3_stmt *v7;
  uint64_t v8;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      if ((*(_BYTE *)(a1 + 312) & 2) != 0)
      {
        v2 = (void *)MEMORY[0x1E0C99DA0];
        v3 = *MEMORY[0x1E0C99768];
        v4 = NSStringFromSelector(sel_rollbackTransaction);
        v5 = (objc_class *)objc_opt_class();
        objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ -- %@ %p: attempted to rollback a transaction while a fetch was in progress"), v4, NSStringFromClass(v5), a1);
      }
      -[NSSQLiteConnection resetSQLStatement](a1);
      v6 = *(NSSQLiteStatement **)(a1 + 144);
      if (!v6)
      {
        v6 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, CFSTR("ROLLBACK"));
        *(_QWORD *)(a1 + 144) = v6;
      }
      -[NSSQLiteConnection prepareSQLStatement:](a1, v6);
      v7 = *(sqlite3_stmt **)(a1 + 144);
      if (v7)
        v8 = *((_QWORD *)v7 + 8);
      else
        v8 = 0;
      if (*(_QWORD *)(a1 + 80) != v8)
        -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v7);
      _execute(a1);
      -[NSSQLiteConnection resetSQLStatement](a1);
      *(_BYTE *)(a1 + 41) = 0;
      -[NSSQLiteConnection _clearTransactionCaches](a1);
    }
    if (*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 0;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NSSQLConnectionRollbackTransactionNotification"), a1);
    }
  }
}

- (_PFSQLiteSnapshotWrapper)_currentQueryGenerationSnapshot:(_PFSQLiteSnapshotWrapper *)result
{
  uint64_t v3;
  NSObject *s;
  sqlite3 *v5;
  int v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  sqlite3_snapshot *v17;
  sqlite3_snapshot *ppSnapshot;
  objc_super v19;

  if (!result)
    return result;
  v3 = (uint64_t)result;
  s = result->_s;
  if (s)
    dispatch_assert_queue_V2(s);
  v5 = *(sqlite3 **)(v3 + 72);
  if (!v5)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("database connection must not be nil here"), 0));
  ppSnapshot = 0;
  v6 = sqlite3_snapshot_get(v5, "main", &ppSnapshot);
  v7 = v6 == 0;
  if (v6 != 517 && v6 != 0)
  {
    if (v6 != 5)
      goto LABEL_18;
    while (1)
    {
      usleep(0x64u);
      v6 = sqlite3_snapshot_get(*(sqlite3 **)(v3 + 72), "main", &ppSnapshot);
      v7 = v6 == 0;
      if (v6 == 517 || v6 == 0)
        break;
      if (v6 != 5)
        goto LABEL_18;
    }
  }
  if (!v7)
  {
LABEL_18:
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSSQLiteErrorDomain"), v6, 0);
    goto LABEL_19;
  }
  v9 = 0;
LABEL_19:
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", ppSnapshot, 48);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", ppSnapshot);
    _NSCoreDataLog(4, (uint64_t)CFSTR("connection %p created snapshot:\n\tss %@ value: \n\tpointer value:%@\n\tpointer: %p"), v11, v12, v13, v14, v15, v16, v3);
  }
  if (readFileSizeFromJournalHandle(*(sqlite3 **)(v3 + 72)))
  {
    if (ppSnapshot)
    {
      result = [_PFSQLiteSnapshotWrapper alloc];
      if (result)
      {
        v17 = ppSnapshot;
        v19.receiver = result;
        v19.super_class = (Class)_PFSQLiteSnapshotWrapper;
        result = (_PFSQLiteSnapshotWrapper *)-[_PFSQLiteSnapshotWrapper init](&v19, sel_init);
        if (result)
        {
          result->_s = v17;
          result->_flags = 1;
        }
      }
    }
    else
    {
      result = 0;
      if (a2 && v9)
      {
        result = 0;
        *a2 = v9;
      }
    }
  }
  else
  {
    if (a2)
      *a2 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134181, 0);
    sqlite3_snapshot_free(ppSnapshot);
    return 0;
  }
  return result;
}

- (BOOL)hasHistoryTransactionWithNumber:(id *)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSSQLiteStatement *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;

  if (!a1)
    return 0;
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("TRANSACTION"));
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)objc_msgSend(*(id *)(v4 + 40), "objectForKey:", CFSTR("_pk"));
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT COUNT(Z_PK) FROM %@ WHERE %@ = %@"), objc_msgSend(v5, "tableName"), objc_msgSend(v6, "columnName"), a2);
  v8 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v7);
  -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)a1, v8);
  objc_msgSend(a1, "execute");
  v9 = -[NSSQLiteConnection newFetchedArray]((uint64_t)a1);
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "objectAtIndex:", 0);
    if (v11 == NSKeyValueCoding_NullValue)
      v12 = 0;
    else
      v12 = (void *)objc_msgSend(v10, "objectAtIndex:", 0);
    v13 = objc_msgSend(v12, "integerValue") > 0;

  }
  else
  {
    v13 = 0;
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a1, 0);

  return v13;
}

- (uint64_t)canConnect
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 24))
    {
      *(_QWORD *)(result + 24) = (id)objc_msgSend(*(id *)(result + 16), "URL");

    }
    if (!*(_QWORD *)(v1 + 32))
      *(_QWORD *)(v1 + 32) = (id)objc_msgSend(*(id *)(v1 + 24), "path");
    if (*(_QWORD *)(v1 + 72))
      return 1;
    v2 = *(_QWORD *)(v1 + 16);
    if (v2 && (*(_BYTE *)(v2 + 193) & 0x40) != 0)
      return 1;
    else
      return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

- (void)fetchMetadata
{
  NSObject *v2;
  void *v3;
  NSSQLiteStatement *v4;
  void *v5;
  NSSQLColumn *v6;
  NSSQLColumn *v7;
  NSSQLColumn *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v24;
  const __CFString *v25;
  uint64_t v26;
  id v27;
  const __CFString *v28;

  if (!a1)
    return 0;
  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_assert_queue_V2(v2);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v4 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@"), CFSTR("Z_VERSION"), CFSTR("Z_UUID"), CFSTR("Z_PLIST"), CFSTR("Z_METADATA")));
  -[NSSQLiteConnection prepareSQLStatement:](a1, v4);
  objc_msgSend((id)a1, "execute");
  v5 = *(void **)(a1 + 64);
  if (!v5)
  {
    v6 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("Z_VERSION"), 1);
    v7 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("Z_UUID"), 6);
    v8 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("Z_PLIST"), 10);
    *(_QWORD *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, v7, v8, 0);

    v5 = *(void **)(a1 + 64);
  }
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v5);
  v9 = -[NSSQLiteConnection newFetchedArray](a1);
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "objectAtIndex:", 2);
    if (v11 != NSKeyValueCoding_NullValue)
    {
      v12 = (void *)objc_msgSend(v10, "objectAtIndex:", 2);
      v13 = (uint64_t)v12;
      if (v12)
      {
        if (objc_msgSend(v12, "length"))
        {
          v28 = 0;
          v14 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, &v28);
          v21 = v14;
          if (!v14 || (objc_msgSend(v14, "isNSDictionary") & 1) == 0)
          {
            _NSCoreDataLog(1, (uint64_t)CFSTR("failure reading metadata plist with data bytes: %@"), v15, v16, v17, v18, v19, v20, v13);
            v25 = v28;
            if (!v28)
              v25 = CFSTR("<null>");
            v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An error %@ occurred converting the metadata plist data: %@"), v25, v13);
            v27 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 259, v26, 0);
            objc_exception_throw(v27);
          }
          objc_msgSend(v3, "setDictionary:", v21);
        }
      }
    }
    v22 = objc_msgSend(v10, "objectAtIndex:", 1);
    if (!v22)
    {
      v24 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 259, (uint64_t)CFSTR("Metadata table is missing database UUID."), 0);
      objc_exception_throw(v24);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("NSStoreUUID"));
  }

  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(_QWORD *)(a1 + 100) = 0;
  *(_QWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection releaseSQLStatement](a1);

  return v3;
}

- (id)initForSQLCore:(id)a3
{
  NSSQLiteConnection *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;
  NSObject *v11;
  const __CFAllocator *v12;
  const CFDictionaryValueCallBacks *v13;
  CFStringRef (__cdecl *v14)(const void *);
  id v15;
  uint64_t v16;
  uint64_t i;
  CFDictionaryKeyCallBacks keyCallBacks;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NSSQLiteConnection;
  v4 = -[NSSQLiteConnection init](&v20, sel_init);
  if (v4)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "URL"), "isFileURL")
      && (v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "URL"), "path")) != 0)
    {
      v6 = (const __CFString *)objc_msgSend(v5, "lastPathComponent");
    }
    else
    {
      v6 = CFSTR("nil");
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLQueue %p for %@"), v4, v6);
    v8 = objc_msgSend(a3, "_persistentStoreCoordinator");
    if (v8 && (v9 = *(_DWORD *)(v8 + 24), (v9 >> 3)))
      v10 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)(v9 >> 3), 0);
    else
      v10 = 0;
    v11 = dispatch_queue_create((const char *)objc_msgSend(v7, "fileSystemRepresentation"), v10);
    v4->_queue = (OS_dispatch_queue *)v11;
    dispatch_set_context(v11, v4);
    v4->_sqlCore = (NSSQLCore *)a3;
    v4->_useSyntaxColoredLogging = +[NSSQLCore coloredLoggingDefault](NSSQLCore, "coloredLoggingDefault");
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v4->_vmCachedStatements = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    v4->_pragmaSettings = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    keyCallBacks.version = *MEMORY[0x1E0C9B390];
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B390] + 8);
    v14 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B390] + 24);
    keyCallBacks.equal = 0;
    keyCallBacks.hash = 0;
    keyCallBacks.copyDescription = v14;
    v4->_cachedEntityUpdateStatements = CFDictionaryCreateMutable(v12, 0, &keyCallBacks, v13);
    v4->_cachedEntityConstrainedValuesUpdateStatements = CFDictionaryCreateMutable(v12, 0, &keyCallBacks, v13);
    v4->_statementCachesByEntity = CFDictionaryCreateMutable(v12, 0, &keyCallBacks, v13);
    v4->_mObjectIDsUpdatedByTriggers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_mObjectIDsInsertedByDATriggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_mObjectIDsUpdatededByDATriggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_timeOutOption = 0.0;
    v15 = -[NSDictionary objectForKey:](-[NSPersistentStore options](v4->_sqlCore, "options"), "objectForKey:", CFSTR("NSPersistentStoreTimeoutOption"));
    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
    }
    else
    {
      if (!BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
        goto LABEL_15;
      v16 = 0x406E000000000000;
    }
    *(_QWORD *)&v4->_timeOutOption = v16;
LABEL_15:
    for (i = 0; i != 5; ++i)
      v4->_extraBuffersForRegisteredFunctions[i] = PF_CALLOC_OBJECT_ARRAY(4);
    v4->_dbPathRegisteredWithBackupd = 0;
    *(_DWORD *)&v4->_sqliteConnectionFlags |= 0x100u;
    v4->_transactionStringName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_usedIndexes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (uint64_t)_transactionsStringAndPKsForStrings:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  sqlite3_int64 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  sqlite3 *v15;
  void *v16;
  NSSQLiteStatementCache *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSSQLiteStatement *v23;
  NSSQLBindVariable *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  id obj;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "count"))
    return 0;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v39 = a2;
  obj = (id)objc_msgSend(a2, "allKeys");
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v43;
    v34 = *MEMORY[0x1E0C99768];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(obj);
        v41 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v4);
        v5 = objc_msgSend(v39, "objectForKey:");
        v6 = objc_msgSend(*(id *)(a1 + 336), "objectForKey:", v5);
        if (v6)
        {
          objc_msgSend(v37, "setValue:forKey:", v6, v41);
        }
        else
        {
          v36 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("TRANSACTIONSTRING"));
          v8 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
          if (!v8)
          {
            v30 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v34, 134030, (uint64_t)CFSTR("unable to generate primary keys for transaction"), 0);
            objc_exception_throw(v30);
          }
          -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v47 != v11)
                  objc_enumerationMutation(v9);
                v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                v14 = objc_msgSend(v13, "index");
                if (v14)
                {
                  if (v14 == 3)
                    objc_msgSend(v13, "setValue:", v5);
                }
                else
                {
                  objc_msgSend(v13, "setInt64:", v8);
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
            }
            while (v10);
          }
          objc_msgSend((id)a1, "execute");
          v15 = *(sqlite3 **)(a1 + 72);
          if (v15 && sqlite3_changes(v15) >= 1)
            v16 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_last_insert_rowid(*(sqlite3 **)(a1 + 72))), "copy");
          else
            v16 = 0;
          if (!*(_QWORD *)(a1 + 80))
          {
            v17 = -[NSSQLiteConnection statementCacheForEntity:](a1, v7);
            -[NSSQLiteStatementCache cacheInsertStatement:](v17, 0);
          }
          -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
          -[NSSQLiteConnection resetSQLStatement](a1);
          objc_msgSend(v36, "drain");
          v18 = 0;
          if (v16)
            goto LABEL_40;
          v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("TRANSACTIONSTRING"));
          v20 = (void *)v19;
          v21 = v19 ? (void *)objc_msgSend(*(id *)(v19 + 40), "objectForKey:", CFSTR("NAME")) : 0;
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT Z_PK FROM %@ WHERE %@ = ?"), objc_msgSend(v20, "tableName"), objc_msgSend(v21, "columnName"));
          v23 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v20, v22);
          v24 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v5, 5, objc_msgSend(v21, "attributeDescription"));
          -[NSSQLiteStatement addBindVariable:]((uint64_t)v23, v24);

          -[NSSQLiteConnection prepareSQLStatement:](a1, v23);
          objc_msgSend((id)a1, "execute");
          v25 = -[NSSQLiteConnection newFetchedArray](a1);
          v26 = v25;
          if (v25)
          {
            if (objc_msgSend(v25, "count"))
            {
              v27 = objc_msgSend(v26, "objectAtIndex:", 0);
              v28 = v27 == NSKeyValueCoding_NullValue ? 0 : (void *)objc_msgSend(v26, "objectAtIndex:", 0);
              v29 = v28;
            }
            else
            {
              v29 = 0;
            }

          }
          else
          {
            v29 = 0;
          }
          -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);

          v16 = (void *)objc_msgSend(v29, "copy");
          if (v16)
          {
LABEL_40:
            objc_msgSend(*(id *)(a1 + 336), "setValue:forKey:", v16, v5);
            objc_msgSend(v37, "setValue:forKey:", v16, v41);

          }
        }
        ++v4;
      }
      while (v4 != v40);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      v40 = v31;
    }
    while (v31);
  }
  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v37);

  return v32;
}

- (sqlite3_int64)fetchMaxPrimaryKeyForEntity:(uint64_t)a1
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  sqlite3_int64 v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3_int64 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
  {
    v5 = -[NSSQLiteConnection fetchTableNames]((id)a1);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "caseInsensitiveCompare:", CFSTR("Y_UBRANGE")))
          {
            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", a2, 0);
            v12 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntities:](a1, v11);

            v13 = (void *)objc_msgSend(v12, "objectForKey:", objc_msgSend(a2, "name"));
            if (v13)
              v14 = objc_msgSend(v13, "longLongValue");
            else
              v14 = -[NSSQLiteConnection _fetchMaxPrimaryKeyForEntity:](a1, a2);
            v10 = v14;

            return v10;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
  return -[NSSQLiteConnection _fetchMaxPrimaryKeyForEntity:](a1, a2);
}

- (sqlite3_int64)_fetchMaxPrimaryKeyForEntity:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const char *v13;
  id v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  useconds_t v19;
  int v20;
  sqlite3_stmt *v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  useconds_t v26;
  sqlite3_int64 v27;
  uint64_t v28;
  sqlite3 *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  sqlite3_stmt *ppStmt;
  char *pzTail;

  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT MAX(%@) FROM %@"), CFSTR("Z_PK"), objc_msgSend(a2, "tableName"));
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
  {
    if (*(_BYTE *)(a1 + 42))
      v12 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
    else
      v12 = CFSTR("%@");
    _NSCoreDataLog(6, (uint64_t)v12, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  ppStmt = 0;
  pzTail = 0;
  v13 = (const char *)objc_msgSend(v5, "UTF8String");
  v14 = v5;
  -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
  v15 = strlen(v13);
  v16 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v13, v15, &ppStmt, (const char **)&pzTail);
  if ((_DWORD)v16)
  {
    v17 = 0;
    v18 = 1;
    while (v16 - 5 <= 1)
    {
      if (v17 >= 0xB)
        v19 = v17 + 1101;
      else
        v19 = v18;
      usleep(v19);
      v20 = strlen(v13);
      v16 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v13, v20, &ppStmt, (const char **)&pzTail);
      v18 += 3;
      ++v17;
      if (!(_DWORD)v16)
        goto LABEL_15;
    }
    v30 = *(sqlite3 **)(a1 + 72);
    v31 = v16;
    v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(v30));
    v33 = *MEMORY[0x1E0C99768];
    v34 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31), CFSTR("NSSQLiteErrorDomain"));
    v35 = v33;
    v36 = (const __CFString *)v32;
LABEL_28:
    v38 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v35, 256, (uint64_t)v36, v34);
    objc_exception_throw(v38);
  }
LABEL_15:
  v21 = ppStmt;
  if (ppStmt)
  {
    v22 = sqlite3_step(ppStmt);
    if (v22 != 100)
    {
      LOBYTE(v23) = v22;
      v24 = 0;
      v25 = 1;
      while (v23 - 5 <= 1)
      {
        if (v24 >= 0xB)
          v26 = v24 + 1101;
        else
          v26 = v25;
        usleep(v26);
        v23 = sqlite3_step(ppStmt);
        v25 += 3;
        ++v24;
        if (v23 == 100)
          goto LABEL_23;
      }
      v37 = *MEMORY[0x1E0C99768];
      v34 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("NSSQLiteErrorDomain"));
      v36 = CFSTR("Fetching maximum primary key for entity failed");
      v35 = v37;
      goto LABEL_28;
    }
LABEL_23:
    v21 = ppStmt;
  }
  v27 = sqlite3_column_int64(v21, 0);
  v28 = sqlite3_finalize(ppStmt);
  ppStmt = 0;
  if ((_DWORD)v28)
  {
    v39 = v28;
    v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
    v41 = *MEMORY[0x1E0C99768];
    v34 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39), CFSTR("NSSQLiteErrorDomain"));
    v35 = v41;
    v36 = (const __CFString *)v40;
    goto LABEL_28;
  }
  return v27;
}

- (uint64_t)_insertTransactionStringsForRequestContext:(uint64_t)a1
{
  _BYTE *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  if (a2 && (v4 = *(_BYTE **)(a2 + 32)) != 0 && (v4[43] & 8) != 0)
  {
    v5 = -[NSPersistentStoreCoordinator _xpcBundleIdentifier]((os_unfair_lock_s *)objc_msgSend(v4, "persistentStoreCoordinator"));
    v11 = -[NSPersistentStoreCoordinator _xpcProcessName]((os_unfair_lock_s *)objc_msgSend(*(id *)(a2 + 32), "persistentStoreCoordinator"));
    v7 = (uint64_t)v11;
    v8 = v11 != 0;
    if (v5 == 0 && v8)
      v5 = v11;
  }
  else
  {
    v5 = (os_unfair_lock_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
    v7 = v6;
    v8 = v6 != 0;
    if (v5 == 0 && v8)
      v5 = (os_unfair_lock_s *)v6;
    if (!a2)
    {
      v9 = objc_msgSend(0, "name");
      v10 = 0;
      goto LABEL_11;
    }
  }
  v9 = objc_msgSend(*(id *)(a2 + 32), "name");
  v10 = *(void **)(a2 + 32);
LABEL_11:
  v12 = objc_msgSend(v10, "transactionAuthor");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  v14 = v13;
  if (v5)
    objc_msgSend(v13, "setValue:forKey:", v5, CFSTR("BUNDLEIDTS"));
  if (v8)
    objc_msgSend(v14, "setValue:forKey:", v7, CFSTR("PROCESSIDTS"));
  if (v9)
    objc_msgSend(v14, "setValue:forKey:", v9, CFSTR("CONTEXTNAMETS"));
  if (v12)
    objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("AUTHORTS"));
  v15 = -[NSSQLiteConnection _transactionsStringAndPKsForStrings:](a1, v14);

  return v15;
}

- (BOOL)databaseIsEmpty
{
  void *v1;
  stat v3;

  if (result)
  {
    v1 = *(void **)(result + 32);
    memset(&v3.st_size, 0, 48);
    return stat((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v3)|| v3.st_size == 0;
  }
  return result;
}

- (void)prepareAndExecuteSQLStatement:(uint64_t)a1
{
  NSObject *v4;
  void *v5;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if (a2)
    {
      v5 = (void *)MEMORY[0x18D76B4E4]();
      -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:]((_QWORD *)a1, a2);
      -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
      objc_msgSend((id)a1, "execute");
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(_QWORD *)(a1 + 100) = 0;
      *(_QWORD *)(a1 + 92) = 0;
      *(_DWORD *)(a1 + 108) = 0;
      -[NSSQLiteConnection releaseSQLStatement](a1);
      objc_autoreleasePoolPop(v5);
    }
  }
}

- (void)processDeleteRequest:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __objc2_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSSQLiteStatement *v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  const __CFArray *v34;
  const __CFArray *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  _QWORD *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  id obj;
  unsigned int obja;
  uint64_t v60;
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
  if (a1)
  {
    v2 = a1;
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
    v4 = -[NSSQLEntity tempTableName](v3);
    if (-[NSSQLiteConnection _hasTableWithName:isTemp:](v2, v4, 1))
    {
      v5 = -[NSSQLEntity tempTableName](v3);
      if (-[NSSQLiteConnection _tableHasRows:](v2, v5))
      {
        v54 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](v2, a2);
        v56 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](v2, a2, v54);
        v6 = *(NSObject **)(v2 + 8);
        if (v6)
          dispatch_assert_queue_V2(v6);
        v55 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
        v8 = -[NSSQLEntity tempTableName](v7);
        if (-[NSSQLiteConnection _tableHasRows:](v2, v8))
        {
          if (v7)
            v9 = objc_msgSend(*(id *)(v7 + 40), "objectForKey:", CFSTR("ENTITY"));
          else
            v9 = 0;
          v10 = *(_QWORD *)(v2 + 16);
          if (v10)
            v11 = (void *)objc_msgSend(*(id *)(v10 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
          else
            v11 = 0;
          v12 = &OBJC_METACLASS___NSSQLStoreRequestContext;
          v60 = v2;
          if (objc_msgSend(v11, "count"))
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
            v52 = (void *)v9;
            v53 = v7;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v14 = *(_QWORD *)(v2 + 16);
            if (v14)
            {
              obj = (id)objc_msgSend(*(id *)(v14 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
            }
            else
            {
              obj = 0;
              v15 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
            }
            v16 = v15;
            if (v15)
            {
              v17 = 0;
              v18 = *(_QWORD *)v74;
              do
              {
                v19 = 0;
                do
                {
                  if (*(_QWORD *)v74 != v18)
                    objc_enumerationMutation(obj);
                  v20 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v19);
                  v21 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "model"), "entityNamed:", v20);
                  if (!v21)
                  {
                    v71 = 0u;
                    v72 = 0u;
                    v69 = 0u;
                    v70 = 0u;
                    v2 = v60;
                    v23 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v60 + 16), "ancillarySQLModels"), "allValues");
                    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
                    if (!v24)
                      goto LABEL_24;
                    v25 = *(_QWORD *)v70;
LABEL_28:
                    v26 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v70 != v25)
                        objc_enumerationMutation(v23);
                      v21 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v26), "entityNamed:", v20);
                      if (v21)
                        break;
                      if (v24 == ++v26)
                      {
                        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
                        if (v24)
                          goto LABEL_28;
                        goto LABEL_23;
                      }
                    }
                  }
                  v22 = *(unsigned int *)(v21 + 184);
                  if (v17)
                    objc_msgSend(v13, "appendFormat:", CFSTR(","));
                  objc_msgSend(v13, "appendFormat:", CFSTR("%lld"), v22);
                  ++v17;
LABEL_23:
                  v2 = v60;
LABEL_24:
                  ++v19;
                }
                while (v19 != v16);
                v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
                v16 = v27;
              }
              while (v27);
            }
            objc_msgSend(v13, "appendFormat:", CFSTR(")"));
            v7 = v53;
            v12 = &OBJC_METACLASS___NSSQLStoreRequestContext;
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN %@"), -[NSSQLEntity tempTableName](v53), objc_msgSend(v52, "columnName"), v13);
            v29 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v28);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v29);

          }
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("UPDATE %@ SET Z%@ = %lld"), -[NSSQLEntity tempTableName](v7), CFSTR("TRANSACTIONID"), v56);
          v31 = (_QWORD *)objc_msgSend(objc_alloc(&v12[13]), "initWithEntity:sqlString:", 0, v30);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v31);

          v32 = -[NSSQLEntity tempTableName](v7);
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT count(*) FROM "));
          objc_msgSend(v33, "appendString:", v32);
          v34 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v2, v33);
          v35 = v34;
          if (v34)
          {
            if (CFArrayGetCount(v34) >= 1 && *(_QWORD *)CFArrayGetValueAtIndex(v35, 0))
              v36 = *(_QWORD *)CFArrayGetValueAtIndex(v35, 1);
            else
              LODWORD(v36) = -1;
            obja = v36;
            CFRelease(v35);
          }
          else
          {
            obja = -1;
          }

          v37 = objc_alloc(MEMORY[0x1E0CB37A0]);
          if (v7)
            v38 = *(void **)(v7 + 136);
          else
            v38 = 0;
          v39 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("%@"), objc_msgSend(v38, "columnName"));
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v40 = (void *)objc_msgSend((id)v7, "attributeColumns");
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v66;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v66 != v42)
                  objc_enumerationMutation(v40);
                objc_msgSend(v39, "appendFormat:", CFSTR(",%@"), objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "columnName"));
              }
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
            }
            while (v41);
          }
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v44 = (void *)objc_msgSend((id)v7, "foreignKeyColumns");
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
          if (v45)
          {
            v46 = *(_QWORD *)v62;
            do
            {
              for (j = 0; j != v45; ++j)
              {
                if (*(_QWORD *)v62 != v46)
                  objc_enumerationMutation(v44);
                objc_msgSend(v39, "appendFormat:", CFSTR(",%@"), objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "columnName"));
              }
              v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
            }
            while (v45);
          }
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("INSERT INTO %@ (%@) SELECT %@ FROM %@"), objc_msgSend((id)v7, "tableName"), v39, v39, -[NSSQLEntity tempTableName](v7));
          v49 = (_QWORD *)objc_msgSend(objc_alloc(&v12[13]), "initWithEntity:sqlString:", 0, v48);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v49);

          -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](v2, v7, obja);
        }
        objc_msgSend(v55, "drain");
        v50 = 0;
        v51 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v56);
        if (a2)
          *(_QWORD *)(a2 + 72) = v51;

      }
    }
  }
}

- (BOOL)_tableHasRows:(_BOOL8)result
{
  uint64_t v2;
  void *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  uint64_t v6;

  if (result)
  {
    v2 = result;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT count(*) FROM (SELECT 0 FROM %@ LIMIT 1)"), a2);
    v4 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v2, v3);
    v5 = v4;
    if (v4)
    {
      if (CFArrayGetCount(v4) >= 1 && *(_QWORD *)CFArrayGetValueAtIndex(v5, 0))
        v6 = *(_QWORD *)CFArrayGetValueAtIndex(v5, 1);
      else
        v6 = -1;
      CFRelease(v5);
    }
    else
    {
      v6 = -1;
    }

    return v6 > 0;
  }
  return result;
}

void __29__NSSQLiteConnection_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t j;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  const void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  if (v4)
  {
    dispatch_assert_queue_V2(v4);
    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v3 + 16) = 0;
  -[NSSQLiteConnection releaseSQLStatement](*(_QWORD *)(a1 + 32));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 72))
    -[NSSQLiteConnection disconnect](v5);
  for (i = 0; i != 5; ++i)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * i + 248);
    if (v7)
    {
      for (j = 0; j != 32; j += 8)
      {
        v9 = *(void **)(v7 + j);
        if (v9)
        {
          if ((i & 0x7FFFFFFB) == 0)

          *(_QWORD *)(v7 + j) = 0;
        }
      }
      PF_FREE_OBJECT_ARRAY(*(void **)(*(_QWORD *)(a1 + 32) + 8 * i + 248));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * i + 248) = 0;
    }
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 200);
  if (v11)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          -[NSSQLiteStatementCache clearCachedStatements](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++)));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 200));
    v10 = *(_QWORD *)(a1 + 32);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(const void **)(v16 + 152);
  if (v17)
  {
    CFRelease(v17);
    v16 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v16 + 152) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(const void **)(v18 + 288);
  if (v19)
  {
    CFRelease(v19);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = 0;
    v18 = *(_QWORD *)(a1 + 32);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344) = 0;
  objc_autoreleasePoolPop(v2);
}

- (void)disconnect
{
  NSObject *v2;
  void *v3;
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
  sqlite3_stmt *stmt;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  sqlite3 *v26;
  uint64_t FileSizeFromJournalHandle;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
      dispatch_assert_queue_V2(v2);
    v35 = 0;
    objc_msgSend(*(id *)(a1 + 328), "removeAllObjects");
    v3 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: SQLite disconnection"), &v35);
    -[NSSQLiteConnection _finalizeStatement](a1);
    if (*(_BYTE *)(a1 + 40))
      -[NSSQLiteConnection rollbackTransaction](a1);
    -[NSSQLiteConnection _clearTransactionCaches](a1);
    -[NSSQLiteConnection _clearCachedStatements]((NSObject **)a1);
    if (!*(_QWORD *)(a1 + 72))
      goto LABEL_15;
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault"))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Disconnecting from sqlite database."), v4, v5, v6, v7, v8, v9, v34);
    if (objc_msgSend(*(id *)(a1 + 16), "_persistentStoreCoordinator")
      && !objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption")))
    {
      v25 = *(_QWORD *)(a1 + 16);
      if (v25)
      {
        v26 = *(sqlite3 **)(a1 + 72);
        if (*(_QWORD *)(v25 + 200))
        {
          FileSizeFromJournalHandle = readFileSizeFromJournalHandle(v26);
          if (FileSizeFromJournalHandle >= 41943041)
          {
            _NSCoreDataLog(4, (uint64_t)CFSTR("Marking -wal eligible for checkpointing in -disconnect due to its large size (%lld)"), v28, v29, v30, v31, v32, v33, FileSizeFromJournalHandle);
            sqlite3_db_config(*(sqlite3 **)(a1 + 72), 1006, 0, 0);
          }
          goto LABEL_11;
        }
      }
      else
      {
        v26 = *(sqlite3 **)(a1 + 72);
      }
      sqlite3_db_config(v26, 1006, 0, 0);
    }
LABEL_11:
    if (sqlite3_close_v2(*(sqlite3 **)(a1 + 72)))
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disconnected from database with pending transactions: %@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72))));
      _NSCoreDataLog(1, (uint64_t)CFSTR("%@\n"), v11, v12, v13, v14, v15, v16, v10);
      stmt = 0;
      while (1)
      {
        stmt = sqlite3_next_stmt(*(sqlite3 **)(a1 + 72), stmt);
        if (!stmt)
          break;
        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Un-finalized statement: %p"), stmt);
        _NSCoreDataLog(1, (uint64_t)CFSTR("%@\n"), v19, v20, v21, v22, v23, v24, v18);
      }
    }
LABEL_15:

    *(_QWORD *)(a1 + 304) = 0;
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(_QWORD *)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 80) = 0;

    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v35, v3);
  }
}

- (NSObject)_clearCachedStatements
{
  NSObject **v1;
  NSObject *v2;
  const __CFDictionary *v3;
  unint64_t Count;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void **v8;
  uint64_t v9;
  const void *v10;
  id *Value;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  v2 = result[1];
  if (v2)
    dispatch_assert_queue_V2(v2);
  v3 = (const __CFDictionary *)v1[19];
  if (v3)
  {
    Count = CFDictionaryGetCount(v3);
    v5 = Count;
    if (Count <= 1)
      v6 = 1;
    else
      v6 = Count;
    if (Count >= 0x201)
      v7 = 1;
    else
      v7 = v6;
    v8 = (const void **)((char *)&v19 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (Count >= 0x201)
    {
      v8 = (const void **)NSAllocateScannedUncollectable();
      CFDictionaryGetKeysAndValues((CFDictionaryRef)v1[19], v8, 0);
    }
    else
    {
      bzero((char *)&v19 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v6);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)v1[19], v8, 0);
      if (!v5)
        goto LABEL_23;
    }
    v9 = 0;
    do
    {
      v10 = v8[v9];
      Value = (id *)CFDictionaryGetValue((CFDictionaryRef)v1[19], v10);
      if (Value && (WeakRetained = objc_loadWeakRetained(Value + 1)) != 0)
      {
        v13 = WeakRetained;
        -[NSSQLiteStatement clearCaches:](WeakRetained, 0);

      }
      else
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v1[19], v10);
      }
      ++v9;
    }
    while (v5 != v9);
    if (v5 >= 0x201)
      NSZoneFree(0, v8);
  }
LABEL_23:
  v14 = v1[25];
  if (v14)
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    v19 = 0u;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[NSSQLiteStatementCache clearCachedStatements](-[NSObject objectForKey:](v1[25], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i)));
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }
  }
  return -[NSSQLiteConnection _clearOtherStatements](v1);
}

- (NSObject)_clearOtherStatements
{
  sqlite3_stmt *v1;
  NSObject *v2;
  sqlite3_stmt *v3;

  if (result)
  {
    v1 = (sqlite3_stmt *)result;
    v2 = result[1];
    if (v2)
      dispatch_assert_queue_V2(v2);
    v3 = (sqlite3_stmt *)*((_QWORD *)v1 + 14);
    if (v3)
      sqlite3_finalize(v3);
    *((_QWORD *)v1 + 14) = 0;
    result = (NSObject **)*((_QWORD *)v1 + 15);
    if (result)
      result = (NSObject **)sqlite3_finalize((sqlite3_stmt *)result);
    *((_QWORD *)v1 + 15) = 0;
  }
  return result;
}

- (uint64_t)selectCountWithStatement:(uint64_t)result
{
  void *v3;

  if (result)
  {
    v3 = (void *)result;
    if (a2 && a2[40])
    {
      return 0;
    }
    else
    {
      -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:]((_QWORD *)result, a2);
      -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v3, a2);
      objc_msgSend(v3, "execute");
      return 1;
    }
  }
  return result;
}

- (NSSQLitePrefetchRequestCache)prefetchRequestCache
{
  NSSQLitePrefetchRequestCache *v1;

  if (result)
  {
    v1 = result;
    result = (NSSQLitePrefetchRequestCache *)result[6]._length;
    if (!result)
    {
      result = -[NSSQLitePrefetchRequestCache initWithSQLCore:]([NSSQLitePrefetchRequestCache alloc], "initWithSQLCore:", v1->_length);
      v1[6]._length = (unint64_t)result;
    }
  }
  return result;
}

- (CFMutableArrayRef)copyRawIntegerRowsForSQL:(uint64_t)a1
{
  NSObject *v4;
  CFMutableArrayRef v5;
  double v6;
  double Current;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const char *v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  useconds_t v22;
  double v23;
  int v24;
  int v25;
  int v26;
  _QWORD *v27;
  double v28;
  int v29;
  uint64_t v30;
  useconds_t v31;
  double v32;
  uint64_t v33;
  malloc_zone_t *v34;
  malloc_zone_t *v35;
  uint64_t v36;
  CFMutableArrayRef v37;
  malloc_zone_t *v38;
  _QWORD *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  const __CFString *v48;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  int v63;
  const __CFString *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  int v88;
  const __CFString *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const __CFString *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const __CFString *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *context;
  CFMutableArrayRef theArray;
  uint64_t v120;
  unsigned int v121;
  int v122;
  __CFString *v123;
  unsigned int v124;
  sqlite3_stmt *ppStmt;
  char *pzTail;
  CFArrayCallBacks callBacks;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    *(_OWORD *)&callBacks.version = xmmword_1E1EDFF60;
    *(_OWORD *)&callBacks.release = *(_OWORD *)&off_1E1EDFF70;
    callBacks.equal = 0;
    v5 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
    context = (void *)MEMORY[0x18D76B4E4]();
    ppStmt = 0;
    pzTail = 0;
    v124 = 0;
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    v6 = 0.0;
    Current = 0.0;
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (*(_BYTE *)(a1 + 42))
        v14 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
      else
        v14 = CFSTR("%@");
      _NSCoreDataLog(6, (uint64_t)v14, v8, v9, v10, v11, v12, v13, (uint64_t)a2);
    }
    theArray = v5;
    v15 = (const char *)objc_msgSend(a2, "UTF8String");
    v121 = 0;
    v16 = 0;
    v17 = 0;
    while (2)
    {
      v18 = 3 * v16 - 29999;
LABEL_11:
      v19 = strlen(v15);
      v20 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v15, v19, &ppStmt, (const char **)&pzTail);
      v21 = v20;
      switch((char)v20)
      {
        case 0:
          v24 = 0;
          v122 = 0;
          v25 = 0;
          v26 = 0;
          v120 = 0;
          v27 = 0;
          while (2)
          {
            v28 = 0.0;
LABEL_38:
            v29 = 3 * v25 - 29999;
            while (2)
            {
              v30 = sqlite3_step(ppStmt);
              v21 = v30;
              if (v30 <= 0x63u)
              {
                switch((char)v30)
                {
                  case 5:
                    if (!v24)
                      sqlite3_reset(ppStmt);
                    if (*(double *)(a1 + 232) > 0.0 && v28 == 0.0)
                      v28 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
                    if (v25 < 10001)
                      goto LABEL_64;
                    if ((v25 - 10000) >= 0xB)
                      v31 = v25 - 8899;
                    else
                      v31 = v29;
                    goto LABEL_63;
                  case 6:
                    if (!v24)
                      sqlite3_reset(ppStmt);
                    if (*(double *)(a1 + 232) > 0.0 && v28 == 0.0)
                      v28 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
                    goto LABEL_60;
                  case 7:
                  case 10:
                  case 17:
                  case 21:
                    goto LABEL_115;
                  case 8:
                  case 9:
                  case 12:
                  case 13:
                  case 15:
                  case 16:
                  case 18:
                  case 19:
                  case 20:
                  case 22:
                  case 23:
                  case 24:
                  case 25:
                    goto LABEL_125;
                  case 11:
                  case 26:
                    goto LABEL_121;
                  case 14:
                    if (v26 > 2)
                      goto LABEL_115;
                    if (*(double *)(a1 + 232) > 0.0 && v28 == 0.0)
                      v28 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
                    ++v26;
LABEL_60:
                    if (v25 > 10)
                      v31 = v25 + 1101;
                    else
                      v31 = 3 * (v25 % 11) + 1;
LABEL_63:
                    usleep(v31);
LABEL_64:
                    if (v28 == 0.0 || (v32 = CFAbsoluteTimeGetCurrent(), v32 <= v28))
                    {
                      v29 += 3;
                      ++v25;
                      continue;
                    }
                    if (v122 <= 7)
                    {
                      ++v25;
                      v28 = v32 + *(double *)(a1 + 240);
                      ++v122;
                      goto LABEL_38;
                    }
                    v107 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The database operation timed out after %.2f seconds."), v32 - v28 + *(double *)(a1 + 232));
                    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
                    {
                      if (*(_BYTE *)(a1 + 42))
                        v114 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m");
                      else
                        v114 = CFSTR("(%d) %@");
                      v116 = v107;
                      _NSCoreDataLog(1, (uint64_t)v114, v108, v109, v110, v111, v112, v113, v21);
                    }
                    if (theArray)
                      CFRelease(theArray);
                    if (ppStmt)
                      sqlite3_finalize(ppStmt);
                    v106 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during SQL execution : %@"), v107, v116);
                    break;
                  default:
                    if (v30 != 1)
                      goto LABEL_125;
LABEL_115:
                    v75 = v30;
                    v76 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
                    if (v75 == 10)
                      sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v124);
                    v77 = *(_QWORD *)(a1 + 32);
                    if (v124)
                      v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d"), v77, v21, v76, v124);
                    else
                      v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@'"), v77, v21, v76, v117);
                    v79 = (void *)v78;
                    if (v78)
                    {
                      v123 = 0;
                      v80 = 256;
                    }
                    else
                    {
LABEL_121:
                      v79 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'"), *(_QWORD *)(a1 + 32), v21, sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
                      v80 = (int)v21;
                      v123 = CFSTR("NSSQLiteErrorDomain");
                    }
                    sqlite3_finalize(ppStmt);
                    ppStmt = 0;
                    -[NSSQLiteConnection _forceDisconnectOnError](a1);
                    if (!v79)
                      goto LABEL_126;
                    v87 = (const char *)objc_msgSend(v79, "UTF8String");
                    v88 = 0;
                    goto LABEL_127;
                }
                goto LABEL_162;
              }
              break;
            }
            if (v30 == 100)
            {
              v33 = v120;
              if (!v27)
              {
                v33 = sqlite3_column_count(ppStmt);
                v34 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
                if (!_PF_Private_Malloc_Zone)
                  v34 = malloc_default_zone();
                v27 = malloc_type_zone_malloc(v34, 8uLL, 0x100004000313F17uLL);
                *v27 = (int)v33;
                CFArrayAppendValue(theArray, v27);
                v24 = 1;
              }
              v120 = v33;
              if ((int)v33 > 0)
              {
                v35 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
                if (!_PF_Private_Malloc_Zone)
                  v35 = malloc_default_zone();
                v27 = malloc_type_zone_malloc(v35, 8 * v33, 0x100004000313F17uLL);
                v36 = 0;
                do
                {
                  v27[v36] = sqlite3_column_int64(ppStmt, v36);
                  ++v36;
                }
                while (v120 != v36);
                CFArrayAppendValue(theArray, v27);
              }
              continue;
            }
            break;
          }
          if (v30 != 101)
          {
LABEL_125:
            v123 = 0;
            v80 = 0;
LABEL_126:
            v87 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
            v79 = 0;
            v88 = 1;
LABEL_127:
            if (*(_BYTE *)(a1 + 42))
              v89 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m");
            else
              v89 = CFSTR("(%d) %s");
            _NSCoreDataLog(1, (uint64_t)v89, v81, v82, v83, v84, v85, v86, v21);
            if (v88)
            {
              v79 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during execution of SQL string '%s' : %s"), v15, v87);
              v80 = 256;
            }
            if (theArray)
              CFRelease(theArray);
            if (ppStmt)
              sqlite3_finalize(ppStmt);
            v90 = *MEMORY[0x1E0C99768];
            v91 = (void *)MEMORY[0x1E0C99D80];
            v92 = *(_QWORD *)(a1 + 32);
            v93 = *MEMORY[0x1E0CB2AA0];
            v94 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
            if (v124)
              v95 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
            else
              v95 = 0;
            v71 = (void *)objc_msgSend(v91, "dictionaryWithObjectsAndKeys:", v92, v93, v94, CFSTR("NSSQLiteErrorDomain"), v95, *MEMORY[0x1E0CB2FE0], 0);
            v72 = v90;
            v73 = v80;
            v74 = (uint64_t)v79;
            goto LABEL_140;
          }
          v37 = theArray;
          if (!CFArrayGetCount(theArray))
          {
            v38 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
            if (!_PF_Private_Malloc_Zone)
              v38 = malloc_default_zone();
            v39 = malloc_type_zone_malloc(v38, 8uLL, 0x100004000313F17uLL);
            *v39 = 0;
            CFArrayAppendValue(theArray, v39);
          }
          if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
          {
            v40 = *(unsigned __int8 *)(a1 + 42);
            v47 = CFAbsoluteTimeGetCurrent() - Current;
            if (v40)
              v48 = CFSTR("sql execution time: \x1B[31m%.4f\x1B[0ms");
            else
              v48 = CFSTR("sql execution time: %.4fs");
            _NSCoreDataLog(4, (uint64_t)v48, v41, v42, v43, v44, v45, v46, *(uint64_t *)&v47);
          }
          sqlite3_finalize(ppStmt);
          objc_autoreleasePoolPop(context);
          return v37;
        case 1:
        case 7:
        case 10:
        case 17:
        case 21:
          goto LABEL_92;
        case 5:
          if (*(double *)(a1 + 232) > 0.0 && v6 == 0.0)
            v6 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          if (v16 < 0x2711)
            goto LABEL_31;
          if (v16 - 10000 >= 0xB)
            v22 = v16 - 8899;
          else
            v22 = v18;
          goto LABEL_30;
        case 6:
          if (*(double *)(a1 + 232) > 0.0 && v6 == 0.0)
            v6 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          goto LABEL_27;
        case 11:
        case 26:
          goto LABEL_98;
        case 14:
          if (v17 > 2)
          {
LABEL_92:
            v50 = v20;
            v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
            if (v50 == 10)
              sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v124);
            v52 = *(_QWORD *)(a1 + 32);
            if (v124)
              v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d"), v52, v21, v51, v124);
            else
              v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I/O error for database at %@.  SQLite error code:%d, '%@'"), v52, v21, v51, v117);
            v54 = (void *)v53;
            if (v53)
            {
              v123 = 0;
              v55 = 256;
            }
            else
            {
LABEL_98:
              v54 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'"), *(_QWORD *)(a1 + 32), v21, sqlite3_errmsg(*(sqlite3 **)(a1 + 72)));
              v55 = (int)v21;
              v123 = CFSTR("NSSQLiteErrorDomain");
            }
            sqlite3_finalize(ppStmt);
            ppStmt = 0;
            -[NSSQLiteConnection _forceDisconnectOnError](a1);
            if (v54)
            {
              v62 = (const char *)objc_msgSend(v54, "UTF8String");
              v63 = 0;
            }
            else
            {
LABEL_101:
              v62 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
              v54 = 0;
              v63 = 1;
            }
            if (*(_BYTE *)(a1 + 42))
              v64 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m");
            else
              v64 = CFSTR("(%d) %s");
            _NSCoreDataLog(1, (uint64_t)v64, v56, v57, v58, v59, v60, v61, v21);
            if (v63)
            {
              v54 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during execution of SQL string '%s' : %s"), v15, v62);
              v55 = 256;
            }
            if (ppStmt)
              sqlite3_finalize(ppStmt);
            v65 = *MEMORY[0x1E0C99768];
            v66 = (void *)MEMORY[0x1E0C99D80];
            v67 = *(_QWORD *)(a1 + 32);
            v68 = *MEMORY[0x1E0CB2AA0];
            v69 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
            if (v124)
              v70 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
            else
              v70 = 0;
            v71 = (void *)objc_msgSend(v66, "dictionaryWithObjectsAndKeys:", v67, v68, v69, CFSTR("NSSQLiteErrorDomain"), v70, *MEMORY[0x1E0CB2FE0], 0);
            v72 = v65;
            v73 = v55;
            v74 = (uint64_t)v54;
LABEL_140:
            v96 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v72, v73, v74, v71);
            v97 = v96;
            if (v123)
              -[_NSCoreDataException _setDomain:]((uint64_t)v96, v123);
            objc_exception_throw(v97);
          }
          if (*(double *)(a1 + 232) > 0.0 && v6 == 0.0)
            v6 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          ++v17;
LABEL_27:
          if (v16 <= 0xA)
            v22 = 3 * v16 + 1;
          else
            v22 = v16 + 1101;
LABEL_30:
          usleep(v22);
LABEL_31:
          if (v6 != 0.0)
          {
            v23 = CFAbsoluteTimeGetCurrent();
            if (v23 > v6)
            {
              if (v121 <= 7)
              {
                ++v16;
                v6 = v23 + *(double *)(a1 + 240);
                ++v121;
                continue;
              }
              v98 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The database operation timed out after %.2f seconds."), v23 - v6 + *(double *)(a1 + 232));
              if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
              {
                if (*(_BYTE *)(a1 + 42))
                  v105 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m");
                else
                  v105 = CFSTR("(%d) %@");
                v116 = v98;
                _NSCoreDataLog(1, (uint64_t)v105, v99, v100, v101, v102, v103, v104, v21);
              }
              if (ppStmt)
                sqlite3_finalize(ppStmt);
              v106 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during SQL execution : %@"), v98, v116);
LABEL_162:
              v115 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134090, v106, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21), CFSTR("NSSQLiteErrorDomain")));
              objc_exception_throw(v115);
            }
          }
          v18 += 3;
          ++v16;
          goto LABEL_11;
        default:
          v123 = 0;
          v55 = 0;
          goto LABEL_101;
      }
    }
  }
  return 0;
}

void __36__NSSQLiteConnection__performBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_class();
  }
}

- (void)_performBlock:(uint64_t)a1
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD block[5];

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 8);
    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__NSSQLiteConnection__performBlock___block_invoke;
      block[3] = &unk_1E1EDFF40;
      block[4] = a2;
      dispatch_async(v3, block);
    }
    else
    {
      v4 = (void *)MEMORY[0x18D76B4E4]();
      (*(void (**)(uint64_t))(a2 + 16))(a2);
      objc_autoreleasePoolPop(v4);
      v5 = 0;
    }
  }
}

- (uint64_t)fetchBufferResultSet:(uint64_t)a3 usingFetchPlan:
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  int *plan_for_entity;
  objc_class *v12;
  size_t v13;
  malloc_zone_t *v14;
  _DWORD *v15;
  int v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  char *v26;
  int v27;
  malloc_zone_t *v28;
  char *v29;
  unsigned int v30;
  id v31;
  int v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  int *v38;
  int *v39;
  int v40;
  const unsigned __int8 *v41;
  const unsigned __int8 *v42;
  int v43;
  int v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  __objc2_class **v48;
  uint64_t v49;
  unint64_t v50;
  malloc_zone_t *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  int *v60;
  int *v61;
  int v62;
  sqlite3_int64 v63;
  sqlite3_int64 v64;
  char *v65;
  int *v66;
  int *v67;
  int v68;
  double v69;
  double v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  int *v75;
  int *v76;
  int v77;
  int v78;
  int v79;
  int *v80;
  int v81;
  int v82;
  int *v83;
  int *v84;
  int v85;
  const char *v86;
  int v87;
  size_t v88;
  int v89;
  uint64_t v90;
  void *v91;
  _QWORD *v92;
  uint64_t v93;
  _PFExternalReferenceData *v94;
  uint64_t v95;
  uint64_t v96;
  _PFExternalReferenceData *v97;
  int *v98;
  int *v99;
  int v100;
  int v101;
  int v102;
  char v103;
  unint64_t v104;
  unint64_t v105;
  int v106;
  _DWORD *v107;
  sqlite3_int64 *v108;
  uint64_t v109;
  uint64_t v110;
  sqlite3_int64 v111;
  int v112;
  int v113;
  objc_class *v114;
  size_t v115;
  malloc_zone_t *v116;
  char *v117;
  const void *v118;
  int v119;
  unsigned int v120;
  int *v121;
  int *v122;
  int v123;
  sqlite3_int64 v124;
  sqlite3_int64 v125;
  int v126;
  int v127;
  BOOL v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _PFExternalReferenceData *v138;
  uint64_t v139;
  uint64_t v140;
  _PFExternalReferenceData *v141;
  int v142;
  int v143;
  int v144;
  objc_class *v145;
  size_t v146;
  malloc_zone_t *v147;
  char *v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  int *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  int v167;
  int v168;
  unsigned int v169;
  int v170;
  unint64_t v171;
  uint64_t (*v172)(uint64_t, char *, sqlite3_int64);
  sqlite3_int64 v174;
  unsigned int v175;
  unsigned __int8 v176;
  unsigned int v177;
  unsigned int v178;
  uint64_t v179;
  int v180;
  uint64_t v181;
  int *v182;
  _DWORD *v183;
  size_t v184;

  v181 = result;
  if (result)
  {
    v4 = *(NSObject **)(result + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    v5 = *(_DWORD *)(a3 + 16);
    if (!v5)
      v5 = 0x7FFFFFFF;
    v168 = v5;
    v166 = *(_DWORD *)(a3 + 72);
    v163 = objc_msgSend(*(id *)(a3 + 40), "model");
    v6 = *(_QWORD *)(a3 + 48);
    if (v6)
      v167 = (*(unsigned __int8 *)(v6 + 43) >> 3) & 1;
    else
      v167 = 0;
    v7 = *(_QWORD *)(a3 + 40);
    if (v7)
      v8 = *(void **)(v7 + 240);
    else
      v8 = 0;
    v179 = objc_msgSend(v8, "length");
    v9 = *(_QWORD *)(a3 + 40);
    if (v9)
      v10 = *(_DWORD *)(v9 + 184);
    else
      v10 = 0;
    v162 = a3;
    v172 = *(uint64_t (**)(uint64_t, char *, sqlite3_int64))(a3 + 64);
    v165 = *(_QWORD *)(a3 + 40);
    plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((_QWORD *)v9);
    v12 = (objc_class *)objc_opt_class();
    v13 = ((class_getInstanceSize(v12) + 7) & 0xFFFFFFFFFFFFFFF8) + 8 * v179 + *plan_for_entity;
    if (v13 <= 0x800)
      v13 = 2048;
    v184 = v13;
    v14 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v14 = malloc_default_zone();
    v15 = malloc_type_zone_calloc(v14, 1uLL, v184, 0x7208F41FuLL);
    if (v168 >= 1)
    {
      v169 = 0;
      v16 = 0;
      v17 = v10;
      v164 = 2 * v179;
      while (1)
      {
        if ((*(_BYTE *)(v181 + 312) & 2) == 0)
          goto LABEL_175;
        if ((v166 & 1) != 0)
        {
          v18 = sqlite3_column_int(*(sqlite3_stmt **)(v181 + 80), 0);
          v19 = v18;
          if (!v18)
            -[NSSQLiteConnection handleCorruptedDB:](v181, (uint64_t)CFSTR("The database appears corrupt.  (invalid entity key)"));
          v17 = v18;
          if (v18 != *(_DWORD *)(v181 + 92))
          {
            v165 = (*(uint64_t (**)(uint64_t, char *, _QWORD))(v162 + 64))(v163, sel_entityForID_, v18);
            *(_QWORD *)(v181 + 104) = v165;
            *(_DWORD *)(v181 + 92) = v19;
            plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((_QWORD *)v165);
          }
        }
        v170 = v16;
        v20 = plan_for_entity[1];
        bzero(v15 + 2, v184 - 8);
        v15[5] = 0;
        v171 = v17;
        *((_QWORD *)v15 + 3) = v17;
        *((_QWORD *)v15 + 4) = 0;
        bzero(v15 + 10, v164 * 4);
        v21 = (char *)&v15[v164 + 10];
        v175 = v20;
        if (v20)
          break;
        v180 = 0;
LABEL_169:
        v15[5] = v180;
        bufferResultSetIngestRow(a2, v15, ((unint64_t)(v21 + 7) & 0xFFFFFFFFFFFFFFF8) - (_QWORD)v15);
        ++*(_DWORD *)(v181 + 88);
        v149 = v170;
        ++v169;
        v17 = v171;
LABEL_170:
        _execute(v181);
        v16 = v149 + 1;
        if (v16 == v168)
          goto LABEL_175;
      }
      v22 = 0;
      v180 = 0;
      v23 = 0;
      v174 = 0;
      v176 = 0;
      v24 = 0;
      v25 = (char *)&v15[v164 + 10];
      v26 = v25;
      v182 = plan_for_entity;
      while (1)
      {
        v21 = (char *)((unint64_t)(v26 + 7) & 0xFFFFFFFFFFFFFFF8);
        v27 = LOBYTE(plan_for_entity[6 * v24 + 5]);
        if (v21 - v26 >= 1)
          *(_QWORD *)&v25[8 * (v22 - v179) - 8] += v21 - v26;
        if ((char *)v15 - v21 + v184 <= 0xF)
        {
          v28 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone)
            v28 = malloc_default_zone();
          v184 += 16;
          v29 = (char *)malloc_type_zone_realloc(v28, v15, v184, 0xD4E68BFuLL);
          v25 = &v29[v25 - (char *)v15];
          v21 = (char *)((unint64_t)&v29[v26 - (char *)v15 + 7] & 0xFFFFFFFFFFFFFFF8);
          v15 = v29;
        }
        v30 = v24;
        if (v24 >= 7 && (v176 & 1) != 0)
        {
          if (!v23)
            v23 = v172(objc_msgSend(*(id *)(v181 + 16), "model"), sel_entityForID_, v174);
          v31 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (_QWORD *)v23);
          v32 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)&v182[6 * v24 + 6], "propertyDescription"), "name"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("TOMBSTONE"), &stru_1E1EE23F0), "intValue");
          if (v32 < (int)objc_msgSend(v31, "count"))
          {
            v33 = objc_msgSend(v31, "objectAtIndexedSubscript:", v32);
            if (v23)
              v34 = (void *)objc_msgSend(*(id *)(v23 + 40), "objectForKey:", v33);
            else
              v34 = 0;
            v27 = objc_msgSend(v34, "sqlType");
          }

        }
        v183 = v15;
        switch(v27)
        {
          case 1:
            v72 = v22;
            v73 = v23;
            v74 = v25;
            v75 = &v182[6 * v24];
            v77 = v75[3];
            v76 = v75 + 3;
            v78 = sqlite3_column_int(*(sqlite3_stmt **)(v181 + 80), v77);
            v79 = v78;
            v80 = &v182[6 * v24];
            v81 = *((unsigned __int8 *)v80 + 21);
            v82 = v80[4];
            plan_for_entity = v182;
            if (v81 == 4)
            {
              if ((v82 & 1) != 0)
              {
                if (v78)
                {
                  *(_DWORD *)v21 = 0;
                }
                else
                {
                  v119 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v76);
                  *(_DWORD *)v21 = v119 == 5;
                  if (v119 == 5)
                  {
                    ++v24;
                    v71 = v21;
                    v25 = v74;
                    v23 = v73;
                    v22 = v72;
                    v15 = v183;
                    goto LABEL_124;
                  }
                }
              }
              *(_QWORD *)v21 = v79;
              v71 = v21 + 8;
              v120 = v24 + 1;
              v121 = &v182[6 * v120];
              v123 = v121[3];
              v122 = v121 + 3;
              v124 = sqlite3_column_int64(*(sqlite3_stmt **)(v181 + 80), v123);
              v125 = v124;
              v177 = v120;
              if ((v182[6 * v120 + 4] & 1) == 0)
                goto LABEL_148;
              if (v124)
              {
                *(_QWORD *)v71 = 0;
                goto LABEL_148;
              }
              v131 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v122);
              *(_QWORD *)v71 = v131 == 5;
              if (v131 == 5)
              {
                _NSCoreDataLog(1, (uint64_t)CFSTR("BufferAllocations found a bad Object ID"), v132, v133, v134, v135, v136, v137, v157);
              }
              else
              {
LABEL_148:
                *((_QWORD *)v21 + 1) = v125;
                v71 = v21 + 16;
                ++v180;
              }
              v25 = v74;
              v23 = v73;
              v22 = v72;
              v15 = v183;
              goto LABEL_123;
            }
            if ((v82 & 1) != 0)
            {
              if (v78)
              {
                *(_DWORD *)v21 = 0;
              }
              else
              {
                v126 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v76);
                *(_DWORD *)v21 = v126 == 5;
                if (v126 == 5)
                {
                  v107 = v183;
                  v25 = v74;
                  v23 = v73;
                  v22 = v72;
                  goto LABEL_103;
                }
              }
            }
            *(_DWORD *)v21 = v79;
            if (v165)
              v127 = *(_DWORD *)(v165 + 184);
            else
              v127 = 0;
            v25 = v74;
            v130 = v24 == 3 && v127 == 16001 && v79 == 2;
            v176 |= v130;
            ++v180;
            v71 = v21 + 4;
            v23 = v73;
            v22 = v72;
            v15 = v183;
            goto LABEL_124;
          case 2:
          case 3:
            v56 = v24;
            v57 = v22;
            v58 = v23;
            v59 = v25;
            v60 = &v182[6 * v30];
            v62 = v60[3];
            v61 = v60 + 3;
            v63 = sqlite3_column_int64(*(sqlite3_stmt **)(v181 + 80), v62);
            v64 = v63;
            if ((v182[6 * v30 + 4] & 1) == 0)
              goto LABEL_104;
            if (v63)
            {
              *(_DWORD *)v21 = 0;
LABEL_104:
              v108 = (sqlite3_int64 *)v21;
              v25 = v59;
              v23 = v58;
              v22 = v57;
              v24 = v56;
              if (BYTE1(v182[6 * v30 + 5]) == 3)
              {
                v109 = objc_msgSend((id)objc_msgSend(*(id *)&v182[6 * v30 + 6], "toOneRelationship"), "destinationEntity");
                if (v109)
                  v110 = *(unsigned int *)(v109 + 184);
                else
                  v110 = 0;
                *(_QWORD *)v21 = v110;
                v108 = (sqlite3_int64 *)(v21 + 8);
              }
              *v108 = v64;
              v71 = (char *)(v108 + 1);
              v111 = v174;
              if ((v176 & (v56 == 5)) != 0)
                v111 = v64;
              v174 = v111;
              ++v180;
              plan_for_entity = v182;
              v15 = v183;
              goto LABEL_124;
            }
            v106 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v61);
            *(_DWORD *)v21 = v106 == 5;
            if (v106 != 5)
              goto LABEL_104;
            plan_for_entity = v182;
            v107 = v183;
            v25 = v59;
            v23 = v58;
            v22 = v57;
            v24 = v56;
LABEL_103:
            v15 = v107;
            goto LABEL_125;
          case 4:
          case 5:
          case 6:
          case 9:
          case 12:
          case 13:
          case 14:
            v177 = v24;
            v35 = v22;
            v36 = v23;
            v37 = v25;
            v38 = &v182[6 * v30];
            v40 = v38[3];
            v39 = v38 + 3;
            v41 = sqlite3_column_text(*(sqlite3_stmt **)(v181 + 80), v40);
            v42 = v41;
            if ((v182[6 * v30 + 4] & 1) == 0)
              goto LABEL_47;
            if (v41 && *v41)
            {
              *(_DWORD *)v21 = 0;
            }
            else
            {
              v43 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v39);
              *(_DWORD *)v21 = v43 == 5;
              if (v43 == 5)
              {
                plan_for_entity = v182;
                v25 = v37;
LABEL_46:
                v23 = v36;
                v22 = v35;
                v24 = v177;
                goto LABEL_125;
              }
LABEL_47:
              if (!v42)
              {
                v17 = v171;
                v150 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Row (pk = %ld) for entity '%@' is missing mandatory text data for property '%@'"), 0, objc_msgSend((id)objc_msgSend((id)_sqlEntityForEntityID(v163, v171), "entityDescription"), "name"), objc_msgSend((id)objc_msgSend(*(id *)&v182[6 * v30 + 6], "propertyDescription"), "name"));
                _NSCoreDataLog(1, (uint64_t)CFSTR("%@\n"), v151, v152, v153, v154, v155, v156, v150);
                plan_for_entity = v182;
                v149 = v170;
                goto LABEL_170;
              }
            }
            objc_opt_self();
            LOBYTE(v44) = *v42;
            v45 = 0;
            if (*v42)
            {
              v46 = 0;
              do
              {
                if ((v44 & 0x80u) != 0)
                  v45 = 1;
                v47 = v46 + 1;
                v44 = v42[++v46];
              }
              while (v44);
            }
            else
            {
              v47 = 0;
            }
            v48 = off_1E1EDAE68;
            if (v45)
              v48 = &off_1E1EDAE70;
            v49 = -[__objc2_class bufferOffset](*v48, "bufferOffset");
            v50 = v49 + (((v47 << 32) + 0x100000000) >> 32);
            if (v184 - (v21 - (char *)v183) < v50)
            {
              v51 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone)
                v51 = malloc_default_zone();
              v184 += 2 * (int)v50;
              v52 = (char *)malloc_type_zone_realloc(v51, v183, v184, 0xBAF6857EuLL);
              v21 = &v52[v21 - (char *)v183];
              v37 = &v52[v37 - (char *)v183];
              v183 = v52;
            }
            if (v45 || (int)v47 > 7)
            {
              if (v45)
                v53 = -1;
              else
                v53 = 0;
              *(_QWORD *)v21 = v53;
              *((_DWORD *)v21 + 4) = v47;
              v54 = &v21[v49];
              memcpy(v54, v42, (int)v47);
              v55 = &v54[(int)v47];
              goto LABEL_76;
            }
            if ((*(_BYTE *)(a2 + 40) & 2) != 0)
            {
              memcpy(v21, v42, (int)v47);
              v55 = &v21[(int)v47];
LABEL_76:
              *v55 = 0;
              v71 = v55 + 1;
              plan_for_entity = v182;
              v15 = v183;
              v25 = v37;
              goto LABEL_122;
            }
            __memmove_chk();
            plan_for_entity = v182;
            v104 = (8 * (int)v47) | 0x8000000000000002;
            v105 = *MEMORY[0x1E0DE7C58] ^ v104;
            if ((~v105 & 0xC000000000000007) == 0)
            {
              v15 = v183;
              v25 = v37;
LABEL_121:
              *(_QWORD *)v21 = v104;
              v71 = v21 + 8;
              goto LABEL_122;
            }
            v71 = v21;
            v104 = v105 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v105 & 7));
            v15 = v183;
            v25 = v37;
            if (v104)
              goto LABEL_121;
LABEL_122:
            ++v180;
            v23 = v36;
            v22 = v35;
LABEL_123:
            v24 = v177;
LABEL_124:
            *(_QWORD *)&v25[8 * (v22 - v179)] = v71 - v21;
            v21 = v71;
LABEL_125:
            ++v24;
            ++v22;
            v26 = v21;
            if (v24 >= v175)
              goto LABEL_169;
            break;
          case 7:
          case 8:
            v65 = v25;
            v66 = &v182[6 * v24];
            v68 = v66[3];
            v67 = v66 + 3;
            v69 = sqlite3_column_double(*(sqlite3_stmt **)(v181 + 80), v68);
            v70 = v69;
            plan_for_entity = v182;
            if ((v182[6 * v24 + 4] & 1) == 0)
              goto LABEL_113;
            if (v69 == 0.0)
            {
              v112 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v67);
              *(_DWORD *)v21 = v112 == 5;
              if (v112 == 5)
              {
                v25 = v65;
                goto LABEL_125;
              }
            }
            else
            {
              *(_DWORD *)v21 = 0;
            }
LABEL_113:
            *(double *)v21 = v70;
            v71 = v21 + 8;
            ++v180;
            v25 = v65;
            goto LABEL_124;
          case 16:
            if (!v167)
              goto LABEL_93;
            if ((objc_msgSend((id)objc_msgSend(*(id *)&v182[6 * v24 + 6], "propertyDescription"), "_isFileBackedFuture") & 1) != 0)goto LABEL_93;
            v83 = &v182[6 * v24];
            v85 = v83[3];
            v84 = v83 + 3;
            v86 = (const char *)sqlite3_column_blob(*(sqlite3_stmt **)(v181 + 80), v85);
            v87 = sqlite3_column_bytes(*(sqlite3_stmt **)(v181 + 80), *v84);
            v88 = (v87 - 1);
            if (v87 < 1)
              goto LABEL_93;
            v160 = v84;
            v161 = v22;
            v178 = v87;
            result = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v89 = *(unsigned __int8 *)v86;
            if (v89 == 1)
            {
              v138 = [_PFExternalReferenceData alloc];
              v139 = *(_QWORD *)(v181 + 16);
              if (v139)
                v140 = (*(_DWORD *)(v139 + 192) >> 2) & 7;
              else
                v140 = 0;
              v97 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:](v138, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:", v86, v178, 0, 0, v140);
            }
            else
            {
              if (v89 == 3)
              {
                __break(1u);
                return result;
              }
              v159 = v86;
              v90 = objc_msgSend((id)result, "stringWithFileSystemRepresentation:length:", v86 + 1, strnlen(v86 + 1, v88));
              v91 = (void *)objc_msgSend(*(id *)(v181 + 16), "externalDataReferencesDirectory");
              v92 = *(_QWORD **)(v181 + 16);
              if (v92)
              {
                if (!v92[20])
                  objc_msgSend(*(id *)(v181 + 16), "externalDataReferencesDirectory");
                v92 = (_QWORD *)v92[21];
              }
              v158 = objc_msgSend(v91, "stringByAppendingPathComponent:", v90);
              v93 = objc_msgSend(v92, "stringByAppendingPathComponent:", v90);
              v94 = [_PFExternalReferenceData alloc];
              v95 = *(_QWORD *)(v181 + 16);
              if (v95)
                v96 = (*(_DWORD *)(v95 + 192) >> 2) & 7;
              else
                v96 = 0;
              v97 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:](v94, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:", v159, v178, v158, v93, v96);
            }
            v141 = v97;
            v142 = -[_PFExternalReferenceData length](v97, "length");
            v143 = v142;
            plan_for_entity = v182;
            if ((v182[6 * v24 + 4] & 1) == 0)
              goto LABEL_158;
            if (v142)
            {
              *(_DWORD *)v21 = 0;
            }
            else
            {
              v144 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v160);
              *(_DWORD *)v21 = v144 == 5;
              if (v144 == 5)
              {

                v22 = v161;
                goto LABEL_125;
              }
            }
LABEL_158:
            v145 = (objc_class *)objc_opt_class();
            v146 = ((class_getInstanceSize(v145) + 7) & 0xFFFFFFF8) + v143;
            if (v184 - (v21 - (char *)v15) < v146)
            {
              v147 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone)
                v147 = malloc_default_zone();
              v184 += v146;
              v148 = (char *)malloc_type_zone_realloc(v147, v15, v184, 0x5C3CB237uLL);
              v21 = &v148[v21 - (char *)v15];
              v25 = &v148[v25 - (char *)v15];
              v15 = v148;
            }
            *(_QWORD *)v21 = 0;
            *((_DWORD *)v21 + 3) = v143;
            memcpy(v21 + 24, -[_PFExternalReferenceData bytes](v141, "bytes"), v143);

            ++v180;
            v71 = &v21[v143 + 24];
            v22 = v161;
            goto LABEL_124;
          default:
LABEL_93:
            v177 = v24;
            v35 = v22;
            v36 = v23;
            v98 = &v182[6 * v30];
            v100 = v98[3];
            v99 = v98 + 3;
            v101 = sqlite3_column_bytes(*(sqlite3_stmt **)(v181 + 80), v100);
            v102 = v101;
            v103 = v182[6 * v30 + 4];
            plan_for_entity = v182;
            if ((v103 & 1) == 0)
              goto LABEL_115;
            if (v101)
            {
              *(_DWORD *)v21 = 0;
            }
            else
            {
              v113 = sqlite3_column_type(*(sqlite3_stmt **)(v181 + 80), *v99);
              *(_DWORD *)v21 = v113 == 5;
              if (v113 == 5)
                goto LABEL_46;
            }
LABEL_115:
            v114 = (objc_class *)objc_opt_class();
            v115 = ((class_getInstanceSize(v114) + 7) & 0xFFFFFFF8) + v102;
            if (v184 - (v21 - (char *)v15) < v115)
            {
              v116 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone)
                v116 = malloc_default_zone();
              v184 += v115;
              v117 = (char *)malloc_type_zone_realloc(v116, v15, v184, 0x704EEAAEuLL);
              v21 = &v117[v21 - (char *)v15];
              v25 = &v117[v25 - (char *)v15];
              v15 = v117;
            }
            *(_QWORD *)v21 = 0;
            *((_DWORD *)v21 + 3) = v102;
            v118 = sqlite3_column_blob(*(sqlite3_stmt **)(v181 + 80), *v99);
            memcpy(v21 + 24, v118, v102);
            v71 = &v21[v102 + 24];
            goto LABEL_122;
        }
      }
    }
    v169 = 0;
LABEL_175:
    PF_FREE_OBJECT_ARRAY(v15);
    if (v169 <= 0x40000000)
      result = v169;
    else
      result = 0;
    if ((*(_BYTE *)(v181 + 312) & 2) == 0)
      *(_DWORD *)(a2 + 40) |= 1u;
  }
  return result;
}

- (void)executeAttributeUniquenessCheckSQLStatement:(void *)a3 returningColumns:
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
  objc_msgSend((id)a1, "execute");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v11 && *(_BYTE *)(v11 + 24) == 7)
        {
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          if (*(_QWORD *)(v11 + 72))
            objc_msgSend(v7, "addObject:");
        }
        else
        {
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v7);
  while (1)
  {
    v12 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v12)
      break;
    objc_msgSend(v6, "addObject:", v12);

  }
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(_QWORD *)(a1 + 100) = 0;
  *(_QWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection _finalizeStatement](a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  return v6;
}

- (void)writeCorrelationChangesFromTracker:(uint64_t)a1
{
  if (a1)
  {
    -[NSSQLiteConnection writeCorrelationInsertsFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationDeletesFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationMasterReordersFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationReordersFromTracker:](a1, a2);
  }
}

- (void)writeCorrelationMasterReordersFromTracker:(uint64_t)a1
{
  NSObject *v4;
  __CFString *v5;
  void *v6;
  NSSQLiteStatementCache *v7;
  NSSQLiteStatementCache *v8;
  const __CFDictionary *correlationMasterReorderCache;
  NSSQLiteStatement *Value;
  NSSQLiteStatement *v11;
  sqlite3_stmt *cachedSQLiteStatement;
  int v13;
  uint64_t v14;
  const __CFDictionary *correlationMasterReorderCachePart2;
  NSSQLiteStatement *v16;
  NSSQLiteStatement *v17;
  sqlite3_stmt *v18;
  int v19;
  _QWORD v20[7];
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if (a2 && *(_QWORD *)(a2 + 32))
    {
      v5 = *(__CFString **)(a2 + 8);
      v6 = v5 ? (void *)objc_msgSend(*(id *)(a2 + 8), "propertyDescription") : 0;
      if (objc_msgSend(v6, "isOrdered"))
      {
        v7 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
        v8 = v7;
        if (v7
          && (correlationMasterReorderCache = v7->_correlationMasterReorderCache) != 0
          && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationMasterReorderCache, v5)) != 0
          && (v11 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
        {
          v13 = 0;
          *(_QWORD *)(a1 + 80) = cachedSQLiteStatement;
        }
        else
        {
          v11 = -[NSSQLiteAdapter newCorrelationMasterReorderStatementForRelationship:]((_QWORD *)objc_msgSend((id)a1, "adapter"), v5);
          -[NSSQLiteConnection prepareSQLStatement:](a1, v11);
          -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v11, *(sqlite3_stmt **)(a1 + 80), a1);
          -[NSSQLiteStatementCache cacheCorrelationMasterReorderStatement:forRelationship:]((__CFDictionary *)v8, v11, v5);

          v13 = 1;
        }
        v28 = 0;
        v29 = &v28;
        v30 = 0x2020000000;
        v31 = 0;
        v22 = 0;
        v23 = &v22;
        v24 = 0x3052000000;
        v25 = __Block_byref_object_copy__29;
        v26 = __Block_byref_object_dispose__29;
        v27 = 0;
        v14 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke;
        v21[3] = &unk_1E1EDFFE0;
        v21[4] = a1;
        v21[5] = &v28;
        v21[6] = &v22;
        -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersUsingBlock:](a2, (uint64_t)v21);
        if (!*((_BYTE *)v29 + 24))
        {
          if (v13)
            -[NSSQLiteConnection addVMCachedStatement:](a1, v11);
          -[NSSQLiteConnection resetSQLStatement](a1);
          if (!v5
            || (__CFString *)v5[1].length != v5
            || !objc_msgSend((id)-[__CFString propertyDescription](v5, "propertyDescription"), "isOrdered"))
          {
            goto LABEL_31;
          }
          if (v8
            && (correlationMasterReorderCachePart2 = v8->_correlationMasterReorderCachePart2) != 0
            && (v16 = (NSSQLiteStatement *)CFDictionaryGetValue(correlationMasterReorderCachePart2, v5),
                (v17 = v16) != 0)
            && (v18 = v16->_cachedSQLiteStatement) != 0)
          {
            v19 = 0;
            *(_QWORD *)(a1 + 80) = v18;
          }
          else
          {
            v17 = -[NSSQLiteAdapter newCorrelationMasterReorderStatementPart2ForRelationship:]((_QWORD *)objc_msgSend((id)a1, "adapter"), v5);
            -[NSSQLiteConnection prepareSQLStatement:](a1, v17);
            -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v17, *(sqlite3_stmt **)(a1 + 80), a1);
            -[NSSQLiteStatementCache cacheCorrelationMasterReorderStatement:forRelationship:]((__CFDictionary *)v8, v17, v5);

            v19 = 1;
          }
          v20[0] = v14;
          v20[1] = 3221225472;
          v20[2] = __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke_2;
          v20[3] = &unk_1E1EDFFE0;
          v20[4] = a1;
          v20[5] = &v28;
          v20[6] = &v22;
          -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersPart2UsingBlock:](a2, (uint64_t)v20);
          if (!*((_BYTE *)v29 + 24))
          {
            if (v19)
              -[NSSQLiteConnection addVMCachedStatement:](a1, v17);
            -[NSSQLiteConnection resetSQLStatement](a1);
LABEL_31:
            _Block_object_dispose(&v22, 8);
            _Block_object_dispose(&v28, 8);
            return;
          }
        }
        objc_exception_throw((id)v23[5]);
      }
    }
  }
}

- (void)writeCorrelationInsertsFromTracker:(uint64_t)a1
{
  NSObject *v4;
  __CFString *v5;
  NSSQLiteStatementCache *v6;
  __CFDictionary *v7;
  const __CFDictionary *correlationInsertCache;
  NSSQLiteStatement *Value;
  NSSQLiteStatement *v10;
  sqlite3_stmt *cachedSQLiteStatement;
  int v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if (a2 && *(_QWORD *)(a2 + 16))
    {
      v5 = *(__CFString **)(a2 + 8);
      v6 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
      v7 = (__CFDictionary *)v6;
      if (v6
        && (correlationInsertCache = v6->_correlationInsertCache) != 0
        && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationInsertCache, v5)) != 0
        && (v10 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
      {
        v12 = 0;
        *(_QWORD *)(a1 + 80) = cachedSQLiteStatement;
      }
      else
      {
        v10 = -[NSSQLiteAdapter newCorrelationInsertStatementForRelationship:]((_QWORD *)objc_msgSend((id)a1, "adapter"), v5);
        -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v10, *(sqlite3_stmt **)(a1 + 80), a1);
        -[NSSQLiteStatementCache cacheCorrelationInsertStatement:forRelationship:](v7, v10, v5);

        v12 = 1;
      }
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v14 = 0;
      v15 = &v14;
      v16 = 0x3052000000;
      v17 = __Block_byref_object_copy__29;
      v18 = __Block_byref_object_dispose__29;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__NSSQLiteConnection_writeCorrelationInsertsFromTracker___block_invoke;
      v13[3] = &unk_1E1EDFF90;
      v13[4] = a1;
      v13[5] = &v20;
      v13[6] = &v14;
      -[NSSQLCorrelationTableUpdateTracker enumerateInsertsUsingBlock:](a2, (uint64_t)v13);
      if (v12)
        -[NSSQLiteConnection addVMCachedStatement:](a1, v10);
      if (*((_BYTE *)v21 + 24))
        objc_exception_throw((id)v15[5]);
      -[NSSQLiteConnection resetSQLStatement](a1);
      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v20, 8);
    }
  }
}

- (void)writeCorrelationDeletesFromTracker:(uint64_t)a1
{
  NSObject *v4;
  __CFString *v5;
  NSSQLiteStatementCache *v6;
  __CFDictionary *v7;
  const __CFDictionary *correlationDeleteCache;
  NSSQLiteStatement *Value;
  NSSQLiteStatement *v10;
  sqlite3_stmt *cachedSQLiteStatement;
  int v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if (a2 && *(_QWORD *)(a2 + 24))
    {
      v5 = *(__CFString **)(a2 + 8);
      v6 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
      v7 = (__CFDictionary *)v6;
      if (v6
        && (correlationDeleteCache = v6->_correlationDeleteCache) != 0
        && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationDeleteCache, v5)) != 0
        && (v10 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
      {
        v12 = 0;
        *(_QWORD *)(a1 + 80) = cachedSQLiteStatement;
      }
      else
      {
        v10 = -[NSSQLiteAdapter newCorrelationDeleteStatementForRelationship:]((_QWORD *)objc_msgSend((id)a1, "adapter"), v5);
        -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v10, *(sqlite3_stmt **)(a1 + 80), a1);
        -[NSSQLiteStatementCache cacheCorrelationDeleteStatement:forRelationship:](v7, v10, v5);

        v12 = 1;
      }
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v14 = 0;
      v15 = &v14;
      v16 = 0x3052000000;
      v17 = __Block_byref_object_copy__29;
      v18 = __Block_byref_object_dispose__29;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__NSSQLiteConnection_writeCorrelationDeletesFromTracker___block_invoke;
      v13[3] = &unk_1E1EDFFB8;
      v13[4] = a1;
      v13[5] = &v20;
      v13[6] = &v14;
      -[NSSQLCorrelationTableUpdateTracker enumerateDeletesUsingBlock:](a2, (uint64_t)v13);
      if (v12)
        -[NSSQLiteConnection addVMCachedStatement:](a1, v10);
      if (*((_BYTE *)v21 + 24))
        objc_exception_throw((id)v15[5]);
      -[NSSQLiteConnection resetSQLStatement](a1);
      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v20, 8);
    }
  }
}

- (uint64_t)registerCurrentQueryGenerationWithStore:(uint64_t)a3 retries:
{
  _PFSQLiteSnapshotWrapper *v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  if (!a1)
    return 0;
  -[NSSQLiteConnection connect]((uint64_t)a1);
  if (-[NSSQLiteConnection _ensureWalFileExists]((uint64_t)a1) < 0)
    return 14;
  -[NSSQLiteConnection beginReadTransaction]((uint64_t)a1);
  v10 = 0;
  v6 = -[NSSQLiteConnection _currentQueryGenerationSnapshot:](a1, (uint64_t *)&v10);
  if (v6)
    v7 = -[NSSQLCore _registerNewQueryGenerationSnapshot:](a2, (uint64_t)v6);
  else
    v7 = 0;
  -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
  if (!v6)
  {
    if (v10)
    {
      v8 = objc_msgSend(v10, "code");
      if (a3)
      {
        if (v8 == 134181)
          v7 = -[NSSQLiteConnection registerCurrentQueryGenerationWithStore:retries:](a1, a2, 0);
      }
    }
  }

  return v7;
}

- (int)registerCurrentQueryGenerationWithStore:(id)a3
{
  return -[NSSQLiteConnection registerCurrentQueryGenerationWithStore:retries:]((_PFSQLiteSnapshotWrapper *)self, (uint64_t)a3, 1);
}

- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a1)
    return 0;
  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  if (objc_msgSend(*(id *)(a1 + 328), "count"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 328), "count");
    v6 = v5;
    if (!v5)
      return 0;
    v7 = 0;
    v8 = v5 - 1;
    while (1)
    {
      v9 = objc_msgSend(a2, "compare:", objc_msgSend(*(id *)(a1 + 328), "objectAtIndex:", v7));
      if (v9 < 0)
        break;
      if (v9)
      {
        if (v8 == v7)
          objc_msgSend(*(id *)(a1 + 328), "addObject:", a2);
        if (v6 != ++v7)
          continue;
      }
      return 0;
    }
    objc_msgSend(*(id *)(a1 + 328), "insertObject:atIndex:", a2, v7);
    if (v7)
      return 0;
    v10 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, (uint64_t)a2);
    v17 = v10;
    if (!(_DWORD)v10)
      return v17;
    goto LABEL_14;
  }
  -[NSSQLiteConnection beginReadTransaction](a1);
  objc_msgSend(*(id *)(a1 + 328), "addObject:", a2);
  v10 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, (uint64_t)a2);
  v17 = v10;
  if ((_DWORD)v10)
LABEL_14:
    _NSCoreDataLog(1, (uint64_t)CFSTR("_registerNewQueryGenerationSnapshot failed to adopt query generation with error %d"), v11, v12, v13, v14, v15, v16, v10);
  return v17;
}

- (id)initAsQueryGenerationTrackingConnectionForSQLCore:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = -[NSSQLiteConnection initForSQLCore:](self, "initForSQLCore:", a3);
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__NSSQLiteConnection_initAsQueryGenerationTrackingConnectionForSQLCore___block_invoke;
    v6[3] = &unk_1E1EDD0E0;
    v6[4] = v3;
    v6[5] = &v7;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v3, (uint64_t)v6);
    if (!*((_BYTE *)v8 + 24))
    {

      v4 = 0;
    }
  }
  if (!*((_BYTE *)v8 + 24))
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __72__NSSQLiteConnection_initAsQueryGenerationTrackingConnectionForSQLCore___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
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
  BOOL v19;
  _PFSQLiteSnapshotWrapper *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 312) |= 0x800u;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[NSSQLiteConnection connect](*(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    -[NSSQLiteConnection _hasTableWithName:isTemp:](v3, (uint64_t)CFSTR("Z_METADATA"), 0);
    v3 = *(_QWORD *)(a1 + 32);
  }
  v4 = -[NSSQLiteConnection _ensureWalFileExists](v3);
  v11 = v4;
  if (v4 < 41943041)
  {
    if (v4 < 0)
    {
      v21 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 14, (uint64_t)CFSTR("failed to open journal file"), 0);
      -[_NSCoreDataException _setDomain:]((uint64_t)v21, CFSTR("NSSQLiteErrorDomain"));
      objc_exception_throw(v21);
    }
    v12 = sqlite3_snapshot_recover(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 72), "main");
    if ((_DWORD)v12)
      v19 = v11 == 0;
    else
      v19 = 1;
    if (!v19)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("sqlite3_snapshot_recover failed with %d"), v13, v14, v15, v16, v17, v18, v12);
      goto LABEL_12;
    }
  }
  else
  {
    _NSCoreDataLog(2, (uint64_t)CFSTR("Force checkpointing -wal while initializing query generations due to its large size (%lld)"), v5, v6, v7, v8, v9, v10, v4);
    -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](*(_QWORD *)(a1 + 32), 1, 0);
    -[NSSQLiteConnection _ensureWalFileExists](*(_QWORD *)(a1 + 32));
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 312) |= 0x200u;
LABEL_12:
  -[NSSQLiteConnection _executeSQLString:](*(_QWORD *)(a1 + 32), CFSTR("pragma cache_size = 10"));
  -[NSSQLiteConnection beginReadTransaction](*(_QWORD *)(a1 + 32));
  v20 = -[NSSQLiteConnection _currentQueryGenerationSnapshot:](*(_PFSQLiteSnapshotWrapper **)(a1 + 32), &v23);
  -[NSSQLiteConnection rollbackTransaction](*(_QWORD *)(a1 + 32));
  if (v20)
  {

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_msgSend(v2, "drain");
  v22 = 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    -[NSSQLiteConnection disconnect](*(_QWORD *)(a1 + 32));
}

- (void)_forceDisconnectOnError
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
      dispatch_assert_queue_V2(v2);
    v11 = 0;
    objc_msgSend(*(id *)(a1 + 328), "removeAllObjects");
    v3 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: SQLite disconnection (forced error)"), &v11);
    *(_BYTE *)(a1 + 40) = 0;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection _clearTransactionCaches](a1);
    -[NSSQLiteConnection _clearCachedStatements]((NSObject **)a1);
    if (*(_QWORD *)(a1 + 72))
    {
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault"))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Disconnecting from sqlite database due to an error."), v4, v5, v6, v7, v8, v9, v10);
      sqlite3_close_v2(*(sqlite3 **)(a1 + 72));
    }

    *(_QWORD *)(a1 + 304) = 0;
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(_QWORD *)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 80) = 0;
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v11, v3);
  }
}

- (id)fetchTableNames
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;
  NSSQLiteStatement *v6;
  NSSQLColumn *v7;
  void *v8;
  void *v9;
  void *v10;
  int i;

  if (result)
  {
    v1 = (uint64_t)result;
    v2 = *((_QWORD *)result + 1);
    if (v2)
      dispatch_assert_queue_V2(v2);
    v3 = 0;
    v4 = 0;
    for (i = 3; (v4 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v1);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
      v6 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)v1, "adapter"), (uint64_t)CFSTR("SELECT TBL_NAME FROM SQLITE_MASTER WHERE TYPE = \"table\" ORDER BY TBL_NAME"));
      v7 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("TBL_NAME"), 6);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
      -[NSSQLiteConnection prepareSQLStatement:](v1, v6);
      objc_msgSend((id)v1, "execute");
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v1, v8);
      while (1)
      {
        v9 = -[NSSQLiteConnection newFetchedArray](v1);
        v10 = v9;
        if (!v9)
          break;
        objc_msgSend(v5, "addObject:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "uppercaseString"));

      }
      v4 = 1;
      -[NSSQLiteConnection releaseSQLStatement](v1);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v1, 0);
      *(_DWORD *)(v1 + 312) &= ~2u;
      *(_QWORD *)(v1 + 92) = 0;
      *(_QWORD *)(v1 + 100) = 0;
      *(_DWORD *)(v1 + 108) = 0;

      v3 = v5;
    }
    return v3;
  }
  return result;
}

- (void)createMapOfEntityNameToPKMaxForEntities:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id obj;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend(a2, "count"))
    return 0;
  v3 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntitiesFromPKTable:](a1, a2);
  v4 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntitiesFromUBRangeTable:](a1, a2);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v24 = (void *)v5;
  v25 = v3;
  v26 = v4;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a2;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v7)
    goto LABEL_27;
  v8 = 0;
  v9 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v29 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", -[NSSQLiteConnection _fetchMaxPrimaryKeyForEntity:](a1, v11));
      v13 = objc_msgSend(v26, "objectForKey:", objc_msgSend(v11, "name"));
      v14 = objc_msgSend(v25, "objectForKey:", objc_msgSend(v11, "name"));
      if (v13)
        v15 = (void *)v13;
      else
        v15 = v6;
      if (v14)
        v16 = (void *)v14;
      else
        v16 = v6;
      v17 = objc_msgSend(v12, "compare:", v15);
      if (v17 == -1)
        v18 = v15;
      else
        v18 = v8;
      if (v17 >= 2)
        v8 = v18;
      else
        v8 = v12;
      v19 = objc_msgSend(v8, "compare:", v16);
      if (v19 >= 2)
      {
        if (v19 != -1)
          goto LABEL_25;
        v20 = objc_msgSend(v11, "name");
      }
      else
      {
        v20 = objc_msgSend(v11, "name");
        v16 = v8;
      }
      objc_msgSend(v24, "setObject:forKey:", v16, v20);
LABEL_25:

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v7);
LABEL_27:
  v21 = v24;

  return v21;
}

- (void)createTableForEntity:(void *)a1
{
  NSSQLiteStatement *v3;

  if (a1 && a2 && !a2[20])
  {
    v3 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((const __CFString *)objc_msgSend(a1, "adapter"), a2);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v3);

  }
}

- (void)createManyToManyTablesForEntity:(void *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __CFString *v8;
  __CFString *v9;
  NSSQLiteStatement *v10;

  if (a1)
  {
    v4 = (void *)objc_msgSend(a2, "manyToManyRelationships");
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (__CFString *)objc_msgSend(v4, "objectAtIndex:", i);
        if (v8)
        {
          v9 = v8;
          if (v8[2].isa)
          {
            if ((void *)-[__CFString entity](v8, "entity") == a2)
            {
              v10 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), v9);
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v10);

            }
          }
        }
      }
    }
  }
}

- (uint64_t)_createIndexesForEntities:(void *)a1
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(a2);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[NSSQLiteConnection createIndexesForEntity:](a1, v8);
        if (v8)
        {
          if (!objc_msgSend(*(id *)(v8 + 152), "count"))
            goto LABEL_10;
          v9 = *(_QWORD *)(v8 + 152);
LABEL_9:
          -[NSSQLiteConnection _createIndexesForEntities:](a1, v9);
          goto LABEL_10;
        }
        v10 = objc_msgSend(0, "count");
        v9 = 0;
        if (v10)
          goto LABEL_9;
LABEL_10:
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)createIndexesForEntity:(void *)a1
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = +[NSSQLCore debugDefault](NSSQLCore, "debugDefault") > 0
      || +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") > 0;
    v5 = objc_msgSend(a1, "adapter");
    if (v5)
      v6 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v5, a2, 0);
    else
      v6 = 0;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v6);
          v16 = *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v4)
            _NSCoreDataLog(4, (uint64_t)CFSTR("  Execute create index statement: %@"), v7, v8, v9, v10, v11, v12, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v16);
        }
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

- (uint64_t)createTriggersForEntities:(uint64_t)result
{
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  NSSQLEntity_DerivedAttributesExtension *v6;
  NSSQLEntity_DerivedAttributesExtension *v7;
  NSSQLEntity_DerivedAttributesExtension *v8;
  NSMutableArray *triggerSQL;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
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
  _BYTE v49[128];
  _BYTE v50[128];
  const __CFString *v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = (void *)result;
    v3 = +[NSSQLCore debugDefault](NSSQLCore, "debugDefault") > 0
      || +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") > 0;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    v35 = result;
    if (result)
    {
      v34 = *(_QWORD *)v46;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v46 != v34)
          {
            v5 = v4;
            objc_enumerationMutation(a2);
            v4 = v5;
          }
          v36 = v4;
          v6 = *(NSSQLEntity_DerivedAttributesExtension **)(*((_QWORD *)&v45 + 1) + 8 * v4);
          v7 = -[NSSQLEntity derivedAttributesExtension](v6);
          v8 = v7;
          if (!v7
            || (-[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL]((uint64_t)v7),
                (triggerSQL = v8->_triggerSQL) == 0))
          {
            v31 = (void *)MEMORY[0x1E0C99DA0];
            v51 = CFSTR("entity");
            v52 = -[NSSQLEntity_DerivedAttributesExtension entityDescription](v6, "entityDescription");
            v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
            objc_exception_throw((id)objc_msgSend(v31, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unsupported derivedAttribute"), v32));
          }
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](triggerSQL, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v42 != v17)
                  objc_enumerationMutation(triggerSQL);
                v19 = *(_QWORD **)(*((_QWORD *)&v41 + 1) + 8 * i);
                if (v3)
                  _NSCoreDataLog(4, (uint64_t)CFSTR("  Execute DA trigger creation statement: %@"), v10, v11, v12, v13, v14, v15, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v2, v19);
              }
              v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](triggerSQL, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v16);
          }
          v20 = -[NSSQLiteAdapter newCreateTriggersForEntity:existingRtreeTables:](objc_msgSend(v2, "adapter"), (id *)&v6->super.isa, 0);
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v27 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v38 != v28)
                  objc_enumerationMutation(v20);
                v30 = *(_QWORD **)(*((_QWORD *)&v37 + 1) + 8 * j);
                if (v3)
                  _NSCoreDataLog(4, (uint64_t)CFSTR("  Execute trigger creation statement: %@"), v21, v22, v23, v24, v25, v26, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v2, v30);
              }
              v27 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            }
            while (v27);
          }

          v4 = v36 + 1;
        }
        while (v36 + 1 != v35);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        v35 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)createTablesForEntities:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)result;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(a2);
          v8 = *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSSQLiteConnection createTableForEntity:](v3, v8);
          -[NSSQLiteConnection createManyToManyTablesForEntity:](v3, v8);
        }
        v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v5);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(a2);
          -[NSSQLiteConnection createIndexesForEntity:](v3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j));
        }
        v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }
    return -[NSSQLiteConnection createTriggersForEntities:]((uint64_t)v3, a2);
  }
  return result;
}

- (void)createMetadata
{
  NSSQLiteStatement *v2;

  v2 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE %@ (%@ INTEGER PRIMARY KEY, %@ VARCHAR(255), %@ BLOB)"), CFSTR("Z_METADATA"), CFSTR("Z_VERSION"), CFSTR("Z_UUID"), CFSTR("Z_PLIST")));
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v2);

}

- (void)createMissingHistoryTables
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    v3 = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
    v4 = v3;
    if (v3)
      v3 = (_QWORD *)v3[4];
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    if (v4)
      v4 = (_QWORD *)v4[5];
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, objc_msgSend(v10, "tableName", (_QWORD)v11), 0) & 1) == 0)
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    if (objc_msgSend(v5, "count", (_QWORD)v11))
      -[NSSQLiteConnection createTablesForEntities:](a1, v5);
    objc_autoreleasePoolPop(v2);
  }
}

+ (uint64_t)_replacePersistentStoreAtURL:(void *)a3 destinationOptions:(void *)a4 withPersistentStoreFromURL:(void *)a5 sourceOptions:(uint64_t *)a6 error:
{
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  sqlite3 *v44;
  int v45;
  void *v46;
  __CFString *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  sqlite3 *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  int v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t result;
  uint64_t v68;
  sqlite3 *v69;
  int v70;
  int v71;
  void *v72;
  int v73;
  uint64_t v74;
  char v75;
  void *v76;
  NSString *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSString *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  int v92;
  void *v93;
  int v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  sqlite3 *v98;
  sqlite3 *v99;
  statfs v100;
  statfs v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v11 = (void *)objc_msgSend(a4, "path");
  v12 = (void *)objc_msgSend(a2, "path");
  v13 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  v14 = objc_msgSend(v12, "fileSystemRepresentation");
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a4))
  {
    if (a6)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = objc_msgSend(a4, "path");
      v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, *MEMORY[0x1E0CB2AA0], 0);
      v20 = v15;
      v21 = v16;
      v22 = 258;
LABEL_68:
      v68 = objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v19);
      result = 0;
      *a6 = v68;
      return result;
    }
    return 0;
  }
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a2))
  {
    if (a6)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB28A8];
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = objc_msgSend(a2, "path");
      v19 = objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v26, *MEMORY[0x1E0CB2AA0], 0);
      v20 = v23;
      v21 = v24;
      v22 = 514;
      goto LABEL_68;
    }
    return 0;
  }
  v95 = (const char *)v14;
  v27 = (__CFString *)_NSSQLiteConnectionLockProxyValueFromPragmas((void *)objc_msgSend(a5, "objectForKey:"));
  if (v27)
    v28 = 34;
  else
    v28 = 2;
  v97 = a5;
  v29 = objc_msgSend(a5, "valueForKey:");
  if (v29)
  {
    v30 = v29;
    if (objc_msgSend((id)*MEMORY[0x1E0CB2AE0], "isEqualToString:", v29))
    {
      v28 |= 0x400000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "isEqualToString:", v30))
    {
      v28 |= 0x300000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB8], "isEqualToString:", v30))
    {
      v28 |= 0x200000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB0], "isEqualToString:", v30))
    {
      v28 |= 0x100000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AD0], "isEqualToString:", v30))
    {
      v28 |= 0x700000u;
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey"), v31, v32, v33, v34, v35, v36, v30);
    }
  }
  v99 = 0;
  if (objc_msgSend((id)objc_msgSend(a4, "query"), "length"))
  {
    objc_opt_self();
    v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "absoluteString"), "fileSystemRepresentation");
  }
  v37 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, v97);
  v38 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v13, v37, &v99, v28, 0);
  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v40 = v38;
    v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to open source database"), CFSTR("reason"), v11, *MEMORY[0x1E0CB2AA0], 0);
    v42 = v39;
LABEL_26:
    v96 = objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("NSSQLiteErrorDomain"), v40, v41);
    v43 = 0;
    goto LABEL_32;
  }
  v44 = v99;
  sqlite3_busy_timeout(v99, 120000);
  if (v27)
  {
    if ((-[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR(":auto:")) & 1) == 0)
    {
      v45 = sqlite3_exec(v44, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma lock_proxy_file='%@'"), v27), "UTF8String"), 0, 0, 0);
      if (v45)
      {
        LODWORD(v40) = v45;
        sqlite3_close_v2(v44);
        v99 = 0;
        v46 = (void *)MEMORY[0x1E0CB35C8];
        v40 = (int)v40;
        v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to set file locking on source database"), CFSTR("reason"), v27, CFSTR("lock_proxy_file"), 0);
        v42 = v46;
        goto LABEL_26;
      }
    }
  }
  v96 = 0;
  v43 = 1;
LABEL_32:
  v47 = (__CFString *)_NSSQLiteConnectionLockProxyValueFromPragmas((void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSSQLitePragmasOption")));
  if (v47)
    v48 = 38;
  else
    v48 = 6;
  v49 = objc_msgSend(a3, "valueForKey:", CFSTR("NSPersistentStoreFileProtectionKey"));
  if (v49)
  {
    v50 = v49;
    if (objc_msgSend((id)*MEMORY[0x1E0CB2AE0], "isEqualToString:", v49))
    {
      v48 |= 0x400000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "isEqualToString:", v50))
    {
      v48 |= 0x300000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB8], "isEqualToString:", v50))
    {
      v48 |= 0x200000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB0], "isEqualToString:", v50))
    {
      v48 |= 0x100000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AD0], "isEqualToString:", v50))
    {
      v48 |= 0x700000u;
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey"), v51, v52, v53, v54, v55, v56, v50);
    }
  }
  v98 = 0;
  memset(&v101, 0, 512);
  memset(&v100, 0, 512);
  if (!v43)
  {
    v59 = v96;
    goto LABEL_60;
  }
  if (statfs((const char *)objc_msgSend(v11, "UTF8String"), &v101)
    || statfs((const char *)objc_msgSend((id)objc_msgSend(v12, "stringByDeletingLastPathComponent"), "UTF8String"), &v100)|| strcmp(v101.f_mntonname, v100.f_mntonname)|| (v101.f_flags & 0x1001) != 0x1000|| (v57 = v99, objc_msgSend(v12, "UTF8String"), _sqlite3_db_clone()))
  {
    if (objc_msgSend((id)objc_msgSend(a2, "query"), "length"))
    {
      objc_opt_self();
      v58 = (const char *)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "fileSystemRepresentation");
    }
    else
    {
      v58 = v95;
    }
    v60 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
    v61 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v58, v60, &v98, v48, 1);
    if (v61)
    {
      v62 = (void *)MEMORY[0x1E0CB35C8];
      v63 = v61;
      v64 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to open destination database"), CFSTR("reason"), v12, *MEMORY[0x1E0CB2AA0], 0);
      v65 = v62;
      v66 = v63;
LABEL_59:
      v59 = objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("NSSQLiteErrorDomain"), v66, v64);
LABEL_60:
      if (v99)
        sqlite3_close_v2(v99);
      if (v98)
        sqlite3_close_v2(v98);
      if (a6)
      {
        if (v59)
        {
          result = 0;
          *a6 = v59;
          return result;
        }
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB28A8];
        v22 = 255;
        v19 = 0;
        goto LABEL_68;
      }
      return 0;
    }
    v69 = v98;
    sqlite3_busy_timeout(v98, 120000);
    if (v47)
    {
      if ((-[__CFString isEqualToString:](v47, "isEqualToString:", CFSTR(":auto:")) & 1) == 0)
      {
        v70 = sqlite3_exec(v69, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma lock_proxy_file='%@'"), v47), "UTF8String"), 0, 0, 0);
        if (v70)
        {
          v71 = v70;
          sqlite3_close_v2(v69);
          v98 = 0;
          v72 = (void *)MEMORY[0x1E0CB35C8];
          v64 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to set file locking on destination database"), CFSTR("reason"), v47, CFSTR("lock_proxy_file"), 0);
          v65 = v72;
          v66 = v71;
          goto LABEL_59;
        }
      }
    }
    v57 = v99;
    v73 = sqlite3_file_control(v69, 0, 102, v99);
    if (v73)
    {
      v74 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSSQLiteErrorDomain"), v73, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to replace destination database"), CFSTR("reason"), v12, *MEMORY[0x1E0CB2AA0], v11, CFSTR("Source database Path"), 0));
      v75 = 0;
      v76 = v97;
      goto LABEL_77;
    }
  }
  else
  {
    v69 = 0;
  }
  v75 = 1;
  v76 = v97;
  v74 = v96;
LABEL_77:
  if (sqlite3_close_v2(v69))
  {
    v77 = NSStringFromSelector(sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_);
    _NSCoreDataLog(1, (uint64_t)CFSTR("%@ failed to close destination database %@"), v78, v79, v80, v81, v82, v83, (uint64_t)v77);
  }
  if (sqlite3_close_v2(v57))
  {
    v84 = NSStringFromSelector(sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_);
    _NSCoreDataLog(1, (uint64_t)CFSTR("%@ failed to close source database %@"), v85, v86, v87, v88, v89, v90, (uint64_t)v84);
  }
  if ((v75 & 1) == 0)
  {
    if (a6)
    {
      result = 0;
      *a6 = v74;
      return result;
    }
    return 0;
  }
  v91 = (void *)objc_msgSend(v76, "objectForKey:", CFSTR("NSPersistentStoreUnlinkDestroyOption"));
  if (v91)
    v92 = objc_msgSend(v91, "BOOLValue") ^ 1;
  else
    v92 = 1;
  v93 = (void *)objc_msgSend(v76, "objectForKey:", CFSTR("NSPersistentStoreForceDestroyOption"));
  if (v93)
    v94 = objc_msgSend(v93, "BOOLValue") ^ 1;
  else
    v94 = 1;
  if ((v92 & v94 & 1) != 0)
    return 1;
  else
    return +[NSSQLiteConnection _destroyPersistentStoreAtURL:options:error:]((uint64_t)NSSQLiteConnection, a4, v76, a6);
}

+ (uint64_t)_destroyPersistentStoreAtURL:(void *)a3 options:(uint64_t *)a4 error:
{
  void *v7;
  const char *v8;
  _BOOL8 v9;
  const char *v11;
  const char *v12;
  off_t st_size;
  int v14;
  _BOOL4 v15;
  off_t v16;
  off_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  id v54;
  int v55;
  void *v57;
  int v58;
  int v59;
  sqlite3 *v60;
  void *v61;
  int v62;
  int v63;
  int v66;
  int v67;
  int v68;
  int v69;
  void *v70;
  uint64_t *v71;
  int v72;
  int v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  const __CFString *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  __CFString *v99;
  char *v100;
  char *v101;
  uint64_t *v102;
  void *v103;
  sqlite3 *v104;
  int v105;
  stat v106;
  int v107;
  uint64_t v108;
  statfs v109;
  _QWORD v110[2];
  char v111;
  char v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = (void *)objc_msgSend(a2, "path");
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  if ((+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a2) & 1) != 0)
    return 1;
  v11 = (const char *)objc_msgSend((id)objc_msgSend(v7, "stringByAppendingString:", CFSTR("-journal")), "fileSystemRepresentation");
  v12 = (const char *)objc_msgSend((id)objc_msgSend(v7, "stringByAppendingString:", CFSTR("-wal")), "fileSystemRepresentation");
  memset(&v106, 0, sizeof(v106));
  if (stat(v8, &v106))
    st_size = *__error() != 2;
  else
    st_size = v106.st_size;
  memset(&v109, 0, 512);
  v14 = statfs(v8, &v109);
  v15 = (v14 | v109.f_flags & 0x1000) == 0;
  v100 = (char *)v11;
  if (stat(v11, &v106))
    v16 = *__error() != 2;
  else
    v16 = v106.st_size;
  v101 = (char *)v12;
  v102 = a4;
  v103 = a2;
  if (stat(v12, &v106))
    v17 = *__error() != 2;
  else
    v17 = v106.st_size;
  v105 = 0;
  v18 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
  v19 = v18;
  if (v18)
    v20 = _NSSQLiteConnectionLockProxyValueFromPragmas(v18);
  else
    v20 = 0;
  v21 = (void *)objc_msgSend(v19, "objectForKey:", CFSTR("journal_mode"));
  if (v21 == (void *)NSKeyValueCoding_NullValue)
    v21 = 0;
  if (v20)
    v15 = 0;
  if (v15)
    goto LABEL_24;
  if (!v21)
  {
    if (!(_BYTE)dword_1ECD8DE18)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (objc_msgSend(CFSTR("wal"), "isEqualToString:", objc_msgSend(v21, "lowercaseString")))
LABEL_23:
    v105 |= 1u;
LABEL_24:
  if (!st_size && !v16 && !v17 && (v105 & 1) == 0)
    return 1;
  v22 = 6;
  if (v19)
  {
    if (v20)
      v22 = 38;
    else
      v22 = 6;
    v23 = (void *)objc_msgSend(v19, "objectForKey:", CFSTR("page_size"));
    if (v23)
    {
      v24 = (uint64_t)v23;
      HIDWORD(v31) = objc_msgSend(v23, "intValue");
      LODWORD(v31) = HIDWORD(v31) - 1024;
      switch((v31 >> 10))
      {
        case 0u:
          v32 = v105 | 0x10;
          goto LABEL_40;
        case 1u:
          v32 = v105 | 0x20;
          goto LABEL_40;
        case 3u:
          v32 = v105 | 0x30;
          goto LABEL_40;
        case 7u:
          v32 = v105 | 0x40;
LABEL_40:
          v105 = v32;
          break;
        default:
          _NSCoreDataLog(5, (uint64_t)CFSTR("ignoring unsupported page_size specified as truncate option: %@"), v25, v26, v27, v28, v29, v30, v24);
          break;
      }
    }
    v33 = (void *)objc_msgSend(v19, "objectForKey:", CFSTR("auto_vacuum"));
    if (!v33)
    {
      v37 = v105 | 0xC;
LABEL_54:
      v105 = v37;
      goto LABEL_55;
    }
    v34 = v33;
    if (objc_msgSend(v33, "isNSString"))
    {
      v35 = objc_msgSend(v34, "lowercaseString");
      if ((objc_msgSend(CFSTR("incremental"), "isEqualToString:", v35) & 1) != 0
        || (objc_msgSend(CFSTR("2"), "isEqualToString:", v35) & 1) != 0)
      {
        v36 = 2;
LABEL_53:
        v37 = v105 | dword_18A50A190[v36];
        goto LABEL_54;
      }
      if ((objc_msgSend(CFSTR("full"), "isEqualToString:", v35) & 1) != 0
        || (objc_msgSend(CFSTR("1"), "isEqualToString:", v35) & 1) != 0)
      {
        v36 = 1;
        goto LABEL_53;
      }
      if ((objc_msgSend(CFSTR("off"), "isEqualToString:", v35) & 1) != 0
        || (objc_msgSend(CFSTR("0"), "isEqualToString:", v35) & 1) != 0)
      {
        v36 = 0;
        goto LABEL_53;
      }
    }
    else
    {
      v36 = objc_msgSend(v34, "intValue");
      if (v36 <= 2)
        goto LABEL_53;
    }
    _NSCoreDataLog(5, (uint64_t)CFSTR("unsupported auto_vacuum setting specified as truncate option: %@"), v38, v39, v40, v41, v42, v43, (uint64_t)v34);
  }
LABEL_55:
  v44 = objc_msgSend(a3, "valueForKey:", CFSTR("NSPersistentStoreFileProtectionKey"));
  v99 = (__CFString *)v20;
  if (v44)
  {
    v45 = v44;
    if (objc_msgSend((id)*MEMORY[0x1E0CB2AE0], "isEqualToString:", v44))
    {
      v46 = v7;
      v22 |= 0x400000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "isEqualToString:", v45))
    {
      v46 = v7;
      v22 |= 0x300000u;
    }
    else
    {
      v46 = v7;
      if (objc_msgSend((id)*MEMORY[0x1E0CB2AB8], "isEqualToString:", v45))
      {
        v22 |= 0x200000u;
      }
      else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB0], "isEqualToString:", v45))
      {
        v22 |= 0x100000u;
      }
      else if (objc_msgSend((id)*MEMORY[0x1E0CB2AD0], "isEqualToString:", v45))
      {
        v22 |= 0x700000u;
      }
      else
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey"), v47, v48, v49, v50, v51, v52, v45);
      }
    }
  }
  else
  {
    v46 = v7;
  }
  v104 = 0;
  if (objc_msgSend((id)objc_msgSend(v103, "query"), "length"))
  {
    objc_opt_self();
    v8 = (const char *)objc_msgSend((id)objc_msgSend(v103, "absoluteString"), "fileSystemRepresentation");
  }
  v53 = -6;
  do
  {
    v54 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
    v55 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v8, v54, &v104, v22, 1);
    if (v55 != 14)
      break;
    if (v104)
    {
      sqlite3_close_v2(v104);
      v104 = 0;
    }
    usleep(0x4E20u);
  }
  while (!__CFADD__(v53++, 1));
  v57 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSPersistentStoreForceDestroyOption"));
  if (v57)
    v58 = objc_msgSend(v57, "BOOLValue");
  else
    v58 = 1;
  v59 = v15 | v58;
  v60 = v104;
  v61 = v46;
  if (!v55)
  {
    sqlite3_busy_timeout(v104, 120000);
    v108 = 0;
    v62 = sqlite3_file_control(v60, 0, 7, &v108);
    if (!v108 || v62)
    {
LABEL_105:
      if (v99 && (-[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR(":auto:")) & 1) == 0)
        sqlite3_exec(v60, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma lock_proxy_file='%@'"), v99), "UTF8String"), 0, 0, 0);
      if (v59)
        v105 |= 0x80u;
      v68 = -6;
      while (1)
      {
        v69 = sqlite3_file_control(v60, 0, 101, &v105);
        if ((v69 & 0x7F) != 5)
        {
          v55 = v69;
          if ((v69 & 0x7F) != 6)
            goto LABEL_115;
          usleep(0x4E20u);
        }
        v55 = 5;
LABEL_115:
        if (v68)
        {
          ++v68;
          if (v55 == 5)
            continue;
        }
        goto LABEL_117;
      }
    }
    if (*(_QWORD *)v108)
    {
      v63 = (*(uint64_t (**)(void))(*(_QWORD *)v108 + 16))();
      if (!v63)
      {
        if (v110[0] != 0x66206574694C5153 || *(_QWORD *)((char *)v110 + 7) != 0x332074616D726F66)
          goto LABEL_105;
        v66 = v111 == 2 && v112 == 2;
LABEL_103:
        if (v66 == 1)
          v105 |= 1u;
        goto LABEL_105;
      }
    }
    else
    {
      v63 = 1;
    }
    v107 = 0;
    v67 = sqlite3_file_control(v60, 0, 4, &v107);
    if (v107)
    {
      v66 = -1;
    }
    else if (v63 == 522)
    {
      v66 = 0;
    }
    else if (v67)
    {
      v66 = v67;
    }
    else
    {
      v66 = -1;
    }
    goto LABEL_103;
  }
LABEL_117:
  if (v60)
    sqlite3_close_v2(v60);
  v70 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSPersistentStoreUnlinkDestroyOption"));
  if (v70)
    LODWORD(v70) = objc_msgSend(v70, "BOOLValue");
  v71 = v102;
  v9 = v55 == 0;
  if (v55)
    v72 = v59;
  else
    v72 = 1;
  if ((v15 | v70) != 1 || !v72)
  {
    if (!v55)
      return v9;
    v76 = (void *)MEMORY[0x1E0CB35C8];
    v77 = CFSTR("NSSQLiteErrorDomain");
    v78 = v55;
    v79 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to truncate database"), CFSTR("reason"), v61, *MEMORY[0x1E0CB2AA0], 0);
    v80 = v76;
    goto LABEL_157;
  }
  if ((unlink(v8) & 0x80000000) == 0)
  {
    v73 = 0;
    v74 = 0;
    v75 = v100;
    goto LABEL_135;
  }
  v75 = v100;
  if (*__error() == 2)
  {
    v73 = 0;
  }
  else
  {
    v73 = *__error();
    if (v73)
    {
      v74 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v73, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v46, *MEMORY[0x1E0CB2AA0], 0));
      goto LABEL_135;
    }
  }
  v74 = 0;
LABEL_135:
  if ((unlink(v75) & 0x80000000) == 0)
  {
    if (!v73)
      goto LABEL_141;
LABEL_137:
    if (!v74)
    {
      v81 = (void *)MEMORY[0x1E0CB35C8];
      v82 = *MEMORY[0x1E0CB2FE0];
      v83 = (void *)MEMORY[0x1E0C99D80];
      v84 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v75);
      v85 = v83;
      v71 = v102;
      v74 = objc_msgSend(v81, "errorWithDomain:code:userInfo:", v82, v73, objc_msgSend(v85, "dictionaryWithObjectsAndKeys:", v84, *MEMORY[0x1E0CB2AA0], 0));
    }
    goto LABEL_141;
  }
  if (*__error() == 2)
  {
    v73 = 0;
    goto LABEL_141;
  }
  v73 = *__error();
  if (v73)
    goto LABEL_137;
LABEL_141:
  if ((unlink(v101) & 0x80000000) == 0)
  {
    if (!v73)
      goto LABEL_147;
LABEL_143:
    if (!v74)
    {
      v86 = (void *)MEMORY[0x1E0CB35C8];
      v87 = *MEMORY[0x1E0CB2FE0];
      v88 = (void *)MEMORY[0x1E0C99D80];
      v89 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v101);
      v74 = objc_msgSend(v86, "errorWithDomain:code:userInfo:", v87, v73, objc_msgSend(v88, "dictionaryWithObjectsAndKeys:", v89, *MEMORY[0x1E0CB2AA0], 0));
    }
    goto LABEL_147;
  }
  if (*__error() == 2)
  {
    v73 = 0;
    goto LABEL_147;
  }
  v73 = *__error();
  if (v73)
    goto LABEL_143;
LABEL_147:
  v90 = (const char *)objc_msgSend((id)objc_msgSend(v46, "stringByAppendingString:", CFSTR("-shm")), "fileSystemRepresentation");
  if ((unlink(v90) & 0x80000000) == 0)
  {
    if (!v73)
      goto LABEL_153;
LABEL_149:
    if (!v74)
    {
      v91 = (void *)MEMORY[0x1E0CB35C8];
      v92 = *MEMORY[0x1E0CB2FE0];
      v93 = (void *)MEMORY[0x1E0C99D80];
      v94 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v90);
      v74 = objc_msgSend(v91, "errorWithDomain:code:userInfo:", v92, v73, objc_msgSend(v93, "dictionaryWithObjectsAndKeys:", v94, *MEMORY[0x1E0CB2AA0], 0));
    }
    goto LABEL_153;
  }
  if (*__error() == 2)
  {
    v73 = 0;
    goto LABEL_153;
  }
  v73 = *__error();
  if (v73)
    goto LABEL_149;
LABEL_153:
  v95 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v46, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(CFSTR("."), "stringByAppendingString:", objc_msgSend(v103, "lastPathComponent")), "stringByAppendingString:", CFSTR("-conch"))), "fileSystemRepresentation");
  if (unlink(v95) < 0)
  {
    if (*__error() == 2)
      goto LABEL_158;
    v73 = *__error();
    if (!v73)
      goto LABEL_158;
  }
  else if (!v73)
  {
    goto LABEL_158;
  }
  if (!v74)
  {
    v96 = (void *)MEMORY[0x1E0CB35C8];
    v77 = (const __CFString *)*MEMORY[0x1E0CB2FE0];
    v78 = v73;
    v97 = (void *)MEMORY[0x1E0C99D80];
    v98 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v95);
    v79 = objc_msgSend(v97, "dictionaryWithObjectsAndKeys:", v98, *MEMORY[0x1E0CB2AA0], 0);
    v80 = v96;
LABEL_157:
    v74 = objc_msgSend(v80, "errorWithDomain:code:userInfo:", v77, v78, v79);
  }
LABEL_158:
  if (v71 && v74)
    *v71 = v74;
  return v9;
}

+ (BOOL)_rekeyPersistentStoreAtURL:(void *)a3 options:(void *)a4 withKey:(uint64_t *)a5 error:
{
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  int v26;
  int v27;
  sqlite3 *v28;
  uint64_t v29;
  id v31;
  int v32;
  int v33;
  sqlite3 *v34;
  sqlite3 *v35;

  objc_opt_self();
  v9 = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a2))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB28A8];
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("In-memory stores do not support rekeying"), *MEMORY[0x1E0CB2D50], 0);
LABEL_14:
      v17 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 134060, v12);
      result = 0;
      *a5 = v17;
      return result;
    }
    return 0;
  }
  if (!objc_msgSend(a4, "length"))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB28A8];
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("New key value must not be empty"), *MEMORY[0x1E0CB2D50], 0);
      goto LABEL_14;
    }
    return 0;
  }
  v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
  v14 = 6;
  if (v13)
  {
    if (_NSSQLiteConnectionLockProxyValueFromPragmas(v13))
      v14 = 38;
    else
      v14 = 6;
  }
  v15 = objc_msgSend(a3, "valueForKey:", CFSTR("NSPersistentStoreFileProtectionKey"));
  if (v15)
  {
    v16 = v15;
    if (objc_msgSend((id)*MEMORY[0x1E0CB2AE0], "isEqualToString:", v15))
    {
      v14 |= 0x400000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "isEqualToString:", v16))
    {
      v14 |= 0x300000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB8], "isEqualToString:", v16))
    {
      v14 |= 0x200000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB0], "isEqualToString:", v16))
    {
      v14 |= 0x100000u;
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB2AD0], "isEqualToString:", v16))
    {
      v14 |= 0x700000u;
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey"), v19, v20, v21, v22, v23, v24, v16);
    }
  }
  v35 = 0;
  if (objc_msgSend((id)objc_msgSend(a2, "query"), "length"))
  {
    objc_opt_self();
    v9 = (const char *)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "fileSystemRepresentation");
  }
  v25 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
  v26 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v9, v25, &v35, v14, 1);
  if (v26 == 14)
  {
    v27 = -6;
    while (1)
    {
      v28 = v35;
      if (v35)
      {
        v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(v35));
        sqlite3_close_v2(v28);
        v35 = 0;
      }
      else
      {
        v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errstr(14));
      }
      usleep(0x4E20u);
      if (__CFADD__(v27++, 1))
        break;
      v31 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
      v32 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v9, v31, &v35, v14, 1);
      if (v32 != 14)
      {
        v33 = v32;
        goto LABEL_36;
      }
    }
    v34 = 0;
    v33 = 14;
  }
  else
  {
    v33 = v26;
    v29 = 0;
LABEL_36:
    v34 = v35;
    if (!v33)
    {
      objc_msgSend(a4, "bytes");
      objc_msgSend(a4, "length");
      v33 = sqlite3_rekey_v2();
      if (v33)
        v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(v34));
    }
  }
  sqlite3_close_v2(v34);
  if (a5)
  {
    if (v33)
      *a5 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134180, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v29, *MEMORY[0x1E0CB2D50], 0));
  }
  return v33 == 0;
}

uint64_t __57__NSSQLiteConnection_writeCorrelationInsertsFromTracker___block_invoke(uint64_t a1, uint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4, sqlite3_int64 a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 3)
    _NSCoreDataLog(7, (uint64_t)CFSTR("correlation bindings: %qu, %qu, %qu, %qu"), v10, v11, v12, v13, v14, v15, a2);
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(_QWORD *)(a1 + 32), a2, a3, a4, a5);
}

- (uint64_t)executeCorrelationChangesForValue1:(sqlite3_int64)a3 value2:(sqlite3_int64)a4 value3:(sqlite3_int64)a5 value4:
{
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  if (result)
  {
    v9 = result;
    v10 = *(NSObject **)(result + 8);
    if (v10)
      dispatch_assert_queue_V2(v10);
    v11 = *(_DWORD *)(v9 + 312);
    if ((v11 & 1) == 0
      && (v12 = sqlite3_reset(*(sqlite3_stmt **)(v9 + 80)),
          sqlite3_clear_bindings(*(sqlite3_stmt **)(v9 + 80)),
          v11 = *(_DWORD *)(v9 + 312),
          (_DWORD)v12))
    {
      *(_DWORD *)(v9 + 312) = v11 & 0xFFFFFFFD;
      -[NSSQLiteConnection releaseSQLStatement](v9);
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(v9 + 72)));
      v20 = *MEMORY[0x1E0C99768];
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12), CFSTR("NSSQLiteErrorDomain"));
      v17 = v20;
      v16 = (const __CFString *)v19;
    }
    else
    {
      *(_DWORD *)(v9 + 312) = v11 & 0xFFFFFFFE;
      v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 1, a2);
      if (!(_DWORD)v13)
      {
        v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 2, a3);
        if (!(_DWORD)v13)
        {
          if (!a4 || (v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 3, a4), !(_DWORD)v13))
          {
            if (!a5)
              return _execute(v9);
            v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 4, a5);
            if (!(_DWORD)v13)
              return _execute(v9);
          }
        }
      }
      v14 = *MEMORY[0x1E0C99768];
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13), CFSTR("NSSQLiteErrorDomain"));
      v16 = CFSTR("sqlite3_bind* failed");
      v17 = v14;
    }
    v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v17, 134180, (uint64_t)v16, v15);
    objc_exception_throw(v18);
  }
  return result;
}

uint64_t __57__NSSQLiteConnection_writeCorrelationDeletesFromTracker___block_invoke(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 3)
    _NSCoreDataLog(7, (uint64_t)CFSTR("correlation bindings:  %qu, %qu"), v6, v7, v8, v9, v10, v11, a2);
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(_QWORD *)(a1 + 32), a2, a3, 0, 0);
}

uint64_t __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke(uint64_t a1, uint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 3)
    _NSCoreDataLog(7, (uint64_t)CFSTR("correlation bindings: %qu, %qu, %qu"), v8, v9, v10, v11, v12, v13, a2);
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(_QWORD *)(a1 + 32), a2, a3, a4, 0);
}

uint64_t __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke_2(uint64_t a1, uint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 3)
    _NSCoreDataLog(7, (uint64_t)CFSTR("correlation bindings: %qu, %qu, %qu"), v8, v9, v10, v11, v12, v13, a2);
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(_QWORD *)(a1 + 32), a2, a3, a4, 0);
}

uint64_t __58__NSSQLiteConnection_writeCorrelationReordersFromTracker___block_invoke(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 3)
    _NSCoreDataLog(7, (uint64_t)CFSTR("correlation bindings: %qu, %qu, %qu"), v8, v9, v10, v11, v12, v13, a4);
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(_QWORD *)(a1 + 32), a4, a2, a3, 0);
}

uint64_t __29__NSSQLiteConnection_execute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)handleCorruptedDB:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;

  -[NSSQLiteConnection _forceDisconnectOnError](a1);
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
  {
    if (*(_BYTE *)(a1 + 42))
      v10 = CFSTR("\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m %@\x1B[0m");
    else
      v10 = CFSTR("%@");
    _NSCoreDataLog(1, (uint64_t)v10, v4, v5, v6, v7, v8, v9, a2);
  }
  v11 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 259, a2, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2AA0], 0));
  objc_exception_throw(v11);
}

- (void)setSecureDeleteMode:(uint64_t)a1
{
  __CFString *v2;

  if (a1)
  {
    if (a2)
      v2 = CFSTR("pragma secure_delete=1");
    else
      v2 = CFSTR("pragma secure_delete=0");
    -[NSSQLiteConnection _executeSQLString:](a1, v2);
  }
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  __CFString *v4;

  if (a3)
    v4 = CFSTR("pragma locking_mode=EXCLUSIVE");
  else
    v4 = CFSTR("pragma locking_mode=NORMAL");
  -[NSSQLiteConnection _executeSQLString:]((uint64_t)self, v4);
  -[NSSQLiteConnection beginTransaction]((uint64_t)self);
  -[NSSQLiteConnection commitTransaction]((uint64_t)self);
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)self, 0);
}

- (id)fetchCreationSQLForType:(void *)a3 containing:
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSSQLiteStatement *v9;
  NSSQLColumn *v10;
  NSSQLColumn *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int i;

  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  v5 = 0;
  v6 = 0;
  for (i = 3; (v6 & 1) == 0 && (i & 0x80000000) == 0; --i)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT TBL_NAME, SQL FROM SQLITE_MASTER WHERE TYPE = \"%@\"), a2);
    if (objc_msgSend(a3, "length"))
      objc_msgSend(v8, "appendFormat:", CFSTR(" AND SQL LIKE \"%%%@%%\"), a3);
    objc_msgSend(v8, "appendString:", CFSTR(" ORDER BY TBL_NAME"));
    v9 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)v8);
    v10 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("TBL_NAME"), 6);
    v11 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("SQL"), 6);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v10, v11, 0);

    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection prepareSQLStatement:](a1, v9);
    objc_msgSend((id)a1, "execute");
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v12);
    while (1)
    {
      v13 = -[NSSQLiteConnection newFetchedArray](a1);
      v14 = v13;
      if (!v13)
        break;
      if (objc_msgSend(v13, "count") == 2)
      {
        v15 = (void *)objc_msgSend(v14, "objectAtIndex:", 0);
        v16 = (void *)objc_msgSend(v14, "objectAtIndex:", 1);
        if (objc_msgSend(v15, "isNSString"))
        {
          if (objc_msgSend(v16, "isNSString"))
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend(v15, "uppercaseString"), objc_msgSend(v16, "uppercaseString"), 0);
            objc_msgSend(v7, "addObject:", v17);

          }
        }
      }

    }
    v6 = 1;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(_QWORD *)(a1 + 92) = 0;
    *(_QWORD *)(a1 + 100) = 0;
    *(_DWORD *)(a1 + 108) = 0;

    v5 = v7;
  }
  return v5;
}

- (id)fetchTableCreationSQL
{
  if (result)
    return -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)result, (uint64_t)CFSTR("table"), 0);
  return result;
}

- (id)fetchTableCreationSQLContaining:(id)result
{
  if (result)
    return -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)result, (uint64_t)CFSTR("table"), a2);
  return result;
}

- (id)newFetchUUIDSForSubentitiesRootedAt:(uint64_t)a1
{
  NSObject *v4;
  _QWORD *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSSQLColumn *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t k;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSSQLBindVariable *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  NSSQLiteStatement *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
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
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityNamed:", objc_msgSend(a2, "name"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v7 = v5;
  while (v7)
  {
    v8 = v7;
    v7 = (_QWORD *)v7[21];
    if (v7 == v8)
    {
      v9 = (void *)v8[9];
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v61 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        if (objc_msgSend(v13, "sqlType") == 16)
        {
          v14 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", objc_msgSend(v13, "columnName"), 10);
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v10);
  }
  if (!objc_msgSend(v6, "count"))
    return v6;
  v15 = (void *)objc_msgSend(CFSTR("SELECT "), "mutableCopy");
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v57;
    v18 = 1;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v57 != v17)
          objc_enumerationMutation(v6);
        v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        if ((v18 & 1) == 0)
          objc_msgSend(v15, "appendString:", CFSTR(" ,"));
        objc_msgSend(v15, "appendString:", objc_msgSend(v20, "columnName"));
        v18 = 0;
      }
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      v18 = 0;
    }
    while (v16);
  }
  objc_msgSend(v15, "appendFormat:", CFSTR(" FROM %@ WHERE ("), objc_msgSend(v5, "tableName"));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v53;
    v23 = 1;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v53 != v22)
          objc_enumerationMutation(v6);
        v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
        if ((v23 & 1) == 0)
          objc_msgSend(v15, "appendString:", CFSTR(" OR "));
        objc_msgSend(v15, "appendFormat:", CFSTR("(%@ >= ?)"), objc_msgSend(v25, "columnName"));
        v23 = 0;
      }
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      v23 = 0;
    }
    while (v21);
  }
  objc_msgSend(v15, "appendString:", CFSTR(")"));
  v42 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)v15);

  v26 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v51 = 2;
  objc_msgSend(v26, "appendBytes:length:", &v51, 1);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v48;
    while (1)
    {
      if (*(_QWORD *)v48 != v28)
        objc_enumerationMutation(v6);
      v29 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v26, 10, 0);
      -[NSSQLiteStatement addBindVariable:]((uint64_t)v42, v29);

      if (!--v27)
      {
        v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
        if (!v27)
          break;
      }
    }
  }

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v31 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v41 = a1;
  -[NSSQLiteConnection prepareSQLStatement:](a1, v42);
  objc_msgSend((id)a1, "execute");
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v6);
  while (1)
  {
    v32 = -[NSSQLiteConnection newFetchedArray](v41);
    v33 = v32;
    if (!v32)
      break;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v64, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v44;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * m);
          if ((void *)v31 != v37)
          {
            v38 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "bytes");
            if ((unint64_t)objc_msgSend(v37, "length") >= 2)
            {
              v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v38 + 1);
              if (v39)
              {
                objc_msgSend(v30, "addObject:", v39);

              }
            }
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v64, 16);
      }
      while (v34);
    }

  }
  -[NSSQLiteConnection releaseSQLStatement](v41);
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v41, 0);
  *(_DWORD *)(v41 + 312) &= ~2u;
  *(_QWORD *)(v41 + 100) = 0;
  *(_QWORD *)(v41 + 92) = 0;
  *(_DWORD *)(v41 + 108) = 0;

  return v30;
}

- (void)_createInsertStatementsForEntities:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  unsigned int *v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSSQLiteStatement *v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
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
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = a2;
  v40 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v47;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v47 != v39)
        {
          v4 = v3;
          objc_enumerationMutation(obj);
          v3 = v4;
        }
        v43 = v3;
        v45 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v3);
        v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v7 = v45;
        if (v45)
        {
          while (v7)
          {
            v8 = v7;
            v7 = *(_QWORD *)(v7 + 168);
            if (v7 == v8)
            {
              v9 = *(void **)(v8 + 72);
              goto LABEL_10;
            }
          }
        }
        v9 = 0;
LABEL_10:
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v10 = (void *)objc_msgSend(v9, "sortedArrayUsingFunction:context:", sortColumnsByType, 0);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v55 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_msgSend(v5, "addObject:", objc_msgSend(v14, "columnName"));
              objc_msgSend(v6, "addObject:", objc_msgSend(v14, "columnName"));
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
          }
          while (v11);
        }
        v15 = objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
        v16 = objc_msgSend((id)v45, "tableName");
        v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DEFERRED_TEMP__%@"), v16);
        if (v45 && (*(_QWORD *)(v45 + 160) || (v28 = *(void **)(v45 + 152)) != 0 && objc_msgSend(v28, "count")))
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" WHERE "));
          objc_msgSend(v18, "appendString:", v17);
          objc_msgSend(v18, "appendString:", CFSTR("."));
          objc_msgSend(v18, "appendString:", CFSTR("Z_ENT"));
          objc_msgSend(v18, "appendString:", CFSTR(" = "));
          v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v45, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("NSEntityRenamingShouldRebaseKey"));
          if (!v19)
            goto LABEL_35;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v20 = *(void **)(v45 + 152);
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          if (!v21)
            goto LABEL_35;
          v37 = v17;
          v38 = v15;
          v22 = 0;
          v23 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v51 != v23)
                objc_enumerationMutation(v20);
              if (!(_DWORD)v22)
              {
                v25 = *(unsigned int **)(*((_QWORD *)&v50 + 1) + 8 * j);
                v26 = objc_msgSend((id)objc_msgSend(v25, "name"), "isEqualToString:", v19);
                if (v25)
                  v27 = v26;
                else
                  v27 = 0;
                if (v27 == 1)
                  v22 = v25[46];
                else
                  v22 = 0;
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v21);
          v17 = v37;
          v15 = v38;
          if (!(_DWORD)v22)
LABEL_35:
            v22 = *(unsigned int *)(v45 + 184);
          objc_msgSend(v18, "appendFormat:", CFSTR("%d"), v22);
        }
        else
        {
          v18 = 0;
        }
        v29 = objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
        v30 = v17;
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT INTO "));
        objc_msgSend(v31, "appendString:", objc_msgSend((id)v45, "tableName"));
        objc_msgSend(v31, "appendString:", CFSTR(" ("));
        objc_msgSend(v31, "appendString:", v15);
        objc_msgSend(v31, "appendString:", CFSTR(") SELECT "));
        objc_msgSend(v31, "appendString:", v29);
        objc_msgSend(v31, "appendString:", CFSTR(" FROM "));
        objc_msgSend(v31, "appendString:", v30);
        if (v18)
        {
          objc_msgSend(v31, "appendString:", v18);

        }
        v32 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), (uint64_t)v31);
        -[NSSQLiteAdapter _useModel:]((uint64_t)v32, v44);

        objc_msgSend(v42, "addObject:", v32);
        if (v45)
        {
          if (!objc_msgSend(*(id *)(v45 + 152), "count"))
            goto LABEL_46;
          v33 = *(_QWORD *)(v45 + 152);
          goto LABEL_45;
        }
        if (objc_msgSend(0, "count"))
        {
          v33 = 0;
LABEL_45:
          objc_msgSend(v42, "addObjectsFromArray:", -[NSSQLiteConnection _createInsertStatementsForEntities:](a1, v33));
        }
LABEL_46:
        v3 = v43 + 1;
      }
      while (v43 + 1 != v40);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      v40 = v34;
    }
    while (v34);
  }
  return v42;
}

- (BOOL)finishDeferredLightweightMigration:(uint64_t)a1
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int v11;
  const char *v12;
  const __CFString *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
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
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  NSSQLiteStatement *v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  NSSQLiteStatement *v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t n;
  NSSQLiteStatement *v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  uint64_t v115;
  double v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t ii;
  _QWORD *v135;
  double v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  double v143;
  double v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t jj;
  _QWORD *v154;
  double v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  double v162;
  double v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t kk;
  _QWORD *v173;
  double v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  double v181;
  double v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t mm;
  _QWORD *v192;
  double v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  double v201;
  double v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  double v209;
  double v210;
  uint64_t v211;
  void *v212;
  double v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  double v220;
  double v221;
  __CFString *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  double v229;
  double v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  double v243;
  double v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  CFMutableArrayRef v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  double v271;
  double v272;
  void *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t nn;
  uint64_t v277;
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  double v285;
  char v286;
  uint64_t v288;
  uint64_t v289;
  char v290;
  _BOOL4 v292;
  void *context;
  int v294;
  uint64_t v295;
  void *v296;
  id obj;
  id obja;
  int v299;
  _QWORD *v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  _BYTE v345[128];
  _QWORD v346[2];
  _QWORD v347[2];
  _QWORD v348[2];
  _QWORD v349[2];
  _QWORD v350[2];
  _QWORD v351[2];
  _QWORD v352[2];
  _QWORD v353[2];
  _BYTE v354[128];
  _QWORD v355[2];
  _BYTE v356[128];
  _QWORD v357[2];
  _BYTE v358[128];
  _QWORD v359[2];
  _BYTE v360[128];
  _QWORD v361[2];
  _QWORD v362[2];
  _QWORD v363[2];
  _QWORD v364[2];
  _QWORD v365[2];
  _QWORD v366[2];
  _BYTE v367[128];
  _BYTE v368[128];
  _BYTE v369[128];
  _BYTE v370[128];
  _BYTE v371[128];
  _BYTE v372[128];
  uint64_t v373;

  v373 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 8);
    if (v3)
      dispatch_assert_queue_V2(v3);
    v300 = (_QWORD *)a1;
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") < 1)
    {
      v11 = +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
      v12 = getprogname();
      v10 = v12;
      if (v11 < 1)
      {
        v299 = 0;
        if (!v12)
          goto LABEL_12;
        goto LABEL_10;
      }
    }
    else
    {
      v10 = getprogname();
    }
    v13 = CFSTR("without");
    if (a2)
      v13 = CFSTR("with");
    _NSCoreDataLog(4, (uint64_t)CFSTR("Deferred Lightweight Migration %@ all tasks"), v4, v5, v6, v7, v8, v9, (uint64_t)v13);
    v299 = 1;
    if (!v10)
      goto LABEL_12;
LABEL_10:
    if (!strncmp("assetsd", v10, 7uLL) || !strncmp("photolibraryd", v10, 0xDuLL))
    {
      v290 = 1;
      goto LABEL_14;
    }
LABEL_12:
    v290 = 0;
LABEL_14:
    v14 = 3;
    while (1)
    {
      v292 = v14 >= 0;
      if (v14 < 0)
        return v292;
      v294 = v14;
      context = (void *)MEMORY[0x18D76B4E4]();
      -[NSSQLiteConnection connect]((uint64_t)v300);
      if (v300[9])
        break;
      v286 = 0;
LABEL_179:
      -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v300, 0);
      objc_autoreleasePoolPop(context);
      v14 = v294 - 1;
      if ((v286 & 1) != 0)
        return v292;
    }
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)v300, (uint64_t)CFSTR("table"), 0);
    obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v331 = 0u;
    v332 = 0u;
    v329 = 0u;
    v330 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v329, v369, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v330;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v330 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v329 + 1) + 8 * i);
          if (objc_msgSend(v20, "count") == 2
            && objc_msgSend((id)objc_msgSend(v20, "lastObject"), "containsString:", CFSTR("_DEFERRED_")))
          {
            objc_msgSend(obj, "addObject:", objc_msgSend(v20, "firstObject"));
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v329, v369, 16);
      }
      while (v17);
    }
    v327 = 0u;
    v328 = 0u;
    v325 = 0u;
    v326 = 0u;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v368, 16);
    if (v21)
    {
      v295 = *(_QWORD *)v326;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v326 != v295)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v325 + 1) + 8 * v22);
          v321 = 0u;
          v322 = 0u;
          v323 = 0u;
          v324 = 0u;
          v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v300, "adapter"), "sqlCore"), "model");
          if (v24)
            v25 = *(void **)(v24 + 40);
          else
            v25 = 0;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v321, v367, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v322;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v322 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(_QWORD *)(*((_QWORD *)&v321 + 1) + 8 * j);
                if (v29
                  && !*(_QWORD *)(v29 + 160)
                  && objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v321 + 1) + 8 * j), "tableName"), "isEqualToString:", v23))
                {
                  objc_msgSend(v15, "addObject:", v29);
                }
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v321, v367, 16);
            }
            while (v26);
          }
          ++v22;
        }
        while (v22 != v21);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v368, 16);
        v21 = v30;
      }
      while (v30);
    }
    v31 = (void *)objc_msgSend(v15, "allObjects");
    if (!objc_msgSend(v31, "count"))
    {
LABEL_177:
      v286 = 1;
      goto LABEL_179;
    }
    v32 = v31;
    if ((a2 & 1) == 0)
      v32 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(v31, "firstObject"));
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v34 = v33;
    obja = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (v299)
    {
      _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning lightweight migration on connection"), v35, v36, v37, v38, v39, v40, v288);
      if ((v290 & 1) == 0)
      {
LABEL_58:
        _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning creation of deferred schema migration statements"), v41, v42, v43, v44, v45, v46, v288);
LABEL_59:
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v54 = v53;
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Create alter table migration statements"), v47, v48, v49, v50, v51, v52, v288);
        v296 = v31;
        v55 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        v335 = 0u;
        v336 = 0u;
        v333 = 0u;
        v334 = 0u;
        v56 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v333, v370, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v334;
          do
          {
            for (k = 0; k != v56; ++k)
            {
              if (*(_QWORD *)v334 != v57)
                objc_enumerationMutation(v32);
              v59 = *(void **)(*((_QWORD *)&v333 + 1) + 8 * k);
              v288 = objc_msgSend(v59, "tableName");
              v60 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:]((NSSQLiteStatement *)objc_msgSend(v300, "adapter"), objc_msgSend(v59, "tableName"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DEFERRED_TEMP__%@")));
              objc_msgSend(v55, "addObject:", v60);

            }
            v56 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v333, v370, 16);
          }
          while (v56);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v366[0] = CFSTR("Creation of alter table migration statements");
        v366[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61 - v54);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v366, 2), CFSTR("1.1"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Create create table migration statements"), v62, v63, v64, v65, v66, v67, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v69 = v68;
        v70 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        v339 = 0u;
        v340 = 0u;
        v337 = 0u;
        v338 = 0u;
        v71 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v337, v371, 16);
        if (v71)
        {
          v72 = *(_QWORD *)v338;
          do
          {
            for (m = 0; m != v71; ++m)
            {
              if (*(_QWORD *)v338 != v72)
                objc_enumerationMutation(v32);
              v74 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((const __CFString *)objc_msgSend(v300, "adapter"), *(_QWORD **)(*((_QWORD *)&v337 + 1) + 8 * m));
              objc_msgSend(v70, "addObject:", v74);

            }
            v71 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v337, v371, 16);
          }
          while (v71);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v365[0] = CFSTR("Creation of create table migration statements");
        v365[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v75 - v69);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v365, 2), CFSTR("1.2"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Create insert migration statements"), v76, v77, v78, v79, v80, v81, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v83 = v82;
        v84 = -[NSSQLiteConnection _createInsertStatementsForEntities:](v300, v32);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v364[0] = CFSTR("Creation of insert migration statements");
        v364[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v85 - v83);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v364, 2), CFSTR("1.3"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Create drop table migration statements"), v86, v87, v88, v89, v90, v91, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v93 = v92;
        v94 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        v343 = 0u;
        v344 = 0u;
        v341 = 0u;
        v342 = 0u;
        v95 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v341, v372, 16);
        if (v95)
        {
          v96 = *(_QWORD *)v342;
          do
          {
            for (n = 0; n != v95; ++n)
            {
              if (*(_QWORD *)v342 != v96)
                objc_enumerationMutation(v32);
              v288 = objc_msgSend(*(id *)(*((_QWORD *)&v341 + 1) + 8 * n), "tableName");
              v98 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)objc_msgSend(v300, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DEFERRED_TEMP__%@")));
              objc_msgSend(v94, "addObject:", v98);

            }
            v95 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v341, v372, 16);
          }
          while (v95);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v363[0] = CFSTR("Creation of drop table migration statements");
        v363[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v99 - v93);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v363, 2), CFSTR("1.4"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Finished creating deferred schema migration statements"), v100, v101, v102, v103, v104, v105, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v362[0] = CFSTR("Total preparation time for schema migration statements");
        v362[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v106 - v54);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v362, 2), CFSTR("1.0"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning formal transaction"), v107, v108, v109, v110, v111, v112, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v114 = v113;
        v115 = v300[2];
        if (v115)
          objc_msgSend(*(id *)(v115 + 208), "lock");
        -[NSSQLiteConnection beginTransaction]((uint64_t)v300);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v117 = v116;
        v361[0] = CFSTR("Beginning formal transaction");
        v361[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v116 - v114);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v361, 2), CFSTR("2.1"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Execute alter table statements"), v118, v119, v120, v121, v122, v123, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v125 = v124;
        v319 = 0u;
        v320 = 0u;
        v317 = 0u;
        v318 = 0u;
        v132 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v317, v360, 16);
        if (v132)
        {
          v133 = *(_QWORD *)v318;
          do
          {
            for (ii = 0; ii != v132; ++ii)
            {
              if (*(_QWORD *)v318 != v133)
                objc_enumerationMutation(v55);
              v135 = *(_QWORD **)(*((_QWORD *)&v317 + 1) + 8 * ii);
              if (v299)
                _NSCoreDataLog(4, (uint64_t)CFSTR("  Execute alter table statement: %@"), v126, v127, v128, v129, v130, v131, *(_QWORD *)(*((_QWORD *)&v317 + 1) + 8 * ii));
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v135);
            }
            v132 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v317, v360, 16);
          }
          while (v132);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v359[0] = CFSTR("Execute alter table statements");
        v359[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v136 - v125);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v359, 2), CFSTR("2.2"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Execute create table statements"), v137, v138, v139, v140, v141, v142, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v144 = v143;
        v315 = 0u;
        v316 = 0u;
        v313 = 0u;
        v314 = 0u;
        v151 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v313, v358, 16);
        if (v151)
        {
          v152 = *(_QWORD *)v314;
          do
          {
            for (jj = 0; jj != v151; ++jj)
            {
              if (*(_QWORD *)v314 != v152)
                objc_enumerationMutation(v70);
              v154 = *(_QWORD **)(*((_QWORD *)&v313 + 1) + 8 * jj);
              if (v299)
                _NSCoreDataLog(4, (uint64_t)CFSTR("  Execute create table statement: %@"), v145, v146, v147, v148, v149, v150, *(_QWORD *)(*((_QWORD *)&v313 + 1) + 8 * jj));
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v154);
            }
            v151 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v313, v358, 16);
          }
          while (v151);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v357[0] = CFSTR("Execute create table statements");
        v357[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v155 - v144);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v357, 2), CFSTR("2.3"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Execute insert statements"), v156, v157, v158, v159, v160, v161, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v163 = v162;
        v311 = 0u;
        v312 = 0u;
        v309 = 0u;
        v310 = 0u;
        v170 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v309, v356, 16);
        if (v170)
        {
          v171 = *(_QWORD *)v310;
          do
          {
            for (kk = 0; kk != v170; ++kk)
            {
              if (*(_QWORD *)v310 != v171)
                objc_enumerationMutation(v84);
              v173 = *(_QWORD **)(*((_QWORD *)&v309 + 1) + 8 * kk);
              if (v299)
                _NSCoreDataLog(4, (uint64_t)CFSTR("  Execute insert statement: %@"), v164, v165, v166, v167, v168, v169, *(_QWORD *)(*((_QWORD *)&v309 + 1) + 8 * kk));
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v173);
            }
            v170 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v309, v356, 16);
          }
          while (v170);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v355[0] = CFSTR("Execute insert statements");
        v355[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v174 - v163);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v355, 2), CFSTR("2.4"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Execute drop table statements"), v175, v176, v177, v178, v179, v180, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v182 = v181;
        v307 = 0u;
        v308 = 0u;
        v305 = 0u;
        v306 = 0u;
        v189 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v305, v354, 16);
        if (v189)
        {
          v190 = *(_QWORD *)v306;
          do
          {
            for (mm = 0; mm != v189; ++mm)
            {
              if (*(_QWORD *)v306 != v190)
                objc_enumerationMutation(v94);
              v192 = *(_QWORD **)(*((_QWORD *)&v305 + 1) + 8 * mm);
              if (v299)
                _NSCoreDataLog(4, (uint64_t)CFSTR("  Execute drop table statement: %@"), v183, v184, v185, v186, v187, v188, *(_QWORD *)(*((_QWORD *)&v305 + 1) + 8 * mm));
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v192);
            }
            v189 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v305, v354, 16);
          }
          while (v189);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v353[0] = CFSTR("Execute drop table statements");
        v353[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v193 - v182);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v353, 2), CFSTR("2.5"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Execute create indexes statements"), v194, v195, v196, v197, v198, v199, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v201 = v200;
        -[NSSQLiteConnection _createIndexesForEntities:](v300, v32);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v352[0] = CFSTR("Execute create indexes statements");
        v352[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v202 - v201);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v352, 2), CFSTR("2.6"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Execute create trigger statements"), v203, v204, v205, v206, v207, v208, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v210 = v209;
        v211 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v300, "adapter"), "sqlCore"), "model");
        if (v211)
          v212 = *(void **)(v211 + 40);
        else
          v212 = 0;
        -[NSSQLiteConnection createTriggersForEntities:]((uint64_t)v300, v212);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v351[0] = CFSTR("Execute create trigger statements");
        v351[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v213 - v210);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v351, 2), CFSTR("2.7"));
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v221 = v220;
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Updating metadata"), v214, v215, v216, v217, v218, v219, v288);
        v222 = (__CFString *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NSSQLiteConnection fetchMetadata]((uint64_t)v300));
        if ((a2 & 1) != 0 || (unint64_t)objc_msgSend(v296, "count") < 2)
          -[__CFString removeObjectForKey:](v222, "removeObjectForKey:", CFSTR("NSPersistentStoreDeferredLightweightMigrationOptionKey"));
        else
          -[__CFString setValue:forKey:](v222, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreDeferredLightweightMigrationOptionKey"));
        -[NSSQLiteConnection saveMetadata:](v300, v222);
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Finished updating metadata"), v223, v224, v225, v226, v227, v228, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v230 = v229;
        v350[0] = CFSTR("Update store metadata");
        v350[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v229 - v221);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v350, 2), CFSTR("2.15"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Committing formal transaction"), v231, v232, v233, v234, v235, v236, v288);
        -[NSSQLiteConnection commitTransaction]((uint64_t)v300);
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Finished committing formal transaction"), v237, v238, v239, v240, v241, v242, v288);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v244 = v243;
        v349[0] = CFSTR("Time for COMMIT");
        v349[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v243 - v230);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v349, 2), CFSTR("2.16"));
        v348[0] = CFSTR("Total formal transaction time");
        v348[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v244 - v117);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v348, 2), CFSTR("2.0"));
        if (v299)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Checkpointing WAL journal"), v245, v246, v247, v248, v249, v250, v288);
        v251 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:]((uint64_t)v300, CFSTR("pragma wal_checkpoint(FULL)"));
        if (v251)
          CFRelease(v251);
        v258 = v300[2];
        if (v258)
          objc_msgSend(*(id *)(v258 + 208), "unlock");
        if (v299)
        {
          _NSCoreDataLog(4, (uint64_t)CFSTR("Finished checkpointing WAL journal"), v252, v253, v254, v255, v256, v257, v288);
          _NSCoreDataLog(4, (uint64_t)CFSTR("Successfully completed deferred lightweight migration on connection"), v259, v260, v261, v262, v263, v264, v289);
          if ((v290 & 1) != 0)
          {
            _NSCoreDataLog(4, (uint64_t)CFSTR("Reset SQLite cache size"), v265, v266, v267, v268, v269, v270, v288);
LABEL_166:
            -[NSSQLiteConnection _executeSQLString:]((uint64_t)v300, CFSTR("pragma cache_size = 512"));
          }
        }
        else if ((v290 & 1) != 0)
        {
          goto LABEL_166;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v272 = v271;
        v347[0] = CFSTR("Checkpoint time");
        v347[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v271 - v244);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v347, 2), CFSTR("3.0"));
        v346[0] = CFSTR("Total migration time (on connection)");
        v346[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v272 - v34);
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v346, 2), CFSTR("0.0"));
        if (v299)
        {
          v273 = (void *)objc_msgSend((id)objc_msgSend(obja, "allKeys"), "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
          v303 = 0u;
          v304 = 0u;
          v301 = 0u;
          v302 = 0u;
          v274 = objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v301, v345, 16);
          if (v274)
          {
            v275 = *(_QWORD *)v302;
            do
            {
              for (nn = 0; nn != v274; ++nn)
              {
                if (*(_QWORD *)v302 != v275)
                  objc_enumerationMutation(v273);
                v277 = *(_QWORD *)(*((_QWORD *)&v301 + 1) + 8 * nn);
                v278 = (void *)objc_msgSend(obja, "objectForKey:", v277);
                objc_msgSend(v278, "firstObject");
                objc_msgSend((id)objc_msgSend(v278, "lastObject"), "doubleValue");
                if (v285 > 0.01)
                  _NSCoreDataLog(4, (uint64_t)CFSTR("    Deferred Migration step %@ '%@' took %2.2f seconds"), v279, v280, v281, v282, v283, v284, v277);
              }
              v274 = objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v301, v345, 16);
            }
            while (v274);
          }
        }
        goto LABEL_177;
      }
      _NSCoreDataLog(4, (uint64_t)CFSTR("Increasing SQLite cache size to 148MB"), v41, v42, v43, v44, v45, v46, v288);
    }
    else if ((v290 & 1) == 0)
    {
      goto LABEL_59;
    }
    -[NSSQLiteConnection _executeSQLString:]((uint64_t)v300, CFSTR("pragma cache_size = 38000"));
    if (!v299)
      goto LABEL_59;
    goto LABEL_58;
  }
  return 0;
}

- (void)saveMetadata:(_QWORD *)a1
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSQLiteStatement *v11;
  NSSQLBindVariable *v12;
  NSSQLBindVariable *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  NSSQLiteStatement *v17;
  NSSQLBindVariable *v18;
  NSSQLBindVariable *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;

  if (!a1)
    return;
  v4 = a1[1];
  if (v4)
    dispatch_assert_queue_V2(v4);
  if ((-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)a1, (uint64_t)CFSTR("Z_METADATA"), 0) & 1) == 0)
    -[NSSQLiteConnection createMetadata](a1);
  if ((-[__CFString isNSDictionary](a2, "isNSDictionary") & 1) == 0)
  {
    if (a2)
      v27 = a2;
    else
      v27 = CFSTR("<null>");
    _NSCoreDataLog(1, (uint64_t)CFSTR("metadata is not a dictionary: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v27);
    v28 = *MEMORY[0x1E0C99778];
    v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The metadata is not a dictionary: %@"), v27, v38);
    goto LABEL_21;
  }
  v11 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), CFSTR("Z_METADATA"), CFSTR("Z_VERSION")));
  v12 = [NSSQLBindVariable alloc];
  v13 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v12, "initWithValue:sqlType:propertyDescription:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1), 1, 0);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v11, v13);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

  v14 = -[__CFString objectForKey:](a2, "objectForKey:", CFSTR("NSStoreUUID"));
  v15 = (void *)-[__CFString mutableCopy](a2, "mutableCopy");
  objc_msgSend(v15, "removeObjectForKey:", CFSTR("NSStoreUUID"));
  v39 = 0;
  v16 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v15, 200, 0, &v39);

  if (!v16)
  {
    v16 = CFSTR("<null>");
    goto LABEL_18;
  }
  if ((-[__CFString isNSData](v16, "isNSData") & 1) == 0)
  {
LABEL_18:

    _NSCoreDataLog(1, (uint64_t)CFSTR("failure writing metadata plist with data bytes: %@"), v30, v31, v32, v33, v34, v35, (uint64_t)v16);
    v28 = *MEMORY[0x1E0C99778];
    v36 = v39;
    if (!v39)
      v36 = CFSTR("<null>");
    v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An error %@ occurred converting the metadata plist data: %@"), v36, v16);
LABEL_21:
    v37 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v28, 134030, v29, 0);
    objc_exception_throw(v37);
  }
  v17 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@) VALUES (?, ?, ?)"), CFSTR("Z_METADATA"), CFSTR("Z_VERSION"), CFSTR("Z_UUID"), CFSTR("Z_PLIST")));
  v18 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v14, 6, 0);
  v19 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v16, 10, 0);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v13);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v18);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v19);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v17);
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 2)
  {
    v20 = -[NSSQLBindVariable value](v13, "value");
    _NSCoreDataLog(4, (uint64_t)CFSTR("Saving new meta data; version = %@ ; UUID = %@"),
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v20);
  }

}

- (uint64_t)_dropTableWithName:(uint64_t)a1
{
  NSObject *v4;
  char v5;
  int i;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    v5 = 0;
    for (i = 3; (v5 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](a1);
      if (*(_QWORD *)(a1 + 72))
      {
        -[NSSQLiteConnection beginTransaction](a1);
        -[NSSQLiteConnection _executeSQLString:](a1, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), a2));
        -[NSSQLiteConnection commitTransaction](a1);
        v5 = 1;
      }
      else
      {
        v5 = 0;
      }
      -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);
    }
  }
  return 0;
}

- (id)fetchCachedModel
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  id v4;
  NSSQLiteStatement *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  compression_status v13;
  uint64_t v14;
  id v15;
  id v16;
  const __CFString *v17;
  id v18;
  compression_stream stream;
  NSSQLColumn *v20;
  _BYTE v21[1024];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = (uint64_t)result;
  v2 = *((_QWORD *)result + 1);
  if (v2)
    dispatch_assert_queue_V2(v2);
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), CFSTR("Z_CONTENT"), CFSTR("Z_MODELCACHE"));
  if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, (uint64_t)CFSTR("Z_MODELCACHE"), 0))
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)v1, "adapter"), v3);
  -[NSSQLiteConnection prepareSQLStatement:](v1, v5);
  objc_msgSend((id)v1, "execute");
  v20 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("Z_CONTENT"), 10);
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v1, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1));
  v6 = -[NSSQLiteConnection newFetchedArray](v1);
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    v15 = 0;
    goto LABEL_23;
  }
  v8 = objc_msgSend(v7, "objectAtIndex:", 0);
  if (v8 == NSKeyValueCoding_NullValue || (v9 = (void *)objc_msgSend(v7, "objectAtIndex:", 0), (v10 = v9) == 0))
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  v11 = (void *)objc_msgSend(v9, "length");
  if (!v11)
    goto LABEL_22;
  memset(&stream, 0, sizeof(stream));
  if (compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB))
  {
    v17 = CFSTR("Could not initialize compression decoder.");
LABEL_26:
    v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134060, (uint64_t)v17, 0);
    objc_exception_throw(v18);
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  stream.src_ptr = (const uint8_t *)objc_msgSend(v10, "bytes");
  stream.src_size = objc_msgSend(v10, "length");
  do
  {
    stream.dst_ptr = v21;
    stream.dst_size = 1024;
    v13 = compression_stream_process(&stream, 1);
    if (v13 > COMPRESSION_STATUS_END)
    {
      compression_stream_destroy(&stream);
      v17 = CFSTR("Failed to decompress model cache.");
      goto LABEL_26;
    }
    if (stream.dst_size != 1024)
      objc_msgSend(v12, "appendBytes:length:", v21, 1024 - stream.dst_size);
  }
  while (v13 == COMPRESSION_STATUS_OK);
  compression_stream_destroy(&stream);
  if (!v12)
    goto LABEL_21;
  v11 = (void *)objc_msgSend(v12, "length");
  if (v11)
  {
    v14 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v11 = (void *)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v14, (uint64_t)v12, 0);
  }
LABEL_22:
  v15 = v11;
LABEL_23:

  -[NSSQLiteConnection releaseSQLStatement](v1);
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v1, 0);
  *(_DWORD *)(v1 + 312) &= ~2u;
  *(_QWORD *)(v1 + 100) = 0;
  *(_QWORD *)(v1 + 92) = 0;
  *(_DWORD *)(v1 + 108) = 0;

  objc_msgSend(v4, "drain");
  v16 = 0;
  return v15;
}

- (uint64_t)saveCachedModel:(uint64_t)result
{
  void *v3;
  NSObject *v4;
  id v5;
  NSSQLiteStatement *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  compression_status v11;
  id v12;
  id v13;
  NSSQLiteStatement *v14;
  NSSQLBindVariable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  compression_stream stream;
  _BYTE v25[1024];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)result;
    v4 = *(NSObject **)(result + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, (uint64_t)CFSTR("Z_MODELCACHE"), 0) & 1) != 0)
      v6 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(v3, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), CFSTR("Z_MODELCACHE")));
    else
      v6 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(v3, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE %@ (%@ BLOB)"), CFSTR("Z_MODELCACHE"), CFSTR("Z_CONTENT")));
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, v6);

    v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
    v9 = v8;
    if (v8 && objc_msgSend(v8, "length"))
    {
      memset(&stream, 0, sizeof(stream));
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB))
      {
        v22 = CFSTR("Could not initialize compression encoder.");
      }
      else
      {
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
        stream.src_ptr = (const uint8_t *)objc_msgSend(v9, "bytes");
        stream.src_size = objc_msgSend(v9, "length");
        while (1)
        {
          stream.dst_ptr = v25;
          stream.dst_size = 1024;
          v11 = compression_stream_process(&stream, 1);
          if (v11 > COMPRESSION_STATUS_END)
            break;
          if (stream.dst_size != 1024)
            objc_msgSend(v10, "appendBytes:length:", v25, 1024 - stream.dst_size);
          if (v11)
          {
            compression_stream_destroy(&stream);
            goto LABEL_17;
          }
        }
        compression_stream_destroy(&stream);
        v22 = CFSTR("Failed to decompress model cache.");
      }
      v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134060, (uint64_t)v22, 0);
      objc_exception_throw(v23);
    }
    v10 = 0;
LABEL_17:
    v12 = v10;
    objc_msgSend(v7, "drain");
    v13 = v10;
    if (v13)
    {
      v14 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(v3, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (?)")));
      v15 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v13, 10, 0);
      -[NSSQLiteStatement addBindVariable:]((uint64_t)v14, v15);
      -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, v14);
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 2)
        _NSCoreDataLog(4, (uint64_t)CFSTR("Saving new model cache"), v16, v17, v18, v19, v20, v21, (uint64_t)CFSTR("Z_MODELCACHE"));

    }
    return objc_msgSend(v5, "drain");
  }
  return result;
}

- (void)didCreateSchema
{
  NSSQLiteStatement *v2;

  if ((a1[312] & 0x40) != 0)
  {
    v2 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), (uint64_t)CFSTR("pragma journal_mode=wal"));
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v2);

  }
}

- (uint64_t)recreateIndices
{
  id *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    v2 = *(NSObject **)(result + 8);
    if (v2)
      dispatch_assert_queue_V2(v2);
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      _NSCoreDataLog(4, (uint64_t)CFSTR("re-adding all missing indices"), v3, v4, v5, v6, v7, v8, v22);
    v9 = (_QWORD *)objc_msgSend(v1[2], "model");
    v10 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)v1, (uint64_t)CFSTR("index"), 0);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __37__NSSQLiteConnection_recreateIndices__block_invoke;
    v35[3] = &unk_1E1EE0030;
    v35[4] = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v35);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    if (v9)
      v9 = (_QWORD *)v9[5];
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v12)
    {
      obj = v9;
      v24 = *(_QWORD *)v32;
      do
      {
        v13 = 0;
        v25 = v12;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
          v15 = objc_msgSend(v1, "adapter");
          if (v15)
            v16 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v15, v14, 0);
          else
            v16 = 0;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          v26 = v13;
          if (v17)
          {
            v18 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v28 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(_QWORD **)(*((_QWORD *)&v27 + 1) + 8 * i);
                if ((objc_msgSend(v11, "containsObject:", objc_msgSend((id)objc_msgSend(v20, "sqlString"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("IF NOT EXISTS "), &stru_1E1EE23F0)) & 1) == 0)
                {
                  -[NSSQLiteConnection beginTransaction]((uint64_t)v1);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v20);
                  -[NSSQLiteConnection commitTransaction]((uint64_t)v1);
                }
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
            }
            while (v17);
          }

          v13 = v26 + 1;
        }
        while (v26 + 1 != v25);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        v12 = v21;
      }
      while (v21);
    }
    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v1, 0);

    if ((_DWORD)v12)
      objc_exception_rethrow();
    return 1;
  }
  return result;
}

uint64_t __37__NSSQLiteConnection_recreateIndices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  return result;
}

- (uint64_t)logQueryPlanForStatement:(uint64_t)a1
{
  uint64_t v2;
  id v4;
  const char *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  sqlite3_stmt *ppStmt;

  v2 = a1;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    ppStmt = 0;
    v5 = (const char *)objc_msgSend((id)objc_msgSend(a2, "sqlString"), "UTF8String");
    if (v5)
    {
      v6 = sqlite3_mprintf("EXPLAIN QUERY PLAN %s", v5);
      if (v6)
      {
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SQLite: %s"), v6);
        v2 = sqlite3_prepare_v2(*(sqlite3 **)(v2 + 72), v6, -1, &ppStmt, 0);
        sqlite3_free(v6);
        if (!(_DWORD)v2)
        {
          while (sqlite3_step(ppStmt) == 100)
          {
            objc_msgSend(v7, "appendString:", CFSTR("\n     "));
            v14 = sqlite3_column_int(ppStmt, 0);
            v15 = sqlite3_column_int(ppStmt, 1);
            v16 = sqlite3_column_int(ppStmt, 2);
            objc_msgSend(v7, "appendFormat:", CFSTR("%d %d %d %s"), v14, v15, v16, sqlite3_column_text(ppStmt, 3));
          }
          _NSCoreDataLog(7, (uint64_t)CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
          sqlite3_reset(ppStmt);
          v2 = sqlite3_finalize(ppStmt);
        }
      }
      else
      {
        v2 = 7;
      }
    }
    else
    {
      v2 = 1;
    }
    objc_msgSend(v4, "drain");
    v17 = 0;
  }
  return v2;
}

uint64_t __45__NSSQLiteConnection_indexesUsedByStatement___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  char *v3;
  char *v4;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (char *)sqlite3_column_text(a2, 3);
  v4 = strstr(v3, " INDEX ");
  if (v4 && sscanf(v4 + 7, "%1023s", v6))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6));
  return 0;
}

- (uint64_t)hasIndexTrackingTable
{
  uint64_t v1;
  void *v2;
  objc_class *v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = (objc_class *)objc_opt_class();
    v4 = objc_msgSend(v2, "stringWithFormat:", CFSTR("A%@"), -[NSString uppercaseString](NSStringFromClass(v3), "uppercaseString"));
    return -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, v4, 0);
  }
  return result;
}

- (void)dropIndexTrackingTable
{
  NSSQLiteStatement *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  NSSQLiteStatement *v6;

  if (a1)
  {
    v2 = (NSSQLiteStatement *)objc_msgSend(a1, "adapter");
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    v5 = objc_msgSend(v3, "stringWithFormat:", CFSTR("A%@"), -[NSString uppercaseString](NSStringFromClass(v4), "uppercaseString"));
    v6 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v2, v5);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v6);

  }
}

- (uint64_t)setUpIndexTracking
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  sqlite3_int64 v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  int v29;
  uint64_t v30;
  id obj;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  char v43[1024];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend(a1[2], "_persistentStoreCoordinator"))
    return 0;
  if (objc_msgSend(a1[2], "isReadOnly"))
  {
    _NSCoreDataLog(2, (uint64_t)CFSTR("index tracking enabled on read-only store"), v2, v3, v4, v5, v6, v7, v30);
    return 0;
  }
  v9 = a1[2];
  if (v9 && (v9[194] & 1) != 0 && (-[NSSQLiteConnection hasIndexTrackingTable]((uint64_t)a1) & 1) == 0)
  {
    -[NSSQLiteConnection beginTransaction]((uint64_t)a1);
    if (!-[NSSQLiteConnection hasIndexTrackingTable]((uint64_t)a1))
    {
      v11 = objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentStoreTrackIndexUseOptionKey"));
      v12 = v11;
      if (v11)
        v13 = *(void **)(v11 + 32);
      else
        v13 = 0;
      v14 = (objc_class *)objc_opt_class();
      v32 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", NSStringFromClass(v14));
      if (v12)
        v15 = *(void **)(v12 + 40);
      else
        v15 = 0;
      -[NSSQLiteConnection createTablesForEntities:]((uint64_t)a1, v15);
      v16 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)a1, (uint64_t)CFSTR("index"), 0);
      v17 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:]((uint64_t)a1, (uint64_t)v32, objc_msgSend(v16, "count"));
      v18 = v17 != 0;
      v19 = objc_msgSend(v16, "count");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v16;
      v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v20)
      {
        v21 = v17 - v19 + 1;
        v33 = *(_QWORD *)v39;
LABEL_19:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v39 != v33)
            objc_enumerationMutation(obj);
          if (!v18)
            break;
          v23 = strstr((char *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v22), "objectAtIndexedSubscript:", 1), "UTF8String"), " INDEX ");
          if (sscanf(v23 + 7, "%1023s", v43))
          {
            -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:]((uint64_t)a1, v32);
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v24 = (void *)objc_msgSend(a1[6], "bindVariables");
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v25)
            {
              v26 = *(_QWORD *)v35;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v35 != v26)
                    objc_enumerationMutation(v24);
                  v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                  v29 = objc_msgSend(v28, "index");
                  if (v29)
                  {
                    if (v29 == 4)
                      objc_msgSend(v28, "setValue:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v43), "uppercaseString"));
                  }
                  else
                  {
                    objc_msgSend(v28, "setInt64:", v21++);
                  }
                }
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v25);
            }
            objc_msgSend(a1, "execute");
            v18 = 1;
            -[NSSQLiteConnection _clearBindVariablesForInsertedRow]((uint64_t)a1);
            -[NSSQLiteConnection releaseSQLStatement]((uint64_t)a1);
          }
          else
          {
            v18 = 1;
          }
          if (++v22 == v20)
          {
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
            if (v20)
              goto LABEL_19;
            goto LABEL_39;
          }
        }
      }
      else
      {
LABEL_39:
        if (v18)
        {
          v8 = 1;
          -[NSSQLiteConnection commitTransaction]((uint64_t)a1);
          return v8;
        }
      }
      v8 = 0;
      -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
      return v8;
    }
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
  }
  return 1;
}

- (_QWORD)harvestUsedIndexes
{
  void *v1;

  if (result)
  {
    v1 = (void *)result[43];
    result[43] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    return v1;
  }
  return result;
}

- (uint64_t)fetchUbiquityKnowledgeVector
{
  uint64_t v1;
  char v2;
  NSSQLiteStatement *v3;
  NSSQLColumn *v4;
  NSSQLColumn *v5;
  NSSQLColumn *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSQLiteStatement *v17;
  int i;
  id v19;

  if (result)
  {
    v1 = result;
    v2 = 0;
    v15 = result + 92;
    v16 = 0;
    for (i = 3; (v2 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v1);
      v3 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)v1, "adapter"), (uint64_t)CFSTR("select YPEERID, YTRANSACTIONNUMBER, Y_PK from Y_UBMETA"));
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = v3;
      v4 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YPEERID"), 6);
      objc_msgSend(v19, "addObject:", v4);

      v5 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YTRANSACTIONNUMBER"), 2);
      objc_msgSend(v19, "addObject:", v5);

      v6 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("Y_PK"), 2);
      objc_msgSend(v19, "addObject:", v6);

      if (!*(_QWORD *)(v1 + 72))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Database not open: %@"), "-[NSSQLiteConnection fetchUbiquityKnowledgeVector]", 8355, v1);
        -[NSSQLiteConnection connect](v1);
      }
      -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)v1);
      -[NSSQLiteConnection _ensureNoStatementPrepared](v1);
      -[NSSQLiteConnection _ensureNoTransactionOpen](v1);
      -[NSSQLiteConnection _ensureNoFetchInProgress](v1);
      -[NSSQLiteConnection prepareSQLStatement:](v1, v3);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v1, v19);
      objc_msgSend((id)v1, "execute");
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      while (1)
      {
        v8 = -[NSSQLiteConnection newFetchedArray](v1);
        if (!v8)
          break;
        v9 = v8;
        if (objc_msgSend(v8, "count") == 3)
        {
          v10 = objc_msgSend(v9, "objectAtIndex:", 0);
          v11 = objc_msgSend(v9, "objectAtIndex:", 1);
          v12 = objc_msgSend(v9, "objectAtIndex:", 2);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("YPEERID"), v11, CFSTR("YTRANSACTIONNUMBER"), v12, CFSTR("Y_PK"), 0);
          objc_msgSend(v7, "setObject:forKey:", v13, v10);

        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Had trouble fetching ubiquity knowledge vector from store: %@"), "-[NSSQLiteConnection fetchUbiquityKnowledgeVector]", 8380, v1);
        }

      }
      v2 = 1;
      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);

      v16 = v14;
      -[NSSQLiteConnection releaseSQLStatement](v1);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v1, 0);
      *(_DWORD *)(v1 + 312) &= ~2u;
      *(_QWORD *)v15 = 0;
      *(_QWORD *)(v15 + 8) = 0;
      *(_DWORD *)(v15 + 16) = 0;

    }
    return v16;
  }
  return result;
}

- (_QWORD)updateUbiquityKnowledgeVector:(_QWORD *)result
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  sqlite3 *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  int v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = (uint64_t)result;
    result = (_QWORD *)objc_msgSend(a2, "allKeys");
    obj = result;
    v3 = 0;
    v17 = *MEMORY[0x1E0C99768];
    v18 = 3;
    while ((v3 & 1) == 0 && (v18 & 0x80000000) == 0)
    {
      -[NSSQLiteConnection connect](v2);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v4)
      {
        v5 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v22 != v5)
              objc_enumerationMutation(obj);
            v7 = *(const __CFString **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v8 = (void *)objc_msgSend(a2, "objectForKey:", v7);
            v9 = objc_msgSend(v8, "objectForKey:", CFSTR("YTRANSACTIONNUMBER"));
            v10 = objc_msgSend(v8, "objectForKey:", CFSTR("Y_PK"));
            v11 = objc_msgSend(v8, "objectForKey:", CFSTR("OLDYTRANSACTIONNUMBER"));
            if (v10)
              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL Y_UBMETA set YPEERID=\"%@\", YTRANSACTIONNUMBER=%@ where YTRANSACTIONNUMBER=%@ AND Y_PK=%@"), v7, v9, v11, v10);
            else
              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO Y_UBMETA(YPEERID, YTRANSACTIONNUMBER) VALUES(\"%@\", %@)"), v7, v9);
            v13 = v12;
            -[NSSQLiteConnection _executeSQLString:](v2, v12);
            v14 = *(sqlite3 **)(v2 + 72);
            if (!v14 || !sqlite3_changes(v14))
            {
              if (v7)
                v15 = v7;
              else
                v15 = CFSTR("<null>");
              v16 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v17, 134304, 0, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v15, CFSTR("offendingPeerID"), CFSTR("import"), CFSTR("offendingOperation"), 0));
              objc_exception_throw(v16);
            }

            v3 = 1;
          }
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v4);
      }
      else
      {
        v3 = 0;
      }

      -[NSSQLiteConnection releaseSQLStatement](v2);
      result = -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v2, 0);
      --v18;
      *(_DWORD *)(v2 + 312) &= ~2u;
      *(_QWORD *)(v2 + 92) = 0;
      *(_QWORD *)(v2 + 100) = 0;
      *(_DWORD *)(v2 + 108) = 0;
    }
  }
  return result;
}

- (_QWORD)replaceUbiquityKnowledgeVector:(_QWORD *)result
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  void *v9;
  sqlite3 *v10;
  uint64_t v11;
  void *v12;
  sqlite3 *v13;
  const __CFString *v14;
  id v15;
  uint64_t v16;
  int v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (uint64_t)result;
    result = (_QWORD *)objc_msgSend(a2, "allKeys");
    obj = result;
    v4 = 0;
    v16 = *MEMORY[0x1E0C99768];
    v17 = 3;
    while ((v4 & 1) == 0 && (v17 & 0x80000000) == 0)
    {
      -[NSSQLiteConnection connect](v3);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v20 != v6)
              objc_enumerationMutation(obj);
            v8 = *(const __CFString **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM Y_UBMETA WHERE YPEERID = \"%@\"), v8);
            -[NSSQLiteConnection _executeSQLString:](v3, v9);
            v10 = *(sqlite3 **)(v3 + 72);
            if (v10)
              sqlite3_changes(v10);

            v11 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", v8), "objectForKey:", CFSTR("YTRANSACTIONNUMBER"));
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO Y_UBMETA(YPEERID, YTRANSACTIONNUMBER) VALUES(\"%@\", %@)"), v8, v11);
            -[NSSQLiteConnection _executeSQLString:](v3, v12);
            v13 = *(sqlite3 **)(v3 + 72);
            if (!v13 || !sqlite3_changes(v13))
            {
              if (v8)
                v14 = v8;
              else
                v14 = CFSTR("<null>");
              v15 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v16, 134304, 0, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v14, CFSTR("offendingPeerID"), CFSTR("import"), CFSTR("offendingOperation"), 0));
              objc_exception_throw(v15);
            }

            v4 = 1;
          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v5);
      }
      else
      {
        v4 = 0;
      }

      -[NSSQLiteConnection releaseSQLStatement](v3);
      result = -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v3, 0);
      --v17;
      *(_DWORD *)(v3 + 312) &= ~2u;
      *(_QWORD *)(v3 + 92) = 0;
      *(_QWORD *)(v3 + 100) = 0;
      *(_DWORD *)(v3 + 108) = 0;
    }
  }
  return result;
}

- (_QWORD)updateUbiquityKnowledgeForPeerWithID:(void *)a3 andTransactionNumber:
{
  uint64_t v5;
  char v6;
  const __CFString *v7;
  char *v8;
  int i;
  void *v10;
  void *v11;
  sqlite3 *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;

  if (result)
  {
    v5 = (uint64_t)result;
    v6 = 0;
    v7 = CFSTR("<null>");
    if (a2)
      v7 = a2;
    v17 = v7;
    v16 = *MEMORY[0x1E0C99768];
    v8 = (char *)result + 92;
    for (i = 3; (v6 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v5);
      if (objc_msgSend(a3, "unsignedIntegerValue"))
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL Y_UBMETA set YPEERID=\"%@\", YTRANSACTIONNUMBER=%@ WHERE YPEERID=\"%@\"), a2, a3, a2);
      else
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO Y_UBMETA(YPEERID, YTRANSACTIONNUMBER) VALUES(\"%@\", %@)"), a2, a3);
      v11 = v10;
      -[NSSQLiteConnection _executeSQLString:](v5, v10);
      v12 = *(sqlite3 **)(v5 + 72);
      if (!v12 || !sqlite3_changes(v12))
      {
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = (uint64_t)v11;
        if (!v11)
          v14 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v15 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v16, 134304, 0, (void *)objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v17, CFSTR("offendingPeerID"), CFSTR("export"), CFSTR("offendingOperation"), v14, CFSTR("sqlString"), 0));
        objc_exception_throw(v15);
      }
      v6 = 1;

      -[NSSQLiteConnection releaseSQLStatement](v5);
      result = -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v5, 0);
      *(_DWORD *)(v5 + 312) &= ~2u;
      *(_QWORD *)v8 = 0;
      *((_QWORD *)v8 + 1) = 0;
      *((_DWORD *)v8 + 4) = 0;
    }
  }
  return result;
}

- (_QWORD)addPeerRange:(_QWORD *)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    if (a2)
    {
      v3 = a2[1];
      v4 = a2[2];
      v5 = a2[3];
      v6 = a2[4];
      v7 = a2[5];
      v8 = a2[6];
    }
    else
    {
      v7 = 0;
      v5 = 0;
      v3 = 0;
      v4 = 0;
      v6 = 0;
      v8 = 0;
    }
    return -[NSSQLiteConnection addPeerRangeForPeerID:entityName:rangeStart:rangeEnd:peerRangeStart:peerRangeEnd:](result, v3, v4, v5, v6, v7, v8);
  }
  return result;
}

- (_QWORD)addPeerRangeForPeerID:(uint64_t)a3 entityName:(uint64_t)a4 rangeStart:(uint64_t)a5 rangeEnd:(uint64_t)a6 peerRangeStart:(uint64_t)a7 peerRangeEnd:
{
  uint64_t v10;
  char v11;
  char *v12;
  int i;
  void *v14;

  if (result)
  {
    v10 = (uint64_t)result;
    v11 = 0;
    v12 = (char *)result + 92;
    for (i = 3; (v11 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v10);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO Y_UBRANGE(YPEERID, YENTITYNAME, YRANGESTART, YRANGEEND, YPEERSTART, YPEEREND) VALUES(\"%@\", \"%@\", %@, %@, %@, %@)"), a2, a3, a4, a5, a6, a7);
      -[NSSQLiteConnection _executeSQLString:](v10, v14);
      v11 = 1;

      -[NSSQLiteConnection releaseSQLStatement](v10);
      result = -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v10, 0);
      *(_DWORD *)(v10 + 312) &= ~2u;
      *(_QWORD *)v12 = 0;
      *((_QWORD *)v12 + 1) = 0;
      *((_DWORD *)v12 + 4) = 0;
    }
  }
  return result;
}

- (_DWORD)allPeerRanges
{
  _DWORD *v1;
  char v2;
  NSSQLiteStatement *v3;
  NSSQLColumn *v4;
  NSSQLColumn *v5;
  NSSQLColumn *v6;
  NSSQLColumn *v7;
  NSSQLColumn *v8;
  NSSQLColumn *v9;
  id v10;
  void *v11;
  void *v12;
  PFUbiquitySQLCorePeerRange *v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  int i;
  id v18;

  if (result)
  {
    v1 = result;
    v2 = 0;
    v15 = result + 23;
    v16 = 0;
    for (i = 3; (v2 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect]((uint64_t)v1);
      v3 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(v1, "adapter"), (uint64_t)CFSTR("SELECT YPEERID, YENTITYNAME, YRANGESTART, YRANGEEND, YPEERSTART, YPEEREND FROM Y_UBRANGE"));
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v4 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YPEERID"), 6);
      objc_msgSend(v18, "addObject:", v4);

      v5 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YENTITYNAME"), 6);
      objc_msgSend(v18, "addObject:", v5);

      v6 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YRANGESTART"), 2);
      objc_msgSend(v18, "addObject:", v6);

      v7 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YRANGEEND"), 2);
      objc_msgSend(v18, "addObject:", v7);

      v8 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YPEERSTART"), 2);
      objc_msgSend(v18, "addObject:", v8);

      v9 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YPEEREND"), 2);
      objc_msgSend(v18, "addObject:", v9);

      -[NSSQLiteConnection _ensureDatabaseOpen](v1);
      -[NSSQLiteConnection _ensureNoStatementPrepared]((uint64_t)v1);
      -[NSSQLiteConnection _ensureNoTransactionOpen]((uint64_t)v1);
      -[NSSQLiteConnection _ensureNoFetchInProgress]((uint64_t)v1);
      -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v1, v3);
      -[NSSQLiteConnection setColumnsToFetch:](v1, v18);
      objc_msgSend(v1, "execute");
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      while (1)
      {
        v11 = -[NSSQLiteConnection newFetchedArray]((uint64_t)v1);
        if (!v11)
          break;
        v12 = v11;
        if (objc_msgSend(v11, "count") == 6)
        {
          v13 = -[PFUbiquitySQLCorePeerRange initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:]([PFUbiquitySQLCorePeerRange alloc], "initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:", objc_msgSend(v12, "objectAtIndex:", 0), objc_msgSend(v12, "objectAtIndex:", 1), objc_msgSend(v12, "objectAtIndex:", 2), objc_msgSend(v12, "objectAtIndex:", 3), objc_msgSend(v12, "objectAtIndex:", 4), objc_msgSend(v12, "objectAtIndex:", 5));
          objc_msgSend(v10, "addObject:", v13);

        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Had trouble fetching ubiquity knowledge vector from store: %@"), "-[NSSQLiteConnection allPeerRanges]", 8657, v1);
        }

      }
      v2 = 1;
      v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);

      v16 = v14;
      -[NSSQLiteConnection releaseSQLStatement]((uint64_t)v1);
      -[NSSQLiteConnection setColumnsToFetch:](v1, 0);
      v1[78] &= ~2u;
      *(_QWORD *)v15 = 0;
      *((_QWORD *)v15 + 1) = 0;
      v15[4] = 0;

    }
    return (_DWORD *)v16;
  }
  return result;
}

- (id)createMapOfEntityNameToPKMaxForEntitiesFromPKTable:(uint64_t)a1
{
  char v4;
  id v5;
  NSSQLColumn *v6;
  NSSQLColumn *v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  const __CFString *v14;
  NSSQLiteStatement *v15;
  NSSQLiteStatement *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSQLiteStatement *v22;
  uint64_t v24;
  int i;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend(a2, "count"))
    return 0;
  v26 = 0;
  v4 = 0;
  v24 = *MEMORY[0x1E0C99768];
  for (i = 3; (v4 & 1) == 0 && (i & 0x80000000) == 0; --i)
  {
    -[NSSQLiteConnection connect](a1);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("Z_NAME"), 6);
    objc_msgSend(v5, "addObject:", v6);

    v7 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("MAX"), 2);
    objc_msgSend(v5, "addObject:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT Z_NAME, Z_MAX FROM Z_PRIMARYKEY WHERE Z_NAME IN ("));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(a2);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "name");
          if ((v10 & 1) != 0)
            v14 = CFSTR(", '%@'");
          else
            v14 = CFSTR("'%@'");
          objc_msgSend(v8, "appendFormat:", v14, v13);
          v10 = 1;
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }
    objc_msgSend(v8, "appendString:", CFSTR(") GROUP BY Z_NAME"));
    v15 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)v8);
    -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    -[NSSQLiteConnection prepareSQLStatement:](a1, v15);
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v5);
    objc_msgSend((id)a1, "execute");
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = v15;
    while (1)
    {
      v17 = -[NSSQLiteConnection newFetchedArray](a1);
      v18 = v17;
      if (!v17)
        break;
      v19 = objc_msgSend(v17, "count");
      if (v19 != objc_msgSend(v5, "count"))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v24, CFSTR("Got the wrong number of rows back for the range max query"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count")), CFSTR("fetchResultRows"))));
      v20 = objc_msgSend(v18, "objectAtIndex:", 0);
      v21 = objc_msgSend(v18, "objectAtIndex:", 1);
      if (v20 == objc_msgSend(MEMORY[0x1E0C99E38], "null") || v21 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      {

      }
      else
      {
        objc_msgSend(v26, "setObject:forKey:", v21, v20);

      }
    }
    v22 = v16;
    v4 = 1;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(_QWORD *)(a1 + 92) = 0;
    *(_QWORD *)(a1 + 100) = 0;
    *(_DWORD *)(a1 + 108) = 0;

  }
  return v26;
}

- (id)createMapOfEntityNameToPKMaxForEntitiesFromUBRangeTable:(uint64_t)a1
{
  char v4;
  id v5;
  NSSQLColumn *v6;
  NSSQLColumn *v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  const __CFString *v14;
  NSSQLiteStatement *v15;
  NSSQLiteStatement *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSQLiteStatement *v22;
  uint64_t v24;
  int i;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend(a2, "count"))
    return 0;
  v26 = 0;
  v4 = 0;
  v24 = *MEMORY[0x1E0C99768];
  for (i = 3; (v4 & 1) == 0 && (i & 0x80000000) == 0; --i)
  {
    -[NSSQLiteConnection connect](a1);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YENTITYNAME"), 6);
    objc_msgSend(v5, "addObject:", v6);

    v7 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("MAX"), 2);
    objc_msgSend(v5, "addObject:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT YENTITYNAME, MAX(YRANGEEND) FROM Y_UBRANGE WHERE YENTITYNAME IN ("));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(a2);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "name");
          if ((v10 & 1) != 0)
            v14 = CFSTR(", '%@'");
          else
            v14 = CFSTR("'%@'");
          objc_msgSend(v8, "appendFormat:", v14, v13);
          v10 = 1;
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }
    objc_msgSend(v8, "appendString:", CFSTR(") GROUP BY YENTITYNAME"));
    v15 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)v8);
    -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    -[NSSQLiteConnection prepareSQLStatement:](a1, v15);
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v5);
    objc_msgSend((id)a1, "execute");
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = v15;
    while (1)
    {
      v17 = -[NSSQLiteConnection newFetchedArray](a1);
      v18 = v17;
      if (!v17)
        break;
      v19 = objc_msgSend(v17, "count");
      if (v19 != objc_msgSend(v5, "count"))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v24, CFSTR("Got the wrong number of rows back for the range max query"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count")), CFSTR("fetchResultRows"))));
      v20 = objc_msgSend(v18, "objectAtIndex:", 0);
      v21 = objc_msgSend(v18, "objectAtIndex:", 1);
      if (v20 == objc_msgSend(MEMORY[0x1E0C99E38], "null") || v21 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      {

      }
      else
      {
        objc_msgSend(v26, "setObject:forKey:", v21, v20);

      }
    }
    v22 = v16;
    v4 = 1;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(_QWORD *)(a1 + 92) = 0;
    *(_QWORD *)(a1 + 100) = 0;
    *(_DWORD *)(a1 + 108) = 0;

  }
  return v26;
}

- (_QWORD)setUbiquityTableValue:(uint64_t)a3 forKey:
{
  uint64_t v5;
  char v6;
  char *v7;
  int i;
  void *v9;

  if (result)
  {
    v5 = (uint64_t)result;
    v6 = 0;
    v7 = (char *)result + 92;
    for (i = 3; (v6 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v5);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("REPLACE INTO Y_UBKVS(YKEY, YVALUE) VALUES(\"%@\", \"%@\")"), a3, a2);
      -[NSSQLiteConnection _executeSQLString:](v5, v9);
      v6 = 1;

      -[NSSQLiteConnection releaseSQLStatement](v5);
      result = -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v5, 0);
      *(_DWORD *)(v5 + 312) &= ~2u;
      *(_QWORD *)v7 = 0;
      *((_QWORD *)v7 + 1) = 0;
      *((_DWORD *)v7 + 4) = 0;
    }
  }
  return result;
}

- (id)ubiquityTableValueForKey:(uint64_t)a1
{
  id v4;
  int i;
  void *v6;
  NSSQLiteStatement *v7;
  id v8;
  NSSQLiteStatement *v9;
  NSSQLColumn *v10;
  void *v11;
  void *v12;

  if (!a1 || !objc_msgSend(a2, "length"))
    return 0;
  v4 = 0;
  for (i = 3; !v4 && (i & 0x80000000) == 0; --i)
  {
    -[NSSQLiteConnection connect](a1);
    if (*(_QWORD *)(a1 + 72))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("select YVALUE from Y_UBKVS where YKEY = \"%@\"), a2);
      v7 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)v6);
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = v7;
      v10 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("YVALUE"), 6);
      objc_msgSend(v8, "addObject:", v10);

      -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
      -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
      -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
      -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
      -[NSSQLiteConnection prepareSQLStatement:](a1, v9);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v8);
      objc_msgSend((id)a1, "execute");
      v4 = 0;
      while (1)
      {
        v11 = -[NSSQLiteConnection newFetchedArray](a1);
        v12 = v11;
        if (!v11)
          break;
        if (objc_msgSend(v11, "count") == 1)
        {
          v4 = (id)objc_msgSend(v12, "objectAtIndex:", 0);
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Had trouble fetching ubiquity knowledge vector from store: %@"), "-[NSSQLiteConnection ubiquityTableValueForKey:]", 9115, a1);
        }

      }
      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(_QWORD *)(a1 + 92) = 0;
      *(_QWORD *)(a1 + 100) = 0;
      *(_DWORD *)(a1 + 108) = 0;
    }
    else
    {
      v6 = 0;
      v8 = 0;
      v9 = 0;
      v4 = 0;
    }

  }
  return v4;
}

- (void)dropUbiquityTables
{
  char v2;
  int i;

  if (a1)
  {
    v2 = 0;
    for (i = 3; (v2 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](a1);
      if (*(_QWORD *)(a1 + 72))
      {
        -[NSSQLiteConnection beginTransaction](a1);
        -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DROP TABLE IF EXISTS Y_UBMETA"));
        -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DROP TABLE IF EXISTS Y_UBRANGE"));
        -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DROP TABLE IF EXISTS Y_KVS"));
        -[NSSQLiteConnection commitTransaction](a1);
        v2 = 1;
      }
      else
      {
        v2 = 0;
      }
      -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);
    }
  }
}

- (BOOL)hasHistoryRows
{
  if (result)
    return -[NSSQLiteConnection _tableHasRows:](result, (uint64_t)CFSTR("ATRANSACTION"));
  return result;
}

- (uint64_t)_dropKnownHistoryTrackingTables
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSSQLiteStatement *v6;
  NSSQLiteStatement *v7;
  void *v8;
  NSSQLiteStatement *v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[5];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)result;
    v16[0] = CFSTR("CHANGE");
    v16[1] = CFSTR("TRANSACTION");
    v16[2] = CFSTR("TRANSACTIONSTRING");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    obj = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v12;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v12 != v3)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v4);
          v6 = (NSSQLiteStatement *)objc_msgSend(v1, "adapter");
          v7 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A%@"), v5));
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v7);

          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ set %@=0 where %@ = '%@'"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), CFSTR("Z_NAME"), v5);
          v9 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(v1, "adapter"), (uint64_t)v8);

          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v9);
          ++v4;
        }
        while (v2 != v4);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v2 = result;
      }
      while (result);
    }
  }
  return result;
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  _QWORD *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = (_QWORD *)objc_msgSend(a2, "entity");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = 0;
  }
  else
  {
    v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = v11;
    if (v10)
      v10 = *(unsigned int *)(v10 + 184);
  }
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%u-%lld"), v10, objc_msgSend(a2, "_referenceData64"));
  v13 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      v16 = *(void **)(v15 + 8);
    else
      v16 = 0;
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E20]);
    v18 = *(_QWORD *)(a1 + 48);
    if (v18)
      v19 = *(void **)(v18 + 8);
    else
      v19 = 0;
    v20 = (void *)objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v20, v12);

  }
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v22 = (_QWORD *)objc_msgSend(a3, "entity");
  if (v21 && v22)
  {
    v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v23)
      v23 = *(unsigned int *)(v23 + 184);
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    v23 = 0;
  }
  v35 = (id)objc_msgSend(v24, "initWithFormat:", CFSTR("%u-%lld"), v23, objc_msgSend(a3, "_referenceData64"));
  v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    v26 = (void *)v25;
    v27 = *(_QWORD *)(a1 + 48);
    if (v27 && (v28 = *(_QWORD *)(v27 + 8)) != 0)
      v29 = *(void **)(v28 + 56);
    else
      v29 = 0;
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }
  else
  {
    v30 = objc_alloc(MEMORY[0x1E0C99E20]);
    v31 = *(_QWORD *)(a1 + 48);
    if (v31 && (v32 = *(_QWORD *)(v31 + 8)) != 0)
      v33 = *(void **)(v32 + 56);
    else
      v33 = 0;
    v34 = (void *)objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v34, v35);

  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  _QWORD *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = (_QWORD *)objc_msgSend(a2, "entity");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = 0;
  }
  else
  {
    v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = v11;
    if (v10)
      v10 = *(unsigned int *)(v10 + 184);
  }
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%u-%lld"), v10, objc_msgSend(a2, "_referenceData64"));
  v13 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      v16 = *(void **)(v15 + 8);
    else
      v16 = 0;
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E20]);
    v18 = *(_QWORD *)(a1 + 48);
    if (v18)
      v19 = *(void **)(v18 + 8);
    else
      v19 = 0;
    v20 = (void *)objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    objc_msgSend(*(id *)(a1 + 56), "setValue:forKey:", v20, v12);

  }
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v22 = (_QWORD *)objc_msgSend(a3, "entity");
  if (v21 && v22)
  {
    v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v23)
      v23 = *(unsigned int *)(v23 + 184);
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    v23 = 0;
  }
  v35 = (id)objc_msgSend(v24, "initWithFormat:", CFSTR("%u-%lld"), v23, objc_msgSend(a3, "_referenceData64"));
  v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    v26 = (void *)v25;
    v27 = *(_QWORD *)(a1 + 48);
    if (v27 && (v28 = *(_QWORD *)(v27 + 8)) != 0)
      v29 = *(void **)(v28 + 56);
    else
      v29 = 0;
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }
  else
  {
    v30 = objc_alloc(MEMORY[0x1E0C99E20]);
    v31 = *(_QWORD *)(a1 + 48);
    if (v31 && (v32 = *(_QWORD *)(v31 + 8)) != 0)
      v33 = *(void **)(v32 + 56);
    else
      v33 = 0;
    v34 = (void *)objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    objc_msgSend(*(id *)(a1 + 56), "setValue:forKey:", v34, v35);

  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  _QWORD *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = (_QWORD *)objc_msgSend(a2, "entity");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = 0;
  }
  else
  {
    v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = v11;
    if (v10)
      v10 = *(unsigned int *)(v10 + 184);
  }
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%u-%lld"), v10, objc_msgSend(a2, "_referenceData64"));
  v13 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = *(_QWORD *)(a1 + 48);
    if (v15 && (v16 = *(_QWORD *)(v15 + 8)) != 0)
      v17 = *(void **)(v16 + 56);
    else
      v17 = 0;
    objc_msgSend(v14, "addObject:", objc_msgSend(v17, "name"));
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0C99E20]);
    v19 = *(_QWORD *)(a1 + 48);
    if (v19 && (v20 = *(_QWORD *)(v19 + 8)) != 0)
      v21 = *(void **)(v20 + 56);
    else
      v21 = 0;
    v22 = (void *)objc_msgSend(v18, "initWithObjects:", objc_msgSend(v21, "name"), 0);
    objc_msgSend(*(id *)(a1 + 56), "setValue:forKey:", v22, v12);

  }
  v23 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v24 = (_QWORD *)objc_msgSend(a3, "entity");
  if (v23 && v24)
  {
    v25 = _sqlCoreLookupSQLEntityForEntityDescription(v23, v24);
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v25)
      v25 = *(unsigned int *)(v25 + 184);
  }
  else
  {
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    v25 = 0;
  }
  v35 = (id)objc_msgSend(v26, "initWithFormat:", CFSTR("%u-%lld"), v25, objc_msgSend(a3, "_referenceData64"));
  v27 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v27)
  {
    v28 = (void *)v27;
    v29 = *(_QWORD *)(a1 + 48);
    if (v29)
      v30 = *(void **)(v29 + 8);
    else
      v30 = 0;
    objc_msgSend(v28, "addObject:", objc_msgSend(v30, "name"));
  }
  else
  {
    v31 = objc_alloc(MEMORY[0x1E0C99E20]);
    v32 = *(_QWORD *)(a1 + 48);
    if (v32)
      v33 = *(void **)(v32 + 8);
    else
      v33 = 0;
    v34 = (void *)objc_msgSend(v31, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    objc_msgSend(*(id *)(a1 + 56), "setValue:forKey:", v34, v35);

  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  _QWORD *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = (_QWORD *)objc_msgSend(a2, "entity");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = 0;
  }
  else
  {
    v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = v11;
    if (v10)
      v10 = *(unsigned int *)(v10 + 184);
  }
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%u-%lld"), v10, objc_msgSend(a2, "_referenceData64"));
  v13 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      v16 = *(void **)(v15 + 8);
    else
      v16 = 0;
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E20]);
    v18 = *(_QWORD *)(a1 + 48);
    if (v18)
      v19 = *(void **)(v18 + 8);
    else
      v19 = 0;
    v20 = (void *)objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v20, v12);

  }
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v22 = (_QWORD *)objc_msgSend(a3, "entity");
  if (v21 && v22)
  {
    v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v23)
      v23 = *(unsigned int *)(v23 + 184);
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    v23 = 0;
  }
  v35 = (id)objc_msgSend(v24, "initWithFormat:", CFSTR("%u-%lld"), v23, objc_msgSend(a3, "_referenceData64"));
  v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    v26 = (void *)v25;
    v27 = *(_QWORD *)(a1 + 48);
    if (v27 && (v28 = *(_QWORD *)(v27 + 8)) != 0)
      v29 = *(void **)(v28 + 56);
    else
      v29 = 0;
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }
  else
  {
    v30 = objc_alloc(MEMORY[0x1E0C99E20]);
    v31 = *(_QWORD *)(a1 + 48);
    if (v31 && (v32 = *(_QWORD *)(v31 + 8)) != 0)
      v33 = *(void **)(v32 + 56);
    else
      v33 = 0;
    v34 = (void *)objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v34, v35);

  }
}

- (void)processInsertRequest:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  sqlite3_int64 v20;
  NSObject *v21;
  sqlite3_int64 v22;
  uint64_t v23;
  uint64_t v24;
  sqlite3_int64 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  int v36;
  sqlite3_int64 v37;
  int v38;
  uint64_t v39;
  NSSQLiteStatementCache *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  _QWORD *v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 16);
    v5 = v4
       ? (void *)objc_msgSend(*(id *)(v4 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"))
       : 0;
    if (!objc_msgSend(v5, "count")
      || ((v6 = *(_QWORD *)(a1 + 16)) == 0
        ? (v7 = 0)
        : (v7 = (void *)objc_msgSend(*(id *)(v6 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"))), (objc_msgSend(v7, "containsObject:", objc_msgSend((id)objc_msgSend(a2, "persistentStoreRequest"), "entityName")) & 1) == 0))
    {
      if (a2)
        v8 = a2[11];
      else
        v8 = 0;
      v9 = (void *)-[NSSQLiteConnection gatherHistoryChangesFromTable:](a1, v8);
      v10 = (void *)objc_msgSend(v9, "valueForKey:", CFSTR("inserts"));
      v11 = (void *)objc_msgSend(v9, "valueForKey:", CFSTR("updates"));
      if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
      {
        if (!objc_msgSend(v10, "count")
          && objc_msgSend(v11, "count")
          && (-[NSSQLiteConnection hasAttributeChanges:](v11) & 1) == 0)
        {
          v51 = objc_msgSend(a2, "persistentStoreRequest");
          _NSCoreDataLog(9, (uint64_t)CFSTR("Batch Insert resulted in updates with no updated properties - %@ - %@"), v42, v43, v44, v45, v46, v47, v51);
          return;
        }
        v55 = a2;
        v53 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, (uint64_t)a2);
        v18 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, (uint64_t)a2, v53);
        v19 = a1;
        v20 = v18;
        v61 = v19;
        v21 = *(NSObject **)(v19 + 8);
        if (v21)
          dispatch_assert_queue_V2(v21);
        v54 = v11;
        if (objc_msgSend(v10, "count"))
        {
          obj = v10;
          v52 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v59 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v61 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
          v22 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](v61, (uint64_t)v59, objc_msgSend(v10, "count"));
          if (!v22)
          {
            v48 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("unable to generate primary keys"), 0);
            objc_exception_throw(v48);
          }
          v23 = objc_msgSend(v10, "count");
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
          if (v24)
          {
            v25 = v22 - v23;
            v57 = *(_QWORD *)v67;
            do
            {
              v26 = 0;
              v58 = v24;
              do
              {
                if (*(_QWORD *)v67 != v57)
                  objc_enumerationMutation(obj);
                v27 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v26);
                v28 = (void *)MEMORY[0x18D76B4E4]();
                v29 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(v61 + 16), (_QWORD *)objc_msgSend(v27, "entity"));
                v60 = v26;
                if (v29)
                  v30 = *(unsigned int *)(v29 + 184);
                else
                  v30 = 0;
                -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](v61, v59);
                v64 = 0u;
                v65 = 0u;
                v62 = 0u;
                v63 = 0u;
                v31 = (void *)objc_msgSend(*(id *)(v61 + 48), "bindVariables");
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
                ++v25;
                if (v32)
                {
                  v33 = *(_QWORD *)v63;
                  do
                  {
                    for (i = 0; i != v32; ++i)
                    {
                      if (*(_QWORD *)v63 != v33)
                        objc_enumerationMutation(v31);
                      v35 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                      if (!objc_msgSend(v35, "index"))
                      {
                        v36 = objc_msgSend(v35, "sqlType");
                        v37 = v25;
                        if (v36 == 2)
                        {
LABEL_35:
                          objc_msgSend(v35, "setInt64:", v37);
                          continue;
                        }
                      }
                      if (objc_msgSend(v35, "index") != 1
                        && objc_msgSend(v35, "index") != 2)
                      {
                        if (objc_msgSend(v35, "index") == 3)
                        {
                          v38 = objc_msgSend(v35, "sqlType");
                          v37 = v20;
                          if (v38 == 2)
                            goto LABEL_35;
                        }
                        if (objc_msgSend(v35, "index", v37) == 4)
                        {
                          v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
                        }
                        else if (objc_msgSend(v35, "index") == 6)
                        {
                          v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v30);
                        }
                        else
                        {
                          if (objc_msgSend(v35, "index") != 7)
                            continue;
                          v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v27, "_referenceData64"));
                        }
                        objc_msgSend(v35, "setValue:", v39);
                      }
                    }
                    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
                  }
                  while (v32);
                }
                objc_msgSend((id)v61, "execute");
                if (!*(_QWORD *)(v61 + 80))
                {
                  v40 = -[NSSQLiteConnection statementCacheForEntity:](v61, v59);
                  -[NSSQLiteStatementCache cacheInsertStatement:](v40, 0);
                }
                -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v61);
                -[NSSQLiteConnection resetSQLStatement](v61);
                objc_autoreleasePoolPop(v28);
                v26 = v60 + 1;
              }
              while (v60 + 1 != v58);
              v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
              v24 = v41;
            }
            while (v41);
          }

          v49 = 0;
        }
        -[NSSQLiteConnection insertUpdates:transactionID:updatedAttributes:](v61, v54, v20, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "persistentStoreRequest"), "entity"), "attributesByName"), "allValues"));
        v50 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20);
        if (v55)
          v55[9] = v50;

      }
      else
      {
        _NSCoreDataLog(9, (uint64_t)CFSTR("Batch Insert resulted in no changes - %@ - %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v10);
      }
    }
  }
}

- (uint64_t)gatherHistoryChangesFromTable:(uint64_t)a1
{
  NSSQLiteStatement *v3;
  NSSQLColumn *v4;
  NSSQLColumn *v5;
  NSSQLColumn *v6;
  NSSQLColumn *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
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
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
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
  const __CFString *v53;
  NSSQLiteStatement *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uint64_t v74;
  _QWORD v75[2];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (-[NSSQLiteConnection _tableHasRows:](a1, a2))
  {
    v3 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ENTITYID, PRIMEKEY, TYPE,  group_concat(ATTRIBUTENAME) FROM %@ GROUP BY ENTITYID, PRIMEKEY"), a2));
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v54 = v3;
    v4 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("ENTITYID"), 2);
    objc_msgSend(v57, "addObject:", v4);

    v5 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("PRIMEKEY"), 2);
    objc_msgSend(v57, "addObject:", v5);

    v6 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("TYPE"), 2);
    objc_msgSend(v57, "addObject:", v6);

    v7 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("ATTRIBUTENAME"), 6);
    objc_msgSend(v57, "addObject:", v7);

    -[NSSQLiteConnection prepareSQLStatement:](a1, v54);
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v57);
    objc_msgSend((id)a1, "execute");
    v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53 = CFSTR("inserts");
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v59);
    while (1)
    {
      v8 = -[NSSQLiteConnection newFetchedArray](a1);
      if (!v8)
      {
        v51 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v58);

        v50 = v51;
        -[NSSQLiteConnection releaseSQLStatement](a1);
        -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
        *(_DWORD *)(a1 + 312) &= ~2u;
        *(_QWORD *)(a1 + 100) = 0;
        *(_QWORD *)(a1 + 92) = 0;
        *(_DWORD *)(a1 + 108) = 0;

        return v50;
      }
      v9 = v8;
      v10 = (void *)MEMORY[0x18D76B4E4]();
      if (objc_msgSend(v9, "count") == 4)
        break;
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "incorrect number of results");
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v53);
      v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: incorrect number of results", buf, 2u);
      }
LABEL_31:

      objc_autoreleasePoolPop(v10);
    }
    v60 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
    v11 = objc_msgSend(v60, "unsignedLongValue");
    v12 = (void *)objc_msgSend(v9, "objectAtIndex:", 1);
    v13 = (void *)objc_msgSend(v9, "objectAtIndex:", 2);
    v61 = objc_msgSend(v9, "objectAtIndex:", 3);
    if (v11 >> 7 < 0x7D)
    {
      v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", v11);
    }
    else
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v14 = (void *)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels");
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v64;
LABEL_9:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v14);
          v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v17)), "entityForID:", v11);
          if (v18)
            break;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
            v18 = 0;
            if (v15)
              goto LABEL_9;
            break;
          }
        }
      }
      else
      {
        v18 = 0;
      }
    }
    v27 = (void *)objc_msgSend(*(id *)(a1 + 16), "newObjectIDForEntity:pk:", v18, objc_msgSend(v12, "unsignedLongLongValue"));
    if (v27)
    {
      v28 = objc_msgSend(v13, "longLongValue");
      v29 = v59;
      if (v28)
      {
        if (objc_msgSend(v13, "longLongValue") == 1)
        {
          if (v61)
          {
            v75[0] = v27;
            v75[1] = v61;
            objc_msgSend(v55, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2));
LABEL_30:

            goto LABEL_31;
          }
          v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "History Update for %@ without any updated columns.");
          _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)v27);
          v49 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            goto LABEL_30;
          *(_DWORD *)buf = 138412290;
          v68 = v27;
          v38 = v49;
          v39 = "CoreData: History Update for %@ without any updated columns.";
          v40 = 12;
LABEL_27:
          _os_log_fault_impl(&dword_18A253000, v38, OS_LOG_TYPE_FAULT, v39, buf, v40);
          goto LABEL_30;
        }
        v41 = objc_msgSend(v13, "longLongValue");
        v29 = v56;
        if (v41 != 2)
          goto LABEL_30;
      }
      objc_msgSend(v29, "addObject:", v27);
      goto LABEL_30;
    }
    v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to construct objectID for History Change: %@-%@-%@-%@");
    _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)v60);
    v37 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_DWORD *)buf = 138413058;
    v68 = v60;
    v69 = 2112;
    v70 = v12;
    v71 = 2112;
    v72 = v13;
    v73 = 2112;
    v74 = v61;
    v38 = v37;
    v39 = "CoreData: Unable to construct objectID for History Change: %@-%@-%@-%@";
    v40 = 42;
    goto LABEL_27;
  }
  return MEMORY[0x1E0C9AA70];
}

- (uint64_t)hasAttributeChanges:(void *)a1
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(a1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x18D76B4E4]();
        v8 = (void *)objc_msgSend(v6, "lastObject");
        if (objc_msgSend(v8, "isNSString") && objc_msgSend(v8, "length"))
        {
          objc_autoreleasePoolPop(v7);
          return 1;
        }
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v3 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)insertUpdates:(sqlite3_int64)a3 transactionID:(void *)a4 updatedAttributes:
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  sqlite3_int64 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  sqlite3_int64 v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSSQLiteStatementCache *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *context;
  uint64_t v41;
  void *v43;
  void *v44;
  id v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = *(NSObject **)(a1 + 8);
  if (v5)
    dispatch_assert_queue_V2(v5);
  if (objc_msgSend(a2, "count"))
  {
    v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v39 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("name")), "componentsJoinedByString:", CFSTR(","));
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (!v8)
      goto LABEL_48;
    v36 = v7;
    v37 = *(_QWORD *)v52;
    while (1)
    {
      v41 = 0;
      v38 = v8;
      do
      {
        if (*(_QWORD *)v52 != v37)
          objc_enumerationMutation(a2);
        v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v41);
        context = (void *)MEMORY[0x18D76B4E4]();
        v43 = (void *)objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_msgSend(v9, "lastObject");
        v11 = (void *)v39;
        if (objc_msgSend(v10, "isNSString"))
        {
          v11 = v10;
          if (!objc_msgSend(v10, "length"))
            v11 = (void *)v39;
        }
        v12 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
        if (!v12)
        {
          v32 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("unable to generate primary keys"), 0);
          objc_exception_throw(v32);
        }
        v13 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 16), (_QWORD *)objc_msgSend(v43, "entity"));
        v14 = (void *)v13;
        if (v13)
          v15 = *(unsigned int *)(v13 + 184);
        else
          v15 = 0;
        -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v16 = (void *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        v44 = v14;
        if (v17)
        {
          v18 = *(_QWORD *)v48;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v48 != v18)
                objc_enumerationMutation(v16);
              v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v19);
              if (!objc_msgSend(v20, "index"))
              {
                v21 = objc_msgSend(v20, "sqlType");
                v22 = v12;
                if (v21 == 2)
                {
LABEL_26:
                  objc_msgSend(v20, "setInt64:", v22);
                  goto LABEL_38;
                }
              }
              if (objc_msgSend(v20, "index") != 1 && objc_msgSend(v20, "index") != 2)
              {
                if (objc_msgSend(v20, "index") == 3)
                {
                  v23 = objc_msgSend(v20, "sqlType");
                  v22 = a3;
                  if (v23 == 2)
                    goto LABEL_26;
                }
                v24 = objc_msgSend(v20, "index", v22);
                v25 = v6;
                if (v24 == 4)
                  goto LABEL_37;
                if (objc_msgSend(v20, "index", v6) != 5 || !v11)
                {
                  if (objc_msgSend(v20, "index") == 6)
                  {
                    v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
                  }
                  else
                  {
                    if (objc_msgSend(v20, "index") != 7)
                      goto LABEL_38;
                    v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v43, "_referenceData64"));
                  }
                  v25 = v26;
LABEL_37:
                  objc_msgSend(v20, "setValue:", v25);
                  goto LABEL_38;
                }
                v25 = objc_msgSend(v45, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u-%@"), v15, v11));
                if (v25)
                  goto LABEL_37;
                v27 = objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
                v28 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]((uint64_t)_NSPersistentHistoryChange, v44, (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v27));
                objc_msgSend(v45, "setObject:forKey:", v28, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15));
                objc_msgSend(v20, "setValue:", v28);

              }
LABEL_38:
              ++v19;
            }
            while (v17 != v19);
            v29 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            v17 = v29;
          }
          while (v29);
        }
        objc_msgSend((id)a1, "execute");
        v7 = v36;
        if (!*(_QWORD *)(a1 + 80))
        {
          v30 = -[NSSQLiteConnection statementCacheForEntity:](a1, v36);
          -[NSSQLiteStatementCache cacheInsertStatement:](v30, 0);
        }
        -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
        -[NSSQLiteConnection resetSQLStatement](a1);
        objc_autoreleasePoolPop(context);
        ++v41;
      }
      while (v41 != v38);
      v31 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      v8 = v31;
      if (!v31)
      {
LABEL_48:

        v33 = 0;
        return;
      }
    }
  }
}

- (void)processUpdateRequest:(void *)a3 withOIDs:(void *)a4 forAttributes:
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  sqlite3_int64 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  if (a1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    v9 = v8
       ? (void *)objc_msgSend(*(id *)(v8 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"))
       : 0;
    if (!objc_msgSend(v9, "count")
      || ((v10 = *(_QWORD *)(a1 + 16)) == 0
        ? (v11 = 0)
        : (v11 = (void *)objc_msgSend(*(id *)(v10 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"))), (objc_msgSend(v11, "containsObject:", objc_msgSend((id)objc_msgSend(a2, "request"), "entityName")) & 1) == 0))
    {
      if (-[NSSQLiteConnection hasAttributeChanges:](a3))
      {
        v21 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, (uint64_t)a2);
        v12 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, (uint64_t)a2, v21);
        -[NSSQLiteConnection insertUpdates:transactionID:updatedAttributes:](a1, a3, v12, a4);
        v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
        if (a2)
          a2[9] = v13;

      }
      else
      {
        v14 = objc_msgSend(a2, "persistentStoreRequest");
        _NSCoreDataLog(9, (uint64_t)CFSTR("Batch Update resulted in updates with no updated properties - %@ - %@"), v15, v16, v17, v18, v19, v20, v14);
      }
    }
  }
}

- (uint64_t)_hasOldHistoryTrackingTables
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if ((-[NSSQLiteConnection _hasOldHistoryTrackingTablesV0](result) & 1) != 0)
      return 1;
    else
      return -[NSSQLiteConnection _hasOldHistoryTrackingTablesV1](v1);
  }
  return result;
}

- (uint64_t)_hasOldHistoryTrackingTablesV0
{
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char *errmsg;

  if (result)
  {
    v1 = result;
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](result, (uint64_t)CFSTR("ZCHANGETRACK"), 0) & 1) != 0
      || (v2 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, (uint64_t)CFSTR("ZCHANGETRACKHISTORY"), 0),
          result = 0,
          v2))
    {
      errmsg = 0;
      v3 = (void *)objc_opt_new();
      if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZCHANGETRACK'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| objc_msgSend(v3, "count") != 1)
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to determine if old history table 1 Exists - %s"), v4, v5, v6, v7, v8, v9, (uint64_t)errmsg);
      }
      else if (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCHANGETIMESTAMP FLOAT"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZBUNDLEID VARCHAR"))&& (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCONTEXTNAME VARCHAR")) & 1) != 0)
      {
        v10 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZPROCESSID VARCHAR"));

        if (!v10)
        {
          v17 = 0;
          return v17 != 0;
        }
        v3 = (void *)objc_opt_new();
        if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZCHANGETRACKHISTORY'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| objc_msgSend(v3, "count") != 1)
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to determine if old history table 2 Exists - %s"), v11, v12, v13, v14, v15, v16, (uint64_t)errmsg);
        }
        else if (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR(" ZCHANGETRACKHISTORYCHANGETYPE INTEGER"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCHANGETRACKHISTORYENTITY INTEGER"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCHANGETRACKHISTORYENTITYVERSION INTEGER"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCHANGETRACKINGHISTORYTRANSACTIONID INTEGER"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCHANGETRACKHISTORYTOMBSTONE BLOB")))
        {
          v17 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCHANGETRACKEHISTORYNTITYCOLUMNS BLOB"));
LABEL_20:

          return v17 != 0;
        }
      }
      v17 = 0;
      goto LABEL_20;
    }
  }
  return result;
}

- (uint64_t)_hasOldHistoryTrackingTablesV1
{
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char *errmsg;

  if (result)
  {
    v1 = result;
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](result, (uint64_t)CFSTR("ZCHANGE"), 0) & 1) != 0
      || (v2 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, (uint64_t)CFSTR("ZTRANSACTION"), 0), result = 0, v2))
    {
      errmsg = 0;
      v3 = (void *)objc_opt_new();
      if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZCHANGE'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| objc_msgSend(v3, "count") != 1)
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to determine if old history table 1 Exists - %s"), v4, v5, v6, v7, v8, v9, (uint64_t)errmsg);
      }
      else if (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZENTITY INTEGER, ZENTITYPK INTEGER"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCHANGETYPE INTEGER"))&& (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCOLUMNS BLOB")) & 1) != 0)
      {
        v10 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZTRANSACTIONID INTEGER"));

        if (!v10)
        {
          v17 = 0;
          return v17 != 0;
        }
        v3 = (void *)objc_opt_new();
        if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZTRANSACTION'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| objc_msgSend(v3, "count") != 1)
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to determine if old history table 2 Exists - %s"), v11, v12, v13, v14, v15, v16, (uint64_t)errmsg);
        }
        else if (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR(" ZBUNDLEID VARCHAR"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZCONTEXTNAME VARCHAR"))&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZPROCESSID VARCHAR")))
        {
          v17 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", CFSTR("ZTIMESTAMP FLOAT"));
LABEL_18:

          return v17 != 0;
        }
      }
      v17 = 0;
      goto LABEL_18;
    }
  }
  return result;
}

- (void)_dropOldHistoryTrackingTables
{
  if (a1)
  {
    if (-[NSSQLiteConnection _hasOldHistoryTrackingTablesV0](a1))
    {
      -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DROP TABLE ZCHANGETRACK"));
      -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DROP TABLE ZCHANGETRACKHISTORY"));
    }
    if (-[NSSQLiteConnection _hasOldHistoryTrackingTablesV1](a1))
    {
      -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DROP TABLE ZCHANGE"));
      -[NSSQLiteConnection _executeSQLString:](a1, CFSTR("DROP TABLE ZTRANSACTION"));
    }
  }
}

- (BOOL)addTombstoneColumnsForRange:(unint64_t)a3
{
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSSQLiteStatement *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  _BOOL4 v20;

  if (a1)
  {
    v6 = (_QWORD *)objc_msgSend(a1[2], "model");
    objc_msgSend(a1[2], "options");
    v19 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v6);
    v7 = objc_msgSend(v19, "entityNamed:", CFSTR("CHANGE"));
    v20 = v7 != 0;
    if (v7)
      v8 = a2 >= a3;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = (void *)v7;
      do
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ ADD Z%@%lu BLOB;"),
                        objc_msgSend(v9, "tableName"),
                        CFSTR("TOMBSTONE"),
                        a2);
        v11 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), (uint64_t)v10);
        if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 1)
          _NSCoreDataLog(4, (uint64_t)CFSTR("Executing new tombstone column statement: %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

        ++a2;
      }
      while (a3 != a2);
    }

  }
  else
  {
    return 0;
  }
  return v20;
}

- (uint64_t)numberOfTombstones
{
  uint64_t v1;
  _QWORD *v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *errmsg;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (_QWORD *)objc_msgSend(*(id *)(result + 16), "model");
    objc_msgSend(*(id *)(v1 + 16), "options");
    v3 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v2);
    v4 = (void *)objc_msgSend(v3, "entityNamed:", CFSTR("CHANGE"));
    v5 = 0;
    if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, objc_msgSend(v4, "tableName"), 0))
    {
LABEL_16:

      return v5;
    }
    errmsg = 0;
    v6 = (void *)objc_opt_new();
    if (sqlite3_exec(*(sqlite3 **)(v1 + 72), (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select sql from sqlite_master where name = '%@'"), objc_msgSend(v4, "tableName")), "UTF8String"), (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v6, &errmsg)|| objc_msgSend(v6, "count") != 1)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to determine if tombstones for change table - %s"), v7, v8, v9, v10, v11, v12, (uint64_t)errmsg);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = (void *)objc_msgSend((id)objc_msgSend(v6, "firstObject"), "componentsSeparatedByString:", CFSTR(" "));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v14)
      {
        v15 = v14;
        v5 = 0;
        v16 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            v5 += objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "containsString:", CFSTR("TOMBSTONE"));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v15);
        goto LABEL_15;
      }
    }
    v5 = 0;
LABEL_15:

    goto LABEL_16;
  }
  return result;
}

- (uint64_t)hasTransactionStringColumnsInTransactionTable
{
  uint64_t v1;
  _QWORD *v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *errmsg;
  _BYTE v24[128];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (_QWORD *)objc_msgSend(*(id *)(result + 16), "model");
    objc_msgSend(*(id *)(v1 + 16), "options");
    v3 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v2);
    v4 = (void *)objc_msgSend(v3, "entityNamed:", CFSTR("TRANSACTION"));
    v5 = 0;
    if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, objc_msgSend(v4, "tableName"), 0))
    {
LABEL_16:

      return v5 == 4;
    }
    errmsg = 0;
    v6 = (void *)objc_opt_new();
    if (sqlite3_exec(*(sqlite3 **)(v1 + 72), (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select sql from sqlite_master where name = '%@'"), objc_msgSend(v4, "tableName")), "UTF8String"), (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v6, &errmsg)|| objc_msgSend(v6, "count") != 1)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to determine if tombstones for change table - %s"), v7, v8, v9, v10, v11, v12, (uint64_t)errmsg);
    }
    else
    {
      v25[0] = CFSTR("AUTHORTS");
      v25[1] = CFSTR("BUNDLEIDTS");
      v25[2] = CFSTR("CONTEXTNAMETS");
      v25[3] = CFSTR("PROCESSIDTS");
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = (void *)objc_msgSend((id)objc_msgSend(v6, "firstObject"), "componentsSeparatedByString:", CFSTR(" "));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v15)
      {
        v16 = v15;
        v5 = 0;
        v17 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v20 != v17)
              objc_enumerationMutation(v14);
            v5 += objc_msgSend(v13, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_1E1EE23F0));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v16);
        goto LABEL_15;
      }
    }
    v5 = 0;
LABEL_15:

    goto LABEL_16;
  }
  return result;
}

- (BOOL)addTransactionStringColumnsToTransactionTable
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSSQLiteStatement *v11;
  id v13;
  _BOOL4 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[6];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (_QWORD *)objc_msgSend(a1[2], "model");
    objc_msgSend(a1[2], "options");
    v13 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v2);
    v3 = objc_msgSend(v13, "entityNamed:", CFSTR("TRANSACTION"));
    v14 = v3 != 0;
    if (v3)
    {
      v4 = (void *)v3;
      v20[0] = CFSTR("AUTHORTS");
      v20[1] = CFSTR("BUNDLEIDTS");
      v20[2] = CFSTR("CONTEXTNAMETS");
      v20[3] = CFSTR("PROCESSIDTS");
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ ADD Z%@ INTEGER;"),
                            objc_msgSend(v4, "tableName"),
                            *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
            v11 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), (uint64_t)v10);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }
    }

  }
  else
  {
    return 0;
  }
  return v14;
}

- (void)dropHistoryTrackingTables
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSSQLiteStatement *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    v3 = objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    if (v3)
      v4 = *(void **)(v3 + 40);
    else
      v4 = 0;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x18D76B4E4](v5);
          v11 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter", (_QWORD)v12), objc_msgSend(v9, "tableName"));
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (v6 != v8);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v6 = v5;
      }
      while (v5);
    }
    objc_autoreleasePoolPop(v2);
  }
}

- (id)hasAncillaryEntitiesInHistory
{
  id *v1;
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSQLiteStatement *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result[2], "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
    v3 = (id *)v2;
    if (v2)
    {
      v4 = (void *)objc_msgSend(*(id *)(v2 + 40), "objectForKey:", CFSTR("ENTITY"));
      v5 = (void *)objc_msgSend(v3[5], "objectForKey:", CFSTR("TRANSACTIONID"));
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT MAX(%@) FROM %@ WHERE %@ >= 16000"), objc_msgSend(v5, "columnName"), objc_msgSend(v3, "tableName"), objc_msgSend(v4, "columnName"));
    v7 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v3, v6);
    -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v1, v7);
    objc_msgSend(v1, "execute");
    v8 = -[NSSQLiteConnection newFetchedArray]((uint64_t)v1);
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "count"))
      {
        v10 = objc_msgSend(v9, "objectAtIndex:", 0);
        if (v10 == NSKeyValueCoding_NullValue)
          v11 = 0;
        else
          v11 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
        v12 = v11;
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v1, 0);

    return (id *)v12;
  }
  return result;
}

- (void)dropHistoryBeforeTransactionID:(id *)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSSQLiteStatement *v9;
  NSSQLiteStatement *v10;
  id v11;

  if (a1)
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("TRANSACTION"));
    v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)objc_msgSend(*(id *)(v5 + 40), "objectForKey:", CFSTR("TRANSACTIONID"));
    else
      v7 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE Z_PK <= %@"), objc_msgSend(v4, "tableName"), a2);
    v9 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), (uint64_t)v8);
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ <= %@"), objc_msgSend(v6, "tableName"), objc_msgSend(v7, "columnName"), a2);
    v10 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), (uint64_t)v11);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v9);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v10);

  }
}

- (void)processMigrationRequestForHash:(uint64_t)a3 stageLabel:
{
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  if (a1)
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (a3)
      v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (stage: %@)"), a3);
    else
      v8 = &stru_1E1EE23F0;
    v9 = objc_msgSend(v7, "stringWithFormat:", CFSTR("com.apple.coredata.schemamigrator: lightweight migration from model with digest { %@ }%@"), a2, v8);
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
    v12 = v11;
    if (v11)
      v13 = v10 == 0;
    else
      v13 = 0;
    if (v13)
      v14 = v11;
    else
      v14 = v10;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v16 = v15;
    if (v14)
      objc_msgSend(v15, "setValue:forKey:", v14, CFSTR("BUNDLEIDTS"));
    if (v12)
      objc_msgSend(v16, "setValue:forKey:", v12, CFSTR("PROCESSIDTS"));
    if (v9)
      objc_msgSend(v16, "setValue:forKey:", v9, CFSTR("AUTHORTS"));
    v17 = (void *)-[NSSQLiteConnection _transactionsStringAndPKsForStrings:](a1, v16);

    -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, 0, v17);
    objc_autoreleasePoolPop(v6);
  }
}

- (void)processExternalDataReferenceFilesDeletedByRequest:(uint64_t)a1
{
  void *v4;
  NSSQLColumn *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char isKindOfClass;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
    {
      if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, a2[11], 1) & 1) == 0
        || !-[NSSQLiteConnection _tableHasRows:](a1, a2[11]))
      {
        return;
      }
      v4 = (void *)a2[16];
    }
    else
    {
      if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, 0, 1) & 1) == 0)
        return;
      v9 = -[NSSQLiteConnection _tableHasRows:](a1, 0);
      v4 = 0;
      if (!v9)
        return;
    }
    -[NSSQLiteConnection prepareSQLStatement:](a1, (_QWORD *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 2), "objectAtIndexedSubscript:", 0));
    objc_msgSend((id)a1, "execute");
    v5 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("externalRef"), 16);
    v28[0] = v5;
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1));

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    while (1)
    {
      v7 = -[NSSQLiteConnection newFetchedArray](a1);
      v8 = v7;
      if (!v7)
        break;
      objc_msgSend(v6, "addObject:", objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

    }
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(_QWORD *)(a1 + 100) = 0;
    *(_QWORD *)(a1 + 92) = 0;
    *(_DWORD *)(a1 + 108) = 0;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v6);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_self();
              isKindOfClass = objc_opt_isKindOfClass();
              v17 = v11;
              if ((isKindOfClass & 1) != 0)
              {
                v18 = objc_msgSend(v15, "UUID");
                v17 = v10;
                if (!v18)
                  continue;
              }
              objc_msgSend(v17, "addObject:", v15);
            }
            v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v12);
        }
        v19 = objc_msgSend(v10, "count");
        if (a2 && v19)
          objc_setProperty_nonatomic(a2, v20, v10, 136);
        v21 = objc_msgSend(v11, "count");
        if (a2)
        {
          if (v21)
            objc_setProperty_nonatomic(a2, v22, v11, 144);
        }

      }
    }
  }
}

- (void)prepareInsertStatementForEntity:(uint64_t)a1 includeConstraints:(void *)a2 includeOnConflict:(int)a3 onConflictKeys:(void *)a4
{
  NSSQLiteStatementCache *v8;
  NSSQLiteStatementCache *v9;
  NSSQLiteStatement *batchInsertStatementCache;
  sqlite3_stmt *cachedSQLiteStatement;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  NSSQLiteStatement *v21;
  void *v22;
  NSSQLiteStatement *v23;
  _QWORD *v24;
  NSString *v25;
  NSString *sqlString;
  NSSQLiteStatement *v27;
  id v28;

  v8 = -[NSSQLiteConnection statementCacheForEntity:](a1, a2);
  v9 = v8;
  if (v8)
  {
    batchInsertStatementCache = v8->_batchInsertStatementCache;
    if (batchInsertStatementCache)
    {
      cachedSQLiteStatement = batchInsertStatementCache->_cachedSQLiteStatement;
      if (cachedSQLiteStatement)
      {
        v27 = v9->_batchInsertStatementCache;
        if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
        {
          v12 = *(unsigned __int8 *)(a1 + 42);
          v13 = -[NSSQLiteStatement sqlString](v27, "sqlString");
          if (v12)
            v20 = CFSTR("\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m");
          else
            v20 = CFSTR("%@");
          _NSCoreDataLog(6, (uint64_t)v20, v14, v15, v16, v17, v18, v19, v13);
        }
        *(_QWORD *)(a1 + 48) = v27;
        *(_QWORD *)(a1 + 80) = cachedSQLiteStatement;
        v21 = v27;
        return;
      }
    }
  }
  v22 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "adapter"), "sqlCore"), "objectIDFactoryForSQLEntity:", a2), "alloc"), "initWithPK64:", 1);
  v28 = (id)objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, a2), "initWithSQLEntity:objectID:", a2, v22);
  v23 = -[NSSQLiteAdapter newStatementWithEntity:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), (uint64_t)a2);
  v24 = -[NSSQLiteAdapter newGeneratorWithStatement:]((_QWORD *)objc_msgSend((id)a1, "adapter"), (uint64_t)v23);
  -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]((uint64_t)v24, (uint64_t)v28, 1, a3, a4);
  if (v24)
  {
    v25 = (NSString *)v24[3];
    if (v23)
      goto LABEL_12;
  }
  else
  {
    v25 = 0;
    if (v23)
    {
LABEL_12:
      sqlString = v23->_sqlString;
      if (sqlString != v25)
      {

        v23->_sqlString = (NSString *)-[NSString copy](v25, "copy");
      }
    }
  }
  -[NSSQLiteConnection prepareSQLStatement:](a1, v23);
  -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(a1 + 48), *(sqlite3_stmt **)(a1 + 80), a1);
  if ((a3 & 1) == 0)
    -[NSSQLiteStatementCache cacheBatchInsertStatement:](v9, *(_QWORD **)(a1 + 48));
  -[NSSQLiteConnection addVMCachedStatement:](a1, *(const void **)(a1 + 48));

}

- (uint64_t)insertArray:(uint64_t)a3 forEntity:(char)a4 includeOnConflict:
{
  NSObject *v8;
  uint64_t v9;
  _QWORD v11[7];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (!a1)
    return 0;
  v8 = *(NSObject **)(a1 + 8);
  if (v8)
    dispatch_assert_queue_V2(v8);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke;
  v11[3] = &unk_1E1EE00F8;
  v11[5] = a3;
  v11[6] = &v13;
  v11[4] = a1;
  v12 = a4;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v11);
  v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];
  _QWORD v3[3];
  char v4;

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  v4 = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke_2;
  v2[3] = &unk_1E1EE00D0;
  v2[4] = a2;
  v2[5] = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += -[NSSQLiteConnection insertDictionaryBlock:forEntity:includeOnConflict:](*(_QWORD *)(a1 + 32), (uint64_t)v2, *(id **)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  _Block_object_dispose(v3, 8);
}

BOOL __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(unsigned __int8 *)(v2 + 24);
  if (!*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(a2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return v3 != 0;
}

- (uint64_t)insertDictionaryBlock:(id *)a3 forEntity:(int)a4 includeOnConflict:
{
  NSObject *v4;
  char i;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t v18;
  sqlite3_int64 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSSQLiteStatementCache *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v40;
  uint64_t v43;
  char v44;
  char v46;
  void *v47;
  id v48;
  void *context;
  id obj;
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
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_assert_queue_V2(v4);
  v40 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v48, "count"));
  v43 = 0;
  for (i = 0; ; i = v46)
  {
    v44 = i;
    if ((i & 1) != 0)
      break;
    v47 = (void *)MEMORY[0x18D76B4E4]();
    objc_msgSend(v48, "removeAllObjects");
    objc_msgSend(obj, "removeAllObjects");
    v46 = (*(uint64_t (**)(uint64_t, id))(a2 + 16))(a2, v48);
    if ((v46 & 1) == 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v48);
      while (objc_msgSend(v6, "count"))
      {
        context = (void *)MEMORY[0x18D76B4E4]();
        v7 = +[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, v6);
        v8 = (void *)objc_msgSend(v6, "objectForKey:", v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v61 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
                v13 = (void *)MEMORY[0x18D76B4E4]();
                v14 = objc_msgSend(v8, "objectForKey:", v12);
                objc_msgSend(v6, "setObject:forKey:", v14, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v12));
                objc_autoreleasePoolPop(v13);
              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
            }
            while (v9);
          }
        }
        else
        {
          objc_msgSend(obj, "setObject:forKey:", v8, v7);
        }
        objc_msgSend(v6, "removeObjectForKey:", v7);
        objc_autoreleasePoolPop(context);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v15; ++k)
          {
            if (*(_QWORD *)v57 != v16)
              objc_enumerationMutation(obj);
            if ((_BYTE)dword_1ECD8DE20)
            {
              v18 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
              if (!a3 || !objc_msgSend(a3[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k)))
              {
                v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "name"), CFSTR("NSValidationErrorObject"), v18, CFSTR("NSValidationErrorKey"), 0);
                v33 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 1605, (uint64_t)CFSTR("property not found for entity"), v32);
                objc_exception_throw(v33);
              }
            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v15);
      }
      v19 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, objc_msgSend(a3, "rootEntity"), 1u);
      if (!v19)
      {
        v37 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("unable to generate primary keys for batch insert"), 0);
        objc_exception_throw(v37);
      }
      -[NSSQLiteConnection prepareInsertStatementForEntity:includeConstraints:includeOnConflict:onConflictKeys:](a1, a3, a4, (void *)objc_msgSend(obj, "allKeys"));
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v20 = (void *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v53;
        do
        {
          for (m = 0; m != v21; ++m)
          {
            if (*(_QWORD *)v53 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * m);
            if (objc_msgSend(v24, "index"))
            {
              if (objc_msgSend(v24, "index") == 2)
              {
                objc_msgSend(v24, "setUnsignedInt:", 1);
              }
              else
              {
                v25 = (void *)objc_msgSend(v24, "propertyDescription");
                v26 = v25;
                if (v25)
                {
                  v27 = (void *)objc_msgSend(obj, "objectForKey:", objc_msgSend(v25, "_qualifiedName"));
                  if (!v27 || (v28 = objc_opt_class(), v28 == objc_opt_class()))
                  {
                    if (objc_msgSend(v26, "defaultValue"))
                    {
                      if (objc_msgSend(v26, "_propertyType") == 7)
                        v29 = objc_msgSend(v26, "_buildDefaultValue");
                      else
                        v29 = objc_msgSend(v26, "defaultValue");
                      v30 = v29;
                    }
                    else
                    {
                      if ((objc_msgSend(v26, "isOptional") & 1) == 0)
                      {
                        v34 = (void *)MEMORY[0x1E0C99E08];
                        v35 = objc_msgSend(a3, "entityDescription");
                        v36 = objc_msgSend(v26, "name");
                        -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](1570, CFSTR("mandatory property not set"), v26, (uint64_t)v27, objc_msgSend(v34, "dictionaryWithObjectsAndKeys:", v35, CFSTR("NSValidationErrorObject"), v36, CFSTR("NSValidationErrorKey"), objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NSValidationErrorValue"), 0));
                      }
                      v30 = 0;
                    }
                    objc_msgSend(v24, "setValue:", v30);
                  }
                  else
                  {
                    -[NSSQLiteConnection _validateProperty:withValue:](v26, v27);
                    objc_msgSend(v24, "setValue:", v27);
                  }
                }
              }
            }
            else
            {
              objc_msgSend(v24, "setInt64:", v19);
            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        }
        while (v21);
      }
      objc_msgSend((id)a1, "execute");
      v43 += sqlite3_changes(*(sqlite3 **)(a1 + 72));
      if (!*(_QWORD *)(a1 + 80))
      {
        v31 = -[NSSQLiteConnection statementCacheForEntity:](a1, a3);
        -[NSSQLiteStatementCache cacheBatchInsertStatement:](v31, 0);
      }
      -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
      -[NSSQLiteConnection resetSQLStatement](a1);
    }
    objc_autoreleasePoolPop(v47);
  }

  objc_msgSend(v40, "drain");
  v38 = 0;
  if ((v44 & 1) == 0)
    objc_exception_rethrow();
  return v43;
}

- (void)_batchInsertThrowWithErrorCode:(int)a1 andMessage:(void *)a2 forKey:(void *)a3 andValue:(uint64_t)a4 additionalDetail:(uint64_t)a5
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = objc_msgSend(a3, "entity");
  v12 = objc_msgSend(a3, "name");
  if (!a4)
    a4 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("NSValidationErrorObject"), v12, CFSTR("NSValidationErrorKey"), a4, CFSTR("NSValidationErrorValue"), 0);
  if (objc_msgSend(a2, "length"))
    objc_msgSend(v13, "setValue:forKey:", a2, CFSTR("reason"));
  v14 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], a1, 0), "localizedDescription");
  v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "entity"), "managedObjectModel"), "_localizationPolicy");
  v16 = objc_msgSend(v15, "localizedEntityNameForEntity:", objc_msgSend(a3, "entity"));
  v17 = objc_msgSend(v15, "localizedPropertyNameForProperty:", a3);
  if (v16 | v17)
  {
    v18 = v17;
    v19 = (void *)objc_msgSend(v14, "mutableCopyWithZone:", 0);
    v20 = v19;
    if (v16)
      objc_msgSend(v19, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{ENTITY}@"), v16, 2, 0, objc_msgSend(v19, "length"));
    if (v18)
      objc_msgSend(v20, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{PROPERTY}@"), v18, 2, 0, objc_msgSend(v20, "length"));
    v21 = v20;
    objc_msgSend(v13, "setObject:forKey:", v20, *MEMORY[0x1E0CB2D50]);
  }
  objc_msgSend(v13, "addEntriesFromDictionary:", a5);
  v22 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], a1, (uint64_t)a2, v13);
  objc_exception_throw(v22);
}

- (uint64_t)_validateProperty:(void *)a1 withValue:(void *)a2
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;

  v34 = a2;
  if (objc_msgSend(a1, "_propertyType") != 2)
  {
    v26 = objc_msgSend(a1, "_propertyType");
    v27 = (void *)MEMORY[0x1E0CB3940];
    if (v26 != 6)
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = (void *)objc_msgSend(v27, "stringWithFormat:", CFSTR("Property (%@) is not supported with NSBatchInsertRequest"), NSStringFromClass(v30));
      -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](3328, v31, a1, (uint64_t)a2, 0);
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set value for derived attribute: property = \"%@\"; entity = \"%@\"; value = %@"),
                   objc_msgSend(a1, "name"),
                   objc_msgSend((id)objc_msgSend(a1, "entity"), "name"),
                   a2,
                   v32);
    goto LABEL_58;
  }
  v4 = objc_msgSend(a1, "attributeType");
  if (v4 > 599)
  {
    if (v4 <= 799)
    {
      if (v4 != 600)
      {
        if (v4 == 700 && (objc_msgSend(a2, "isNSString") & 1) != 0)
          goto LABEL_33;
        goto LABEL_21;
      }
    }
    else if (v4 != 800)
    {
      if (v4 == 900)
      {
        if ((objc_msgSend(a2, "isNSDate") & 1) != 0)
          goto LABEL_33;
      }
      else if (v4 == 1000)
      {
        if (objc_msgSend(a1, "isFileBackedFuture"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_33;
        }
        else if ((objc_msgSend(a2, "isNSData") & 1) != 0)
        {
          goto LABEL_33;
        }
      }
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v4 > 299)
  {
    if (v4 != 300 && v4 != 500)
      goto LABEL_21;
LABEL_20:
    if ((objc_msgSend(a2, "isNSNumber") & 1) != 0)
      goto LABEL_33;
    goto LABEL_21;
  }
  if (v4 == 100 || v4 == 200)
    goto LABEL_20;
LABEL_21:
  if (objc_msgSend(a1, "isFileBackedFuture"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unacceptable type of value for attribute: property = \"%@\"; desired type = %@; given type = %@; value = %@."),
                   objc_msgSend(a1, "name"),
                   CFSTR("A class implementing the NSFileBackedFuture protocol"),
                   objc_opt_class(),
                   a2);
    goto LABEL_58;
  }
  v5 = objc_msgSend(a1, "_attributeValueClass");
  if (v5)
  {
    v6 = (void *)v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_33;
    if (objc_msgSend(a2, "isNSNumber")
      && objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
    {
      v34 = (void *)objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", objc_msgSend(a2, "stringValue"));
      goto LABEL_33;
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unacceptable type of value for attribute: property = \"%@\"; desired type = %@; given type = %@; value = %@."),
                   objc_msgSend(a1, "name"),
                   objc_msgSend(a1, "attributeValueClassName"),
                   objc_opt_class(),
                   a2);
LABEL_58:
    -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](1550, v7, a1, (uint64_t)a2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(a1, "name"), CFSTR("key"), a2, CFSTR("value"), 0));
  }
  if ((objc_msgSend(a1, "isTransient") & 1) == 0 && objc_msgSend(a1, "attributeType") != 1800)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set value for attribute with undefined type: property = \"%@\"; entity = \"%@\"; value = %@"),
                   objc_msgSend(a1, "name"),
                   objc_msgSend(a1, "entity"),
                   a2,
                   v32);
    goto LABEL_58;
  }
LABEL_33:
  v33 = 0;
  if ((objc_msgSend(a1, "_nonPredicateValidateValue:forKey:inObject:error:", &v34, objc_msgSend(a1, "name"), 0, &v33) & 1) == 0)
  {
    v28 = objc_msgSend(v33, "code");
    v29 = (void *)objc_msgSend(v33, "localizedDescription");
    -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](v28, v29, a1, (uint64_t)v34, objc_msgSend(v33, "userInfo"));
  }
  v8 = (void *)objc_msgSend(a1, "_rawValidationPredicates");
  v9 = (void *)objc_msgSend(a1, "_rawValidationWarnings");
  result = objc_msgSend(v8, "count");
  if (result)
  {
    v11 = result;
    for (i = 0; v11 != i; ++i)
    {
      v13 = (void *)objc_msgSend(v8, "objectAtIndex:", i);
      result = objc_msgSend(v13, "evaluateWithObject:", v34);
      if ((result & 1) == 0)
      {
        v14 = (void *)objc_msgSend(v9, "objectAtIndex:", i);
        v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(v8, "objectAtIndex:", i), CFSTR("NSValidationErrorPredicate"), 0);
        if (!v14)
        {
          v16 = (uint64_t)v34;
          v17 = 1550;
          goto LABEL_49;
        }
        if (objc_msgSend(v14, "isNSString"))
        {
          v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entity"), "managedObjectModel"), "_localizationPolicy"), "localizedModelStringForKey:", v14);
          if (v18)
            v19 = (void *)v18;
          else
            v19 = v14;
          v16 = (uint64_t)v34;
          v17 = 1550;
          goto LABEL_50;
        }
        if (objc_msgSend(v14, "isNSNumber"))
        {
          v17 = objc_msgSend(v14, "intValue");
          v16 = (uint64_t)v34;
LABEL_49:
          v19 = 0;
LABEL_50:
          -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](v17, v19, a1, v16, v15);
        }
        objc_opt_class();
        result = objc_opt_isKindOfClass();
        if ((result & 1) == 0)
        {
          v20 = objc_msgSend(v14, "intValue");
          v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Illegal validation warning: property = \"%@\"; predicate/warning index = %lu; warning = %@."),
                          objc_msgSend(a1, "name"),
                          i,
                          v14);
          v22 = (uint64_t)v34;
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = objc_msgSend(a1, "name");
          v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", i);
          -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](v20, v21, a1, v22, objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, CFSTR("NSValidationErrorKey"), v25, CFSTR("index"), v14, CFSTR("warning"), v34, CFSTR("NSValidationErrorValue"), 0));
        }
      }
    }
  }
  return result;
}

- (uint64_t)insertManagedObjectBlock:(void *)a3 forEntity:(int)a4 includeOnConflict:
{
  NSObject *v5;
  NSManagedObject *v6;
  NSKnownKeysDictionary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSQLiteStatementCache *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v29;
  void *v30;
  uint64_t v33;
  NSManagedObject *v35;
  sqlite3_int64 v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = *(NSObject **)(a1 + 8);
  if (v5)
    dispatch_assert_queue_V2(v5);
  v29 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v33 = 0;
  v30 = a3;
  while (1)
  {
    v6 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([NSManagedObject alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend(a3, "entityDescription"), 0);
    v35 = v6;
    v7 = v6
       ? -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](v6, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1): 0;
    -[NSManagedObject _setOriginalSnapshot__:](v35, v7);

    if (((*(uint64_t (**)(uint64_t, NSManagedObject *))(a2 + 16))(a2, v35) & 1) != 0)
      break;
    v36 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, objc_msgSend(a3, "rootEntity"), 1u);
    if (!v36)
    {
      v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("unable to generate primary keys for batch insert"), 0);
      objc_exception_throw(v26);
    }
    -[NSSQLiteConnection prepareInsertStatementForEntity:includeConstraints:includeOnConflict:onConflictKeys:](a1, a3, a4, -[NSDictionary allKeys](-[NSManagedObject changedValues](v35, "changedValues"), "allKeys"));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = (void *)objc_msgSend(*(id *)(a1 + 48), "bindVariables");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v39;
      obj = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (objc_msgSend(v12, "index"))
          {
            if (objc_msgSend(v12, "index") == 2)
            {
              objc_msgSend(v12, "setUnsignedInt:", 1);
            }
            else
            {
              v13 = (void *)objc_msgSend(v12, "propertyDescription");
              v14 = v13;
              if (v13)
              {
                v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "_qualifiedName"), "componentsSeparatedByString:", CFSTR(".")), "mutableCopy");
                v16 = -[NSManagedObject valueForKey:](v35, "valueForKey:", objc_msgSend(v15, "firstObject"));
                objc_msgSend(v15, "removeObjectAtIndex:", 0);
                for (j = 0; j < objc_msgSend(v15, "count"); ++j)
                {
                  v18 = objc_msgSend(v15, "objectAtIndex:", j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v16 = (id)objc_msgSend(v16, "objectForKey:", v18);
                }

                if (!v16 || (v19 = objc_opt_class(), v19 == objc_opt_class()))
                {
                  if (objc_msgSend(v14, "defaultValue"))
                  {
                    if (objc_msgSend(v14, "_propertyType") == 7)
                      v20 = objc_msgSend(v14, "_buildDefaultValue");
                    else
                      v20 = objc_msgSend(v14, "defaultValue");
                    v21 = v20;
                  }
                  else
                  {
                    if ((objc_msgSend(v14, "isOptional") & 1) == 0)
                    {
                      v23 = (void *)MEMORY[0x1E0C99E08];
                      v24 = objc_msgSend(v30, "entityDescription");
                      v25 = objc_msgSend(v14, "name");
                      -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](1570, CFSTR("mandatory property not set"), v14, (uint64_t)v16, objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, CFSTR("NSValidationErrorObject"), v25, CFSTR("NSValidationErrorKey"), objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NSValidationErrorValue"), 0));
                    }
                    v21 = 0;
                  }
                  objc_msgSend(v12, "setValue:", v21);
                }
                else
                {
                  -[NSSQLiteConnection _validateProperty:withValue:](v14, v16);
                  objc_msgSend(v12, "setValue:", v16);
                }
              }
            }
          }
          else
          {
            objc_msgSend(v12, "setInt64:", v36);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v9);
    }
    objc_msgSend((id)a1, "execute");
    a3 = v30;
    v33 += sqlite3_changes(*(sqlite3 **)(a1 + 72));
    if (!*(_QWORD *)(a1 + 80))
    {
      v22 = -[NSSQLiteConnection statementCacheForEntity:](a1, v30);
      -[NSSQLiteStatementCache cacheBatchInsertStatement:](v22, 0);
    }
    -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
    -[NSSQLiteConnection resetSQLStatement](a1);

  }
  objc_msgSend(v29, "drain");
  v27 = 0;
  return v33;
}

- (uint64_t)gatherObjectIDsFromTable:(uint64_t)a1
{
  NSSQLiteStatement *v4;
  NSSQLColumn *v5;
  NSSQLColumn *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSSQLiteStatement *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!-[NSSQLiteConnection _tableHasRows:](a1, a2))
    return MEMORY[0x1E0C9AA60];
  v4 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT DISTINCT ENTITYID, PRIMEKEY FROM %@"), a2));
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = v4;
  v5 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("ENTITYID"), 2);
  objc_msgSend(v22, "addObject:", v5);

  v6 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("PRIMEKEY"), 2);
  objc_msgSend(v22, "addObject:", v6);

  -[NSSQLiteConnection prepareSQLStatement:](a1, v4);
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v22);
  objc_msgSend((id)a1, "execute");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (1)
  {
    v8 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v8)
      break;
    v9 = v8;
    if (objc_msgSend(v8, "count") == 2)
    {
      v10 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
      v11 = (void *)objc_msgSend(v9, "objectAtIndex:", 1);
      if ((unint64_t)objc_msgSend(v10, "unsignedLongValue") >> 7 < 0x7D)
      {
        v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", objc_msgSend(v10, "unsignedLongValue"));
      }
      else
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "allValues");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v24;
LABEL_9:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v12);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "entityForID:", objc_msgSend(v10, "unsignedLongValue"));
            if (v16)
              break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
              v16 = 0;
              if (v13)
                goto LABEL_9;
              break;
            }
          }
        }
        else
        {
          v16 = 0;
        }
      }
      v17 = (void *)objc_msgSend(*(id *)(a1 + 16), "newObjectIDForEntity:pk:", v16, objc_msgSend(v11, "unsignedLongLongValue"));
      objc_msgSend(v7, "addObject:", v17);

    }
  }
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);

  v18 = v19;
  -[NSSQLiteConnection releaseSQLStatement](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(_QWORD *)(a1 + 100) = 0;
  *(_QWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;

  return v18;
}

- (uint64_t)_int64ResultForSQL:(uint64_t)a1
{
  const __CFArray *v2;
  const __CFArray *v3;
  uint64_t v4;

  v2 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, a2);
  if (!v2)
    return 0;
  v3 = v2;
  if (CFArrayGetCount(v2) && *(_QWORD *)CFArrayGetValueAtIndex(v3, 0))
    v4 = *(_QWORD *)CFArrayGetValueAtIndex(v3, 1);
  else
    v4 = 0;
  CFRelease(v3);
  return v4;
}

- (uint64_t)percentageUsedByPersistentHistory
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = -[NSSQLiteConnection _int64ResultForSQL:](result, CFSTR("PRAGMA page_count"));
    v3 = -[NSSQLiteConnection _int64ResultForSQL:](v1, CFSTR("PRAGMA freelist_count"));
    v4 = v2 - v3;
    if (v2 - v3 < 1)
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Percentage History calculation error. Total Pages - %lld  Free Pages - %lld");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, v2);
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        v40 = v2;
        v41 = 2048;
        v42 = v3;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Percentage History calculation error. Total Pages - %lld  Free Pages - %lld", buf, 0x16u);
      }
      return 0;
    }
    else
    {
      v5 = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
      if (v5)
        v5 = (_QWORD *)v5[5];
      v6 = (void *)objc_msgSend(v5, "valueForKey:", CFSTR("tableName"));
      v7 = objc_msgSend(v6, "count");
      v8 = 0x1E0CB3000uLL;
      if (v7)
      {
        v33 = v2 - v3;
        v34 = v2;
        v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v36;
          v13 = 1;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v36 != v12)
                objc_enumerationMutation(v6);
              v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
              if ((v13 & 1) == 0)
                objc_msgSend(v9, "appendString:", CFSTR(" , "));
              objc_msgSend(v9, "appendFormat:", CFSTR("'%@'"), v15);
              v13 = 0;
            }
            v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
            v13 = 0;
          }
          while (v11);
        }
        objc_msgSend(v9, "appendString:", CFSTR(")"));
        v2 = v34;
        v4 = v33;
        v8 = 0x1E0CB3000;
      }
      else
      {
        v9 = 0;
      }
      v24 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 1952)), "initWithFormat:", CFSTR("SELECT sum(pageno) FROM dbstat d, sqlite_master m WHERE d.name = m.name AND d.aggregate = TRUE"));
      v25 = v24;
      if (v9)
        objc_msgSend(v24, "appendFormat:", CFSTR(" AND m.tbl_name IN %@"), v9);
      v26 = -[NSSQLiteConnection _int64ResultForSQL:](v1, v25);

      _NSCoreDataLog(4, (uint64_t)CFSTR("Percentage History: total pages - %lld, free pages - %lld, historyPages - %lld"), v27, v28, v29, v30, v31, v32, v2);
      return 100 * v26 / v4;
    }
  }
  return result;
}

- (BOOL)registerMigrationUpdateFunctionWithMigrator:(uint64_t)a1
{
  NSObject *v4;

  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
      dispatch_assert_queue_V2(v4);
    if (NSSQLiteRegisterMigrationFunctions(*(sqlite3 **)(a1 + 72), pApp))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("An internal error occurred while configuring migration functions in the SQLite database."), 0));
  }
  return a1 != 0;
}

- (void)executeMulticolumnUniquenessCheckSQLStatement:(void *)a3 returningColumns:
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
  objc_msgSend((id)a1, "execute");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v11 && *(_BYTE *)(v11 + 24) == 7)
        {
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          if (*(_QWORD *)(v11 + 72))
            objc_msgSend(v7, "addObject:");
        }
        else
        {
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v7);
  while (1)
  {
    v12 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v12)
      break;
    objc_msgSend(v6, "addObject:", v12);

  }
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(_QWORD *)(a1 + 100) = 0;
  *(_QWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection _finalizeStatement](a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  return v6;
}

- (void)reopenQueryGenerationWithIdentifier:(_QWORD *)a3 error:
{
  NSObject *v6;
  int v7;
  sqlite3_snapshot *v8;
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
  void *v25;
  uint64_t v26;

  if (!a1)
    return 0;
  v6 = *(NSObject **)(a1 + 8);
  if (v6)
    dispatch_assert_queue_V2(v6);
  if (!a2)
    return a2;
  if (!*(_QWORD *)(a1 + 72))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("database connection must not be nil here"), 0));
  v7 = *(unsigned __int8 *)(a1 + 40);
  v8 = (sqlite3_snapshot *)objc_msgSend(a2, "bytes");
  if (!v8)
    return 0;
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
    NSLog((NSString *)CFSTR("connection %p attempting to reopen snapshot: %p"), a1, v8);
  if (!v7)
    -[NSSQLiteConnection beginReadTransaction](a1);
  if ((*(_BYTE *)(a1 + 313) & 2) == 0)
  {
    v9 = sqlite3_snapshot_recover(*(sqlite3 **)(a1 + 72), "main");
    if ((_DWORD)v9 && readFileSizeFromJournalHandle(*(sqlite3 **)(a1 + 72)) >= 1)
      _NSCoreDataLog(1, (uint64_t)CFSTR("sqlite3_snapshot_recover failed with %d"), v10, v11, v12, v13, v14, v15, v9);
    else
      *(_DWORD *)(a1 + 312) |= 0x200u;
  }
  while (1)
  {
    v16 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v8);
    v23 = v16;
    if ((_DWORD)v16 == 517 || v16 == 0)
      break;
    if (v16 != 5)
      goto LABEL_24;
    usleep(0x64u);
  }
  if ((_BYTE)v16)
  {
LABEL_24:
    _NSCoreDataLog(1, (uint64_t)CFSTR("Attempt to reopen sqlite3_snapshot_open failed %d"), v17, v18, v19, v20, v21, v22, v16);
    if (a3)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23), CFSTR("NSSQLiteErrorDomain"), 0);
      a2 = 0;
      *a3 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134180, v26);
      if (v7)
        return a2;
    }
    else
    {
      a2 = 0;
      if (v7)
        return a2;
    }
    goto LABEL_32;
  }
  if ((int)-[NSSQLCore _registerNewQueryGenerationSnapshot:](*(_QWORD *)(a1 + 16), (uint64_t)a2) < 0)
    a2 = 0;
  if (!v7)
LABEL_32:
    -[NSSQLiteConnection rollbackTransaction](a1);
  return a2;
}

- (id)_activeGenerations
{
  void *v1;
  id v2;
  _QWORD v3[5];

  if (result)
  {
    v1 = (void *)objc_msgSend(result[41], "copy");
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __40__NSSQLiteConnection__activeGenerations__block_invoke;
    v3[3] = &unk_1E1EE0148;
    v3[4] = v2;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);

    return (id *)v2;
  }
  return result;
}

uint64_t __40__NSSQLiteConnection__activeGenerations__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (uint64_t)_dropAllTriggers
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = -[NSSQLiteConnection fetchCreationSQLForType:containing:](result, (uint64_t)CFSTR("trigger"), 0);
    result = objc_msgSend(v2, "count");
    if (result)
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v9;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v9 != v4)
              objc_enumerationMutation(v2);
            v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
            if (objc_msgSend(v6, "count") == 2)
            {
              v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "lastObject"), "componentsSeparatedByString:", CFSTR(" "));
              if ((unint64_t)objc_msgSend(v7, "count") >= 4)
              {
                if (objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 2), "hasPrefix:", CFSTR("Z")))-[NSSQLiteConnection _executeSQLString:](v1, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER %@"), objc_msgSend(v7, "objectAtIndexedSubscript:", 2)));
              }
            }
            ++v5;
          }
          while (v3 != v5);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v3 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_dropAllDATriggers
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = -[NSSQLiteConnection fetchCreationSQLForType:containing:](result, (uint64_t)CFSTR("trigger"), 0);
    result = objc_msgSend(v2, "count");
    if (result)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v10;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v10 != v4)
              objc_enumerationMutation(v2);
            v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
            if (objc_msgSend(v6, "count") == 2)
            {
              v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "lastObject"), "componentsSeparatedByString:", CFSTR(" "));
              if ((unint64_t)objc_msgSend(v7, "count") >= 4)
              {
                v8 = (void *)objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
                if ((objc_msgSend(v8, "hasPrefix:", CFSTR("Z_DA_")) & 1) != 0
                  || objc_msgSend(v8, "hasPrefix:", CFSTR("Z"))
                  && (objc_msgSend(v8, "hasPrefix:", CFSTR("Z_RT_")) & 1) == 0
                  && (objc_msgSend(v8, "hasPrefix:", CFSTR("ZT_")) & 1) == 0
                  && ((objc_msgSend(v8, "hasSuffix:", CFSTR("INSERT")) & 1) != 0
                   || (objc_msgSend(v8, "hasSuffix:", CFSTR("UPDATE")) & 1) != 0
                   || (objc_msgSend(v8, "hasSuffix:", CFSTR("DELETE")) & 1) != 0
                   || (objc_msgSend(v8, "hasSuffix:", CFSTR("SET")) & 1) != 0
                   || objc_msgSend(v8, "hasSuffix:", CFSTR("UNSET"))))
                {
                  -[NSSQLiteConnection _executeSQLString:](v1, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER %@"), v8));
                }
              }
            }
            ++v5;
          }
          while (v3 != v5);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          v3 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)triggerUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:columnName:newValue:
{
  uint64_t v6;
  id v7;

  if (a1)
  {
    v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v6)
    {
      v7 = (id)objc_msgSend(*(id *)(a1 + 16), "newObjectIDForEntity:pk:", v6, a4);
      objc_msgSend(*(id *)(a1 + 168), "addObject:", v7);

    }
  }
}

- (void)derivedAttributeUpdatedInsertedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:
{
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v10)
    {
      v11 = (void *)objc_msgSend(*(id *)(a1 + 16), "newObjectIDForEntity:pk:", v10, a4);
      v12 = *(void **)(a1 + 176);
      v13[0] = v11;
      v13[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a5);
      if (!a6)
        a6 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13[2] = a6;
      objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3));

    }
  }
}

- (void)derivedAttributeUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:
{
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v10)
    {
      v11 = (void *)objc_msgSend(*(id *)(a1 + 16), "newObjectIDForEntity:pk:", v10, a4);
      v12 = *(void **)(a1 + 184);
      v13[0] = v11;
      v13[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a5);
      if (!a6)
        a6 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13[2] = a6;
      objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3));

    }
  }
}

- (id)createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:(id *)a3 metadataEntity:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSQLiteStatement *v13;
  id v14;
  NSSQLColumn *v15;
  NSSQLColumn *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSSQLiteConnection connect](a1);
  if (a2)
  {
    v6 = (void *)a2[16];
    v7 = (void *)a2[17];
    if (a3)
      goto LABEL_4;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    if (a3)
    {
LABEL_4:
      v8 = (void *)objc_msgSend(a3[5], "objectForKey:", CFSTR("entityPK"));
      v9 = (void *)objc_msgSend(a3[5], "objectForKey:", CFSTR("entityId"));
      if (!v6)
        goto LABEL_22;
      goto LABEL_5;
    }
  }
  v8 = 0;
  v9 = 0;
  if (!v6)
    goto LABEL_22;
LABEL_5:
  if (!v7 || !v8 || !v9)
LABEL_22:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Missing one or more columns to query record metadata for missing rows"), 0));
  v31 = objc_msgSend((id)objc_msgSend(a2, "tableName"), "stringByAppendingFormat:", CFSTR(".%@"), objc_msgSend(v6, "columnName"));
  v30 = objc_msgSend((id)objc_msgSend(a2, "tableName"), "stringByAppendingFormat:", CFSTR(".%@"), objc_msgSend(v7, "columnName"));
  v10 = objc_msgSend((id)objc_msgSend(a3, "tableName"), "stringByAppendingFormat:", CFSTR(".%@"), objc_msgSend(v8, "columnName"));
  v11 = objc_msgSend((id)objc_msgSend(a3, "tableName"), "stringByAppendingFormat:", CFSTR(".%@"), objc_msgSend(v9, "columnName"));
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ LEFT JOIN %@ ON %@ = %@ AND %@ = %@"), v31, v30, v10, v11, objc_msgSend(a2, "tableName"), objc_msgSend(a3, "tableName"), v31, v10, v30, v11);
  v13 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend((id)a1, "adapter"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@, %@ FROM (%@) WHERE %@ IS NULL AND %@ IS NULL"), objc_msgSend(v6, "columnName"), objc_msgSend(v7, "columnName"), v12, objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName")));
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", v31, 2);
  objc_msgSend(v14, "addObject:", v15);

  v16 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", v30, 2);
  objc_msgSend(v14, "addObject:", v16);

  -[NSSQLiteConnection _ensureDatabaseOpen]((_QWORD *)a1);
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
  -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
  -[NSSQLiteConnection beginReadTransaction](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, v14);
  -[NSSQLiteConnection prepareSQLStatement:](a1, v13);
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 4)
    -[NSSQLiteConnection logQueryPlanForStatement:](a1, v13);
  objc_msgSend((id)a1, "execute");
  while (1)
  {
    v17 = -[NSSQLiteConnection newFetchedArray](a1);
    v18 = v17;
    if (!v17)
      break;
    if (objc_msgSend(v17, "count") == 2)
    {
      v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v20 = objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v35[0] = v19;
      v35[1] = v20;
      objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2));
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Missing metadata query got an unexpected number of columns in the result: %@");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)v18);
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v18;
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Missing metadata query got an unexpected number of columns in the result: %@", buf, 0xCu);
      }
    }

  }
  -[NSSQLiteConnection releaseSQLStatement](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(_QWORD *)(a1 + 100) = 0;
  *(_QWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection rollbackTransaction](a1);

  return v32;
}

- (uint64_t)dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[6];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (a2)
    {
      if (objc_msgSend(*(id *)(a2 + 208), "count"))
      {
LABEL_8:
        v13 = *(void **)(a2 + 216);
LABEL_9:
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity___block_invoke;
        v15[3] = &unk_1E1EDD320;
        v15[4] = v3;
        v15[5] = a2;
        return objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);
      }
      v4 = *(void **)(a2 + 216);
    }
    else
    {
      v14 = objc_msgSend(0, "count");
      v4 = 0;
      v13 = 0;
      if (v14)
        goto LABEL_9;
    }
    if (!objc_msgSend(v4, "count")
      && (v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Entity marked as needing unique constraint coalescing but does not appear to be uniqued: %@"), _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a2), v12 = __pflogFaultLog, os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a2;
      _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Entity marked as needing unique constraint coalescing but does not appear to be uniqued: %@", buf, 0xCu);
      if (a2)
        goto LABEL_8;
    }
    else if (a2)
    {
      goto LABEL_8;
    }
    v13 = 0;
    goto LABEL_9;
  }
  return result;
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSQLiteStatement *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[7];
  _QWORD v19[9];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = *(id **)(a1 + 40);
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v4)
      v5 = v4[16];
    else
      v5 = 0;
    objc_msgSend(v17, "addObject:", v5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT %@, "), objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", 0), "columnName"));
    v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
    if (v4)
    {
      v8 = objc_msgSend(v4[16], "columnName");
      v9 = objc_msgSend(v4[16], "columnName");
      v10 = v4[16];
    }
    else
    {
      v8 = objc_msgSend(0, "columnName");
      v9 = objc_msgSend(0, "columnName");
      v10 = 0;
    }
    v11 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("SELECT COUNT(DISTINCT(%@)) AS COUNT, MIN(%@) AS %@, "), v8, v9, objc_msgSend(v10, "columnName"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("GROUP BY "));
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke;
    v19[3] = &unk_1E1EE0170;
    v19[4] = v17;
    v19[5] = v11;
    v19[6] = v12;
    v19[7] = v6;
    objc_msgSend(a2, "enumerateObjectsUsingBlock:", v19);
    objc_msgSend(v11, "appendFormat:", CFSTR(" FROM %@ %@ ORDER BY COUNT DESC"), objc_msgSend(v4, "tableName"), v12);
    objc_msgSend(v6, "appendFormat:", CFSTR(" FROM (%@) WHERE COUNT > 1;"), v11);
    v14 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v4, v6);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSSQLiteConnection prepareSQLStatement:](v2, v14);
    objc_msgSend((id)v2, "execute");
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v2, v17);
    while (1)
    {
      v16 = -[NSSQLiteConnection newFetchedArray](v2);
      if (!v16)
        break;
      objc_msgSend(v15, "addObject:", v16);

    }
    -[NSSQLiteConnection setColumnsToFetch:]((_QWORD *)v2, 0);
    *(_DWORD *)(v2 + 312) &= ~2u;
    *(_QWORD *)(v2 + 100) = 0;
    *(_QWORD *)(v2 + 92) = 0;
    *(_DWORD *)(v2 + 108) = 0;
    -[NSSQLiteConnection _finalizeStatement](v2);
    -[NSSQLiteConnection resetSQLStatement](v2);

    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_2;
    v18[3] = &unk_1E1EE0198;
    v18[4] = v4;
    v18[5] = v17;
    v18[6] = v2;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

  }
}

uint64_t __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke(id *a1, void *a2, uint64_t a3)
{
  objc_msgSend(a1[4], "addObject:", a2);
  if (a3)
  {
    objc_msgSend(a1[5], "appendString:", CFSTR(", "));
    objc_msgSend(a1[6], "appendString:", CFSTR(", "));
    objc_msgSend(a1[7], "appendString:", CFSTR(", "));
  }
  objc_msgSend(a1[5], "appendString:", objc_msgSend(a2, "columnName"));
  objc_msgSend(a1[6], "appendString:", objc_msgSend(a2, "columnName"));
  return objc_msgSend(a1[7], "appendString:", objc_msgSend(a2, "columnName"));
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_2(uint64_t a1, void *a2)
{
  NSSQLiteStatement *v4;
  id v5;
  _QWORD v6[6];

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE "), objc_msgSend(*(id *)(a1 + 32), "tableName"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_3;
  v6[3] = &unk_1E1EDD320;
  v6[4] = *(_QWORD *)(a1 + 40);
  v6[5] = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);
  v4 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", *(_QWORD *)(a1 + 32), v5);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(a1 + 48), v4);

}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  if (a3)
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(" AND "));
  if (objc_msgSend(a2, "isNSString"))
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@ = '%@'"), objc_msgSend(v6, "columnName"), a2);
  }
  else if (objc_msgSend(a2, "isNSNumber"))
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@ = %@"), objc_msgSend(v6, "columnName"), a2);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CloudKit: Deduping for metadata entity doesn't know how to handle this type of object yet: %@ - %@");
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = a2;
      _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: CloudKit: Deduping for metadata entity doesn't know how to handle this type of object yet: %@ - %@", buf, 0x16u);
    }
  }
}

@end
