void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC1CA8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  (*(void (**)(void))(a4 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1CC894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ct_sqlite_rpi_buffer_init(sqlite3 *a1)
{
  return sqlite3_create_module(a1, "ct_sqlite_rpi_buffer", &ct_sqlite_rpi_buffer_module, 0);
}

uint64_t ct_sqlite_rpi_buffer_connect(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  _QWORD *v7;
  _QWORD *v8;

  result = sqlite3_declare_vtab(a1, "CREATE TABLE x(rpi, rpi_pointer hidden, validity_pointer hidden, buffer_count hidden, valid_count hidden, daily_tracing_key_index, rpi_index)");
  if (!(_DWORD)result)
  {
    v7 = sqlite3_malloc(24);
    if (v7)
    {
      v8 = v7;
      result = 0;
      *v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      *a5 = v8;
    }
    else
    {
      return 7;
    }
  }
  return result;
}

uint64_t ct_sqlite_rpi_buffer_best_index(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _QWORD v12[2];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v12[1] = 0;
  v13 = 0;
  v2 = *(_DWORD *)a2;
  if (*(int *)a2 >= 1)
  {
    v3 = 0;
    v4 = *(_QWORD *)(a2 + 8) + 5;
    v5 = (unsigned __int8 *)v4;
    do
    {
      v6 = *v5;
      v5 += 12;
      if (v6)
      {
        if (*(_BYTE *)(v4 - 1) == 2)
        {
          v7 = *(unsigned int *)(v4 - 5);
          if ((v7 - 1) <= 3)
            *((_DWORD *)v12 + v7) = v3;
        }
      }
      ++v3;
      v4 = (uint64_t)v5;
    }
    while (v2 != v3);
  }
  v8 = *(_QWORD *)(a2 + 32);
  for (i = 1; i != 5; ++i)
  {
    v10 = v8 + 8 * *((int *)v12 + i);
    *(_DWORD *)v10 = i;
    *(_BYTE *)(v10 + 4) = 1;
  }
  *(_QWORD *)(a2 + 64) = 0x3FF0000000000000;
  *(_QWORD *)(a2 + 72) = 100;
  *(_DWORD *)(a2 + 40) = 4;
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_disconnect(void *a1)
{
  sqlite3_free(a1);
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_open(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t result;

  v3 = sqlite3_malloc(56);
  if (!v3)
    return 7;
  v4 = v3;
  result = 0;
  v4[6] = 0;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *(_OWORD *)v4 = 0u;
  *a2 = v4;
  return result;
}

uint64_t ct_sqlite_rpi_buffer_close(void *a1)
{
  sqlite3_free(a1);
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_filter(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, sqlite3_value **a5)
{
  sqlite3_int64 v7;
  sqlite3_int64 v8;

  if (a2)
  {
    a1[3] = sqlite3_value_pointer(*a5, "ct_sqlite_rpi_buffer");
    v7 = (sqlite3_int64)sqlite3_value_pointer(a5[1], "ct_sqlite_rpi_validity_buffer");
    a1[4] = v7;
    v8 = a1[3];
    if (v8)
    {
      v8 = sqlite3_value_int64(a5[2]);
      v7 = a1[4];
    }
    a1[5] = v8;
    if (v7)
      v7 = sqlite3_value_int64(a5[3]);
    a1[6] = v7;
  }
  else
  {
    *(_OWORD *)(a1 + 5) = 0u;
    *(_OWORD *)(a1 + 3) = 0u;
  }
  a1[1] = 0;
  a1[2] = 0;
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_next(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1[5];
  v2 = a1[1];
  v3 = v2 + 1;
  if (v1 <= v2 + 1)
    v4 = v2 + 1;
  else
    v4 = a1[5];
  while (v3 < v1)
  {
    if (*(unsigned __int8 *)(a1[4] + v3++))
    {
      v4 = v3 - 1;
      break;
    }
  }
  a1[1] = v4;
  return 0;
}

BOOL ct_sqlite_rpi_buffer_eof(_QWORD *a1)
{
  return a1[2] >= a1[6] || a1[1] >= a1[5];
}

uint64_t ct_sqlite_rpi_buffer_column(_QWORD *a1, sqlite3_context *a2, int a3)
{
  sqlite3_int64 v3;

  switch(a3)
  {
    case 0:
      sqlite3_result_blob(a2, (const void *)(a1[3] + 16 * a1[1]), 16, 0);
      return 0;
    case 3:
      v3 = a1[5];
      goto LABEL_7;
    case 4:
      v3 = a1[6];
      goto LABEL_7;
    case 5:
      v3 = a1[1] / 144;
      goto LABEL_7;
    case 6:
      v3 = a1[1] % 144;
LABEL_7:
      sqlite3_result_int64(a2, v3);
      break;
    default:
      return 0;
  }
  return 0;
}

uint64_t ct_sqlite_rpi_buffer_rowid(uint64_t a1, _QWORD *a2)
{
  *a2 = *(_QWORD *)(a1 + 16);
  return 0;
}

void sub_1CC1D00AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1D0388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ENSQLiteBindFoundationValue(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  const char *v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  const char *v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    if (v6)
      v7 = (const char *)v6;
    else
      v7 = "";
    sqlite3_bind_text(a1, a2, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_26;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    sqlite3_bind_null(a1, a2);
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
LABEL_11:
    sqlite3_bind_double(a1, a2, v8);
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19[0] = 0;
      v19[1] = 0;
      objc_msgSend(v5, "getUUIDBytes:", v19);
      sqlite3_bind_blob(a1, a2, v19, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", "void ENSQLiteBindFoundationValue(sqlite3_stmt * _Nonnull, int, id  _Nullable __strong)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("ENSQLiteUtils.m"), 33, CFSTR("Binding unexpected value class %@"), objc_opt_class());

    }
    v13 = objc_retainAutorelease(v5);
    v14 = (const char *)objc_msgSend(v13, "objCType");
    if (strcmp(v14, "d") && strcmp(v14, "f"))
    {
      sqlite3_bind_int64(a1, a2, objc_msgSend(v13, "longLongValue"));
      goto LABEL_26;
    }
    objc_msgSend(v13, "doubleValue");
    goto LABEL_11;
  }
  v9 = v5;
  if ((unint64_t)objc_msgSend(v9, "length") >= 0x7FFFFFFF)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", "void ENSQLiteBindFoundationValue(sqlite3_stmt * _Nonnull, int, id  _Nullable __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("ENSQLiteUtils.m"), 24, CFSTR("NSData parameter is large (%lu bytes)"), objc_msgSend(v9, "length"));

  }
  v10 = objc_retainAutorelease(v9);
  v11 = objc_msgSend(v10, "bytes");
  if (v11)
    v12 = (const char *)v11;
  else
    v12 = "";
  sqlite3_bind_blob(a1, a2, v12, objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

LABEL_26:
}

id ENSQLiteColumnAsData(sqlite3_stmt *a1, int a2)
{
  void *v4;

  if (sqlite3_column_type(a1, a2) == 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)sqlite3_column_blob(a1, a2);
    if (v4)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBytes:length:", v4, sqlite3_column_bytes(a1, a2));
  }
  return v4;
}

id ENSQLiteColumnAsDate(sqlite3_stmt *a1, int a2)
{
  void *v4;

  if (sqlite3_column_type(a1, a2) == 5)
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D60]), "initWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a1, a2));
  return v4;
}

id ENSQLiteColumnAsNaturalType(sqlite3_stmt *a1, int a2)
{
  void *v4;

  switch(sqlite3_column_type(a1, a2))
  {
    case 1:
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E0]), "initWithLongLong:", sqlite3_column_int64(a1, a2));
      break;
    case 2:
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E0]), "initWithDouble:", sqlite3_column_double(a1, a2));
      break;
    case 3:
      ENSQLiteColumnAsString(a1, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      ENSQLiteColumnAsData(a1, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

unsigned __int8 *ENSQLiteColumnAsString(sqlite3_stmt *a1, int a2)
{
  unsigned __int8 *v4;

  if (sqlite3_column_type(a1, a2) == 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
    if (v4)
      v4 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3938]), "initWithUTF8String:", v4);
  }
  return v4;
}

