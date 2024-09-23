@implementation ABChangeHistoryGetChanges

uint64_t __ABChangeHistoryGetChanges_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 40));
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 2, *(_DWORD *)(a1 + 44));
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 3, *(const char **)(a1 + 32), -1, 0);
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 4, *(const char **)(a1 + 32), -1, 0);
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 5, *(_DWORD *)(a1 + 48));
}

uint64_t __ABChangeHistoryGetChanges_block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 40));
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 2, *(_DWORD *)(a1 + 40));
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 3, *(_DWORD *)(a1 + 44));
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 4, *(const char **)(a1 + 32), -1, 0);
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 5, *(const char **)(a1 + 32), -1, 0);
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 6, *(_DWORD *)(a1 + 48));
}

uint64_t __ABChangeHistoryGetChanges_block_invoke_3(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 40));
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 2, *(const char **)(a1 + 32), -1, 0);
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 3, *(const char **)(a1 + 32), -1, 0);
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 4, *(_DWORD *)(a1 + 44));
}

uint64_t __ABChangeHistoryGetChanges_block_invoke_4(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  uint64_t v5;
  const char *v6;

  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 40));
  v4 = *(sqlite3_stmt **)(a2 + 8);
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "firstObject"), "UTF8String");
  if (v5)
    v6 = (const char *)v5;
  else
    v6 = "";
  return sqlite3_bind_text(v4, 2, v6, -1, 0);
}

@end
