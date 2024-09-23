@implementation ReadNextTimerTimestamp

uint64_t __ReadNextTimerTimestamp_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_stmt *i;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  id obj;

  for (i = a2; ; i = a2)
  {
    v5 = sqlite3_step(i);
    v6 = v5;
    if ((_DWORD)v5 != 100)
      break;
    objc_msgSend(*(id *)(a1 + 32), "doubleForColumn:inStatment:", 0, a2);
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      return 1;
  }
  if ((_DWORD)v5 == 101)
    return 1;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v8, "reportSQLiteErrorCode:method:error:", v6, CFSTR("step"), &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  return 0;
}

@end