id ENSQLiteColumnAsUUID(sqlite3_stmt *a1, int a2)
{
  void *v4;
  void *v5;

  if (sqlite3_column_type(a1, a2) == 5)
    goto LABEL_5;
  v4 = (void *)sqlite3_column_blob(a1, a2);
  if (v4)
  {
    v5 = v4;
    if (sqlite3_column_bytes(a1, a2) == 16)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A30]), "initWithUUIDBytes:", v5);
      return v4;
    }
LABEL_5:
    v4 = 0;
  }
  return v4;
}

void sub_1CC1D0FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC1D14C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SharedServiceConnectionHandler(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[5];
  id v6;

  v1 = a1;
  +[ENXPCServiceListener sharedServiceListener](ENXPCServiceListener, "sharedServiceListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SharedServiceConnectionHandler_block_invoke;
  block[3] = &unk_1E87D9DD8;
  block[4] = v4;
  v6 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

void sub_1CC1D2DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v28 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1D30BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1D3424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DiagnosisReportTypeToServerStringMap()
{
  _QWORD v1[5];
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1E87EDEF8;
  v1[1] = &unk_1E87EDF10;
  v2[0] = CFSTR("confirmed");
  v2[1] = CFSTR("likely");
  v1[2] = &unk_1E87EDF28;
  v1[3] = &unk_1E87EDF40;
  v2[2] = CFSTR("negative");
  v2[3] = CFSTR("user-report");
  v1[4] = &unk_1E87EDF58;
  v2[4] = CFSTR("recursive");
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v2, v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1CC1D3FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1D7754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a67;
  char a71;

  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_1CC1D86E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1DA134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;

  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Unwind_Resume(a1);
}

void sub_1CC1DCD08(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1CC1DE124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC1E7F20(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1CC1EA9CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1CC1EEFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  (*(void (**)(uint64_t))(a12 + 16))(a12);
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1EF8B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F1FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F2224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F2914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F4C48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F51F8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F58FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F5CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F6134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F66E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F6BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F7028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F744C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F7820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F7BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F8068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F841C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  uint64_t v23;

  (*(void (**)(uint64_t))(v23 + 16))(v23);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F8B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  (*(void (**)(void))(a6 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F9168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F972C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1F9CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FA040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FC9A0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  _Block_object_dispose(&STACK[0x3A8], 8);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FD8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FDD90(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FE838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  (*(void (**)(uint64_t))(v16 + 16))(v16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FEB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FEF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FF258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FF5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FF918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FFBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC1FFF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2003A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC200738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2009C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC200C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20126C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC201F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  (*(void (**)(void))(a11 + 16))();
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void sub_1CC202258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC202870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;
  id *v43;

  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a28, 8);
  (*(void (**)(uint64_t))(v42 + 16))(v42);
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void sub_1CC202F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2035D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  (*(void (**)(void))(a3 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20400C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;

  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2049D4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2055E0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CC205BE0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v3 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC206138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CC206558(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1CC2068B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  (*(void (**)(uint64_t))(v14 + 16))(v14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC206D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2073E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;

  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1CC207E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;

  (*(void (**)(void))(a15 + 16))();
  _Block_object_dispose((const void *)(v15 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2083E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CC208798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC208B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20942C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC209988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_1CC209D40(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CC20B888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  (*(void (**)(void))(a11 + 16))();
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20BC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20C124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20C4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20CAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20CFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  (*(void (**)(void))(a11 + 16))();
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20D360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20D69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20DBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20DEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20E510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20EA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  (*(void (**)(void))(a3 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC20EE98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CC20F838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;

  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2101DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC210794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  (*(void (**)(void))(a13 + 16))();
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC210DEC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2119CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  (*(void (**)(void))(a23 + 16))();
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void sub_1CC212DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC213B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2148E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2155E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC215A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC215C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CC215EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CC216254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CC216508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2166C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2196D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC21C3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CC21CEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_1CC21D5E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CC2201F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1CC223FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC224788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC224CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC224FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC225378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC22584C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2259B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC225C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC225F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2260E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2262C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC226984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1CC226EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC227420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC228060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC22859C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC228864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC228BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC22903C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2297B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  (*(void (**)(void))(a11 + 16))();
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1CC22A3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC22A7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC22D7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC22DC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a29);
  _Unwind_Resume(a1);
}

void sub_1CC22E240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC22E458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC22F2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC230298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  uint64_t v13;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 256));
  _Unwind_Resume(a1);
}

void sub_1CC2305A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC231694(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1CC232538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC232A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC233214(_Unwind_Exception *a1)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1CC2334D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CC2338B0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t SQLite3StatementRelease(int a1, sqlite3_stmt *pStmt)
{
  return sqlite3_finalize(pStmt);
}

id exposureWindowsForScanInstances(uint64_t *a1, uint64_t a2, __int128 *a3, char a4, void *a5, double a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  char v27;

  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  objc_msgSend(MEMORY[0x1E0C99D40], "calendarWithIdentifier:", *MEMORY[0x1E0C996C0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E78], "timeZoneForSecondsFromGMT:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v14);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __exposureWindowsForScanInstances_block_invoke;
  v21[3] = &unk_1E87DB948;
  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v22 = v13;
  v23 = v11;
  v27 = a4;
  v15 = v12;
  v24 = v15;
  v16 = v11;
  v17 = v13;
  groupScanInstances(a1, a2, v21, a6);
  v18 = v24;
  v19 = v15;

  return v19;
}

void sub_1CC2364A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void groupScanInstances(uint64_t *a1, uint64_t a2, void *a3, double a4)
{
  void (**v7)(id, uint64_t *, uint64_t);
  uint64_t *v8;
  uint64_t v9;
  void (**v10)(id, uint64_t *, uint64_t);

  v7 = a3;
  if ((_DWORD)a2)
  {
    v10 = v7;
    if ((_DWORD)a2 == 1)
      goto LABEL_9;
    v8 = a1 + 2;
    v9 = a2 - 1;
    a2 = 1;
    do
    {
      if (scanInstancesInDifferentWindows(*a1, a1[1], *v8, v8[1], a4))
      {
        v10[2](v10, a1, a2);
        a2 = 1;
        a1 = v8;
      }
      else
      {
        a2 = (a2 + 1);
      }
      v8 += 2;
      --v9;
    }
    while (v9);
    v7 = v10;
    if ((_DWORD)a2)
    {
LABEL_9:
      v7[2](v10, a1, a2);
      v7 = v10;
    }
  }

}

BOOL scanInstancesInDifferentWindows(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  double v5;
  double v6;
  unsigned __int128 v8;
  unsigned __int128 v9;

  *(_QWORD *)&v9 = a1;
  *((_QWORD *)&v9 + 1) = a2;
  *(_QWORD *)&v8 = a3;
  *((_QWORD *)&v8 + 1) = a4;
  if ((_DWORD)a1 != (_DWORD)a3)
    return 1;
  v5 = *(double *)((char *)&v8 + 4);
  v6 = *(double *)((char *)&v9 + 4);
  if (*(double *)((char *)&v8 + 4) < *(double *)((char *)&v9 + 4))
  {
    *(_QWORD *)&v6 = v8 >> 32;
    *(_QWORD *)&v5 = v9 >> 32;
  }
  return v6 + a5 <= v5;
}

void sub_1CC237280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void __exposureWindowsForScanInstances_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  uint64_t v16;
  unsigned __int128 v17;
  __int16 v18;
  __int16 v19;
  id v20;
  id v21;
  unsigned __int128 v22;

  v6 = *(unsigned __int8 *)(a1 + 73);
  v7 = *(unsigned __int8 *)(a1 + 74);
  v8 = *(unsigned __int8 *)(a1 + 75);
  v21 = objc_alloc_init(MEMORY[0x1E0CAA350]);
  objc_msgSend(v21, "setDiagnosisReportType:", v6);
  objc_msgSend(v21, "setCalibrationConfidence:", v7);
  objc_msgSend(v21, "setVariantOfConcernType:", v8);
  v9 = *(double *)(a2 + 4);
  v10 = (void *)MEMORY[0x1E0C99D60];
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v10, "dateWithTimeIntervalSince1970:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startOfDayForDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setDate:", v13);
  objc_msgSend(v21, "setInfectiousness:", objc_msgSend(*(id *)(a1 + 40), "infectiousnessWithDaysSinceOnsetOfSymptoms:", *(_QWORD *)(a1 + 64)));
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  if (a3)
  {
    v16 = 0;
    do
    {
      v17 = *(_OWORD *)(a2 + v16);
      v22 = v17;
      if (*(_BYTE *)(a1 + 80))
      {
        if (v16
          && *(_DWORD *)(a2 + v16 - 16) == (_DWORD)v17
          && (LOWORD(v15) = HIWORD(v17),
              v15 = (double)*(unint64_t *)&v15,
              *(double *)&v17 = vabdd_f64(COERCE_DOUBLE(v17 >> 32) - v15, *(double *)(a2 + v16 - 12)),
              *(double *)&v17 < 4.0))
        {
          v18 = vcvtmd_u64_f64(*(double *)((char *)&v22 + 4) / 60.0) - vcvtmd_u64_f64(*(double *)(a2 + v16 - 12) / 60.0);
        }
        else
        {
          LOWORD(v17) = HIWORD(v22);
          v18 = llroundf((float)v17 / 60.0);
        }
        v19 = 60 * v18;
        HIWORD(v22) = v19;
      }
      else
      {
        v19 = HIWORD(v17);
      }
      if (v19)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0CAA3C0]);
        objc_msgSend(v20, "setMinimumAttenuation:", BYTE13(v22));
        objc_msgSend(v20, "setTypicalAttenuation:", BYTE12(v22));
        objc_msgSend(v20, "setSecondsSinceLastScan:", HIWORD(*((_QWORD *)&v22 + 1)));
        objc_msgSend(v14, "addObject:", v20);

      }
      v16 += 16;
    }
    while (16 * a3 != v16);
  }
  objc_msgSend(v21, "setScanInstances:", v14);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);

}

uint64_t __timeOrderedAdvertisements_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    objc_msgSend(v5, "timestamp");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

id ENBundleIdentifierForURLSessions()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D8], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1CC238CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t AddKeyValueTable(void *a1, const char *a2)
{
  return objc_msgSend(a1, "executeUncachedSQLStatements:error:", &unk_1E87EDE08, a2);
}

uint64_t AddOriginalReportType(void *a1, const char *a2)
{
  return objc_msgSend(a1, "executeUncachedSQLStatements:error:", &unk_1E87EDE20, a2);
}

uint64_t AddDetectionHistoryTables(void *a1, const char *a2)
{
  return objc_msgSend(a1, "executeUncachedSQLStatements:error:", &unk_1E87EDE50, a2);
}

uint64_t AddDetectionHistoryMetadata(void *a1, const char *a2)
{
  return objc_msgSend(a1, "executeUncachedSQLStatements:error:", &unk_1E87EDE68, a2);
}

uint64_t AddVariantOfConcernType(void *a1, const char *a2)
{
  return objc_msgSend(a1, "executeUncachedSQLStatements:error:", &unk_1E87EDE80, a2);
}

uint64_t AddOriginalVariantOfConcernType(void *a1, const char *a2)
{
  return objc_msgSend(a1, "executeUncachedSQLStatements:error:", &unk_1E87EDE38, a2);
}

void sub_1CC23D048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC23D658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CC23E82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC23ECC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC23FB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC23FE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

id ENTestResultErrorF(uint64_t a1)
{
  const char *v2;
  __CFString *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 - 1) > 0xC)
    v2 = "?";
  else
    v2 = off_1E87DBF80[a1 - 1];
  NSPrintV();
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v2;
  NSPrintF();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB35C0]);
  v12[0] = CFSTR("cuErrorDesc");
  v12[1] = CFSTR("cuErrorMsg");
  v6 = &stru_1E87DD6B8;
  if (v3)
    v6 = v3;
  v13[0] = v4;
  v13[1] = v6;
  v7 = *MEMORY[0x1E0CAA2D0];
  v12[2] = *MEMORY[0x1E0CB2930];
  v13[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v13, v12, 3, v11, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", v7, a1, v8);

  return v9;
}

id ENNestedTestResultErrorF(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  __CFString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if ((unint64_t)(a2 - 1) > 0xC)
    v4 = "?";
  else
    v4 = off_1E87DBF80[a2 - 1];
  NSPrintV();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  NSPrintF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB35C0]);
  v8 = *MEMORY[0x1E0CAA2D0];
  v17[0] = CFSTR("cuErrorDesc");
  v17[1] = CFSTR("cuErrorMsg");
  v9 = &stru_1E87DD6B8;
  if (v5)
    v9 = v5;
  v18[0] = v6;
  v18[1] = v9;
  v10 = *MEMORY[0x1E0CB2930];
  v18[2] = v6;
  v11 = *MEMORY[0x1E0CB3390];
  v17[2] = v10;
  v17[3] = v11;
  v12 = v3;
  if (!v3)
  {
    NSErrorF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v18, v17, 4, v16, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, a2, v13);

  if (!v3)
  return v14;
}

uint64_t initCPPhoneNumberCopyActiveCountryCode()
{
  if (AppSupportLibrary_sOnce != -1)
    dispatch_once(&AppSupportLibrary_sOnce, &__block_literal_global_159);
  softLinkCPPhoneNumberCopyActiveCountryCode[0] = (uint64_t (*)())dlsym((void *)AppSupportLibrary_sLib, "CPPhoneNumberCopyActiveCountryCode");
  return softLinkCPPhoneNumberCopyActiveCountryCode[0]();
}

id initTPSNormalizedPhoneNumberString(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = TelephonyPreferencesLibrary_sOnce;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&TelephonyPreferencesLibrary_sOnce, &__block_literal_global_162);
  softLinkTPSNormalizedPhoneNumberString = (uint64_t (*)())dlsym((void *)TelephonyPreferencesLibrary_sLib, "TPSNormalizedPhoneNumberString");
  ((void (*)(id, id))softLinkTPSNormalizedPhoneNumberString)(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t ENReadLinesFromFile()
{
  int v0;
  _QWORD *v1;
  _QWORD *v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  ssize_t v7;
  unint64_t v8;
  off_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v25;
  int __fd;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _BYTE __buf[8192];
  uint64_t v46;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = v0;
  v46 = *MEMORY[0x1E0C80C00];
  v27 = v4;
  if ((v3 & 0x80000000) == 0)
  {
    v25 = v2;
    v5 = objc_alloc_init(MEMORY[0x1E0CB3798]);
    bzero(__buf, 0x2000uLL);
    v6 = (void *)MEMORY[0x1D17A7CB8]();
    __fd = v3;
    v7 = pread(v3, __buf, 0x2000uLL, 0);
    if (v7 < 1)
    {
LABEL_21:
      if (v7 < 0)
      {
        if (*__error())
        {
          if (*__error())
            v21 = *__error();
          else
            v21 = -6700;
        }
        else
        {
          v21 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C0], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F98], v21, 0, v25);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v19 = (id)v22;
      }
      else
      {
        v19 = 0;
      }
      objc_autoreleasePoolPop(v6);
      if (v19)
      {
        if (v25)
        {
          v19 = objc_retainAutorelease(v19);
          v20 = 0;
          *v25 = v19;
        }
        else
        {
          v20 = 0;
        }
        goto LABEL_41;
      }
      v23 = objc_msgSend(v5, "length");
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __ENReadLinesFromFile_block_invoke_2;
      v28[3] = &unk_1E87DC078;
      v29 = v27;
      objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, 0, v28);

    }
    else
    {
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = v7 + v8;
        if (v7 + v8 >= 3)
          v11 = 3;
        else
          v11 = v7 + v8;
        v12 = v7 + v8;
        do
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3938]), "initWithBytes:length:encoding:", __buf, v12, 4);
          v14 = v13;
          if (v13)
            v15 = 1;
          else
            v15 = v11 == 0;
          --v11;
          --v12;
        }
        while (!v15);
        if (!v13)
        {
          ENErrorF();
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (objc_msgSend(v13, "length") >= v10)
        {
          v8 = 0;
        }
        else
        {
          v16 = objc_msgSend(v14, "length");
          objc_msgSend(v14, "length");
          v8 = v10 - v16;
          __memmove_chk();
        }
        objc_msgSend(v5, "appendString:", v14, v25);
        v41 = 0;
        v42 = &v41;
        v43 = 0x2020000000;
        v44 = 0;
        v35 = 0;
        v36 = &v35;
        v37 = 0x3010000000;
        v38 = &unk_1CC277F8B;
        v39 = 0;
        v40 = 0;
        v17 = objc_msgSend(v5, "length");
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __ENReadLinesFromFile_block_invoke;
        v30[3] = &unk_1E87DC050;
        v18 = v5;
        v31 = v18;
        v32 = v27;
        v33 = &v41;
        v34 = &v35;
        objc_msgSend(v18, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 0, v30);
        if (*((_BYTE *)v42 + 24))
          break;
        if (v36[5])
          objc_msgSend(v18, "deleteCharactersInRange:", v36[4]);

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v41, 8);

        objc_autoreleasePoolPop(v6);
        v6 = (void *)MEMORY[0x1D17A7CB8]();
        v9 += v7;
        v7 = pread(__fd, &__buf[v8], 0x2000 - v8, v9);
        if (v7 < 1)
          goto LABEL_21;
      }

      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v41, 8);

      objc_autoreleasePoolPop(v6);
    }
    v19 = 0;
    v20 = 1;
