@implementation GetDataForAllKeys

uint64_t __GetDataForAllKeys_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  unsigned int v17;
  id obj;

  v4 = sqlite3_step(a2);
  while ((_DWORD)v4 == 100)
  {
    v17 = objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 0, a2);
    v5 = objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
    v6 = objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 2, a2);
    v7 = objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 3, a2);
    v8 = objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 4, a2);
    v9 = objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 5, a2);
    objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 6, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 7, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 8, a2) != 0;
    HIDWORD(v16) = objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 9, a2);
    LOBYTE(v16) = v12;
    if (((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v17, v5, v6, v7, v8, v9, v10, v11, v16) & 1) == 0)
    {

      return 1;
    }
    v4 = sqlite3_step(a2);

  }
  if ((_DWORD)v4 != 101)
  {
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v14 + 40);
    objc_msgSend(v13, "reportSQLiteErrorCode:method:error:", v4, CFSTR("step"), &obj);
    objc_storeStrong((id *)(v14 + 40), obj);
    return 0;
  }
  return 1;
}

@end
