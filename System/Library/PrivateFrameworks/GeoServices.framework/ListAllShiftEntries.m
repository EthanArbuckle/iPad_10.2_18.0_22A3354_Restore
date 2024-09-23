@implementation ListAllShiftEntries

uint64_t __ListAllShiftEntries_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id obj;

  v4 = sqlite3_step(a2);
  v5 = 1;
  while ((_DWORD)v4 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "doubleForColumn:inStatment:", 1, a2);
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "doubleForColumn:inStatment:", 2, a2);
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "doubleForColumn:inStatment:", 3, a2);
    if (!(*(unsigned int (**)(double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v7, v9, v10))
      return v5;
    v4 = sqlite3_step(a2);
  }
  if ((_DWORD)v4 == 101)
    return 1;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v12 + 40);
  objc_msgSend(v11, "reportSQLiteErrorCode:method:error:", v4, CFSTR("step"), &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  return 0;
}

@end