LABEL_41:

    goto LABEL_42;
  }
  if (v2)
  {
    ENErrorF();
    v20 = 0;
    *v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_42:

  return v20;
}

void sub_1CC244DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1CC245700(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CC245A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _ENAdvertisementDatabaseStorageFullResponseHandler(CFTypeRef cf, char a2)
{
  void *v3;
  void *v4;
  char v5;

  if ((a2 & 3) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5880], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

    if ((v5 & 1) == 0
      && gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  alertActive = 0;
  CFRelease(cf);
}

void sub_1CC247338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC248168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC248A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC249480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  (*(void (**)(void))(a12 + 16))();
  _Unwind_Resume(a1);
}

void sub_1CC249FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1E0D8D700]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C60]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D68](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D88]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97DA0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E88](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FD8](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98008](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98128](bundle);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98410]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984F0]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98548](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x1E0D1A958]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1E0D1A978]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x1E0D1A988]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985B0]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1E0D1A998]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985C0](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98608](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98618](cf1, cf2);
}

uint64_t CFHTTPCookieStorageCreateFromFile()
{
  return MEMORY[0x1E0C92780]();
}

uint64_t CFHTTPCookieStorageScheduleWithRunLoop()
{
  return MEMORY[0x1E0C927B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C0]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F8](center, observer);
}

