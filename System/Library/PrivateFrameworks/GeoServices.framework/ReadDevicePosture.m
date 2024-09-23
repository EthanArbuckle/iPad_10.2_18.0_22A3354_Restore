@implementation ReadDevicePosture

uint64_t __ReadDevicePosture_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id obj;

  v4 = sqlite3_step(a2);
  while ((_DWORD)v4 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 0, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 1, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 2, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
    {

      return 1;
    }
    v4 = sqlite3_step(a2);

  }
  if ((_DWORD)v4 != 101)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v8, "reportSQLiteErrorCode:method:error:", v4, CFSTR("step"), &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    return 0;
  }
  return 1;
}

@end
