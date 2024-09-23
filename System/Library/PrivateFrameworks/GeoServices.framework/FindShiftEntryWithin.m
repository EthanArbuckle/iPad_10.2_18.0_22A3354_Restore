@implementation FindShiftEntryWithin

uint64_t __FindShiftEntryWithin_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;
  uint64_t v6;
  int v7;
  void *v8;
  double v9;
  uint64_t v10;
  int v11;
  void *v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v23;
  id v24;
  id v25;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(double *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindRealParameter:toValue:inStatement:error:", "@shiftresponse_lat", a2, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(double *)(a1 + 64);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindRealParameter:toValue:inStatement:error:", "@shiftresponse_lng", a2, &v25, v9);
  objc_storeStrong((id *)(v10 + 40), v25);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(double *)(a1 + 72);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindRealParameter:toValue:inStatement:error:", "@epsilon", a2, &v24, v13);
  objc_storeStrong((id *)(v14 + 40), v24);
  if (!v15)
    return 0;
  v16 = sqlite3_step(a2);
  while ((_DWORD)v16 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    v17 = 1;
    objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 1, a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      goto LABEL_11;
    v16 = sqlite3_step(a2);

  }
  if ((_DWORD)v16 == 101)
    return 1;
  v19 = *(void **)(a1 + 32);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v23 = *(id *)(v20 + 40);
  objc_msgSend(v19, "reportSQLiteErrorCode:method:error:", v16, CFSTR("step"), &v23);
  v21 = v23;
  v17 = 0;
  v18 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v21;
LABEL_11:

  return v17;
}

@end