uint64_t CFPrefs_CopyKeys()
{
  return MEMORY[0x1E0D1AA38]();
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x1E0D1AA48]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x1E0D1AA58]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1E0D1AA68]();
}

uint64_t CFPrefs_RemoveValue()
{
  return MEMORY[0x1E0D1AA70]();
}

uint64_t CFPrefs_SetDouble()
{
  return MEMORY[0x1E0D1AA78]();
}

uint64_t CFPrefs_SetInt64()
{
  return MEMORY[0x1E0D1AA80]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x1E0D1AA90]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC8](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF0](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C48]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99178]();
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993D0](allocator, buffer, bufLen, isDirectory);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995B0](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995C0](allocator, userNotification, callout, order);
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x1E0D1AB08]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x1E0D1AB10]();
}

uint64_t CUPrintDateCF()
{
  return MEMORY[0x1E0D1AB70]();
}

uint64_t CUPrintDuration32()
{
  return MEMORY[0x1E0D1AB78]();
}

uint64_t CUPrintDurationDouble()
{
  return MEMORY[0x1E0D1AB80]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x1E0D1AB88]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x1E0D1AB90]();
}

uint64_t CUPrintHex()
{
  return MEMORY[0x1E0D1ABA8]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x1E0D1ABC0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x1E0D1ABC8]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x1E0D1ABE8]();
}

