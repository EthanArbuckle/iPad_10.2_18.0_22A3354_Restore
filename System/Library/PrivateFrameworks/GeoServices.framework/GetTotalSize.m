@implementation GetTotalSize

BOOL __GetTotalSize_block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id obj;

  v4 = sqlite3_step(a2);
  v5 = (void *)a1[4];
  if ((_DWORD)v4 == 100)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "int64ForColumn:inStatment:", 0, a2);
  }
  else
  {
    v6 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v6 + 40);
    objc_msgSend(v5, "reportSQLiteErrorCode:method:error:", v4, CFSTR("step"), &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
  }
  return (_DWORD)v4 == 100;
}

@end
