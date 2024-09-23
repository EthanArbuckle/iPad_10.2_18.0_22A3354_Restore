@implementation BSSqlitePreparedSimpleStatement

void __79___BSSqlitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  id v11;
  sqlite3_stmt *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  uint64_t v21;
  sqlite3_uint64 v22;
  NSObject *v23;
  sqlite3_stmt *v24;
  double v25;
  void *v26;
  id v27;
  uint64_t v28;
  int v29;
  void *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  _BYTE v46[24];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 16));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(a1 + 40);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v3)
    {
      v38 = *(_QWORD *)v40;
      v35 = 136315650;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v40 != v38)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
          v6 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5, v35);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v5;
          v9 = v7;
          if (v6)
          {
            v10 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)(v6 + 16), (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
            if (!v10)
              goto LABEL_33;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v10 = sqlite3_bind_null(*(sqlite3_stmt **)(v6 + 16), v10);
              goto LABEL_33;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = v9;
              v12 = *(sqlite3_stmt **)(v6 + 16);
              v13 = objc_retainAutorelease(v11);
              v14 = sqlite3_bind_text(v12, v10, (const char *)-[NSObject UTF8String](v13, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              goto LABEL_13;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = objc_retainAutorelease(v9);
              v15 = (const char *)-[NSObject objCType](v13, "objCType");
              if (strlen(v15) == 1)
              {
                v16 = *v15 - 66;
                if (v16 <= 0x31)
                {
                  if (((1 << v16) & 0x2848200028483) != 0)
                  {
                    v14 = sqlite3_bind_int64(*(sqlite3_stmt **)(v6 + 16), v10, -[NSObject longLongValue](v13, "longLongValue"));
                    goto LABEL_13;
                  }
                  if (((1 << v16) & 0x1400000000) != 0)
                  {
                    v24 = *(sqlite3_stmt **)(v6 + 16);
                    -[NSObject doubleValue](v13, "doubleValue");
                    v14 = sqlite3_bind_double(v24, v10, v25);
                    goto LABEL_13;
                  }
                }
                BSLogCommon();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
LABEL_39:
                  *(_DWORD *)buf = v35;
                  v44 = "-[_BSSqlitePreparedSimpleStatement _bindParameterIndex:numberValue:]";
                  v45 = 2082;
                  *(_QWORD *)v46 = v15;
                  *(_WORD *)&v46[8] = 2112;
                  *(_QWORD *)&v46[10] = v13;
                  _os_log_error_impl(&dword_18A184000, v23, OS_LOG_TYPE_ERROR, "%s: unexpected value type '%{public}s' for object %@", buf, 0x20u);
                }
              }
              else
              {
                BSLogCommon();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  goto LABEL_39;
              }

LABEL_31:
              v10 = 20;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                BSLogCommon();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  v26 = (void *)objc_opt_class();
                  *(_DWORD *)buf = v35;
                  v44 = "-[_BSSqlitePreparedSimpleStatement _bindKey:value:]";
                  v45 = 2112;
                  *(_QWORD *)v46 = v9;
                  *(_WORD *)&v46[8] = 2112;
                  *(_QWORD *)&v46[10] = v26;
                  v27 = v26;
                  _os_log_error_impl(&dword_18A184000, v13, OS_LOG_TYPE_ERROR, "%s: unexpected object %@ of class %@", buf, 0x20u);

                }
                goto LABEL_31;
              }
              v13 = objc_retainAutorelease(v9);
              v17 = -[NSObject bytes](v13, "bytes");
              v18 = -[NSObject length](v13, "length");
              v19 = v13 != 0;
              v20 = v17 == 0;
              if (v19 && v20)
                v21 = 3735936685;
              else
                v21 = v17;
              if (v19 && v20)
                v22 = 0;
              else
                v22 = v18;
              v14 = sqlite3_bind_blob64(*(sqlite3_stmt **)(v6 + 16), v10, (const void *)v21, v22, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_13:
              v10 = v14;
            }

            goto LABEL_33;
          }
          v10 = 0;
LABEL_33:

          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
          if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
            goto LABEL_42;
          ++v4;
        }
        while (v3 != v4);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        v3 = v28;
      }
      while (v28);
    }
LABEL_42:

    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      do
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 16));
        v29 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (v29 == 100)
        {
          if (*(_QWORD *)(a1 + 48))
          {
            +[BSSqliteResultRow resultRowWithStatement:]((uint64_t)BSSqliteResultRow, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            objc_msgSend(v30, "invalidate");

            v29 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          }
          else
          {
            v29 = 100;
          }
        }
      }
      while (v29 == 100);
      if (v29 != 101)
      {
        v31 = sqlite3_extended_errcode(a2);
        BSLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = sqlite3_errstr(v31);
          v34 = sqlite3_sql(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 16));
          *(_DWORD *)buf = 136315906;
          v44 = "-[_BSSqlitePreparedSimpleStatement executeWithBindings:resultRowHandler:error:]_block_invoke";
          v45 = 1024;
          *(_DWORD *)v46 = v31;
          *(_WORD *)&v46[4] = 2080;
          *(_QWORD *)&v46[6] = v33;
          *(_WORD *)&v46[14] = 2080;
          *(_QWORD *)&v46[16] = v34;
          _os_log_error_impl(&dword_18A184000, v32, OS_LOG_TYPE_ERROR, "%s: received extended error %d (%s) executing statement '%s'", buf, 0x26u);
        }

      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 16));
    }
  }
}

uint64_t __43___BSSqlitePreparedSimpleStatement_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

@end