uint64_t CUPrintPID()
{
  return MEMORY[0x1E0D1ABF8]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x1E0D1AC08]();
}

uint64_t CUStateDumpWithObject()
{
  return MEMORY[0x1E0D1AC10]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x1E0D1AC20]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x1E0D1AC48]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x1E0D1AC68]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x1E0D1AC70]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x1E0D1AC88]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x1E0D1ACA8]();
}

uint64_t ENCloneFileToTemporaryDirectory()
{
  return MEMORY[0x1E0CAA230]();
}

uint64_t ENCompareDiagnosisReportTypes()
{
  return MEMORY[0x1E0CAA238]();
}

uint64_t ENCopyPublicKeyFromBase64String()
{
  return MEMORY[0x1E0CAA240]();
}

uint64_t ENDaemonBundle()
{
  return MEMORY[0x1E0CAA248]();
}

uint64_t ENDataVaultPath()
{
  return MEMORY[0x1E0CAA250]();
}

uint64_t ENDataVaultURL()
{
  return MEMORY[0x1E0CAA258]();
}

uint64_t ENDefaultExpirationDate()
{
  return MEMORY[0x1E0CAA260]();
}

uint64_t ENErrorF()
{
  return MEMORY[0x1E0CAA298]();
}

uint64_t ENErrorMetricTypeToString()
{
  return MEMORY[0x1E0CAA2A0]();
}

uint64_t ENLocalizedString()
{
  return MEMORY[0x1E0CAA2B0]();
}

uint64_t ENNestedErrorF()
{
  return MEMORY[0x1E0CAA2B8]();
}

uint64_t ENRPIMetadataDeserialize()
{
  return MEMORY[0x1E0CAA2C0]();
}

uint64_t ENXPCDecodeSecureObject()
{
  return MEMORY[0x1E0CAA2D8]();
}

uint64_t ENXPCDecodeSecureObjectIfPresent()
{
  return MEMORY[0x1E0CAA2E0]();
}

uint64_t ENXPCEncodeSecureObject()
{
  return MEMORY[0x1E0CAA2E8]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x1E0D1ADB8]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x1E0D1ADD8]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x1E0D1ADF8]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1E0D1B000]();
}

uint64_t LogCategoryCopyOSLogHandle()
{
  return MEMORY[0x1E0D1B040]();
}

uint64_t LogControl()
{
  return MEMORY[0x1E0D1B070]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1E0D1B090]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x1E0D1B0A0]();
}

uint64_t LogSetAppID()
{
  return MEMORY[0x1E0D1B0A8]();
}

uint64_t LogShow()
{
  return MEMORY[0x1E0D1B0C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E498]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4C8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1E0D1B138]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x1E0D1B140]();
}

uint64_t NSArrayGetNSNumberAtIndex()
{
  return MEMORY[0x1E0D1B148]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB2898](aClassName);
}

uint64_t NSDataWithHex()
{
  return MEMORY[0x1E0D1B160]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x1E0D1B1B0]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x1E0D1B1C8]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x1E0D1B1D8]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1E0D1B208]();
}

uint64_t NSPrintV()
{
  return MEMORY[0x1E0D1B220]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x1E0D1B230]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3180](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3208](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3238](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB33F8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1E0DAB720]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6398](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6410](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A8](rnd, count, bytes);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1E0DB0F98]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1E0DB0FB8]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1E0DB0FD0]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x1E0DB0FE0]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x1E0DB1000]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x1E0DB1028]();
}

uint64_t TCCAccessResetForBundle()
{
  return MEMORY[0x1E0DB1030]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1E0DB1068]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x1E0DB1080]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x1E0D1B810]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return MEMORY[0x1E0C9A388]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A7F8]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A810]();
}

uint64_t _CTServerConnectionCopyISOForMCC()
{
  return MEMORY[0x1E0CA6EB0]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F28]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1E0D1B888]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sqlite3_db_copy()
{
  return MEMORY[0x1E0DE8520]();
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x1E0DE8530]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cchmac()
{
  return MEMORY[0x1E0C820A8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D0](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1E0DE8718](db, zName, p, pClientData);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1E0DE8770](a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x1E0DE8838](*(_QWORD *)&a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8878](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE88B8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x1E0DE88F8](a1, a2);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A50](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1E0DE8A58](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

uint64_t stricmp_prefix()
{
  return MEMORY[0x1E0D1B980]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x1E0C85EE8](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return MEMORY[0x1E0C86100]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1E0C86238]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

uint64_t xpc_dictionary_set_cf_object()
{
  return MEMORY[0x1E0D1B9C0]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_main(xpc_connection_handler_t handler)
{
  MEMORY[0x1E0C86608](handler);
}

